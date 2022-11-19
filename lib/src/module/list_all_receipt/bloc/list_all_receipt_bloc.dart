
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:logging/logging.dart';
import 'package:meta/meta.dart';


import '../../../config/transaction_config.dart';
import '../../../database/db_provider.dart';
import '../../../entity/pos/entity.dart';
import '../../../repositories/repository.dart';

part 'list_all_receipt_event.dart';
part 'list_all_receipt_state.dart';

class ListAllReceiptBloc extends Bloc<ListAllReceiptEvent, ListAllReceiptState> with DatabaseProvider {

  final log = Logger('ListAllReceiptBloc');

  final TransactionRepository transactionRepository;

  ListAllReceiptBloc({ required this.transactionRepository }) : super(ListAllReceiptState()) {
    on<LoadAllReceipt>(_onLoadAllReceipt);
    on<UpdateFilterStatus>(_onUpdateFilterStatus);
    on<UpdateFilterDateRange>(_onUpdateFilterDateRange);
  }

  void _onLoadAllReceipt(LoadAllReceipt event, Emitter<ListAllReceiptState> emit) async {
    try {
      emit(state.copyWith(status: ListAllReceiptStatus.loading));
      var receipts = await db.transactionHeaderEntitys.where().sortByBeginDatetimeDesc().findAll();
      emit(state.copyWith(receipts: receipts, status: ListAllReceiptStatus.success));
    } catch (e) {
      log.severe(e);
      emit(state.copyWith(status: ListAllReceiptStatus.failure));
    }
  }

  void _onUpdateFilterStatus(UpdateFilterStatus event, Emitter<ListAllReceiptState> emit) async {
    try {
      TransactionFilterCriteria criteria = state.filter;

      if (event.status == null) {
        criteria = TransactionFilterCriteria(dateRange: criteria.dateRange);
        emit(state.copyWith(status: ListAllReceiptStatus.loading, filter: criteria));
      } else {
        criteria = criteria.copyWith(status: event.status);
        emit(state.copyWith(status: ListAllReceiptStatus.loading, filter: criteria));
      }
      var res = await transactionRepository.searchTransaction(criteria);
      emit(state.copyWith(receipts: res, status: ListAllReceiptStatus.success));
    } catch (e) {
      log.severe(e);
      emit(state.copyWith(status: ListAllReceiptStatus.failure));
    }
  }

  void _onUpdateFilterDateRange(UpdateFilterDateRange event, Emitter<ListAllReceiptState> emit) async {
    try {
      TransactionFilterCriteria criteria = state.filter;
      criteria = criteria.copyWith(dateRange: event.dateRange);
      emit(state.copyWith(status: ListAllReceiptStatus.loading, filter: criteria));
      var res = await transactionRepository.searchTransaction(criteria);
      emit(state.copyWith(receipts: res, status: ListAllReceiptStatus.success));
    } catch (e) {
      log.severe(e);
      emit(state.copyWith(status: ListAllReceiptStatus.failure));
    }
  }
}
