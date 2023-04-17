import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../entity/pos/floor_entity.dart';
import '../../../entity/pos/table_entity.dart';
import '../../../entity/pos/table_reservation_entity.dart';
import '../../../repositories/table_repository.dart';
import '../../authentication/bloc/authentication_bloc.dart';

part 'table_layout_event.dart';
part 'table_layout_state.dart';

class TableLayoutBloc extends Bloc<TableLayoutEvent, TableLayoutState> {
  final TableRepository tableRepository;
  final AuthenticationBloc authenticationBloc;
  TableLayoutBloc({required this.tableRepository, required this.authenticationBloc}) : super(TableLayoutState()) {
    on<FetchAllTables>(_onFetchAllTables);
    on<RefreshReservation>(_onRefreshReservation);
    on<FetchTablesByFloor>(_onFetchTablesByFloor);
    on<ConfirmReservation>(_onConfirmReservation);
    on<CompleteReservation>(_onCompleteReservation);
  }

  void _onFetchAllTables(
      FetchAllTables event, Emitter<TableLayoutState> emit) async {
    emit(state.copyWith(status: TableLayoutStatus.loading));
    final cnf = await tableRepository.getAllConfirmedReservation();
    final pending = await tableRepository.getAllUpcomingReservation();
    final floor = await tableRepository.getAllFloorPlans();
    if (floor.isEmpty) {
      emit(state.copyWith(
          currentReservation: cnf,
          upcoming: pending,
          status: TableLayoutStatus.loaded));
    } else {
      final tables =
          await tableRepository.getTableByFloorId(floor.first.floorId);
      emit(state.copyWith(
          currentReservation: cnf,
          upcoming: pending,
          tables: tables,
          floor: floor.first,
          floors: floor,
          status: TableLayoutStatus.loaded));
    }
  }

  void _onRefreshReservation(
      RefreshReservation event, Emitter<TableLayoutState> emit) async {
    emit(state.copyWith(status: TableLayoutStatus.loading));
    final cnf = await tableRepository.getAllConfirmedReservation();
    final pending = await tableRepository.getAllUpcomingReservation();

    emit(state.copyWith(
        currentReservation: cnf, upcoming: pending, status: TableLayoutStatus.loaded));
  }

  void _onFetchTablesByFloor(
      FetchTablesByFloor event, Emitter<TableLayoutState> emit) async {
    emit(state.copyWith(status: TableLayoutStatus.loading));
    await Future.delayed(const Duration(milliseconds: 50));
    final tables = await tableRepository.getTableByFloorId(event.floor.floorId);
    emit(state.copyWith(
        tables: tables, floor: event.floor, status: TableLayoutStatus.loaded));
  }

  void _onConfirmReservation(
      ConfirmReservation event, Emitter<TableLayoutState> emit) async {
    emit(state.copyWith(status: TableLayoutStatus.loading));
    await tableRepository.confirmReservation(event.reservation, authenticationBloc.state.employee!);
    emit(state.copyWith(status: TableLayoutStatus.loaded));
    add(FetchAllTables());
  }

  void _onCompleteReservation(
      CompleteReservation event, Emitter<TableLayoutState> emit) async {
    emit(state.copyWith(status: TableLayoutStatus.loading));
    await tableRepository.completeReservation(event.reservation);
    emit(state.copyWith(status: TableLayoutStatus.loaded));
    add(FetchAllTables());
  }
}
