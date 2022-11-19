import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'package:meta/meta.dart';

import '../../../entity/pos/entity.dart';
import '../../../repositories/repository.dart';

part 'list_all_receipt_event.dart';
part 'list_all_receipt_state.dart';

class ListAllReceiptBloc
    extends Bloc<ListAllReceiptEvent, ListAllReceiptState> {
  final log = Logger('ListAllReceiptBloc');

  final TransactionRepository transactionRepository;

  ListAllReceiptBloc({required this.transactionRepository})
      : super(ListAllReceiptState()) {
    on<InitTransactionSearch>(_onInitTransactionSearch);
    on<LoadAllReceipt>(_onLoadAllReceipt);
    on<LoadNextReceipt>(_onLoadNextReceipt);
    on<UpdateFilterStatus>(_onUpdateFilterStatus);
    on<UpdateFilterDateRange>(_onUpdateFilterDateRange);
    on<SearchTransactionByText>(_onSearchTransactionById);
    on<SortTransaction>(_onSortTransaction);
    on<AddTransactionTypeForFilter>(_onAddTransactionType);
    on<RemoveTransactionTypeFromFilter>(_onRemoveTransactionType);
  }

  void _onInitTransactionSearch(
      InitTransactionSearch event, Emitter<ListAllReceiptState> emit) {
    log.info('InitTransactionSearch');
    add(LoadAllReceipt());
  }

  void _onLoadAllReceipt(
      LoadAllReceipt event, Emitter<ListAllReceiptState> emit) async {
    try {
      emit(state.copyWith(status: ListAllReceiptStatus.loading));
      var receipts =
          await transactionRepository.searchTransaction(state.filter);
      emit(state.copyWith(
          receipts: receipts, status: ListAllReceiptStatus.success));
    } catch (e) {
      log.severe(e);
      emit(state.copyWith(status: ListAllReceiptStatus.failure));
    }
  }

  void _onLoadNextReceipt(
      LoadNextReceipt event, Emitter<ListAllReceiptState> emit) async {
    try {
      emit(state.copyWith(status: ListAllReceiptStatus.loading));
      var receipts = await transactionRepository.searchTransaction(state.filter
          .copyWith(offset: state.filter.offset + state.filter.limit));
      emit(state.copyWith(
          receipts: receipts, status: ListAllReceiptStatus.success));
    } catch (e) {
      log.severe(e);
      emit(state.copyWith(status: ListAllReceiptStatus.failure));
    }
  }

  void _onUpdateFilterStatus(
      UpdateFilterStatus event, Emitter<ListAllReceiptState> emit) async {
    TransactionFilterCriteria criteria = state.filter;
    if (event.status == null) {
      criteria =
          TransactionFilterCriteria(dateRange: criteria.dateRange, offset: 0);
      emit(state.copyWith(
        filter: criteria,
      ));
    } else {
      criteria = criteria.copyWith(status: event.status, offset: 0);
      emit(state.copyWith(filter: criteria));
    }
    add(LoadAllReceipt());
  }

  void _onUpdateFilterDateRange(
      UpdateFilterDateRange event, Emitter<ListAllReceiptState> emit) async {
    TransactionFilterCriteria criteria = state.filter;

    // Change the daterange to capture the whole day for a given date

    DateTimeRange dateRange = DateTimeRange(
      start: event.dateRange.start,
      end: event.dateRange.end
          .add(const Duration(days: 1))
          .subtract(const Duration(microseconds: 1)),
    );

    criteria = criteria.copyWith(dateRange: dateRange, offset: 0);
    emit(state.copyWith(filter: criteria));
    add(LoadAllReceipt());
  }

  void _onSearchTransactionById(
      SearchTransactionByText event, Emitter<ListAllReceiptState> emit) async {
    TransactionFilterCriteria criteria = state.filter;
    criteria = criteria.copyWith(search: event.id, offset: 0);
    emit(state.copyWith(filter: criteria));
    add(LoadAllReceipt());
  }

  void _onSortTransaction(
      SortTransaction event, Emitter<ListAllReceiptState> emit) async {
    TransactionFilterCriteria criteria = state.filter;
    criteria = criteria.copyWith(sortBy: event.sortType, offset: 0);
    emit(state.copyWith(filter: criteria));
    add(LoadAllReceipt());
  }

  void _onAddTransactionType(
      AddTransactionTypeForFilter event, Emitter<ListAllReceiptState> emit) async {
    TransactionFilterCriteria criteria = state.filter;
    if (state.filter.transactionTypes.contains(event.type)) {
      return;
    }
    criteria = criteria.copyWith(
        transactionTypes: criteria.transactionTypes + [event.type],
        offset: 0);
    emit(state.copyWith(filter: criteria));
    add(LoadAllReceipt());
  }

  void _onRemoveTransactionType(
      RemoveTransactionTypeFromFilter event, Emitter<ListAllReceiptState> emit) async {
    TransactionFilterCriteria criteria = state.filter;
    criteria = criteria.copyWith(
        transactionTypes: criteria.transactionTypes
            .where((element) => element != event.type)
            .toList(),
        offset: 0);
    emit(state.copyWith(filter: criteria));
    add(LoadAllReceipt());
  }
}
