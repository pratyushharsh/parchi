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
}
