part of 'create_edit_table_bloc.dart';

abstract class CreateEditTableEvent {}

class ChangeTableId extends CreateEditTableEvent {
  final String tableId;

  ChangeTableId(this.tableId);
}

class ChangeTableName extends CreateEditTableEvent {
  final String tableName;

  ChangeTableName(this.tableName);
}

class ChangeTableCapacity extends CreateEditTableEvent {
  final int tableCapacity;

  ChangeTableCapacity(this.tableCapacity);
}

class OnSaveTable extends CreateEditTableEvent {}

class CreateNewFloorLayout extends CreateEditTableEvent {
  final String floorName;
  final String floorId;
  final double floorWidth;
  final double floorHeight;

  CreateNewFloorLayout({
    required this.floorName,
    required this.floorId,
    required this.floorWidth,
    required this.floorHeight,
  });
}

class FetchAllFloors extends CreateEditTableEvent {}