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
}