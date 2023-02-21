
import '../../entity/pos/trn_line_item_entity.dart';
import '../../repositories/price_repository.dart';
import 'abstract_calculator.dart';

class PriceCalculator implements AbstractCalculator {

  PriceRepository priceRepository;
  PriceCalculator({required this.priceRepository});

  @override
  Future<List<TransactionLineItemEntity>> handleLineItemEvent(List<TransactionLineItemEntity> lineItems) {
    // For each line item, find the item price.
    for (var lineItem in lineItems) {
      calculatePriceForLineItem(lineItem);
    }
    return Future.value(lineItems);
  }

  Future<TransactionLineItemEntity> calculatePriceForLineItem(TransactionLineItemEntity lineItem) async {
    // Find the price for the item
    double price = await priceRepository.findPriceForItemId(lineItem.itemId!);
    lineItem.unitPrice = price;
    lineItem.baseUnitPrice = price;
    lineItem.netAmount = price * lineItem.quantity!;
    return lineItem;
  }
}