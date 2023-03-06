import 'package:isar/isar.dart';

part 'deals_entity.g.dart';

@Collection()
class DealsEntity {
  final Id? id;

  @Index(
      unique: true, replace: true, caseSensitive: true, type: IndexType.value)
  final String dealId;

  final String? description;

  @Index(type: IndexType.value)
  final DateTime? startDate;
  final DateTime? endEndDate;

  final double? amountCap;

  final double? subTotalMin;
  final double? subTotalMax;

  final List<DealFieldsTest> dealFields;
  final List<DealItem> items;

  @Index(type: IndexType.value)
  final List<String> dealRef;

  DealsEntity({
    this.id,
    required this.dealId,
    this.description,
    this.startDate,
    this.endEndDate,
    this.amountCap,
    this.subTotalMin,
    this.subTotalMax,
    this.dealFields = const [],
    this.items = const [],
    this.dealRef = const [],
  });
}

@Embedded()
class DealFieldsTest {

  @Enumerated(EnumType.name)
  MatchingField? matchingField;
  @Enumerated(EnumType.name)
  MatchingRule? matchingRule;
  String? matchingRuleValue1;
  String? matchingRuleValue2;

  DealFieldsTest({
    this.matchingField,
    this.matchingRule,
    this.matchingRuleValue1,
    this.matchingRuleValue2,
  });
}

@Embedded()
class DealItem {
  double minQuantity;
  double maxQuantity;
  double? minItemTotal;
  @Enumerated(EnumType.name)
  DealAction? action;
  double? actionValue;
  double? actionQuantity;

  DealItem({
    this.minQuantity = 1,
    this.maxQuantity = 1,
    this.minItemTotal,
    this.action,
    this.actionValue,
    this.actionQuantity,
  });
}

enum DealAction {
  noAction("NO_ACTION"),
  newPrice("NEW_PRICE"),
  percentOff("PERCENT_OFF"),
  currencyOff("CURRENCY_OFF");

  const DealAction(this.value);
  final String value;
}

enum MatchingField {
  item("SKU"),
  department("DEPARTMENT");

  const MatchingField(this.value);
  final String value;
}

enum MatchingRule {
  equal("EQUAL"),
  notEqual("NOT_EQUAL"),
  greaterThan("GREATER_THAN"),
  lessThan("LESS_THAN"),
  greaterThanOrEqual("GREATER_THAN_OR_EQUAL"),
  lessThanOrEqual("LESS_THAN_OR_EQUAL"),
  between("BETWEEN"),
  notBetween("NOT_BETWEEN"),
  contains("CONTAINS"),
  notContains("NOT_CONTAINS"),
  startsWith("STARTS_WITH"),
  endsWith("ENDS_WITH"),
  notStartsWith("NOT_STARTS_WITH"),
  notEndsWith("NOT_ENDS_WITH"),
  empty("EMPTY"),
  notEmpty("NOT_EMPTY");

  const MatchingRule(this.value);
  final String value;
}