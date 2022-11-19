part of 'list_all_receipt_bloc.dart';

@immutable
abstract class ListAllReceiptEvent {}

class InitTransactionSearch extends ListAllReceiptEvent {}

class LoadAllReceipt extends ListAllReceiptEvent {}

class LoadNextReceipt extends ListAllReceiptEvent {}

class UpdateFilterStatus extends ListAllReceiptEvent {
  final TransactionStatus? status;

  UpdateFilterStatus(this.status);
}

class UpdateFilterDateRange extends ListAllReceiptEvent {
  final DateTimeRange dateRange;

  UpdateFilterDateRange(this.dateRange);
}

class SearchTransactionByText extends ListAllReceiptEvent {
  final String id;

  SearchTransactionByText(this.id);
}

class SortTransaction extends ListAllReceiptEvent {
  final TransactionSortByCriteria sortType;

  SortTransaction(this.sortType);
}

class AddTransactionTypeForFilter extends ListAllReceiptEvent {
  final TransactionType type;

  AddTransactionTypeForFilter(this.type);
}

class RemoveTransactionTypeFromFilter extends ListAllReceiptEvent {
  final TransactionType type;

  RemoveTransactionTypeFromFilter(this.type);
}