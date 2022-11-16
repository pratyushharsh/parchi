import 'package:isar/isar.dart';

import 'background_sync.dart';
import '../../entity/pos/entity.dart';

class BackgroundTaxGroupSync extends BackgroundEntitySync {
  @override
  Future<List<Map<String, dynamic>>> exportData() async {
    var taxGroups = await db.taxGroupEntitys.where().exportJson();
    for (var tax in taxGroups) {
      if (tax['syncState'] != null && tax['syncState'] < 500) {
        return taxGroups;
      }
    }
    return List.empty();
  }

  @override
  Future<void> importData(List data, int lastSyncAt) async {
    List<Map<String, dynamic>> taxGroups = [];
    for (var taxGroup in data) {
      var tmp = Map<String, dynamic>.from(taxGroup);
      tmp['syncState'] = 1000;
      taxGroups.add(tmp);
    }

    await db.writeTxn(() async {
      if (taxGroups.isNotEmpty) {
        await db.taxGroupEntitys.importJson(taxGroups);
      }
      await updateSyncEntityTimestamp(lastSyncAt);
    });
  }

  @override
  String get type => taxGroupSync;
}
