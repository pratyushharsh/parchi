import 'package:bloc/bloc.dart';
import 'package:logging/logging.dart';
import 'package:meta/meta.dart';

import '../../../entity/pos/entity.dart';
import '../../../repositories/transaction_repository.dart';

part 'return_order_event.dart';
part 'return_order_state.dart';

class ReturnOrderBloc extends Bloc<ReturnOrderEvent, ReturnOrderState> {
  final log = Logger('ReturnOrderBloc');

  TransactionRepository transactionRepository;
  List<TransactionLineItemEntity> currentOrderLineItem;

  ReturnOrderBloc({required this.transactionRepository, required this.currentOrderLineItem})
      : super(ReturnOrderState()) {
    on<SearchOrderToReturn>(_onSearchReturnOrderEvent);
    on<RemoveLineItemFromReturn>(_onRemoveLineItemToReturn);
    on<AddLineItemToReturn>(_onAddLineItemToReturn);
  }

  void _onSearchReturnOrderEvent(
      SearchOrderToReturn event, Emitter<ReturnOrderState> emit) async {
    emit(state.copyWith(status: ReturnOrderExistStatus.loading));
    try {
      final order = await transactionRepository.getTransaction(event.orderId);
      if (order == null) {
        emit(state.copyWith(
            status: ReturnOrderExistStatus.notFound,
            errorMessage: 'Order # ${event.orderId} not found.'));
        return;
      }
      final alreadyReturnedOrder = await transactionRepository
          .getLineItemWithOriginalTransactionNo(event.orderId);

      // Find the Already returned order.
      Map<String, double> alreadyReturnedOrderMap = {};

      for (var lineItem in currentOrderLineItem) {
        if (lineItem.returnFlag) {
          if (lineItem.originalTransSeq == event.orderId) {
            var key = "${lineItem.originalLineItemSeq}#${lineItem.itemId}";
            if (alreadyReturnedOrderMap.containsKey(key)) {
              alreadyReturnedOrderMap[key] =
                  alreadyReturnedOrderMap[key]! + lineItem.quantity!;
            } else {
              alreadyReturnedOrderMap[key] = lineItem.quantity!;
            }
          }
        }
      }

      for (var element in alreadyReturnedOrder) {
        var key = "${element.originalLineItemSeq}#${element.itemId}";

        if (alreadyReturnedOrderMap.containsKey(key)) {
          alreadyReturnedOrderMap[key] =
              alreadyReturnedOrderMap[key]! + element.quantity!;
        } else {
          alreadyReturnedOrderMap[key] = element.quantity!;
        }
      }

      List<TransactionLineItemEntity> availableLineItemToReturn = [];
      for (var lineItem in order.lineItems) {
        if (alreadyReturnedOrderMap
            .containsKey("${lineItem.lineItemSeq}#${lineItem.itemId}")) {
          if (alreadyReturnedOrderMap[
                  "${lineItem.lineItemSeq}#${lineItem.itemId}"]! <
              lineItem.quantity!) {
            availableLineItemToReturn.add(lineItem);
          }
        } else {
          availableLineItemToReturn.add(lineItem);
        }
      }

      emit(state.copyWith(
          status: ReturnOrderExistStatus.success,
          order: order,
          alreadyReturnedOrderMap: alreadyReturnedOrderMap,
          availableLineItemToReturn: availableLineItemToReturn,
          returnedLineItem: alreadyReturnedOrder));
    } catch (e) {
      log.severe(e);
      emit(state.copyWith(status: ReturnOrderExistStatus.error));
    }
  }

  void _onRemoveLineItemToReturn(
      RemoveLineItemFromReturn event, Emitter<ReturnOrderState> emit) async {
    Map<TransactionLineItemEntity, ReturnLineItemParameters> tmpMap =
        Map.from(state.returnMap);
    tmpMap.remove(event.lineItem);

    emit(state.copyWith(returnMap: tmpMap));
  }

  void _onAddLineItemToReturn(
      AddLineItemToReturn event, Emitter<ReturnOrderState> emit) async {
    Map<TransactionLineItemEntity, ReturnLineItemParameters> tmpMap =
        Map.from(state.returnMap);
    tmpMap.putIfAbsent(event.lineItem, () => event.returnLineItemParameters);
    emit(state.copyWith(returnMap: tmpMap));
  }
}
