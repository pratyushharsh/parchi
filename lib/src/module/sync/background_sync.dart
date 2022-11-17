import 'package:isar/isar.dart';

import '../../database/db_provider.dart';
import '../../entity/pos/entity.dart';

const String transactionSync = 'TRANSACTION';
const String customerSync = 'CUSTOMER';
const String productSync = 'PRODUCT';
const String taxGroupSync = 'TAX';
const String reportConfigSync = 'INVOICE';
const String sequenceSync = 'SEQUENCE';

abstract class BackgroundEntitySync with DatabaseProvider {
  /// Type of the entity
  String get type;

  /// Starts the background sync process.
  Future<List<Map<String, dynamic>>> exportData();

  /// Stops the background sync process.
  Future<void> importData(List<dynamic> data, int lastSyncAt);

  /// Updates the sync entity timestamp.
  Future<void> updateSyncEntityTimestamp(int lastSyncAt) async {
    var e = await db.syncEntitys.where().typeEqualTo(type).findFirst();
    if (e == null) {
      e = SyncEntity(
          type: transactionSync,
          lastSyncAt: DateTime.fromMicrosecondsSinceEpoch(lastSyncAt),
          status: 100,
          syncEndTime: DateTime.fromMicrosecondsSinceEpoch(lastSyncAt));
      await db.syncEntitys.putByType(e);
    } else {
      e.lastSyncAt = DateTime.fromMicrosecondsSinceEpoch(lastSyncAt);
      e.syncEndTime = DateTime.fromMicrosecondsSinceEpoch(lastSyncAt);
      await db.syncEntitys.putByType(e);
    }
  }
}
