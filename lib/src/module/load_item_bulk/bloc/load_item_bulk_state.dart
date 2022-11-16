part of 'load_item_bulk_bloc.dart';

enum LoadItemBulkStatus { initial, loading, success, failure }

class LoadItemBulkState {
  final LoadItemBulkStatus status;

  LoadItemBulkState({ this.status = LoadItemBulkStatus.initial});

  LoadItemBulkState copyWith({LoadItemBulkStatus? status}) {
    return LoadItemBulkState(
      status: status ?? this.status
    );
  }
}
