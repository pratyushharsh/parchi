import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../entity/pos/contact_entity.dart';
import '../../../entity/pos/table_entity.dart';
import '../../../entity/pos/table_reservation_entity.dart';
import '../../../repositories/table_repository.dart';

part 'table_reservation_event.dart';
part 'table_reservation_state.dart';

class TableReservationBloc
    extends Bloc<TableReservationEvent, TableReservationState> {
  final TableRepository tableRepository;

  TableReservationBloc({required this.tableRepository})
      : super(TableReservationState()) {
    on<FetchAllTables>(_onFetchAllTables);
    on<ChangeReservationDate>(_onChangeReservationDate);
    on<ChangeReservationTime>(_onChangeReservationTime);
    on<ChangeNumberOfGuest>(_onChangeNumberOfGuest);
    on<ChangeCustomerNotes>(_onChangeCustomerNotes);
    on<ChangeSelectedTable>(_onChangeSelectedTable);
    on<ChangeCustomerName>(_onChangeCustomerName);
    on<ChangeCustomerPhone>(_onChangeCustomerPhone);
    on<ChangeCustomer>(_onChangeCustomer);
    on<CreateNewTableReservation>(_onCreateReservation);
  }

  void _onFetchAllTables(
      FetchAllTables event, Emitter<TableReservationState> emit) async {
    emit(state.copyWith(status: ReservationStatus.loading));
    final tables = await tableRepository.getAllTables();
    emit(state.copyWith(tables: tables, status: ReservationStatus.loaded));
  }

  void _onChangeReservationDate(
      ChangeReservationDate event, Emitter<TableReservationState> emit) {
    emit(state.copyWith(reservationDate: event.date));
  }

  void _onChangeReservationTime(
      ChangeReservationTime event, Emitter<TableReservationState> emit) {
    emit(state.copyWith(reservationTime: event.time));
  }

  void _onChangeNumberOfGuest(
      ChangeNumberOfGuest event, Emitter<TableReservationState> emit) {
    emit(state.copyWith(numberOfPeople: event.numberOfGuest));
  }

  void _onChangeCustomerNotes(
      ChangeCustomerNotes event, Emitter<TableReservationState> emit) {
    emit(state.copyWith(customerNotes: event.notes));
  }

  void _onChangeSelectedTable(
      ChangeSelectedTable event, Emitter<TableReservationState> emit) {
    emit(state.copyWith(selectedTable: event.table));
  }

  void _onChangeCustomerName(
      ChangeCustomerName event, Emitter<TableReservationState> emit) {
    emit(state.copyWith(customerName: event.name));
  }

  void _onChangeCustomerPhone(
      ChangeCustomerPhone event, Emitter<TableReservationState> emit) {
    emit(state.copyWith(customerPhone: event.phone));
  }

  void _onChangeCustomer(
      ChangeCustomer event, Emitter<TableReservationState> emit) {
    emit(state.copyWith(customer: event.customer));
  }

  void _onCreateReservation(
      CreateNewTableReservation event, Emitter<TableReservationState> emit) async {
    emit(state.copyWith(status: ReservationStatus.loading));
    await Future.delayed(const Duration(milliseconds: 50));

    // create date time
    final reservationTime = DateTime(
        state.reservationDate!.year,
        state.reservationDate!.month,
        state.reservationDate!.day,
        state.reservationTime!.hour,
        state.reservationTime!.minute);

    try {
      await tableRepository.createNewTableReservation(TableReservationEntity(
        customerName: state.customerName,
        customerPhone: state.customerPhone,
        customerId: state.customer?.contactId,
        numberOfGuest: state.numberOfPeople,
        reservationTime: reservationTime,
        tableId: state.selectedTable?.tableId,
        note: state.customerNotes,
        createdAt: DateTime.now(),
        status: TableReservationStatus.pending
      ));
      emit(state.copyWith(status: ReservationStatus.success));
    } catch (e, st) {
      emit(state.copyWith(status: ReservationStatus.error));
    }
  }
}
