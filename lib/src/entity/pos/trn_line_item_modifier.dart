import 'package:isar/isar.dart';

part 'trn_line_item_modifier.g.dart';

@embedded
class TransactionLineItemModifierEntity {
  int? storeId;
  DateTime? businessDate;
  int? posId;
  String? transSeq;
  int? lineItemSeq;
  int? lineItemModSeq;

  double amount;
  double extendedAmount;
  String? notes;

  double? percent;
  String? priceModifierReasonCode;

  String? description;
  String? promotionId;
  String? dealId;
  String? discountCode;
  String? groupDiscountId;
  String? discountReasonCode;
  bool? isVoid;

  // @Backlink(to: 'lineModifiers')
  // final lineItem = IsarLink<TransactionLineItemEntity>();

  TransactionLineItemModifierEntity({
    this.storeId,
    this.businessDate,
    this.posId,
    this.transSeq,
    this.lineItemSeq,
    this.lineItemModSeq,
    this.amount = 0,
    this.extendedAmount = 0,
    this.notes,
    this.percent,
    this.priceModifierReasonCode,
    this.description,
    this.promotionId,
    this.dealId,
    this.discountCode,
    this.groupDiscountId,
    this.discountReasonCode,
    this.isVoid = false,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TransactionLineItemModifierEntity &&
          runtimeType == other.runtimeType &&
          storeId == other.storeId &&
          businessDate == other.businessDate &&
          posId == other.posId &&
          transSeq == other.transSeq &&
          lineItemSeq == other.lineItemSeq &&
          lineItemModSeq == other.lineItemModSeq &&
          amount == other.amount &&
          extendedAmount == other.extendedAmount &&
          notes == other.notes &&
          percent == other.percent &&
          priceModifierReasonCode == other.priceModifierReasonCode &&
          description == other.description &&
          promotionId == other.promotionId &&
          dealId == other.dealId &&
          discountCode == other.discountCode &&
          groupDiscountId == other.groupDiscountId &&
          discountReasonCode == other.discountReasonCode &&
          isVoid == other.isVoid;

  @override
  int get hashCode =>
      storeId.hashCode ^
      businessDate.hashCode ^
      posId.hashCode ^
      transSeq.hashCode ^
      lineItemSeq.hashCode ^
      lineItemModSeq.hashCode ^
      amount.hashCode ^
      extendedAmount.hashCode ^
      notes.hashCode ^
      percent.hashCode ^
      priceModifierReasonCode.hashCode ^
      description.hashCode ^
      promotionId.hashCode ^
      dealId.hashCode ^
      discountCode.hashCode ^
      groupDiscountId.hashCode ^
      discountReasonCode.hashCode ^
      isVoid.hashCode;
}
