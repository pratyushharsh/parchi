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