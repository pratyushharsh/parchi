import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../../entity/pos/tax_group_entity.dart';
import '../../../entity/pos/tax_rule_entity.dart';
import '../../../repositories/tax_repository.dart';

part 'new_tax_rule_event.dart';
part 'new_tax_rule_state.dart';

class NewTaxRuleBloc extends Bloc<NewTaxRuleEvent, NewTaxRuleState> {
  final TaxGroupEntity taxGroup;
  final TaxRepository taxRepository;
  NewTaxRuleBloc({required this.taxRepository, required this.taxGroup})
      : super(const NewTaxRuleState()) {
    on<OnRuleNameChangeEvent>(_onRuleNameChangeEvent);
    on<OnRuleIdChangeEvent>(_onRuleIdChangeEvent);
    on<OnAmountChangeEvent>(_onAmountChangeEvent);
    on<OnPercentChangeEvent>(_onPercentChangeEvent);
    on<OnEffectiveDateChangeEvent>(_onEffectiveDateChangeEvent);
    on<OnExpirationDateChangeEvent>(_onExpirationDateChangeEvent);
    on<OnMinimumTaxableAmountChangeEvent>(_onMinimumTaxableAmountChangeEvent);
    on<OnMaximumTaxableAmountChangeEvent>(_onMaximumTaxableAmountChangeEvent);
    on<CreateNewTaxRule>(_onCreateNewTaxRule);
  }

  void _onCreateNewTaxRule(
      CreateNewTaxRule event, Emitter<NewTaxRuleState> emit) async {
    emit(state.copyWith(status: NewTaxRuleStatus.loading));
    try {
      TaxRuleEntity taxRule = TaxRuleEntity(
        ruleId: state.ruleId,
        ruleName: state.ruleName,
        amount: state.amount,
        percent: state.percent,
        effectiveDateTimeStamp: state.effectiveDateTimeStamp,
        expirationDateTimeStamp: state.expirationDateTimeStamp,
        minimumTaxableAmount: state.minimumTaxableAmount,
        maximumTaxableAmount: state.maximumTaxableAmount,
        ruleSequence: taxGroup.taxRules.length + 1,
        groupId: taxGroup.groupId,
        locationId: '',
        authorityName: '',
        authorityType: '',
        authorityId: '',
      );
      await taxRepository.createNewTaxRule(taxGroup, taxRule);
      emit(state.copyWith(status: NewTaxRuleStatus.created));
    } catch (e) {
      emit(state.copyWith(status: NewTaxRuleStatus.error));
    }
  }

  void _onRuleIdChangeEvent(
      OnRuleIdChangeEvent event, Emitter<NewTaxRuleState> emit) {
    emit(state.copyWith(ruleId: event.ruleId));
  }

  void _onRuleNameChangeEvent(
      OnRuleNameChangeEvent event, Emitter<NewTaxRuleState> emit) async {
    emit(state.copyWith(ruleName: event.ruleName));
  }

  void _onAmountChangeEvent(
      OnAmountChangeEvent event, Emitter<NewTaxRuleState> emit) async {
    emit(state.copyWith(amount: event.amount));
  }

  void _onPercentChangeEvent(
      OnPercentChangeEvent event, Emitter<NewTaxRuleState> emit) async {
    emit(state.copyWith(percent: event.percent));
  }

  void _onEffectiveDateChangeEvent(
      OnEffectiveDateChangeEvent event, Emitter<NewTaxRuleState> emit) async {
    emit(state.copyWith(effectiveDateTimeStamp: event.effectiveDateTimeStamp));
  }

  void _onExpirationDateChangeEvent(
      OnExpirationDateChangeEvent event, Emitter<NewTaxRuleState> emit) async {
    emit(
        state.copyWith(expirationDateTimeStamp: event.expirationDateTimeStamp));
  }

  void _onMinimumTaxableAmountChangeEvent(
      OnMinimumTaxableAmountChangeEvent event,
      Emitter<NewTaxRuleState> emit) async {
    emit(state.copyWith(minimumTaxableAmount: event.minimumTaxableAmount));
  }

  void _onMaximumTaxableAmountChangeEvent(
      OnMaximumTaxableAmountChangeEvent event,
      Emitter<NewTaxRuleState> emit) async {
    emit(state.copyWith(maximumTaxableAmount: event.maximumTaxableAmount));
  }
}
