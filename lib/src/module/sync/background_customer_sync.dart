import 'package:isar/isar.dart';

import 'background_sync.dart';
import '../../entity/pos/entity.dart';

class BackgroundCustomerSync extends BackgroundEntitySync {
  @override
  Future<List<Map<String, dynamic>>> exportData() async {
    return await db.contactEntitys
        .where()
        .syncStateIsNull()
        .or()
        .syncStateLessThan(500)
        .exportJson();
  }

  @override
  Future<void> importData(List data, int lastSyncAt) async {
    List<Map<String, dynamic>> customers = [];
    for (var customer in data) {
      var tmp = Map<String, dynamic>.from(customer);
      tmp['syncState'] = 1000;
      customers.add(tmp);
    }

    await db.writeTxn(() async {
      if (customers.isNotEmpty) {
        await db.contactEntitys.importJson(customers);
      }
      await updateSyncEntityTimestamp(lastSyncAt);
    });
  }

  @override
  String get type => customerSync;
}
