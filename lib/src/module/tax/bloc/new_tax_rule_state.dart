part of 'new_tax_rule_bloc.dart';

enum NewTaxRuleStatus {
  initial,
  loading,
  created,
  error,
}


class NewTaxRuleState extends Equatable {
  final String ruleName;
  final String ruleId;
  final double? amount;
  final double? percent;
  final DateTime? effectiveDateTimeStamp;
  final DateTime? expirationDateTimeStamp;
  final double? minimumTaxableAmount;
  final double? maximumTaxableAmount;
  final NewTaxRuleStatus status;

  bool get isValid {
    return ruleId.isNotEmpty && ruleName.isNotEmpty &&
        ((amount != null && amount! > 0) || (percent != null && percent! > 0)) &&
        ((minimumTaxableAmount != null && maximumTaxableAmount != null) ? (minimumTaxableAmount! <= maximumTaxableAmount!) : true);
  }

  const NewTaxRuleState({
    this.ruleId = '',
    this.ruleName = '',
    this.amount,
    this.percent,
    this.effectiveDateTimeStamp,
    this.expirationDateTimeStamp,
    this.minimumTaxableAmount,
    this.maximumTaxableAmount,
    this.status = NewTaxRuleStatus.initial,
  });

  NewTaxRuleState copyWith({
    String? ruleId,
    String? ruleName,
    double? amount,
    double? percent,
    DateTime? effectiveDateTimeStamp,
    DateTime? expirationDateTimeStamp,
    double? minimumTaxableAmount,
    double? maximumTaxableAmount,
    NewTaxRuleStatus? status,
  }) {
    return NewTaxRuleState(
      ruleId: ruleId ?? this.ruleId,
      ruleName: ruleName ?? this.ruleName,
      amount: amount ?? this.amount,
      percent: percent ?? this.percent,
      effectiveDateTimeStamp:
          effectiveDateTimeStamp ?? this.effectiveDateTimeStamp,
      expirationDateTimeStamp:
          expirationDateTimeStamp ?? this.expirationDateTimeStamp,
      minimumTaxableAmount: minimumTaxableAmount ?? this.minimumTaxableAmount,
      maximumTaxableAmount: maximumTaxableAmount ?? this.maximumTaxableAmount,
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props => [
        ruleId,
        ruleName,
        amount,
        percent,
        effectiveDateTimeStamp,
        expirationDateTimeStamp,
        minimumTaxableAmount,
        maximumTaxableAmount,
        status,
      ];
}
