part of 'list_all_receipt_bloc.dart';

@immutable
abstract class ListAllReceiptEvent {}

class LoadAllReceipt extends ListAllReceiptEvent {}

class UpdateFilterStatus extends ListAllReceiptEvent {
  final TransactionStatus? status;

  UpdateFilterStatus(this.status);
}

class UpdateFilterDateRange extends ListAllReceiptEvent {
  final DateTimeRange dateRange;

  UpdateFilterDateRange(this.dateRange);
}