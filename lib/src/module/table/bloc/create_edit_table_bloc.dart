
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../entity/pos/table_entity.dart';
import '../../../repositories/table_repository.dart';

part 'create_edit_table_event.dart';
part 'create_edit_table_state.dart';

class CreateEditTableBloc extends Bloc<CreateEditTableEvent, CreateEditTableState> {

  final TableRepository tableRepository;
  final String? tableId;

  CreateEditTableBloc({required this.tableRepository, this.tableId}) : super(CreateEditTableState()) {
    on<ChangeTableId>(_onTableIdChanged);
    on<ChangeTableName>(_onTableNameChanged);
    on<ChangeTableCapacity>(_onTableCapacityChanged);
    on<OnSaveTable>(_onSaveTable);
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

}
