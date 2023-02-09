part of 'background_sync_bloc.dart';

@immutable
abstract class BackgroundSyncEvent {}

class StartSyncEvent extends BackgroundSyncEvent {
  final int storeId;

  StartSyncEvent(this.storeId);
}
class StopSyncEvent extends BackgroundSyncEvent {}

class SyncAllDataEvent extends BackgroundSyncEvent {}

class SyncAllConfigDataEvent extends BackgroundSyncEvent {
  final bool forceSync;

  SyncAllConfigDataEvent({this.forceSync = false});
}

class LoadSampleData extends BackgroundSyncEvent {
  final bool fullImport;

  LoadSampleData({this.fullImport = false});
}

class ExportDataEvent extends BackgroundSyncEvent {}

class UpdateConnectivityStatus extends BackgroundSyncEvent {
  final ConnectivityResult connectivityResult;

  UpdateConnectivityStatus(this.connectivityResult);
}