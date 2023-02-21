import '../../entity/pos/entity.dart';

class DealEngine {

  Map<int, List<Pair<String, DealItem>>> findTheBestDealsForLineItems(List<TransactionLineItemEntity> lineItems, Map<int, List<DealsEntity>> rawDealsMap) {
    Map<int, List<Pair<String, DealItem>>> dealsMap = {};

    for (var lineItem in lineItems) {
      List<DealsEntity> deals = rawDealsMap[lineItem.lineItemSeq!]!;
      List<Pair<String, DealItem>> dealItems = [];
      for (var deal in deals) {
        for (var dealItem in deal.items) {
          dealItems.add(Pair(deal.dealId, dealItem));
        }
      }
      dealsMap[lineItem.lineItemSeq!] = dealItems;
    }
    return dealsMap;
  }
}
class Pair<K, T> {
  K key;
  T value;
  Pair(this.key, this.value);
}