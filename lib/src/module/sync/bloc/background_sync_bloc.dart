import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:isolate';

import 'package:archive/archive_io.dart';
import 'package:bloc/bloc.dart';
import 'package:logging/logging.dart';
import 'package:meta/meta.dart';


import '../../../config/constants.dart';
import '../background_isolate_service.dart';
import '../../../repositories/repository.dart';

part 'background_sync_event.dart';
part 'background_sync_state.dart';

class BackgroundSyncBloc
    extends Bloc<BackgroundSyncEvent, BackgroundSyncState> {
  final log = Logger('BackgroundSyncBloc');
  final SyncRepository syncRepository;
  final SyncConfigRepository syncConfigRepository;
  final InvoiceRepository invoiceRepository;
  final ProductRepository productRepository;

  Timer? _timer;
  Isolate? _isolate;
  bool isSyncEnabled = false;

  @override
  Future<void> close() async {
    if (_timer != null) {
      _timer!.cancel();
    }
    return super.close();
  }

  BackgroundSyncBloc(
      {required this.syncRepository,
      required this.syncConfigRepository,
      required this.invoiceRepository, required this.productRepository})
      : super(BackgroundSyncState()) {
    on<StartSyncEvent>(_onStartSyncEvent);
    on<SyncAllDataEvent>(_onSyncAllDataEvent);
    on<SyncAllConfigDataEvent>(_onSyncAllConfigEvent);
    on<LoadSampleData>(_onLoadSampleDataEvent);
    on<StopSyncEvent>(_onStopSyncEvent);
    on<ExportDataEvent>(_onExportDataEvent);
  }

  // @TODO Control Sync Using State
  void _onStartSyncEvent(
      StartSyncEvent event, Emitter<BackgroundSyncState> emit) async {
    if (!isSyncEnabled) {
      return;
    }

    if (_timer != null) {
      _timer!.cancel();
    }

    if (_isolate != null) {
      _isolate!.kill(priority: Isolate.immediate);
    }

    final ReceivePort receivePort = ReceivePort();
    _isolate = await Isolate.spawn(
        IsolateSyncService.isolateEntryPoint, receivePort.sendPort);
    SendPort sendPort = await receivePort.first;

    // Response Port
    ReceivePort responsePort = ReceivePort();
    responsePort.listen((dynamic message) {
      log.info('Received From Isolate: $message');
    });

    // Send Store Id to start the background sync.
    sendPort.send({
      'storeId': event.storeId,
      'sendPort': responsePort.sendPort,
      'syncType': 'start',
      'tmpDir': await Constants.getTmpPath(),
      'imageDir': Constants.baseImagePath
    });

    // sendPort.send(["Starting Background Sync", responsePort.sendPort]);
    emit(state.copyWith(
        storeId: event.storeId, status: BackgroundSyncStatus.started));
    log.info("Start Sync Event");
    _timer = Timer.periodic(const Duration(seconds: 60), (t) async {
      sendPort.send({
        'storeId': event.storeId,
        'sendPort': responsePort.sendPort,
        'syncType': 'refresh',
      });
    });
  }

  void _onStopSyncEvent(
      StopSyncEvent event, Emitter<BackgroundSyncState> emit) async {
    if (_timer != null) {
      _timer!.cancel();
    }

    if (_isolate != null) {
      _isolate!.kill(priority: Isolate.immediate);
    }
  }

  void _onSyncAllConfigEvent(
      SyncAllConfigDataEvent event, Emitter<BackgroundSyncState> emit) async {
    await syncConfigRepository.getSyncConfigDetails(forceSync: event.forceSync);
  }

  void _onLoadSampleDataEvent(
      LoadSampleData event, Emitter<BackgroundSyncState> emit) async {
    await syncConfigRepository.loadSampleProductAndImages(
        fullImport: event.fullImport);
  }

  void _onSyncAllDataEvent(
      SyncAllDataEvent event, Emitter<BackgroundSyncState> emit) async {
    if (state.status == BackgroundSyncStatus.inProgress) {
      return;
    }
    emit(state.copyWith(status: BackgroundSyncStatus.inProgress));
    DateTime start = DateTime.now();
    log.info("Starting Sync for all the Data");
    await syncRepository.startSync(state.storeId!);
    // DateTime end = DateTime.now();
    // Duration diff = end.difference(start);
    // log.info("${diff.inSeconds} Seconds elapsed in syncing the data");
    // emit(state.copyWith(status: BackgroundSyncStatus.success));
  }

  void _onExportDataEvent(
      ExportDataEvent event, Emitter<BackgroundSyncState> emit) async {
    // Get all the products;
    final products = await productRepository.getAllProducts();
    var tmpPath = await Constants.getTmpPath();
    // create a file and move to tmp location.
    Directory x = Directory(tmpPath);
    var tmpDir = await x.createTemp('image_export');

    log.info('Exporting Data to $tmpPath');
    for (var product in products) {
      var urls = product.imageUrl.where((e) => e.startsWith('file:/')).map((e) => '${Constants.baseImagePath}${e.substring(6)}').toList();
      for (var url in urls) {
        var fileName = '${product.productId}/${url.split('/').last}';
        var sourceFile = File(url);
        var destFile = File('${tmpDir.path}/$fileName');
        if (!await destFile.exists()) {
          await destFile.create(recursive: true);
        }
        await sourceFile.copy('${tmpDir.path}/$fileName');
      }
    }

    var encoder = ZipFileEncoder();
    encoder.zipDirectory(tmpDir, filename: '$tmpPath/log.zip');
  }
}
