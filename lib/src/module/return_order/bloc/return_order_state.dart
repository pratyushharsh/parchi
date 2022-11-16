part of 'return_order_bloc.dart';

enum ReturnOrderExistStatus {
  initial,
  success,
  loading,
  error,
  notFound,
}

class ReturnOrderState {
  final ReturnOrderExistStatus status;
  final TransactionHeaderEntity? order;
  final String? errorMessage;
  final List<TransactionLineItemEntity> returnedLineItem;
  final List<TransactionLineItemEntity> availableLineItemToReturn;
  final Map<String, double> alreadyReturnedOrderMap;
  final Map<TransactionLineItemEntity, ReturnLineItemParameters> returnMap;

  const ReturnOrderState(
      {this.status = ReturnOrderExistStatus.initial,
      this.order,
      this.errorMessage,
      this.returnedLineItem = const [],
      this.availableLineItemToReturn = const [],
      this.alreadyReturnedOrderMap = const {},
      this.returnMap = const {}})
      : assert(status == ReturnOrderExistStatus.success ? order != null : true);

  ReturnOrderState copyWith(
      {ReturnOrderExistStatus? status,
      TransactionHeaderEntity? order,
      String? errorMessage,
      List<TransactionLineItemEntity>? returnedLineItem,
      List<TransactionLineItemEntity>? availableLineItemToReturn,
      Map<String, double>? alreadyReturnedOrderMap,
      Map<TransactionLineItemEntity, ReturnLineItemParameters>? returnMap}) {
    return ReturnOrderState(
        status: status ?? this.status,
        order: order ?? this.order,
        errorMessage: errorMessage ?? this.errorMessage,
        returnedLineItem: returnedLineItem ?? this.returnedLineItem,
        availableLineItemToReturn:
            availableLineItemToReturn ?? this.availableLineItemToReturn,
        alreadyReturnedOrderMap:
            alreadyReturnedOrderMap ?? this.alreadyReturnedOrderMap,
        returnMap: returnMap ?? this.returnMap);
  }

  @override
  String toString() {
    return 'ReturnOrderState{status: $status, order: $order, errorMessage: $errorMessage, returnMap: $returnMap}';
  }
}

class ReturnLineItemParameters {
  final String reasonCode;
  final double quantity;
  final String? comment;

  ReturnLineItemParameters({required this.reasonCode, required this.quantity, this.comment});
}
