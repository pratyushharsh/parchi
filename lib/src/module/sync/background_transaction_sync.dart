import 'package:isar/isar.dart';

import 'background_sync.dart';
import '../../entity/pos/entity.dart';

class BackgroundTransactionSync extends BackgroundEntitySync {
  @override
  String get type => transactionSync;

  @override
  Future<List<Map<String, dynamic>>> exportData() async {
    return await db.transactionHeaderEntitys
        .where()
        .lockedEqualTo(false)
        .filter()
        .syncStateLessThan(500)
        .or()
        .syncStateIsNull()
        .exportJson();
  }

  @override
  Future<void> importData(List<dynamic> data, int lastSyncAt) async {
    List<Map<String, dynamic>> transactions = [];
    for (var transaction in data) {
      var tmp = Map<String, dynamic>.from(transaction);
      tmp['syncState'] = 1000;
      transactions.add(tmp);
    }

    await db.writeTxn(() async {
      if (transactions.isNotEmpty) {
        await db.transactionHeaderEntitys.importJson(transactions);
      }
      await updateSyncEntityTimestamp(lastSyncAt);
    });
  }
}
