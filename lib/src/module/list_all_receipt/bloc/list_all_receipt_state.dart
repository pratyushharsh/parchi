part of 'list_all_receipt_bloc.dart';

enum ListAllReceiptStatus { initial, loading, success, failure }

class ListAllReceiptState {
  final ListAllReceiptStatus status;
  final List<TransactionHeaderEntity> receipts;

  ListAllReceiptState(
      {this.status = ListAllReceiptStatus.initial,
      this.receipts = const <TransactionHeaderEntity>[]});

  ListAllReceiptState copyWith(
      {ListAllReceiptStatus? status, List<TransactionHeaderEntity>? receipts}) {
    return ListAllReceiptState(
        status: status ?? this.status, receipts: receipts ?? this.receipts);
  }
}
