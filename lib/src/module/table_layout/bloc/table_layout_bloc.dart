import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../entity/pos/floor_entity.dart';
import '../../../entity/pos/table_entity.dart';
import '../../../repositories/table_repository.dart';

part 'table_layout_event.dart';
part 'table_layout_state.dart';

class TableLayoutBloc extends Bloc<TableLayoutEvent, TableLayoutState> {
  final TableRepository tableRepository;
  TableLayoutBloc({ required this.tableRepository }) : super(TableLayoutState()) {
    on<FetchAllTables>(_onFetchAllTables);
    on<FetchTablesByFloor>(_onFetchTablesByFloor);
  }

  void _onFetchAllTables(FetchAllTables event, Emitter<TableLayoutState> emit) async {
    emit(state.copyWith(status: TableLayoutStatus.loading));
    final floor = await tableRepository.getAllFloorPlans();
    if (floor.isEmpty) return;
    final tables = await tableRepository.getTableByFloorId(floor.first.floorId);
    emit(state.copyWith(tables: tables, floor: floor.first, floors: floor, status: TableLayoutStatus.loaded));
  }

  void _onFetchTablesByFloor(FetchTablesByFloor event, Emitter<TableLayoutState> emit) async {
    emit(state.copyWith(status: TableLayoutStatus.loading));
    await Future.delayed(const Duration(milliseconds: 50));
    final tables = await tableRepository.getTableByFloorId(event.floor.floorId);
    emit(state.copyWith(tables: tables, floor: event.floor, status: TableLayoutStatus.loaded));
  }

}
