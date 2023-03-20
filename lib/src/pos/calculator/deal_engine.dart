import '../../entity/pos/entity.dart';
import '../helper/deals_helper.dart';
import 'package:collection/collection.dart';

class DealEngine {
  final DealsHelper dealsHelper;

  DealEngine({required this.dealsHelper});

  void clearAllTheExistingDeals(List<TransactionLineItemEntity> lineItems) {
    for (var lineItem in lineItems) {
      lineItem.lineModifiers = [];
    }
  }

  // @TODO use the dart isolate to compute the result.
  Map<int, List<Pair<String, DealItem>>> findTheBestDealsForLineItems(
      List<TransactionLineItemEntity> lineItems,
      Map<int, List<DealsEntity>> rawDealsMap) {
    Map<int, List<Pair<String, DealItem>>> dealsMap = {};

    HeapPriorityQueue<DealEngineResults> pq =
        HeapPriorityQueue<DealEngineResults>(
            (a, b) => b.totalDiscount.compareTo(a.totalDiscount));

    // Clear all the deals
    clearAllTheExistingDeals(lineItems);

    findAndApplyTheBestDealToTheItem(lineItems, rawDealsMap, pq);
    // for (var lineItem in lineItems) {
    //   List<DealsEntity> deals = rawDealsMap[lineItem.lineItemSeq!]!;
    //   List<Pair<String, DealItem>> dealItems = [];
    //   for (var deal in deals) {
    //     for (var dealItem in deal.items) {
    //       dealItems.add(Pair(deal.dealId, dealItem));
    //     }
    //   }
    //   dealsMap[lineItem.lineItemSeq!] = dealItems;
    // }

    // Apply the best deal to the line item
    DealEngineResults bestDeal = pq.first;
    for (var lineItem in lineItems) {
      List<TransactionLineItemModifierEntity> mods =
          bestDeal.dealsMap[lineItem.lineItemSeq!]!;
      lineItem.lineModifiers = mods;
    }

    return dealsMap;
  }

  // Will recursively apply the deal and find the best deal for the item.
  void findAndApplyTheBestDealToTheItem(
      List<TransactionLineItemEntity> lineItems,
      Map<int, List<DealsEntity>> rawDealsMap,
      HeapPriorityQueue<DealEngineResults> res) {
    Set<String> dId = {};
    List<DealsEntity> deals = [];
    for (var deal in rawDealsMap.values) {
      for (var d in deal) {
        if (!dId.contains(d.dealId)) {
          dId.add(d.dealId);
          deals.add(d);
        }
      }
    }

    findAndApplyTheBestDealToTheItemHelper(
        lineItems, rawDealsMap, deals, 0, res);
  }

  void findAndApplyTheBestDealToTheItemHelper(
      List<TransactionLineItemEntity> lineItems,
      Map<int, List<DealsEntity>> rawDealsMap,
      List<DealsEntity> deals,
      int dealIndex,
      HeapPriorityQueue<DealEngineResults> res) {
    if (dealIndex >= deals.length) {
      // Calculate the total discount by applying all the deals and return
      double totalDeal =
          dealsHelper.calculateTotalDealsDiscountForTransaction(lineItems);
      Map<int, List<TransactionLineItemModifierEntity>> dealsMap = {};
      for (var lineItem in lineItems) {
        dealsMap[lineItem.lineItemSeq!] = List.from(lineItem.lineModifiers);
      }
      var tmp = DealEngineResults(totalDiscount: totalDeal, dealsMap: dealsMap);
      res.add(tmp);
      return;
    }
    DealsEntity deal = deals[dealIndex];

    // without applying the deal
    findAndApplyTheBestDealToTheItemHelper(
        lineItems, rawDealsMap, deals, dealIndex + 1, res);

    Map<int, List<TransactionLineItemModifierEntity>> dealsMap =
        applyDealToItems(deal, lineItems);

    // with applying the deal
    for (var lineItem in lineItems) {
      List<TransactionLineItemModifierEntity> mods = List.from(lineItem.lineModifiers);
      if (dealsMap[lineItem.lineItemSeq!] != null && dealsMap[lineItem.lineItemSeq!]!.isNotEmpty) {
        mods.addAll(dealsMap[lineItem.lineItemSeq!]!);
        lineItem.lineModifiers = mods;
      }
    }

    findAndApplyTheBestDealToTheItemHelper(
        lineItems, rawDealsMap, deals, dealIndex + 1, res);

    // Remove all the deals which is applied
    for (var lineItem in lineItems) {
      List<TransactionLineItemModifierEntity> mods = List.from(lineItem.lineModifiers);
      if (dealsMap[lineItem.lineItemSeq!] != null && dealsMap[lineItem.lineItemSeq!]!.isNotEmpty) {
        mods.removeRange(mods.length - dealsMap[lineItem.lineItemSeq!]!.length, mods.length);
        lineItem.lineModifiers = mods;
      }
    }

  }

