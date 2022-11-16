part of 'new_tax_rule_bloc.dart';

@immutable
abstract class NewTaxRuleEvent {}

class OnRuleNameChangeEvent extends NewTaxRuleEvent {
  final String ruleName;

  OnRuleNameChangeEvent(this.ruleName);
}

class OnRuleIdChangeEvent extends NewTaxRuleEvent {
  final String ruleId;

  OnRuleIdChangeEvent(this.ruleId);
}

class OnAmountChangeEvent extends NewTaxRuleEvent {
  final double amount;

  OnAmountChangeEvent(this.amount);
}

class OnPercentChangeEvent extends NewTaxRuleEvent {
  final double percent;

  OnPercentChangeEvent(this.percent);
}

class OnEffectiveDateChangeEvent extends NewTaxRuleEvent {
  final DateTime effectiveDateTimeStamp;

  OnEffectiveDateChangeEvent(this.effectiveDateTimeStamp);
}

class OnExpirationDateChangeEvent extends NewTaxRuleEvent {
  final DateTime expirationDateTimeStamp;

  OnExpirationDateChangeEvent(this.expirationDateTimeStamp);
}

class OnMinimumTaxableAmountChangeEvent extends NewTaxRuleEvent {
  final double minimumTaxableAmount;

  OnMinimumTaxableAmountChangeEvent(this.minimumTaxableAmount);
}

class OnMaximumTaxableAmountChangeEvent extends NewTaxRuleEvent {
  final double maximumTaxableAmount;

  OnMaximumTaxableAmountChangeEvent(this.maximumTaxableAmount);
}

class CreateNewTaxRule extends NewTaxRuleEvent {}