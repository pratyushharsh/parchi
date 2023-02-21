import 'package:logging/logging.dart';

import '../../entity/pos/entity.dart';
import '../../entity/pos/tax_rule_entity.dart';
import '../../repositories/tax_repository.dart';
import '../helper/pos_helper.dart';
import '../tax/strategy/abstract_tax_strategy.dart';
import '../tax/strategy/sale_tax_strategy.dart';
import '../tax/tax_calculation_info.dart';
import 'abstract_calculator.dart';

class TaxModifierCalculator implements AbstractCalculator {
  final log = Logger('TaxModifierCalculator');
  final TaxRepository taxRepository;
  final TaxHelper taxHelper;

  TaxModifierCalculator({required this.taxRepository, required this.taxHelper});

  Future<TransactionLineItemEntity> calculateTaxForLineItem(TransactionLineItemEntity lineItem) async {
    for(TransactionLineItemTaxModifier mod in lineItem.taxModifiers) {
      // Check for tax override
      TaxRuleEntity? taxRule = await taxRepository.getTaxRulesByGroupIdAndRuleId(mod.taxGroupId!, mod.taxRuleId!);

      if (taxRule == null) {
        log.severe("Tax rule not found for group id: ${mod.taxGroupId} and rule name: ${mod.taxRuleName}");
        continue;
      }

      TaxCalculationInfo taxInfo = TaxCalculationInfo(
          modifier: mod,
          taxRule: taxRule,
          taxableAmount: mod.taxableAmount!,
          itemQuantity: lineItem.quantity!,
          rawTaxableAmount: mod.taxableAmount!);
      double originalTaxableAmount  = mod.originalTaxableAmount!;
      if (mod.taxOverride && mod.taxOverridePercent != null && mod.taxOverridePercent! > 0 && originalTaxableAmount > 0) {
        taxInfo.rawTaxableAmount = originalTaxableAmount;
      }

      AbstractTaxStrategy taxStrategy = getTaxStrategy(mod.authorityType);
      // Modified Tax
      calculateModifierTax(taxStrategy, taxInfo, lineItem.returnFlag);
    }
    return lineItem;
  }

  double calculateModifierTax(AbstractTaxStrategy taxStrategy, TaxCalculationInfo ti, bool isReturn) {
    double rawTaxAmount = 0.0;

    // Calculate the raw tax amount based on the tax strategy
    rawTaxAmount = taxStrategy.calculateRawAmount(ti.rawTaxableAmount, ti.itemQuantity, 0.0, ti);

    // @TODO Round the tax amount based upon the govt rounding factor and scale.
    if (_reverseCalculation(ti) && ti.modifier.taxOverride) {
      if (ti.modifier.taxOverridePercent == null && ti.modifier.taxOverrideAmount == null) {
        ti.modifier.taxOverrideAmount = rawTaxAmount;
        ti.modifier.taxOverridePercent = ti.modifier.rawTaxPercentage;
      }
      double overrideAmt = taxStrategy.calculateOverrideAmount(ti.modifier, ti.taxableAmount, ti.itemQuantity);
      double overridePct = taxStrategy.calculateOverridePercent(ti.modifier, ti.taxableAmount, ti.itemQuantity);

      ti.modifier.rawTaxAmount = rawTaxAmount;
      ti.modifier.taxableAmount = ti.taxableAmount;
      ti.modifier.taxAmount = overrideAmt;
      ti.modifier.taxPercent = overridePct;
      return overrideAmt;
    }

    ti.modifier.rawTaxAmount = rawTaxAmount;
    ti.modifier.taxableAmount = ti.taxableAmount;
    ti.modifier.taxAmount = rawTaxAmount;
    ti.modifier.taxPercent = taxStrategy.reverseCalculatePercentage(ti.taxableAmount, rawTaxAmount);

    return rawTaxAmount;
  }

  @override
  Future<List<TransactionLineItemEntity>> handleLineItemEvent(List<TransactionLineItemEntity> lineItems) async {
    for (TransactionLineItemEntity lineItem in lineItems) {
      // Find the tax Rules for the line item
      if (lineItem.taxGroupId == null) {
        continue;
      }
      var taxRules = await taxRepository.getTaxRulesByGroupId(lineItem.taxGroupId!);
      List<TransactionLineItemTaxModifier> taxModifiers = taxHelper.createSaleTaxModifiers(lineItem, taxRules);
      lineItem.taxModifiers = taxModifiers;
      await calculateTaxForLineItem(lineItem);
      lineItem.taxAmount = taxHelper.calculateTaxAmount(lineItem);
    }
    return lineItems;
  }

  bool _reverseCalculation(TaxCalculationInfo ti) {
    // @TODO also tackle the return scenario in case of verified return.
    return ti.modifier.taxOverride;
  }

  // @TODO Get the tax strategy based on the type
  AbstractTaxStrategy getTaxStrategy(String? type) {
    return SaleTaxStrategy();
  }
}