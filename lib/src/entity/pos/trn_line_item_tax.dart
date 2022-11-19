import 'package:isar/isar.dart';

part 'trn_line_item_tax.g.dart';

@embedded
class TransactionLineItemTaxModifier {

  String? transSeq;
  int? lineItemSeq;

  String? authorityId;
  String? authorityName;
  String? authorityType;
  String? taxGroupId;
  String? taxRuleId;
  String? taxRuleName;
  String? taxLocationId;

  double? taxableAmount;
  double? taxAmount;
  double? taxPercent;
  double? originalTaxableAmount;
  double? rawTaxPercentage;
  double? rawTaxAmount;

  // Tax Exempt Parameter

  // Tax Override Parameter
  bool taxOverride;
  double? taxOverrideAmount;
  double? taxOverridePercent;
  String? taxOverrideReasonCode;

  TransactionLineItemTaxModifier(
      {
      this.transSeq,
      this.lineItemSeq,
      this.authorityId,
      this.authorityName,
      this.authorityType,
      this.taxGroupId,
      this.taxRuleId,
      this.taxRuleName,
      this.taxLocationId,
      this.taxableAmount,
      this.taxAmount,
      this.taxPercent,
      this.originalTaxableAmount,
      this.rawTaxPercentage,
      this.rawTaxAmount,
      this.taxOverride = false,
      this.taxOverrideAmount,
      this.taxOverridePercent,
      this.taxOverrideReasonCode});
}
