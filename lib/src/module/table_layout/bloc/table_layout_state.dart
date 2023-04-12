part of 'table_layout_bloc.dart';

enum TableLayoutStatus { initial, loading, loaded, error }

class TableLayoutState {
  final FloorEntity? floor;
  final List<FloorEntity> floors;
  final List<TableEntity> tables;
  final TableLayoutStatus status;
  final bool isTableSelected;

  TableLayoutState(
      {this.floor,
      this.floors = const [],
      this.tables = const [],
      this.status = TableLayoutStatus.initial,
      this.isTableSelected = false});

  TableLayoutState copyWith({
    FloorEntity? floor,
    List<FloorEntity>? floors,
    List<TableEntity>? tables,
    TableLayoutStatus? status,
    bool? isTableSelected,
  }) {
    return TableLayoutState(
      tables: tables ?? this.tables,
      floor: floor ?? this.floor,
      floors: floors ?? this.floors,
      status: status ?? this.status,
      isTableSelected: isTableSelected ?? this.isTableSelected,
    );
  }
}
