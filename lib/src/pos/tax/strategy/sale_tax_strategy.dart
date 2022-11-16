
import '../../../entity/pos/entity.dart';
import '../../../entity/pos/tax_rule_entity.dart';
import 'abstract_tax_strategy.dart';

class SaleTaxStrategy extends AbstractTaxStrategy {
  @override
  double calculate(TaxRuleEntity taxRule, double taxableAmount) {
    if (taxRule.percent != null) {
      return (taxRule.percent! / 100) * taxableAmount;
    }

    if (taxRule.amount != null) {
      return taxRule.amount!;
    }
    log.severe("TAX RULE IS INCORRECT CONFIGURED");
    return 0.0;
  }

  @override
  double calculateOverrideAmount(TransactionLineItemTaxModifier modifier, double taxableAmount, double quantity) {
    double? taxRate = modifier.taxOverridePercent;
    if (taxRate != null) {
      return taxableAmount * taxRate;
    }

    double? taxAmount = modifier.taxOverrideAmount;
    if (taxAmount != null) {
      return calculateForAmount(taxableAmount, taxAmount);
    }
    log.severe("TAX OVERRIDE IS INCORRECT");
    return 0.0;
  }

  @override
  double reverseCalculatePercentage(double taxableAmount, double taxAmount) {
    if (taxAmount == 0 || taxableAmount == 0) return 0.0;
    return  taxAmount / taxableAmount * 100;
  }
}
