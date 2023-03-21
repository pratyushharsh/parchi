part of 'table_layout_bloc.dart';

class TableLayoutState {
  final List<TableEntity> tables;
  final bool isTableSelected;

  TableLayoutState({this.tables = const [], this.isTableSelected = false});

  TableLayoutState copyWith({List<TableEntity>? tables, bool? isTableSelected}) {
    return TableLayoutState(
      tables: tables ?? this.tables,
      isTableSelected: isTableSelected ?? this.isTableSelected,
    );
  }
}