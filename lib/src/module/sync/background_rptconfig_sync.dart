import 'package:isar/isar.dart';

import 'background_sync.dart';
import '../../entity/pos/entity.dart';

class BackgroundReportConfigSync extends BackgroundEntitySync {
  @override
  Future<List<Map<String, dynamic>>> exportData() async {
    return await db.reportConfigEntitys
        .where()
        .syncStateIsNull()
        .or()
        .syncStateLessThan(500)
        .exportJson();
  }

  @override
  Future<void> importData(List data, int lastSyncAt) async {
    List<Map<String, dynamic>> reportConfigs = [];
    for (var reportConfig in data) {
      var tmp = Map<String, dynamic>.from(reportConfig);
      tmp['syncState'] = 1000;
      reportConfigs.add(tmp);
    }

    await db.writeTxn(() async {
      if (reportConfigs.isNotEmpty) {
        await db.reportConfigEntitys.importJson(reportConfigs);
      }
      await updateSyncEntityTimestamp(lastSyncAt);
    });
  }

  @override
  String get type => reportConfigSync;
}