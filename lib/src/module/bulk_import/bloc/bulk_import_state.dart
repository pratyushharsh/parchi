part of 'bulk_import_bloc.dart';

enum BulkImportStatus { initial, loading, success, failure }

class BulkImportState {
  final BulkImportStatus status;
  final String? message;

  const BulkImportState({
    this.status = BulkImportStatus.initial,
    this.message,
  });

  BulkImportState copyWith({
    BulkImportStatus? status,
    String? message,
  }) {
    return BulkImportState(
      status: status ?? this.status,
      message: message ?? this.message,
    );
  }

  @override
  String toString() => 'BulkImportState { status: $status, message: $message }';
}
