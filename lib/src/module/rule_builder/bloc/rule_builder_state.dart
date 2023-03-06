part of 'rule_builder_bloc.dart';

enum RuleTotalConditionEnum {
  startDate("Start Date For The Promotion"),
  endDate("End Date For The Promotion"),
  totalAmountCap("Total Amount Cap"),
  subtotalMin("Subtotal Min"),
  subtotalMax("Subtotal Max");

  const RuleTotalConditionEnum(this.value);
  final String value;
}

class RuleTotalCondition {
  final Uuid uuid = const Uuid();
  final RuleTotalConditionEnum condition;
  final dynamic value;

  RuleTotalCondition({required this.condition, required this.value});
}

class RuleItemCondition {
  final Uuid uuid;
  final MatchingField field;
  final MatchingRule operator;
  final dynamic value;
  final double minQty;
  final double maxQty;
  final DealAction action;
  final double actionValue;

  RuleItemCondition(
      {this.uuid = const Uuid(),
      required this.field,
      required this.operator,
      required this.value,
      required this.minQty,
      required this.maxQty,
      required this.action,
      required this.actionValue});

  RuleItemCondition copyWith(
      {Uuid? uuid,
      MatchingField? field,
      MatchingRule? operator,
      dynamic? value,
      double? minQty,
      double? maxQty,
      DealAction? action,
      double? actionValue}) {
    return RuleItemCondition(
      uuid: uuid ?? this.uuid,
      field: field ?? this.field,
      operator: operator ?? this.operator,
      value: value ?? this.value,
      minQty: minQty ?? this.minQty,
      maxQty: maxQty ?? this.maxQty,
      action: action ?? this.action,
      actionValue: actionValue ?? this.actionValue,
    );
  }
}

class RuleBuilderState {
  final String dealId;
  final String dealDescription;
  final List<RuleTotalCondition> totalConditions;
  final List<RuleItemCondition> itemConditions;

  bool get isHeaderConditionPresent =>
      totalConditions.length < RuleTotalConditionEnum.values.length;

  bool containsCondition(RuleTotalConditionEnum condition) =>
      totalConditions.any((element) => element.condition == condition);

  bool get isValid => dealId.isNotEmpty && dealDescription.isNotEmpty;

  const RuleBuilderState(
      {this.dealId = '',
      this.dealDescription = '',
      this.totalConditions = const [],
      this.itemConditions = const []});

  RuleBuilderState copyWith(
      {String? dealId,
      String? dealDescription,
      List<RuleTotalCondition>? totalConditions,
      List<RuleItemCondition>? itemConditions,
      bool? isHeaderConditionPresent}) {
    return RuleBuilderState(
      dealId: dealId ?? this.dealId,
      dealDescription: dealDescription ?? this.dealDescription,
      totalConditions: totalConditions ?? this.totalConditions,
      itemConditions: itemConditions ?? this.itemConditions,
    );
  }
}
