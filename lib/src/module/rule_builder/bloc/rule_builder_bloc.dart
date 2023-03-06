import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uuid/uuid.dart';

import '../../../entity/pos/deals_entity.dart';

part 'rule_builder_event.dart';
part 'rule_builder_state.dart';

class RuleBuilderBloc extends Bloc<RuleBuilderEvent, RuleBuilderState> {
  RuleBuilderBloc() : super(const RuleBuilderState()) {
    on<DealIdChangeEvent>(_onDealIdChangeEvent);
    on<DealDescriptionChangeEvent>(_onDealDescriptionChangeEvent);
    on<AddNewTotalConditionEvent>(_onAddNewTotalConditionEvent);
    on<AddNewDummyConditionEvent>(_onAddNewDummyConditionEvent);
    on<DeleteTotalConditionEvent>(_onDeleteTotalConditionEvent);
    on<UpdateTotalConditionEvent>(_onUpdateTotalConditionEvent);
    on<ChangeTotalConditionValueEvent>(_onChangeTotalConditionValueEvent);
    on<NewDummyItemCondition>(_onNewDummyItemCondition);
    on<RemoveItemConditionEvent>(_onRemoveItemConditionEvent);
    on<UpdateItemMatchingFieldEvent>(_onUpdateItemMatchingFieldEvent);
    on<UpdateItemMatchingRuleEvent>(_onUpdateItemMatchingRuleEvent);
    on<UpdateItemMatchingValueEvent>(_onUpdateItemMatchingValueEvent);
    on<UpdateItemMinQtyEvent>(_onUpdateItemMinQtyEvent);
    on<UpdateItemMaxQtyEvent>(_onUpdateItemMaxQtyEvent);
    on<UpdateItemActionEvent>(_onUpdateItemActionEvent);
    on<UpdateItemActionValueEvent>(_onUpdateItemActionValueEvent);
  }

  void _onDealIdChangeEvent(
      DealIdChangeEvent event, Emitter<RuleBuilderState> emit) {
    emit(state.copyWith(dealId: event.dealId));
  }

  void _onDealDescriptionChangeEvent(
      DealDescriptionChangeEvent event, Emitter<RuleBuilderState> emit) {
    emit(state.copyWith(dealDescription: event.dealDescription));
  }

  void _onAddNewTotalConditionEvent(
      AddNewTotalConditionEvent event, Emitter<RuleBuilderState> emit) {
    final newTotalConditions =
        List<RuleTotalCondition>.from(state.totalConditions);
    newTotalConditions.add(
        RuleTotalCondition(condition: event.condition, value: event.value));
    emit(state.copyWith(totalConditions: newTotalConditions));
  }

  void _onAddNewDummyConditionEvent(
      AddNewDummyConditionEvent event, Emitter<RuleBuilderState> emit) {
    final newTotalConditions =
        List<RuleTotalCondition>.from(state.totalConditions);

    // Find the condition not present in the list
    final conditionNotPresent = RuleTotalConditionEnum.values.firstWhere(
        (element) => !newTotalConditions
            .any((condition) => condition.condition == element));
    newTotalConditions.add(RuleTotalCondition(
        condition: conditionNotPresent, value: DateTime.now()));

    emit(state.copyWith(totalConditions: newTotalConditions));
  }

  void _onDeleteTotalConditionEvent(
      DeleteTotalConditionEvent event, Emitter<RuleBuilderState> emit) {
    final newTotalConditions =
        List<RuleTotalCondition>.from(state.totalConditions);
    newTotalConditions.remove(event.condition);
    emit(state.copyWith(totalConditions: newTotalConditions));
  }

  void _onUpdateTotalConditionEvent(
      UpdateTotalConditionEvent event, Emitter<RuleBuilderState> emit) {
    final newTotalConditions =
        List<RuleTotalCondition>.from(state.totalConditions);
    final index = newTotalConditions.indexOf(event.condition);
    newTotalConditions[index] = RuleTotalCondition(
        condition: event.newCondition, value: "");
    emit(state.copyWith(totalConditions: newTotalConditions));
  }

  void _onChangeTotalConditionValueEvent(
      ChangeTotalConditionValueEvent event, Emitter<RuleBuilderState> emit) {
    final newTotalConditions =
        List<RuleTotalCondition>.from(state.totalConditions);
    final index = newTotalConditions.indexOf(event.condition);
    newTotalConditions[index] = RuleTotalCondition(
        condition: event.condition.condition, value: event.value);
    emit(state.copyWith(totalConditions: newTotalConditions));
  }

