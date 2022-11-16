import '../../entity/pos/entity.dart';
import '../config/config.dart';

class TransactionHelper {

  static TransactionLineItemEntity changeLineItemTax(
      TransactionLineItemEntity line, double taxAmount, String reasonCode,
      {required TaxCalculationMethod taxCalculationMethod,
      required TaxApplicationMethod taxApplicationMethod}) {
    // Calculate all the amount again for the item and assign
    double discountAmount = line.discountAmount!;
    double unitPrice = line.unitPrice!;

    double grossAmount = unitPrice * line.quantity!;
    double netAmount = grossAmount - discountAmount;

    // @TODO Recalculate the tax based on the new discount amount
    double unitTaxAmount = taxAmount;
    if (TaxCalculationMethod.percentage == taxCalculationMethod) {
      unitTaxAmount = unitPrice * taxAmount / 100;
    } else if (TaxCalculationMethod.amount == taxCalculationMethod) {
      unitTaxAmount = taxAmount;
    }

    double taxAmt = unitTaxAmount * line.quantity!;

    double extendedAmount = netAmount + taxAmt;

    TransactionLineItemEntity res = TransactionLineItemEntity(
      storeId: line.storeId,
      businessDate: line.businessDate,
      posId: line.posId,
      grossAmount: grossAmount,
      taxAmount: taxAmt,
      netAmount: netAmount,
      unitCost: line.unitCost,
      baseUnitPrice: line.baseUnitPrice,
      extendedAmount: extendedAmount,
      discountAmount: discountAmount,
      itemDescription: line.itemDescription,
      itemId: line.itemId,
      itemIdEntryMethod: line.itemIdEntryMethod,
      lineItemSeq: line.lineItemSeq,
      nonExchangeableFlag: line.nonExchangeableFlag,
      nonReturnableFlag: line.nonReturnableFlag,
      originalBusinessDate: line.originalBusinessDate,
      originalLineItemSeq: line.originalLineItemSeq,
      originalPosId: line.originalPosId,
      originalTransSeq: line.originalTransSeq,
      priceEntryMethod: line.priceEntryMethod,
      quantity: line.quantity,
      returnComment: line.returnComment,
      returnFlag: line.returnFlag,
      returnReasonCode: line.returnReasonCode,
      returnTypeCode: line.returnTypeCode,
      returnedQuantity: line.returnedQuantity,
      serialNumber: line.serialNumber,
      unitPrice: line.unitPrice,
      vendorId: line.vendorId,
      uom: line.uom,
      shippingWeight: line.shippingWeight,
      transSeq: line.transSeq,
      priceOverride: line.priceOverride,
      priceOverrideAmount: line.priceOverrideAmount,
      priceOverrideReason: line.priceOverrideReason,
    );
    res.lineModifiers.addAll(line.lineModifiers);
    return res;
  }
}
