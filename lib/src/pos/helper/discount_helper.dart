import 'dart:math' as math;
import 'dart:math';
import '../../entity/pos/entity.dart';
import '../config/config.dart';
import '../reason_code/reason_code.dart';

class DiscountHelper {
  TransactionLineItemModifierEntity? createNewDiscountOverrideLineModifier(
      TransactionLineItemEntity lineItem,
      DiscountEntity discount,
      String reason) {
    double itemBasePrice = lineItem.unitPrice!;

    if (DiscountCalculationMethod.percentage.name == discount.discountType) {
      var unitDiscount = itemBasePrice * min(discount.percent!, 100) / 100;

      return TransactionLineItemModifierEntity(
        storeId: lineItem.storeId,
        businessDate: lineItem.businessDate,
        posId: lineItem.posId,
        transSeq: lineItem.transSeq,
        lineItemSeq: lineItem.lineItemSeq,
        lineItemModSeq: lineItem.lineModifiers.length + 1,
        extendedAmount: unitDiscount * lineItem.quantity!,
        amount: unitDiscount * lineItem.quantity!,
        percent: discount.percent,
        priceModifierReasonCode: PriceModifierReasonCode.discountPercent.code,
        description: discount.description,
        discountCode: discount.discountCode,
        discountReasonCode: reason,
      );
    } else if (DiscountCalculationMethod.amount.name == discount.discountType) {
      var rawUnitDiscount = discount.amount! / lineItem.quantity!;
      var unitDiscount = math.min(rawUnitDiscount, lineItem.unitPrice!);

      return TransactionLineItemModifierEntity(
        storeId: lineItem.storeId,
        businessDate: lineItem.businessDate,
        posId: lineItem.posId,
        transSeq: lineItem.transSeq,
        lineItemSeq: lineItem.lineItemSeq,
        lineItemModSeq: lineItem.lineModifiers.length + 1,
        extendedAmount: unitDiscount * lineItem.quantity!,
        amount: discount.amount!,
        priceModifierReasonCode: PriceModifierReasonCode.discountAmount.code,
        description: discount.description,
        discountCode: discount.discountCode,
        discountReasonCode: reason,
      );
    } else if (DiscountCalculationMethod.group.name == discount.discountType) {}
    return null;
  }

  double calculateDiscountAmount(TransactionLineItemEntity lineItem) {
    double discountAmount = 0.0;
    for (var lineModifier in lineItem.lineModifiers) {
      if (lineModifier.priceModifierReasonCode ==
          PriceModifierReasonCode.discountPercent.code) {
        discountAmount += lineModifier.extendedAmount;
      } else if (lineModifier.priceModifierReasonCode ==
          PriceModifierReasonCode.discountAmount.code) {
        discountAmount += lineModifier.extendedAmount;
      }
    }
    return discountAmount;
  }

  void updateUnitPriceOnDiscountQuantityChange(
      TransactionLineItemEntity lineItem, double quantity) {
    for (var lineModifier in lineItem.lineModifiers) {
      // If the line item modifier is percentage discount then calculate discount based on that.
      if (lineModifier.priceModifierReasonCode ==
          PriceModifierReasonCode.discountPercent.code) {
        double discountPercent = lineModifier.percent!;
        var unitDiscount = lineItem.unitPrice! * discountPercent / 100;

        lineModifier.extendedAmount = unitDiscount * quantity;
        lineModifier.amount = unitDiscount * quantity;
      } else if (lineModifier.priceModifierReasonCode ==
          PriceModifierReasonCode.discountAmount.code) {
        var maximumDiscount = lineModifier.amount;
        var unitDiscount =
            math.min(maximumDiscount / quantity, lineItem.unitPrice!);

        lineModifier.extendedAmount = unitDiscount * quantity;
      }
    }
  }

  double calculateTransactionDiscountTotal(
      TransactionHeaderEntity transaction) {
    double discountTotal = 0.0;
    for (var lineItem in transaction.lineItems) {
      discountTotal += calculateDiscountAmount(lineItem);
    }
    return discountTotal;
  }

  List<TransactionLineItemModifierEntity>
      createLineItemModifierFromOriginalTransaction(
          TransactionLineItemEntity originalLine,
          TransactionLineItemEntity newLine) {

    List<TransactionLineItemModifierEntity> newLineModifiers = [];
    List<TransactionLineItemModifierEntity> originalLineModifiers = originalLine.lineModifiers.toList();

    for (var lineModifier in originalLineModifiers) {
      var unitDiscount = lineModifier.amount / originalLine.quantity!;
      var newModifier = TransactionLineItemModifierEntity(
        storeId: newLine.storeId,
        businessDate: newLine.businessDate,
        posId: newLine.posId,
        transSeq: newLine.transSeq,
        lineItemSeq: newLine.lineItemSeq,
        lineItemModSeq: newLineModifiers.length + 1,
        extendedAmount: - unitDiscount * newLine.quantity!,
        amount: - unitDiscount * newLine.quantity!,
        priceModifierReasonCode: lineModifier.priceModifierReasonCode,
        description: lineModifier.description,
        discountCode: lineModifier.discountCode,
        discountReasonCode: lineModifier.discountReasonCode,
      );
      newLineModifiers.add(newModifier);
    }

    return newLineModifiers;
  }
}