  Map<int, List<TransactionLineItemModifierEntity>> applyDealToItems(
      DealsEntity deal, List<TransactionLineItemEntity> lineItems) {
    Map<int, List<TransactionLineItemModifierEntity>> dealsMap = {};

    // Create index for line items and the deal item test fields
    Map<int, List<int>> dealItemIdx = {};

    for (var i = 0; i < deal.dealFields.length; i++) {
      DealFieldsTest df = deal.dealFields[i];
      if (df.matchingField == MatchingField.item) {
        bool lineItemFound = false;
        for (var lineItem in lineItems) {
          if (df.matchingRule == MatchingRule.equal) {
            if (lineItem.itemId == df.matchingRuleValue1) {
              lineItemFound = true;
              if (dealItemIdx.containsKey(i)) {
                dealItemIdx[i]!.add(lineItem.lineItemSeq!);
              } else {
                dealItemIdx[i] = [lineItem.lineItemSeq!];
              }
            }
          }
        }
        if (!lineItemFound) {
          return dealsMap;
        }
      }
    }

    // If all the conditions are satisfied then apply the deal to the items.
    for (var i = 0; i < deal.items.length; i++) {
      DealItem dealItem = deal.items[i];
      List<int> itemIndex = dealItemIdx[i]!;
      // Calculate the total quantity of the deal item
      double totalQuantity = 0.0;
      for (var j = 0; j < itemIndex.length; j++) {
        totalQuantity += lineItems[itemIndex[j] - 1].quantity ?? 0.0;
      }

      // Calculate the number of times the deal can be applied
      if (totalQuantity >= dealItem.minQuantity && totalQuantity <= dealItem.maxQuantity) {
        for (var k = 0; k < itemIndex.length; k++) {
          TransactionLineItemModifierEntity mod =
          dealsHelper.createDealModifier(lineItems[itemIndex[k] - 1], dealItem, deal);
          if (dealsMap.containsKey(itemIndex[k])) {
            dealsMap[itemIndex[k]]!.add(mod);
          } else {
            dealsMap[itemIndex[k]] = [mod];
          }
        }
      }
    }

    return dealsMap;
  }

  bool isDealApplicableForLineItem(
      DealsEntity deal, TransactionLineItemEntity lineItem) {
    return true;
  }

  bool checkIfDealCanBeAdded(
      DealsEntity deal, TransactionLineItemEntity lineItem) {
    return lineItem.lineModifiers.isEmpty;
  }

  // bool canDealsCombine(DealsEntity deal1, DealsEntity deal2) {
  //   return false;
  // }

  // 0 0 - 0.0
  // 0 1 - 3.5
  // 1 0 - 3.5
  // 1 1

  // DealItem? getDealItem(DealsEntity deal, TransactionLineItemEntity lineItem) {
  //   for (var i = 0; i < deal.dealFields.length; i++) {
  //     if (deal.dealFields[i].matchingField == MatchingField.item &&
  //         deal.dealFields[i].matchingRule == MatchingRule.equal &&
  //         deal.dealFields[i].matchingRuleValue1 == lineItem.itemId) {
  //       return deal.items[i];
  //     }
  //   }
  //   return null;
  // }

  double calculateTheDealDiscount(
      TransactionLineItemEntity lineItem, DealsEntity deal, DealItem dealItem) {
    TransactionLineItemModifierEntity mod =
        dealsHelper.createDealModifier(lineItem, dealItem, deal);
    return mod.amount;
  }
}

class Pair<K, T> {
  K key;
  T value;
  Pair(this.key, this.value);
}

class DealEngineResults {
  final double totalDiscount;
  final Map<int, List<TransactionLineItemModifierEntity>> dealsMap;
  DealEngineResults({required this.totalDiscount, this.dealsMap = const {}});
}
