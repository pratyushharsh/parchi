import 'dart:async';


import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../entity/pos/contact_entity.dart';
import '../../../entity/pos/table_entity.dart';
import '../../../repositories/table_repository.dart';

part 'table_reservation_event.dart';
part 'table_reservation_state.dart';

class TableReservationBloc extends Bloc<TableReservationEvent, TableReservationState> {

  final TableRepository tableRepository;

  TableReservationBloc({required this.tableRepository}) : super(TableReservationState()) {
    on<FetchAllTables>(_onFetchAllTables);
    on<ChangeReservationDate>(_onChangeReservationDate);
    on<ChangeReservationTime>(_onChangeReservationTime);
    on<ChangeNumberOfGuest>(_onChangeNumberOfGuest);
    on<ChangeCustomerNotes>(_onChangeCustomerNotes);
    on<ChangeSelectedTable>(_onChangeSelectedTable);
    on<ChangeCustomer>(_onChangeCustomer);
  }

  void _onFetchAllTables(FetchAllTables event, Emitter<TableReservationState> emit) async {
    emit(state.copyWith(status: TableReservationStatus.loading));
    final tables = await tableRepository.getAllTables();
    emit(state.copyWith(tables: tables, status: TableReservationStatus.loaded));
  }

  void _onChangeReservationDate(ChangeReservationDate event, Emitter<TableReservationState> emit) {
    emit(state.copyWith(reservationDate: event.date));
  }

  void _onChangeReservationTime(ChangeReservationTime event, Emitter<TableReservationState> emit) {
    emit(state.copyWith(reservationTime: event.time));
  }

  void _onChangeNumberOfGuest(ChangeNumberOfGuest event, Emitter<TableReservationState> emit) {
    emit(state.copyWith(numberOfPeople: event.numberOfGuest));
  }

  void _onChangeCustomerNotes(ChangeCustomerNotes event, Emitter<TableReservationState> emit) {
    emit(state.copyWith(customerNotes: event.notes));
  }

  void _onChangeSelectedTable(ChangeSelectedTable event, Emitter<TableReservationState> emit) {
    emit(state.copyWith(selectedTable: event.table));
  }

  void _onChangeCustomer(ChangeCustomer event, Emitter<TableReservationState> emit) {
    emit(state.copyWith(customer: event.customer));
  }
}
