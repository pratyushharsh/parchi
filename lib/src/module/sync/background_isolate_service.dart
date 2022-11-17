import 'dart:convert';
import 'dart:isolate';

import 'package:isar/isar.dart';
import 'package:logging/logging.dart';
import 'package:http/http.dart' as http;

import '../../../log.dart';
import '../../database/db_provider.dart';
import '../../entity/pos/entity.dart';
import '../../repositories/repository.dart';
import 'background_customer_sync.dart';
import 'background_product_sync.dart';
import 'background_rptconfig_sync.dart';
import 'background_sync.dart';
import 'background_transaction_sync.dart';
import 'background_taxgroup_sync.dart';

/// Syncing architecture information
/// Pull the record from the last timestamp to the current timestamp
/// 1. Get the last timestamp from the local database
/// 2. Get the current timestamp from the server
/// 3. Get the data from the last timestamp to the current timestamp
/// 4. Save the data to the local database
/// 5. Update the last timestamp to the current timestamp

class BackgroundSyncServiceFromIso with DatabaseProvider {
  final log = Logger('BackgroundSyncServiceFromIso');
  InvoiceRepository invoiceRepository = InvoiceRepository();
  final int storeId;
  String tmpDir;
  String imageDir;

  final String _baseUrl =
      'https://mr4f4gk1n3.execute-api.ap-south-1.amazonaws.com/dev';

  List<String> toSyncEntity = [
    transactionSync,
    customerSync,
    productSync,
    taxGroupSync,
    reportConfigSync
  ];

  BackgroundTransactionSync bckTrnSync = BackgroundTransactionSync();
  BackgroundCustomerSync bckCustSync = BackgroundCustomerSync();
  BackgroundProductSync bckProdSync = BackgroundProductSync();
  BackgroundTaxGroupSync bckTaxSync = BackgroundTaxGroupSync();
  BackgroundReportConfigSync bckRptSync = BackgroundReportConfigSync();

  BackgroundSyncServiceFromIso(
      {required this.storeId, required this.tmpDir, required this.imageDir});

  initIsar() async {
    await DatabaseProvider.ensureInitialized(
        name: storeId.toString(), isolateInit: true);
  }

