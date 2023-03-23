import 'package:isar/isar.dart';

import '../database/db_provider.dart';
import '../entity/pos/table_entity.dart';

class TableRepository with DatabaseProvider {

  // Crud Operations for TableEntity
  Future<void> insertTable(TableEntity table) async {
    await db.tableEntitys.put(table);
  }

  Future<void> updateTable(TableEntity table) async {
    await db.writeTxn(() async {
      await db.tableEntitys.put(table);
    });
  }

  Future<void> deleteTable(String tableId) async {
    await db.tableEntitys.deleteByTableId(tableId);
  }

  Future<List<TableEntity>> getAllTables() async {
    return await db.tableEntitys.where().findAll();
  }

  Future<void> reserveTable(TableEntity table) async {
    await db.writeTxn(() async {
      await db.tableEntitys.put(table);
    });
  }
}