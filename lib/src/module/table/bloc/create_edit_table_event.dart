part of 'create_edit_table_bloc.dart';

abstract class CreateEditTableEvent {}

// class ChangeTableId extends CreateEditTableEvent {
//   final String tableId;
//
//   ChangeTableId(this.tableId);
// }
//
// class ChangeTableName extends CreateEditTableEvent {
//   final String tableName;
//
//   ChangeTableName(this.tableName);
// }
//
// class ChangeTableCapacity extends CreateEditTableEvent {
//   final int tableCapacity;
//
//   ChangeTableCapacity(this.tableCapacity);
// }

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

class SelectFloorLayout extends CreateEditTableEvent {
  final FloorEntity floorEntity;

  SelectFloorLayout(this.floorEntity);
}

class SaveTableEvent extends CreateEditTableEvent {
  final String tableId;
  final String tableName;
  final String floorId;
  final int tableCapacity;

  SaveTableEvent({
    required this.tableId,
    required this.tableName,
    required this.floorId,
    required this.tableCapacity,
  });
}

class SaveTableLayout extends CreateEditTableEvent {
  final List<TableEntity> tables;

  SaveTableLayout({
    required this.tables,
  });
}