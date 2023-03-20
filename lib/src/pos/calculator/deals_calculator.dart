import 'package:logging/logging.dart';

import '../../entity/pos/entity.dart';
import '../../repositories/deal_repository.dart';
import '../helper/deals_helper.dart';
import 'abstract_calculator.dart';
import 'deal_engine.dart';

class DealsCalculator implements AbstractCalculator {
  final log = Logger('DealsCalculator');
  final DealsRepository dealsRepository;
  final DealsHelper dealsHelper;

  DealsCalculator({required this.dealsRepository, required this.dealsHelper});

  @override
  Future<List<TransactionLineItemEntity>> handleLineItemEvent(List<TransactionLineItemEntity> lineItems) async {

    // Find all the deal for the line items
    Map<int, List<DealsEntity>> rawDealsMap = await dealsHelper.findTheBestDealsForTheLineItems(lineItems);

    // Use the algorithm to find the best deals for the line items
    DealEngine dealEngine = DealEngine(dealsHelper: dealsHelper);
    Map<int, List<Pair<String, DealItem>>> dealsMap = dealEngine.findTheBestDealsForLineItems(lineItems, rawDealsMap);
    // Apply the best deals to the line items
    // for (var lineItem in lineItems) {
    //   await calculateDealsForLineItem(lineItem, dealsMap[lineItem.lineItemSeq!]!);
    // }
    return lineItems;
  }

  Future<TransactionLineItemEntity> calculateDealsForLineItem(TransactionLineItemEntity lineItem, List<Pair<String, DealItem>> deals) async {
    // Apply the deal for all line items
    List<TransactionLineItemModifierEntity> modifiers = [   ];
    for (var deal in deals) {
      DealsEntity de = await dealsRepository.getDealById(deal.key);
      TransactionLineItemModifierEntity dealModifier = dealsHelper.createDealModifier(lineItem, deal.value, de);
      modifiers.add(dealModifier);
    }
    lineItem.lineModifiers = modifiers;

    // Sum all the modifier amount
    lineItem.discountAmount = modifiers.fold<double>(0.0, (previousValue, element) => previousValue + element.amount);
    lineItem.netAmount = lineItem.unitPrice! * lineItem.quantity! - lineItem.discountAmount!;
    // lineItem.unitPrice = lineItem.unitPrice! - lineItem.discountAmount;
    return lineItem;
  }

}