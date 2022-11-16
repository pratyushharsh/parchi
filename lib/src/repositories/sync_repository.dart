import 'dart:convert';
import 'dart:io';
import 'dart:isolate';

import 'package:isar/isar.dart';
import 'package:logging/logging.dart';
import 'package:path_provider/path_provider.dart';


import '../database/db_provider.dart';
import '../entity/config/code_value_entity.dart';
import '../entity/pos/entity.dart';
import '../model/api/api.dart';
import '../util/helper/rest_api.dart';

/*
SyncState
100 - Initial
200 - Batched To Be Processed
300 - Sync Successful
500 - Failed to sync
 */

class SyncRepository with DatabaseProvider {
  final log = Logger('SyncRepository');

  final RestApiClient restClient;

  static const int staging = 200;
  static const int syncSuccessful = 300;
  static const int syncFailure = 500;
  DateTime firstStartTime = DateTime(2000);

  SyncRepository({
    required this.restClient,
  });

  Future<void> getProductDataFromLastSync(ImportDataFromServer request) async {
    try {
      var option =
          RestOptions(path: '/export', body: json.encode(request.toMap()));
      var rawResp = await restClient.post(restOptions: option);
      if (rawResp.statusCode == 200) {
        var decode = json.decode(rawResp.body);
        if (decode is List) {
          log.info("Fetched ${decode.length} records to sync");
        }
      } else {
        throw 'Unable to sync the data. Contact Admin';
      }
    } catch (e) {
      log.severe(e);
    }
  }

  Future<void> getContactsFromLastSync(ImportDataFromServer request) async {
    try {
      var option =
      RestOptions(path: '/export', body: json.encode(request.toMap()));
      var rawResp = await restClient.post(restOptions: option);
      if (rawResp.statusCode == 200) {
        var decode = json.decode(rawResp.body);
        if (decode is List) {
          log.info("Fetched ${decode.length} records to sync");
        }
      } else {
        throw 'Unable to sync the data. Contact Admin';
      }
    } catch (e) {
      log.severe(e);
    }
  }

  Future<void> getTransactionsFromLastSync(ImportDataFromServer request) async {
    try {
      var option =
      RestOptions(path: '/export', body: json.encode(request.toMap()));
      var rawResp = await restClient.post(restOptions: option);
      if (rawResp.statusCode == 200) {
        var decode = json.decode(rawResp.body);
        if (decode is List) {
          log.info("Fetched ${decode.length} records to sync");
          for (var element in decode) {
            try {
              // @TODO
              // await db.transactionDao.insertTransaction(TransactionHeaderEntity.fromMap(element));
              var lineItems = element["line_items"];
              if (lineItems is List) {
                // @TODO
                // await db.transactionDao.insertTransactionLineItems(lineItems.map((e) => TransactionLineItemEntity.fromMap(e)).toList());
              }
            } catch (e) {
              log.severe(e);
            }
          }
        }
      } else {
        throw 'Unable to sync the data. Contact Admin';
      }
    } catch (e) {
      log.severe(e);
    }
  }

  Future<void> exportData() async {
    try {
      var x = await db.transactionHeaderEntitys.where().exportJsonRaw((p0) => p0,);
      // var dir = Directory('/storage/emulated/0/Download');
      var dir = await getApplicationSupportDirectory();
      // Archive archive = Archive();
      log.info(dir.path);
      var myFile = File('${dir.path}/transaction.txt');
      await myFile.writeAsBytes(x, flush: true);
      log.info('File written');
    } catch (e) {
      log.severe(e);
    }
  }

