part of 'return_order_bloc.dart';

@immutable
abstract class ReturnOrderEvent {}

class SearchOrderToReturn extends ReturnOrderEvent {
  final String orderId;

  SearchOrderToReturn({ required this.orderId });
}

class AddLineItemToReturn extends ReturnOrderEvent {
  final TransactionLineItemEntity lineItem;
  final ReturnLineItemParameters returnLineItemParameters;

  AddLineItemToReturn(
      { required this.lineItem, required this.returnLineItemParameters });
}

class RemoveLineItemFromReturn extends ReturnOrderEvent {
  final TransactionLineItemEntity lineItem;

  RemoveLineItemFromReturn({ required this.lineItem });
}