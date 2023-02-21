import 'package:logging/logging.dart';


import '../../entity/pos/entity.dart';
import '../../entity/pos/tax_rule_entity.dart';
import '../../repositories/repository.dart';

class TaxHelper {
  static final log = Logger('TaxHelper');
  // final TaxRepository taxRepository;

  // TaxHelper({required this.taxRepository});

  // Future<List<TaxRuleEntity>> getTaxRuleByGroupId(String groupId) async {
  //   return await taxRepository.getTaxRulesByGroupId(groupId);
  // }

  TransactionLineItemTaxModifier _createTaxModifierLine(
      TransactionLineItemEntity lineItem, TaxRuleEntity taxRule) {
    return TransactionLineItemTaxModifier(
      transSeq: lineItem.transSeq,
      lineItemSeq: lineItem.lineItemSeq,
      authorityId: taxRule.authorityId,
      authorityName: taxRule.authorityName,
      authorityType: taxRule.authorityType,
      taxGroupId: taxRule.groupId,
      taxableAmount: lineItem.netAmount,
      taxRuleId: taxRule.ruleId,
      taxRuleName: taxRule.ruleName,
      taxAmount: 0.0,
      taxPercent: 0.0,
      rawTaxAmount: 0.0,
      originalTaxableAmount: lineItem.netAmount,
      rawTaxPercentage: 0.0,
    );
  }

  List<TransactionLineItemTaxModifier> createSaleTaxModifiers(
      TransactionLineItemEntity lineItem, List<TaxRuleEntity> taxRules) {
    List<TransactionLineItemTaxModifier> taxModifiers = [];
    for (TaxRuleEntity taxRule in taxRules) {
      if (validateTaxRule(taxRule, lineItem)) {
        taxModifiers.add(_createTaxModifierLine(lineItem, taxRule));
      }
    }
    return taxModifiers;
  }

  bool validateTaxRule(
      TaxRuleEntity taxRule, TransactionLineItemEntity lineItem) {
    return true;
  }

  double calculateTaxAmount(TransactionLineItemEntity lineItem) {
    return lineItem.taxModifiers
        .fold(0.00, (acc, taxModifier) => acc + taxModifier.taxAmount!);
  }

  double calculateTransactionTaxAmount(TransactionHeaderEntity transaction) {
    return transaction.lineItems
        .fold(0.00, (acc, lineItem) => acc + (!lineItem.isVoid ? calculateTaxAmount(lineItem) : 0.0));
  }

  List<TransactionLineItemTaxModifier>
      createTaxModifierFromOriginalTransaction(
          TransactionLineItemEntity originalTransaction,
          TransactionLineItemEntity newTransaction) {
    List<TransactionLineItemTaxModifier> newTaxLines = [];
    List<TransactionLineItemTaxModifier> originalTaxLines =
        originalTransaction.taxModifiers.toList();
    for (var i = 0; i < originalTaxLines.length; i++) {
      TransactionLineItemTaxModifier originalTaxLine = originalTaxLines[i];

      var unitTaxAmount = originalTaxLine.taxAmount! / originalTransaction.quantity!;

      TransactionLineItemTaxModifier newTaxLine =
          TransactionLineItemTaxModifier(
        transSeq: newTransaction.transSeq,
        lineItemSeq: newTransaction.lineItemSeq,
        authorityId: originalTaxLine.authorityId,
        authorityName: originalTaxLine.authorityName,
        authorityType: originalTaxLine.authorityType,
        taxGroupId: originalTaxLine.taxGroupId,
        taxableAmount: newTransaction.netAmount,
        taxRuleId: originalTaxLine.taxRuleId,
        taxRuleName: originalTaxLine.taxRuleName,
        taxAmount: - unitTaxAmount * newTransaction.quantity!,
        taxPercent: - originalTaxLine.taxPercent!,
        rawTaxAmount: - (originalTaxLine.rawTaxAmount! / originalTransaction.quantity!) * newTransaction.quantity!,
        originalTaxableAmount: - (originalTaxLine.originalTaxableAmount! / originalTransaction.quantity!) * newTransaction.quantity!,
        rawTaxPercentage: - originalTaxLine.rawTaxPercentage!,
      );
      newTaxLines.add(newTaxLine);
    }

    return newTaxLines;
  }

  TransactionLineItemTaxModifier creteManualTaxModifier(
      TransactionLineItemEntity lineItem, TaxRuleEntity taxRule) {
    return TransactionLineItemTaxModifier(
        transSeq: lineItem.transSeq,
        lineItemSeq: lineItem.lineItemSeq,
        authorityId: taxRule.authorityId,
        authorityName: taxRule.authorityName,
        authorityType: taxRule.authorityType,
        taxGroupId: taxRule.groupId,
        taxableAmount: lineItem.netAmount,
        taxRuleId: taxRule.ruleId,
        taxRuleName: taxRule.ruleName,
        taxAmount: 0.0,
        taxPercent: 0.0,
        rawTaxAmount: 0.0,
        originalTaxableAmount: lineItem.netAmount,
        rawTaxPercentage: 0.0,
        taxOverride: true);
  }
}