  // Future<SyncDataResponse> uploadDataToServer(SyncDataRequest request) async {
  //   try {
  //     var option =
  //         RestOptions(path: '/sync', body: json.encode(request.toMap()));
  //     var rawResp = await restClient.post(restOptions: option);
  //     if (rawResp.statusCode == 200) {
  //       log.info('Successfully Synced the data');
  //       return Future.value(SyncDataResponse());
  //     } else {
  //       throw 'Unable to sync the data. Contact Admin';
  //     }
  //   } catch (e) {
  //     log.severe(e);
  //     throw 'Error while syncing the data';
  //   }
  // }
  //
  // Future<SyncEntity?> _initiateSync({required EntityType entity}) async {
  //   // Get If there is already sync going on
  //   DateTime now = DateTime.now();
  //   // @TODO
  //   SyncEntity? lastSyncStatus = await db.syncDao.findSyncById(entity.type);
  //   if (lastSyncStatus != null && lastSyncStatus.status == 200) {
  //     if (now.difference(lastSyncStatus.syncStartTime!).inSeconds > 120) {
  //       log.warning("Unable to find the last sync status. Retrying...");
  //     } else {
  //       log.info("Sync already in progress waiting it for finish");
  //       return null;
  //     }
  //   }
  //   return lastSyncStatus;
  // }
  //
  // Future<void> _initiateBatch(
  //     {required EntityType entity, required int syncState}) async {
  //   DateTime curTime = DateTime.now();
  //   var st = db.database.batch();
  //
  //   if (EntityType.product == entity) {
  //     st.execute('UPDATE product SET syncState = ?1 where syncState < 200',
  //         [syncState]);
  //   } else if (EntityType.transaction == entity) {
  //     st.execute('UPDATE trn_header SET syncState = ?1 where syncState < 200',
  //         [syncState]);
  //   } else if (EntityType.contact == entity) {
  //     st.execute('UPDATE customer SET syncState = ?1 where syncState < 200',
  //         [syncState]);
  //   }
  //
  //   st.execute(
  //       'INSERT INTO sync(type, status, syncStartTime) VALUES (?1, ?2, ?3) ON CONFLICT (type) DO UPDATE SET status=excluded.status, syncStartTime=excluded.syncStartTime',
  //       [entity.type, 200, curTime.millisecondsSinceEpoch]);
  //   await st.commit();
  // }
  //
  // Future<void> _closeOrUpdateSync(
  //     {required EntityType entity, required int syncState}) async {
  //   DateTime syncEndTime = DateTime.now();
  //   var en = db.database.batch();
  //
  //   if (EntityType.product == entity) {
  //     en.execute('UPDATE product SET syncState = ?1 where syncState = 200',
  //         [syncState]);
  //   } else if (EntityType.transaction == entity) {
  //     en.execute('UPDATE trn_header SET syncState = ?1 where syncState = 200',
  //         [syncState]);
  //   } else if (EntityType.contact == entity) {
  //     en.execute('UPDATE customer SET syncState = ?1 where syncState = 200',
  //         [syncState]);
  //   }
  //
  //   en.execute(
  //       'INSERT INTO sync(type, status, syncEndTime, lastSyncAt) VALUES (?1, ?2, ?3, ?4) ON CONFLICT (type) DO UPDATE SET status=excluded.status, syncEndTime=excluded.syncEndTime, lastSyncAt=excluded.lastSyncAt',
  //       [
  //         entity.type,
  //         syncState,
  //         syncEndTime.millisecondsSinceEpoch,
  //         syncEndTime.millisecondsSinceEpoch
  //       ]);
  //   await en.commit();
  // }
  //
  // Future<void> _getAllTheProductFromLastSync(String storeId) async {
  //
  //   // Get Last Sync Time
  //   SyncEntity? sync = await _initiateSync(entity: EntityType.product);
  //   DateTime lastSyncTime = sync?.lastSyncAt ?? firstStartTime;
  //   // Create Batch For Sync
  //   await _initiateBatch(entity: EntityType.product, syncState: staging);
  //
  //   // Fetch Data From Server And Insert In Db
  //   // @TODO Handle the error
  //   try {
  //     await getProductDataFromLastSync(ImportDataFromServer(
  //         storeId: storeId,
  //         type: "product",
  //         lastSyncAt: lastSyncTime.toUtc().toIso8601String()));
  //   } catch (e) {
  //     log.severe(e);
  //   }
  //
  //   try {
  //     // Start Uploading to server the difference
  //     var products = await db.productDao.getProductByStatus(staging);
  //     var data = products.map((e) => e.toMap()).toList();
  //     log.info("Uploading ${data.length} records to sync to server");
  //     if (data.isNotEmpty) {
  //       var req = SyncDataRequest(products: data);
  //       await uploadDataToServer(req);
  //       log.info(data);
  //     }
  //     // End Send to server
  //
  //     // Update Status After Success failure for sync
  //     await _closeOrUpdateSync(
  //         entity: EntityType.product, syncState: syncSuccessful);
  //   } catch (e) {
  //     log.severe(e);
  //     await _closeOrUpdateSync(
  //         entity: EntityType.product, syncState: syncFailure);
  //   }
  // }
  //
  // Future<void> syncProducts() async {
  //   // Fetch the last sync status
  //   DateTime now = DateTime.now();
  //   SyncEntity? lastSyncStatus =
  //       await db.syncDao.findSyncById(EntityType.product.type);
  //   if (lastSyncStatus != null && lastSyncStatus.status == 200) {
  //     if (now.difference(lastSyncStatus.syncStartTime!).inSeconds > 120) {
  //       log.warning("Unable to find the last sync status. Retrying...");
  //     } else {
  //       log.info("Sync already in progress waiting it for finish");
  //       return;
  //     }
  //   }
  // }
  //
  // /// Transaction Sync Detail
  // /// Can only upload own store transaction
  // /// But can view others tranasaction
  // Future<void> _getAllTransactionFromLastSync(String storeId) async {
  //   // Get If there is already sync going on
  //   // Get Last Sync Time
  //   SyncEntity? sync = await _initiateSync(entity: EntityType.transaction);
  //   DateTime lastSyncTime = sync?.lastSyncAt ?? firstStartTime;
  //   // Create Batch For Sync
  //   await _initiateBatch(entity: EntityType.transaction, syncState: staging);
  //
  //
  //   // Fetch the transaction and store in the database
  //   // Fetch Data From Server And Insert In Db
  //   // @TODO Handle the error
  //   try {
  //     await getTransactionsFromLastSync(ImportDataFromServer(
  //         storeId: storeId,
  //         type: "transaction",
  //         lastSyncAt: lastSyncTime.toUtc().toIso8601String()));
  //   } catch (e) {
  //     log.severe(e);
  //   }
  //   // End Fetch From Server
  //
  //   try {
  //     // Send Transaction To Server
  //     var transactions =
  //         await db.transactionDao.getTransactionHeaderByStatus(staging);
  //     var header = transactions.map((e) async {
  //       var lineItem =
  //           await db.transactionDao.findLineItemByTransactionSeq(e.transId);
  //       return {
  //         ...e.toMap(),
  //         "line_items": lineItem.map((l) => l.toMap()),
  //       };
  //     }).toList();
  //     var data = await Future.wait(header);
  //     log.info("Uploading ${data.length} transactions to sync to server");
  //     if (data.isNotEmpty) {
  //       var req = SyncDataRequest(transactions: data);
  //       await uploadDataToServer(req);
  //       log.info(data);
  //     }
  //     // End Send to server
  //
  //     // Update Status After Success failure for sync
  //     await _closeOrUpdateSync(
  //         entity: EntityType.transaction, syncState: syncSuccessful);
  //   } catch (e) {
  //     log.severe(e);
  //     await _closeOrUpdateSync(
  //         entity: EntityType.transaction, syncState: syncFailure);
  //   }
  // }
  //
  // Future<void> _syncAllContacts(String storeId) async {
  //   // Get If there is already sync going on
  //   // Get Last Sync Time
  //   SyncEntity? sync = await _initiateSync(entity: EntityType.contact);
  //   DateTime lastSyncTime = sync?.lastSyncAt ?? firstStartTime;
  //   // Create Batch For Sync
  //   await _initiateBatch(entity: EntityType.contact, syncState: staging);
  //
  //
  //   // Fetch the transaction and store in the database
  //   // Fetch Data From Server And Insert In Db
  //   // @TODO Handle the error
  //   try {
  //     await getContactsFromLastSync(ImportDataFromServer(
  //         storeId: storeId,
  //         type: "customer",
  //         lastSyncAt: lastSyncTime.toUtc().toIso8601String()));
  //   } catch (e) {
  //     log.severe(e);
  //   }
  //   // End Fetch From Server
  //
  //
  //   /// Upload the sync data
  //   try {
  //     // Send Contacts To Server
  //     var contacts = await db.contactDao.getCustomerByStatus(staging);
  //     var data = contacts.map((e) => e.toMap()).toList();
  //     log.info(data);
  //     log.info("Uploading ${data.length} contacts to sync to server");
  //     if (data.isNotEmpty) {
  //       var req = SyncDataRequest(customers: data);
  //       await uploadDataToServer(req);
  //       log.info(data);
  //     }
  //     // End Send to server
  //
  //     // Update Status After Success failure for sync
  //     await _closeOrUpdateSync(
  //         entity: EntityType.contact, syncState: syncSuccessful);
  //   } catch (e) {
  //     log.severe(e);
  //     await _closeOrUpdateSync(
  //         entity: EntityType.contact, syncState: syncFailure);
  //   }
  // }


