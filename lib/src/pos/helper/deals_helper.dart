import '../../entity/pos/entity.dart';
import '../../repositories/deal_repository.dart';

class DealsHelper {

  final DealsRepository dealsRepository;
  DealsHelper({required this.dealsRepository });

  Future<Map<int, List<DealsEntity>>> findTheBestDealsForTheLineItems(List<TransactionLineItemEntity> lineItems) async {
    // Find the best deals for the line items
    Map<int, List<DealsEntity>> dealsMap = {};
    for (TransactionLineItemEntity lineItem in lineItems) {
      List<DealsEntity> deals = await findTheBestDealsForTheLineItem(lineItem);
      dealsMap[lineItem.lineItemSeq!] = deals;
    }
    return dealsMap;
  }

  Future<List<DealsEntity>> findTheBestDealsForTheLineItem(TransactionLineItemEntity lineItem) async {
    assert(lineItem.itemId != null);
    List<DealsEntity> deal = await dealsRepository.getDealsByItemId(lineItem.itemId!);
    return deal;
  }

  double calculateTotalDealsDiscountForTransaction(List<TransactionLineItemEntity> lineItems) {
    double totalDiscount = 0.0;
    for (var lineItem in lineItems) {
      totalDiscount += lineItem.lineModifiers.fold<double>(0.0, (previousValue, element) => previousValue + element.amount);
    }
    return totalDiscount;
  }

  TransactionLineItemModifierEntity createDealModifier(TransactionLineItemEntity line, DealItem deal, DealsEntity dealsEntity) {

    double amount = 0.0;
    double percent = 0.0;
    if (deal.action == DealAction.percentOff) {
      // Find the unit price * quantity
      double unitPrice = line.unitPrice!;
      double quantity = line.quantity!;
      percent = deal.actionValue ?? 0;
      amount = (unitPrice * quantity) * (percent / 100);
      // precise the decimal to 2 places
      amount = double.parse(amount.toStringAsFixed(2));
    } else if (deal.action == DealAction.currencyOff) {
      amount = deal.actionValue ?? 0;
      double unitPrice = line.unitPrice!;
      double quantity = line.quantity!;
      percent = (amount / (unitPrice * quantity)) * 100;
      // precise the decimal to 2 places
      percent = double.parse(percent.toStringAsFixed(2));
    }
    TransactionLineItemModifierEntity dealModifier = TransactionLineItemModifierEntity(
      amount: amount,
      extendedAmount: amount,
      description: dealsEntity.description,
      dealId: dealsEntity.dealId,
      isVoid: false,
      percent: percent,
      priceModifierReasonCode: 'DEAL',
    );
    return dealModifier;
  }
}