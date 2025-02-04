part of 'background_sync_bloc.dart';

enum BackgroundSyncStatus {
  initial,
  started,
  inProgress,
  success,
  sampleDataLoading,
  sampleDataSuccess,
  sampleDataFailure,
  sampleImageLoading,
  sampleImageFailure
}

class BackgroundSyncState {
  final BackgroundSyncStatus status;
  final int? storeId;
  final bool isOnline;

  const BackgroundSyncState(
      {this.status = BackgroundSyncStatus.initial,
      this.storeId,
      this.isOnline = true})
      : assert((status == BackgroundSyncStatus.started ||
                status == BackgroundSyncStatus.inProgress ||
                status == BackgroundSyncStatus.success)
            ? storeId != null
            : true);

  BackgroundSyncState copyWith(
      {BackgroundSyncStatus? status, int? storeId, bool? isOnline}) {
    return BackgroundSyncState(
        status: status ?? this.status,
        storeId: storeId ?? this.storeId,
        isOnline: isOnline ?? this.isOnline);
  }

  @override
  String toString() {
    return 'BackgroundSyncState{status: $status, storeId: $storeId}';
  }
}
