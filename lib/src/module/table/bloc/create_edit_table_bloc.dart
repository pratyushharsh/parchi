
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
  final String? tableId;

  CreateEditTableBloc({required this.tableRepository, this.tableId}) : super(CreateEditTableState()) {
    on<ChangeTableId>(_onTableIdChanged);
    on<ChangeTableName>(_onTableNameChanged);
    on<ChangeTableCapacity>(_onTableCapacityChanged);
    on<OnSaveTable>(_onSaveTable);
    on<CreateNewFloorLayout>(_onCreateNewFloorLayout);
    on<FetchAllFloors>(_onFetchAllFloors);
  }

  void _onTableIdChanged(ChangeTableId event, Emitter<CreateEditTableState> emit) {
    emit(state.copyWith(tableId: event.tableId));
  }

  void _onTableNameChanged(ChangeTableName event, Emitter<CreateEditTableState> emit) {
    emit(state.copyWith(tableName: event.tableName));
  }

  void _onTableCapacityChanged(ChangeTableCapacity event, Emitter<CreateEditTableState> emit) {
    emit(state.copyWith(tableCapacity: event.tableCapacity));
  }

  void _onSaveTable(OnSaveTable event, Emitter<CreateEditTableState> emit) async {
    emit(state.copyWith(status: CreateEditTableStatus.loading));
    try {
      if (tableId != null) {
        await tableRepository.insertTable(TableEntity(
          tableId: state.tableId,
          tableCapacity: state.tableCapacity,
        ));
      } else {
        await tableRepository.updateTable(TableEntity(
          tableId: state.tableId,
          tableCapacity: state.tableCapacity,
        ));
      }
      emit(state.copyWith(status: CreateEditTableStatus.success));
    } catch (e) {
      print(e);
      emit(state.copyWith(status: CreateEditTableStatus.failure));
    }
  }

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
}
