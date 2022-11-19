part of 'list_all_receipt_bloc.dart';

enum ListAllReceiptStatus { initial, loading, success, failure }

class ListAllReceiptState {
  final ListAllReceiptStatus status;
  final List<TransactionHeaderEntity> receipts;
  final TransactionFilterCriteria filter;

  ListAllReceiptState(
      {this.status = ListAllReceiptStatus.initial,
      this.receipts = const <TransactionHeaderEntity>[],
      this.filter = const TransactionFilterCriteria()});

  ListAllReceiptState copyWith(
      {ListAllReceiptStatus? status,
      List<TransactionHeaderEntity>? receipts,
      TransactionFilterCriteria? filter}) {
    return ListAllReceiptState(
        status: status ?? this.status,
        receipts: receipts ?? this.receipts,
        filter: filter ?? this.filter);
  }
}

enum TransactionSortByCriteria {
  date("Date (Oldest to Newest)"),
  dateDesc("Date (Newest to Oldest)"),
  amount("Amount (Lowest to Highest)"),
  amountHighToLow("Amount (Highest to Lowest)");

  final String value;
  const TransactionSortByCriteria(this.value);
}

class TransactionFilterCriteria {
  final TransactionStatus? status;
  final DateTimeRange? dateRange;
  final String? search;
  final List<TransactionType> transactionTypes;
  final int limit;
  final int offset;
  final TransactionSortByCriteria sortBy;

  const TransactionFilterCriteria(
      {this.status,
      this.dateRange,
      this.search,
      this.transactionTypes = const [],
      this.limit = 10,
      this.offset = 0,
      this.sortBy = TransactionSortByCriteria.dateDesc});

  TransactionFilterCriteria copyWith({
    TransactionStatus? status,
    DateTimeRange? dateRange,
    String? search,
    List<TransactionType>? transactionTypes,
    int? limit,
    int? offset,
    TransactionSortByCriteria? sortBy,
  }) {
    return TransactionFilterCriteria(
        status: status ?? this.status,
        dateRange: dateRange ?? this.dateRange,
        search: search ?? this.search,
        transactionTypes: transactionTypes ?? this.transactionTypes,
        limit: limit ?? this.limit,
        offset: offset ?? this.offset,
        sortBy: sortBy ?? this.sortBy);
  }
}
