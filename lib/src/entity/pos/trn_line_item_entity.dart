import 'package:isar/isar.dart';

import 'entity.dart';

part 'trn_line_item_entity.g.dart';

@embedded
class TransactionLineItemEntity {
  int? storeId;
  DateTime? businessDate;
  int? posId;
  String? transSeq;
  int? lineItemSeq;
  String? category;
  String? itemId;
  String? itemDescription;
  String? itemColor;
  String? itemSize;
  String? hsn;
  double? quantity; // Quantity of the item
  double?
      unitPrice; // Unit price of the item for the transaction it will be overridden in case of price override
  double? unitCost; // Unit Cost At which item is sold.
  double? baseUnitPrice; // Unit price before any discount
  double? extendedAmount; // Unit Price * Quantity
  bool returnFlag;
  String? itemIdEntryMethod;
  String? priceEntryMethod;
  double? netAmount; // Item on which tax is calculated
  double? grossAmount; // Item paid for this line item.
  String? serialNumber;
  double? taxAmount; // Tax amount of the item
  double? discountAmount; // Discount amount on the item
  String? uom;
  String? currency;

  /// Price Override Reason
  bool priceOverride;
  double? priceOverrideAmount; // Deprecate
  String? priceOverrideReason;

  /// Return Parameters
  double? returnedQuantity;

  bool isVoid;

  final int? originalPosId;

  String? originalTransSeq;
  int? originalLineItemSeq;
  DateTime? originalBusinessDate;
  String? returnReasonCode;
  String? returnComment;
  String? returnTypeCode;

  bool nonReturnableFlag;
  bool nonExchangeableFlag;

  /// For DropShipping Items
  String? vendorId;
  double? shippingWeight;
  String? taxGroupId;

  // @Backlink(to: 'lineItems')
  // final header = IsarLink<TransactionHeaderEntity>();
  List<TransactionLineItemModifierEntity> lineModifiers;
  List<TransactionLineItemTaxModifier> taxModifiers;

  // final lineModifiers = IsarLinks<TransactionLineItemModifierEntity>();

  // final taxModifiers = IsarLinks<TransactionLineItemTaxModifier>();

  TransactionLineItemEntity({
    this.storeId,
    this.businessDate,
    this.posId,
    this.transSeq,
    this.lineItemSeq,
    this.priceOverride = false,
    this.priceOverrideAmount,
    this.priceOverrideReason,
    this.category,
    this.baseUnitPrice,
    this.itemId,
    this.itemDescription,
    this.itemColor,
    this.itemSize,
    this.quantity,
    this.hsn,
    this.unitPrice,
    this.unitCost,
    this.extendedAmount,
    this.discountAmount = 0.00,
    this.returnFlag = false,
    this.itemIdEntryMethod,
    this.priceEntryMethod,
    this.netAmount,
    this.grossAmount,
    this.serialNumber,
    this.taxAmount,
    this.uom,
    this.currency,
    this.returnedQuantity,
    this.originalPosId,
    this.originalTransSeq,
    this.originalLineItemSeq,
    this.originalBusinessDate,
    this.returnReasonCode,
    this.returnComment,
    this.returnTypeCode,
    this.isVoid = false,
    this.nonReturnableFlag = false,
    this.nonExchangeableFlag = false,
    this.vendorId,
    this.shippingWeight,
    this.taxGroupId,
    this.lineModifiers = const [],
    this.taxModifiers = const [],
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TransactionLineItemEntity &&
          runtimeType == other.runtimeType &&
          storeId == other.storeId &&
          businessDate == other.businessDate &&
          posId == other.posId &&
          transSeq == other.transSeq &&
          lineItemSeq == other.lineItemSeq &&
          category == other.category &&
          itemId == other.itemId &&
          itemDescription == other.itemDescription &&
          itemColor == other.itemColor &&
          itemSize == other.itemSize &&
          hsn == other.hsn &&
          quantity == other.quantity &&
          unitPrice == other.unitPrice &&
          unitCost == other.unitCost &&
          baseUnitPrice == other.baseUnitPrice &&
          extendedAmount == other.extendedAmount &&
          returnFlag == other.returnFlag &&
          itemIdEntryMethod == other.itemIdEntryMethod &&
          priceEntryMethod == other.priceEntryMethod &&
          netAmount == other.netAmount &&
          grossAmount == other.grossAmount &&
          serialNumber == other.serialNumber &&
          taxAmount == other.taxAmount &&
          discountAmount == other.discountAmount &&
          uom == other.uom &&
          currency == other.currency &&
          priceOverride == other.priceOverride &&
          priceOverrideAmount == other.priceOverrideAmount &&
          priceOverrideReason == other.priceOverrideReason &&
          returnedQuantity == other.returnedQuantity &&
          isVoid == other.isVoid &&
          originalPosId == other.originalPosId &&
          originalTransSeq == other.originalTransSeq &&
          originalLineItemSeq == other.originalLineItemSeq &&
          originalBusinessDate == other.originalBusinessDate &&
          returnReasonCode == other.returnReasonCode &&
          returnComment == other.returnComment &&
          returnTypeCode == other.returnTypeCode &&
          nonReturnableFlag == other.nonReturnableFlag &&
          nonExchangeableFlag == other.nonExchangeableFlag &&
          vendorId == other.vendorId &&
          shippingWeight == other.shippingWeight &&
          taxGroupId == other.taxGroupId &&
          lineModifiers == other.lineModifiers &&
          taxModifiers == other.taxModifiers;

  @override
  int get hashCode =>
      storeId.hashCode ^
      businessDate.hashCode ^
      posId.hashCode ^
      transSeq.hashCode ^
      lineItemSeq.hashCode ^
      category.hashCode ^
      itemId.hashCode ^
      itemDescription.hashCode ^
      itemColor.hashCode ^
      itemSize.hashCode ^
      hsn.hashCode ^
      quantity.hashCode ^
      unitPrice.hashCode ^
      unitCost.hashCode ^
      baseUnitPrice.hashCode ^
      extendedAmount.hashCode ^
      returnFlag.hashCode ^
      itemIdEntryMethod.hashCode ^
      priceEntryMethod.hashCode ^
      netAmount.hashCode ^
      grossAmount.hashCode ^
      serialNumber.hashCode ^
      taxAmount.hashCode ^
      discountAmount.hashCode ^
      uom.hashCode ^
      currency.hashCode ^
      priceOverride.hashCode ^
      priceOverrideAmount.hashCode ^
      priceOverrideReason.hashCode ^
      returnedQuantity.hashCode ^
      isVoid.hashCode ^
      originalPosId.hashCode ^
      originalTransSeq.hashCode ^
      originalLineItemSeq.hashCode ^
      originalBusinessDate.hashCode ^
      returnReasonCode.hashCode ^
      returnComment.hashCode ^
      returnTypeCode.hashCode ^
      nonReturnableFlag.hashCode ^
      nonExchangeableFlag.hashCode ^
      vendorId.hashCode ^
      shippingWeight.hashCode ^
      taxGroupId.hashCode ^
      lineModifiers.hashCode ^
      taxModifiers.hashCode;
}

class ItemIdEntryMethod extends EntryMethod {}

class EntryMethod {
  static const keyboard = "KEYBOARD";
}