  Future<Map<String, dynamic>> uploadSyncData(
      Map<String, dynamic> input) async {
    var body = json.encode(input);
    log.info('Uploading Sync Data: $body');
    final response = await http.post(
      Uri.parse('$_baseUrl/business/$storeId/sync'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: body,
    );
    log.info('Response: ${response.body}');
    if (response.statusCode == 200) {
      var responseJson = json.decode(response.body);
      return responseJson;
    } else {
      log.severe(response.body);
      throw Exception('Failed to load data');
    }
  }

  Future<Map<String, dynamic>> getDataFromServer(int timestamp) async {
    log.info(
        'Get Sync Data From: $_baseUrl/business/$storeId/sync?startTime=$timestamp');
    final response = await http.get(
      Uri.parse('$_baseUrl/business/$storeId/sync?startTime=$timestamp'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    log.info('Response: ${response.body}');
    if (response.statusCode == 200) {
      var responseJson = json.decode(response.body);
      return responseJson;
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<void> syncAllData() async {
    // Fetch all the SyncEntity from the database
    try {
      var rawSyncData = await db.syncEntitys.where().findAll();
      // Filter the records to sync.
      // var syncEntities = rawSyncData.where((e) => toSyncEntity.contains(e.type)).toList();

      List<SyncEntity> syncEntities = [];
      for (var e in toSyncEntity) {
        var syncEntity = rawSyncData.firstWhere((element) => element.type == e,
            orElse: () => SyncEntity(
                type: e,
                lastSyncAt: null,
                status: 100,
                syncStartTime: DateTime.now(),
                syncEndTime: null));
        syncEntities.add(syncEntity);
      }

      await db.writeTxn(() async {
        await db.syncEntitys.putAllByType(syncEntities);
      });

      // Find the minimum lastsync time
      var minLastSyncTime = syncEntities
          .map((e) => e.lastSyncAt?.microsecondsSinceEpoch ?? 0)
          .reduce((value, element) => value < element ? value : element);

      // ***************** Import Process Start *****************
      // Fetch All the data from last sync.
      // Fetch Data from Server
      // Find the last sync time and proceed
      var data = await getDataFromServer(minLastSyncTime + 1);

      // ***************** Import Transaction Start *****************
      if (data['transactions'] != null) {
        await bckTrnSync.importData(
            data['transactions']['data'] ?? [], data['transactions']['to']);
      }
      // ***************** Import Transaction End   *****************

      // ***************** Import Customer Start *****************
      if (data['customers'] != null) {
        await bckCustSync.importData(
            data['customers']['data'] ?? [], data['customers']['to']);
      }
      // ***************** Import Customer End   *****************

      // ***************** Import Product Start *****************
      if (data['products'] != null) {
        await bckProdSync.importData(
            data['products']['data'] ?? [], data['products']['to']);
      }
      // ***************** Import Product End   *****************

      // ***************** Import TaxGroup Start *****************
      if (data['config'] != null && data['config']['taxConfig'] != null) {
        await bckTaxSync.importData(data['config']['taxConfig']['data'] ?? [],
            data['config']['taxConfig']['to']);
      }
      // ***************** Import TaxGroup End   *****************

      // ***************** Import ReportConfig Start *****************
      if (data['config'] != null && data['config']['invoiceConfig'] != null) {
        await bckRptSync.importData(
            data['config']['invoiceConfig']['data'] ?? [],
            data['config']['invoiceConfig']['to']);
      }
      // ***************** Import ReportConfig End   *****************

      // ***************** Import Process End *****************

      // ***************** Export Process Start *****************

      var unsyncedTransactions = await bckTrnSync.exportData();
      var unsyncedCustomers = await bckCustSync.exportData();
      var unsyncedProducts = await bckProdSync.exportData();
      var unsyncedTaxGroups = await bckTaxSync.exportData();
      var unsyncedReportConfig = await bckRptSync.exportData();

      Map<String, dynamic> rawRequestBody = {
        'transactions': unsyncedTransactions,
        'customers': unsyncedCustomers,
        'products': unsyncedProducts,
        'config': {
          'taxConfig': unsyncedTaxGroups,
          'invoiceConfig': unsyncedReportConfig
        }
      };

      if (!(unsyncedTransactions.isNotEmpty ||
          unsyncedCustomers.isNotEmpty ||
          unsyncedProducts.isNotEmpty ||
          unsyncedTaxGroups.isNotEmpty ||
          unsyncedReportConfig.isNotEmpty)) {
        log.info('No data to sync');
        return;
      }

      var uploadResponse = await uploadSyncData(rawRequestBody);

      // Construct the json to add lastSyncAt state and syncState
      // Update the syncState and lastSyncAt in the database
      int syncTimeInMicroseconds = uploadResponse['lastSyncedAt'];

      await bckTrnSync.importData(unsyncedTransactions, syncTimeInMicroseconds);
      await bckCustSync.importData(unsyncedCustomers, syncTimeInMicroseconds);
      await bckProdSync.importData(unsyncedProducts, syncTimeInMicroseconds);
      await bckTaxSync.importData(unsyncedTaxGroups, syncTimeInMicroseconds);
      await bckRptSync.importData(unsyncedReportConfig, syncTimeInMicroseconds);

      // Get all the image to upload.
      await bckProdSync.createZipForProductImages(unsyncedProducts, imageDir, tmpDir);
      // Upload the image
    } catch (e, st) {
      log.severe('Error while syncing data: $e', e, st);
    }
  }
}

class IsolateSyncService {
  static Logger log = Logger('IsolateSyncService');

  static executeSync(BackgroundSyncServiceFromIso syncDb) async {
    DateTime start = DateTime.now();
    // await syncDb.getNewTransactionToSync();
    await syncDb.syncAllData();
    DateTime end = DateTime.now();
    Duration diff = end.difference(start);
    log.info('Time taken to sync: ${diff.inMilliseconds} ms');
  }

  static void isolateEntryPoint(SendPort sendPort) async {
    final ReceivePort receivePort = ReceivePort();
    sendPort.send(receivePort.sendPort);
    // Initializing the logger
    initRootLogger();
    BackgroundSyncServiceFromIso? syncDb;
    receivePort.listen((dynamic message) async {
      if (message is Map) {
        if (message['syncType'] == 'start') {
          log.info('Starting Sync Service');
          syncDb = BackgroundSyncServiceFromIso(
              storeId: message['storeId'],
              tmpDir: message['tmpDir'],
              imageDir: message['imageDir']);
          await syncDb!.initIsar();
          await executeSync(syncDb!);
        } else if (message['syncType'] == 'refresh') {
          await executeSync(syncDb!);
        }
      }
    });
  }
}
