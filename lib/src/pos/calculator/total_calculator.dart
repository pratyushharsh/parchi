import '../../entity/pos/entity.dart';
import 'abstract_calculator.dart';

class TotalCalculator implements AbstractCalculator {

  @override
  Future<List<TransactionLineItemEntity>> handleLineItemEvent(List<TransactionLineItemEntity> lineItems) {
    // For each line item, find the item price.
    for (var lineItem in lineItems) {
      calculateTotalForLineItem(lineItem);
    }
    return Future.value(lineItems);
  }

  Future<TransactionLineItemEntity> calculateTotalForLineItem(TransactionLineItemEntity lineItem) async {
    // Find the price for the item
    lineItem.grossAmount = lineItem.netAmount! + lineItem.taxAmount!;
    lineItem.unitCost = lineItem.grossAmount! / lineItem.quantity!;
    return lineItem;
  }
}