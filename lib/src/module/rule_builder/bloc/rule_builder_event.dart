part of 'rule_builder_bloc.dart';

abstract class RuleBuilderEvent {}

class DealIdChangeEvent extends RuleBuilderEvent {
  final String dealId;

  DealIdChangeEvent(this.dealId);
}

class DealDescriptionChangeEvent extends RuleBuilderEvent {
  final String dealDescription;

  DealDescriptionChangeEvent(this.dealDescription);
}

class AddNewTotalConditionEvent extends RuleBuilderEvent {
  final RuleTotalConditionEnum condition;
  final dynamic value;

  AddNewTotalConditionEvent(this.condition, this.value);
}

class AddNewDummyConditionEvent extends RuleBuilderEvent {}

class DeleteTotalConditionEvent extends RuleBuilderEvent {
  final RuleTotalCondition condition;

  DeleteTotalConditionEvent(this.condition);
}

class UpdateTotalConditionEvent extends RuleBuilderEvent {
  final RuleTotalCondition condition;
  final RuleTotalConditionEnum newCondition;

  UpdateTotalConditionEvent(this.condition, this.newCondition);
}

class ChangeTotalConditionValueEvent extends RuleBuilderEvent {
  final RuleTotalCondition condition;
  final dynamic value;

  ChangeTotalConditionValueEvent(this.condition, this.value);
}

class NewDummyItemCondition extends RuleBuilderEvent {}

class RemoveItemConditionEvent extends RuleBuilderEvent {
  final RuleItemCondition condition;

  RemoveItemConditionEvent(this.condition);
}

class UpdateItemMatchingFieldEvent extends RuleBuilderEvent {
  final Uuid uuid;
  final MatchingField field;
  UpdateItemMatchingFieldEvent(this.uuid, this.field);
}

class UpdateItemMatchingRuleEvent extends RuleBuilderEvent {
  final Uuid uuid;
  final MatchingRule rule;
  UpdateItemMatchingRuleEvent(this.uuid, this.rule);
}

class UpdateItemMatchingValueEvent extends RuleBuilderEvent {
  final Uuid uuid;
  final dynamic value;
  UpdateItemMatchingValueEvent(this.uuid, this.value);
}

class UpdateItemMinQtyEvent extends RuleBuilderEvent {
  final Uuid uuid;
  final double minQty;
  UpdateItemMinQtyEvent(this.uuid, this.minQty);
}

class UpdateItemMaxQtyEvent extends RuleBuilderEvent {
  final Uuid uuid;
  final double maxQty;
  UpdateItemMaxQtyEvent(this.uuid, this.maxQty);
}

class UpdateItemActionEvent extends RuleBuilderEvent {
  final Uuid uuid;
  final DealAction action;
  UpdateItemActionEvent(this.uuid, this.action);
}

class UpdateItemActionValueEvent extends RuleBuilderEvent {
  final Uuid uuid;
  final double actionValue;
  UpdateItemActionValueEvent(this.uuid, this.actionValue);
}