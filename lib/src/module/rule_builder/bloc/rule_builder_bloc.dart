import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uuid/uuid.dart';

import '../../../entity/pos/deals_entity.dart';
import '../../../repositories/repository.dart';

part 'rule_builder_event.dart';
part 'rule_builder_state.dart';

class RuleBuilderBloc extends Bloc<RuleBuilderEvent, RuleBuilderState> {

  final DealsRepository dealsRepository;
  final DealsEntity? dealsEntity;

  RuleBuilderBloc({
    required this.dealsRepository,
    this.dealsEntity
}) : super(const RuleBuilderState()) {
    on<OnInitEvent>(_onInitEvent);
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

    on<SaveDealEvent>(_onSaveDealEvent);
  }

  void _onInitEvent(OnInitEvent event, Emitter<RuleBuilderState> emit) async {
    if (event.newDeal != null && event.newDeal!) {
      emit(state.copyWith(status: RuleBuilderStateStatus.loading));
      await Future.delayed(const Duration(milliseconds: 30));
      emit(const RuleBuilderState(status: RuleBuilderStateStatus.success));
      return;
    }

    if (event.dealId != null) {
      emit(state.copyWith(status: RuleBuilderStateStatus.loading));

      // Hack for refreshing all the UI
      await Future.delayed(const Duration(milliseconds: 30));
      try {
        var deal = await dealsRepository.getDealById(event.dealId!);

        List<RuleTotalCondition>? totalConditions = [];
        List<RuleItemCondition>? itemConditions = [];

        for(var i = 0; i < deal.dealFields.length; i++) {
          itemConditions.add(RuleItemCondition(
              field: deal.dealFields[i].matchingField!,
              operator: deal.dealFields[i].matchingRule!,
              value: deal.dealFields[i].matchingRuleValue1,
              minQty: deal.items[i].minQuantity,
              maxQty: deal.items[i].maxQuantity,
              action: deal.items[i].action!,
              actionValue: deal.items[i].actionValue!,)
          );
        }
        emit(RuleBuilderState(
          dealId: deal.dealId,
          dealDescription: deal.description ?? "",
          totalConditions: totalConditions,
          itemConditions: itemConditions,
          status: RuleBuilderStateStatus.success,
          isNew: false,
        ));

      } catch (e) {
       print(e);
      }
    }
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

  void _onSaveDealEvent(SaveDealEvent event, Emitter<RuleBuilderState> emit) async {

    List<DealFieldsTest> dit = [];
    List<DealItem> di = [];
    Set<String> dealRef = {};

    for(var i = 0; i < state.itemConditions.length; i++) {
      dit.add(DealFieldsTest(
        matchingField: state.itemConditions[i].field,
        matchingRule: state.itemConditions[i].operator,
        matchingRuleValue1: state.itemConditions[i].value,
      ));

      dealRef.add("${state.itemConditions[i].field.value}#${state.itemConditions[i].value}");

      di.add(DealItem(
        action: state.itemConditions[i].action,
        minQuantity: state.itemConditions[i].minQty,
        maxQuantity: state.itemConditions[i].maxQty,
        actionValue: state.itemConditions[i].actionValue,
      ));
    }

    DealsEntity deal = DealsEntity(
      dealId: state.dealId,
      description: state.dealDescription,
      dealFields: dit,
      items: di,
      dealRef: dealRef.toList(),
    );

    try {
      await dealsRepository.saveDeal(deal);
    } catch (e) {
      print(e);
    }
  }
}
