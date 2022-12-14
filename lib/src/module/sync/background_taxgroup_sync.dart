import 'package:isar/isar.dart';

import 'background_sync.dart';
import '../../entity/pos/entity.dart';
import 'sync_config.dart';

class BackgroundTaxGroupSync extends BackgroundEntitySync {
  @override
  Future<List<Map<String, dynamic>>> exportData() async {
    var taxGroups = await db.taxGroupEntitys.where().exportJson();
    for (var tax in taxGroups) {
      if (tax['syncState'] != null && tax['syncState'] != serverSync) {
        return taxGroups;
      }
    }
    return List.empty();
  }

  Map<String, dynamic> merge(Map<String, dynamic> local, Map<String, dynamic> server) {
    // If there is no update simply return the data.
    if (local['lastChangedAt'] == server['lastChangedAt']) {
      return server;
    }

    // If the local data is newer than the server data, return the local data.
    if (local['lastChangedAt'] != null && server['lastChangedAt'] != null) {
      if (local['lastChangedAt'].compareTo(server['lastChangedAt']) > 0) {
        return local;
      }
    }

    return server;
  }

  @override
  Future<void> importData(List data, int lastSyncAt) async {
    for (var taxGroup in data) {
      var tmp = Map<String, dynamic>.from(taxGroup);
      await db.writeTxn(() async {
        // Get the data for the particular tax group from the database.
        var localTaxGroup = await db.taxGroupEntitys.where().groupIdEqualTo(tmp['groupId']).exportJson();
        // if the tax group is not present in the database, then add it.
        if (localTaxGroup.isEmpty) {
          tmp['syncState'] = serverSync;
          tmp['lastSyncAt'] = lastSyncAt;
          var rules = tmp['taxRules'] as List<dynamic>;
          var modRules = List<Map<String, dynamic>>.empty(growable: true);
          for (var rule in rules) {
            var x = Map<String, dynamic>.from(rule);
            x['syncState'] = serverSync;
            x['lastSyncAt'] = lastSyncAt;
            modRules.add(x);
          }
          tmp['taxRules'] = modRules;
          await db.taxGroupEntitys.importJson([tmp]);
        } else {
          await db.taxGroupEntitys.importJson([merge(localTaxGroup[0], taxGroup)]);
        }
        await updateSyncEntityTimestamp(lastSyncAt);
      });
      // Based on the sync state to determine whether to update or create.
    }
  }

  @override
  String get type => taxGroupSync;
}
