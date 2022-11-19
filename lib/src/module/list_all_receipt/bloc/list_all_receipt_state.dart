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

class TransactionFilterCriteria {
  final TransactionStatus? status;
  final DateTimeRange? dateRange;

  const TransactionFilterCriteria({this.status, this.dateRange});

  TransactionFilterCriteria copyWith(
      {TransactionStatus? status, DateTimeRange? dateRange}) {
    return TransactionFilterCriteria(
        status: status ?? this.status,
        dateRange: dateRange ?? this.dateRange);
  }
}
