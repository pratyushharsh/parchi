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
  final FloorEntity? selectedFloor;
  final List<TableEntity> tables;

  bool get isValid => tableId.isNotEmpty && tableCapacity > 0;

  CreateEditTableState({
    this.tableId = '',
    this.tableName = '',
    this.tableCapacity = 0,
    this.status = CreateEditTableStatus.initial,
    this.error = '',
    this.floors = const [],
    this.tables = const [],
    this.selectedFloor,
  });

  CreateEditTableState copyWith({
    String? tableId,
    String? tableName,
    int? tableCapacity,
    CreateEditTableStatus? status,
    String? error,
    List<FloorEntity>? floors,
    List<TableEntity>? tables,
    FloorEntity? selectedFloor,
  }) {
    return CreateEditTableState(
      tableId: tableId ?? this.tableId,
      tableName: tableName ?? this.tableName,
      tableCapacity: tableCapacity ?? this.tableCapacity,
      status: status ?? this.status,
      error: error ?? this.error,
      floors: floors ?? this.floors,
      tables: tables ?? this.tables,
      selectedFloor: selectedFloor ?? this.selectedFloor,
    );
  }
}
