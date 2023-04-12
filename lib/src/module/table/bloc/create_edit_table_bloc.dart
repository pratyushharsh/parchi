
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logging/logging.dart';

import '../../../entity/pos/floor_entity.dart';
import '../../../entity/pos/table_entity.dart';
import '../../../repositories/table_repository.dart';

part 'create_edit_table_event.dart';
part 'create_edit_table_state.dart';

class CreateEditTableBloc extends Bloc<CreateEditTableEvent, CreateEditTableState> {

  static final log = Logger('CreateEditTableBloc');

  final TableRepository tableRepository;

  CreateEditTableBloc({required this.tableRepository }) : super(CreateEditTableState()) {
    on<CreateNewFloorLayout>(_onCreateNewFloorLayout);
    on<FetchAllFloors>(_onFetchAllFloors);
    on<SelectFloorLayout>(_onSelectFloorLayout);
    on<SaveTableEvent>(_onSaveTable);
    on<SaveTableLayout>(_onSaveTableLayout);
  }

  // void _onSaveTable(OnSaveTable event, Emitter<CreateEditTableState> emit) async {
  //   emit(state.copyWith(status: CreateEditTableStatus.loading));
  //   try {
  //     if (tableId != null) {
  //       await tableRepository.insertTable(TableEntity(
  //         tableId: state.tableId,
  //         tableCapacity: state.tableCapacity,
  //       ));
  //     } else {
  //       await tableRepository.updateTable(TableEntity(
  //         tableId: state.tableId,
  //         tableCapacity: state.tableCapacity,
  //       ));
  //     }
  //     emit(state.copyWith(status: CreateEditTableStatus.success));
  //   } catch (e) {
  //     print(e);
  //     emit(state.copyWith(status: CreateEditTableStatus.failure));
  //   }
  // }

  void _onCreateNewFloorLayout(CreateNewFloorLayout event, Emitter<CreateEditTableState> emit) async {
    emit(state.copyWith(status: CreateEditTableStatus.loading));
    try {
      await tableRepository.createANewFloorPlan(FloorEntity(
        floorId: event.floorId,
        description: event.floorName,
        width: event.floorWidth,
        height: event.floorHeight,
      ));
      emit(state.copyWith(status: CreateEditTableStatus.success));
      add(FetchAllFloors());
    } catch (e, trace) {
      log.severe(e, 'NEW_FLOOR_CREATION_ERROR', trace);
      emit(state.copyWith(status: CreateEditTableStatus.failure));
    }
  }

  void _onFetchAllFloors(FetchAllFloors event, Emitter<CreateEditTableState> emit) async {
    emit(state.copyWith(status: CreateEditTableStatus.loading));
    try {
      final floors = await tableRepository.getAllFloorPlans();
      emit(state.copyWith(status: CreateEditTableStatus.success, floors: floors));
    } catch (e, trace) {
      log.severe(e, 'FETCH_ALL_FLOORS_ERROR', trace);
      emit(state.copyWith(status: CreateEditTableStatus.failure));
    }
  }

  void _onSelectFloorLayout(SelectFloorLayout event, Emitter<CreateEditTableState> emit) async {
    emit(state.copyWith(status: CreateEditTableStatus.loading));
    await Future.delayed(const Duration(milliseconds: 500));
    var tables = await tableRepository.getTableByFloorId(event.floorEntity.floorId);
    emit(state.copyWith(selectedFloor: event.floorEntity, tables: tables, status: CreateEditTableStatus.success));
  }

  void _onSaveTable(SaveTableEvent event, Emitter<CreateEditTableState> emit) async {
    emit(state.copyWith(status: CreateEditTableStatus.loading));
    try {
      await tableRepository.insertTable(TableEntity(
        tableId: event.tableId,
        tableCapacity: event.tableCapacity,
        floorId: event.floorId,
      ));
      emit(state.copyWith(status: CreateEditTableStatus.success));
      add(SelectFloorLayout(state.selectedFloor!));
    } catch (e, trace) {
      log.severe(e, 'SAVE_TABLE_ERROR', trace);
      emit(state.copyWith(status: CreateEditTableStatus.failure));
    }
  }

  void _onSaveTableLayout(SaveTableLayout event, Emitter<CreateEditTableState> emit) async {
    emit(state.copyWith(status: CreateEditTableStatus.loading));
    try {
      await tableRepository.saveTableLayoutPlan(event.tables);
      emit(state.copyWith(status: CreateEditTableStatus.success));
      add(SelectFloorLayout(state.selectedFloor!));
    } catch (e, trace) {
      log.severe(e, 'SAVE_TABLE_LAYOUT_ERROR', trace);
      emit(state.copyWith(status: CreateEditTableStatus.failure));
    }
  }
}
