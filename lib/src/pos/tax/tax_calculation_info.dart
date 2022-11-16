import '../../entity/pos/entity.dart';
import '../../entity/pos/tax_rule_entity.dart';

class TaxCalculationInfo {
  TransactionLineItemTaxModifier modifier;
  TaxRuleEntity taxRule;
  double taxableAmount;
  double itemQuantity;
  double rawTaxableAmount;

  TaxCalculationInfo(
      {required this.modifier,
      required this.taxRule,
      required this.taxableAmount,
      required this.itemQuantity,
      required this.rawTaxableAmount});
}