  Future<String> createDummyMessages() async {
    // we don't need the path here because the instance is already open
    final isar = await Isar.open(
      [TransactionHeaderEntitySchema],
        name: 'xpos'
    );

    var data = await isar.transactionHeaderEntitys.where().findAll();
    print(data);
    return 'Data';
  }

  static void spawnIsolate(SendPort sendPort) async {
    print("It is present in new isolate");
    ReceivePort childReceivePort = ReceivePort();
    sendPort.send(childReceivePort.sendPort);

    final isar = await Isar.open(
        [
          RetailLocationEntitySchema,
          ContactEntitySchema,
          EmployeeEntitySchema,
          EmployeeRoleEntitySchema,
          ProductEntitySchema,
          CollectionEntitySchema,
          SequenceEntitySchema,
          SettingEntitySchema,
          SyncEntitySchema,
          TransactionHeaderEntitySchema,
          CodeValueEntitySchema,
          ReasonCodeEntitySchema,
          TaxGroupEntitySchema,
          ReportConfigEntitySchema,
        ],
        name: 'xpos'
    );

    // Get the last config from the database

    var parsedDate = DateTime.parse('1974-03-20 00:00:00.000');
    var data = await isar.transactionHeaderEntitys.filter().lastChangedAtGreaterThan(parsedDate).findAll();
    print(data);

    SendPort sPort = (await childReceivePort.first)[1];
    sPort.send("Hello");
    print("New Isolate End");
  }

  Future<void> startSync(int storeId) async {
    ReceivePort receivePort = ReceivePort();
    // Isolate.spawn(spawnIsolate, receivePort.sendPort);
    //
    // SendPort sendPort = await receivePort.first;
    //
    // ReceivePort responsePort = ReceivePort();
    // sendPort.send(["Logic", responsePort.sendPort]);
    // var resp = await responsePort.first;
    // print(resp);
  }
}
