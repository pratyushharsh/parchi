part of 'create_edit_table_bloc.dart';


enum CreateEditTableStatus {
  initial,
  loading,
  success,
  failure,
}

class CreateEditTableState {
  final String tableId;
  final String tableName;
  final int tableCapacity;
  final CreateEditTableStatus status;
  final String error;
  final List<FloorEntity> floors;

  bool get isValid => tableId.isNotEmpty && tableCapacity > 0;

  CreateEditTableState({
    this.tableId = '',
    this.tableName = '',
    this.tableCapacity = 0,
    this.status = CreateEditTableStatus.initial,
    this.error = '',
    this.floors = const [],
  });

  CreateEditTableState copyWith({
    String? tableId,
    String? tableName,
    int? tableCapacity,
    CreateEditTableStatus? status,
    String? error,
    List<FloorEntity>? floors,
  }) {
    return CreateEditTableState(
      tableId: tableId ?? this.tableId,
      tableName: tableName ?? this.tableName,
      tableCapacity: tableCapacity ?? this.tableCapacity,
      status: status ?? this.status,
      error: error ?? this.error,
      floors: floors ?? this.floors,
    );
  }
}