  void _onNewDummyItemCondition(
      NewDummyItemCondition event, Emitter<RuleBuilderState> emit) {
    final newItemConditions = List<RuleItemCondition>.from(state.itemConditions);
    newItemConditions.add(RuleItemCondition(
      field: MatchingField.values.first,
      operator: MatchingRule.values.first,
      value: "",
      minQty: 1,
      maxQty: 1,
      action: DealAction.noAction,
      actionValue: 0,
    ));
    emit(state.copyWith(itemConditions: newItemConditions));
  }

  void _onRemoveItemConditionEvent(
      RemoveItemConditionEvent event, Emitter<RuleBuilderState> emit) {
    final newItemConditions = List<RuleItemCondition>.from(state.itemConditions);
    newItemConditions.remove(event.condition);
    emit(state.copyWith(itemConditions: newItemConditions));
  }

  void _onUpdateItemMatchingFieldEvent(
      UpdateItemMatchingFieldEvent event, Emitter<RuleBuilderState> emit) {
    final newItemConditions = List<RuleItemCondition>.from(state.itemConditions);
    // Find the item with uuid;
    final index = newItemConditions.indexWhere((element) => element.uuid == event.uuid);
    newItemConditions[index] = newItemConditions[index].copyWith(field: event.field);
    emit(state.copyWith(itemConditions: newItemConditions));
  }

  void _onUpdateItemMatchingRuleEvent(
      UpdateItemMatchingRuleEvent event, Emitter<RuleBuilderState> emit) {
    final newItemConditions = List<RuleItemCondition>.from(state.itemConditions);
    // Find the item with uuid;
    final index = newItemConditions.indexWhere((element) => element.uuid == event.uuid);
    newItemConditions[index] = newItemConditions[index].copyWith(operator: event.rule);
    emit(state.copyWith(itemConditions: newItemConditions));
  }

  void _onUpdateItemMatchingValueEvent(
      UpdateItemMatchingValueEvent event, Emitter<RuleBuilderState> emit) {
    final newItemConditions = List<RuleItemCondition>.from(state.itemConditions);
    // Find the item with uuid;
    final index = newItemConditions.indexWhere((element) => element.uuid == event.uuid);
    newItemConditions[index] = newItemConditions[index].copyWith(value: event.value);
    emit(state.copyWith(itemConditions: newItemConditions));
  }

  void _onUpdateItemMinQtyEvent(
      UpdateItemMinQtyEvent event, Emitter<RuleBuilderState> emit) {
    final newItemConditions = List<RuleItemCondition>.from(state.itemConditions);
    // Find the item with uuid;
    final index = newItemConditions.indexWhere((element) => element.uuid == event.uuid);
    newItemConditions[index] = newItemConditions[index].copyWith(minQty: event.minQty);
    emit(state.copyWith(itemConditions: newItemConditions));
  }

  void _onUpdateItemMaxQtyEvent(
      UpdateItemMaxQtyEvent event, Emitter<RuleBuilderState> emit) {
    final newItemConditions = List<RuleItemCondition>.from(state.itemConditions);
    // Find the item with uuid;
    final index = newItemConditions.indexWhere((element) => element.uuid == event.uuid);
    newItemConditions[index] = newItemConditions[index].copyWith(maxQty: event.maxQty);
    emit(state.copyWith(itemConditions: newItemConditions));
  }

  void _onUpdateItemActionEvent(
      UpdateItemActionEvent event, Emitter<RuleBuilderState> emit) {
    final newItemConditions = List<RuleItemCondition>.from(state.itemConditions);
    // Find the item with uuid;
    final index = newItemConditions.indexWhere((element) => element.uuid == event.uuid);
    newItemConditions[index] = newItemConditions[index].copyWith(action: event.action);
    emit(state.copyWith(itemConditions: newItemConditions));
  }

  void _onUpdateItemActionValueEvent(
      UpdateItemActionValueEvent event, Emitter<RuleBuilderState> emit) {
    final newItemConditions = List<RuleItemCondition>.from(state.itemConditions);
    // Find the item with uuid;
    final index = newItemConditions.indexWhere((element) => element.uuid == event.uuid);
    newItemConditions[index] = newItemConditions[index].copyWith(actionValue: event.actionValue);
    emit(state.copyWith(itemConditions: newItemConditions));
  }
}
