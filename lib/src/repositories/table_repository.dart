import 'package:isar/isar.dart';

import '../database/db_provider.dart';
import '../entity/pos/employee_entity.dart';
import '../entity/pos/floor_entity.dart';
import '../entity/pos/table_entity.dart';
import '../entity/pos/table_reservation_entity.dart';
import '../model/api/get_employee_response.dart';

class TableRepository with DatabaseProvider {

  // Crud Operations for TableEntity
  Future<void> insertTable(TableEntity table) async {
    await db.writeTxn(() async {
      await db.tableEntitys.put(table);
    });
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

  Future<List<TableEntity>> getTableByFloorId(String floorId) async {
    return await db.tableEntitys.where().floorIdEqualTo(floorId).findAll();
  }

  Future<void> reserveTable(TableEntity table) async {
    await db.writeTxn(() async {
      await db.tableEntitys.put(table);
    });
  }

  Future<void> createANewFloorPlan(FloorEntity floor) async {
    await db.writeTxn(() async {
      await db.floorEntitys.put(floor);
    });
  }

  Future<List<FloorEntity>> getAllFloorPlans() async {
    return await db.floorEntitys.where().findAll();
  }

  Future<void> saveTableLayoutPlan(List<TableEntity> floor) async {
    await db.writeTxn(() async {
      await db.tableEntitys.putAll(floor);
    });
  }

  Future<void> createNewTableReservation(TableReservationEntity table) async {
    await db.writeTxn(() async {
      await db.tableReservationEntitys.put(table);
    });
  }

  Future<List<TableReservationEntity>> getAllConfirmedReservation() async {
    return await db.tableReservationEntitys.where().statusEqualTo(TableReservationStatus.confirmed).findAll();
  }

  Future<List<TableReservationEntity>> getAllUpcomingReservation() async {
    return await db.tableReservationEntitys.where().statusEqualTo(TableReservationStatus.pending).findAll();
  }

  Future<void> confirmReservation(TableReservationEntity table, EmployeeEntity emp) async {
    await db.writeTxn(() async {
      table.status = TableReservationStatus.confirmed;
      // Get the tableEntity and update the status
      if (table.tableId != null) {
        final tableEntity = await db.tableEntitys.where().tableIdEqualTo(table.tableId!).findFirst();
        tableEntity!.status = TableStatus.occupied;
        tableEntity.customerName = table.customerName;
        tableEntity.associateName = '${emp.firstName} ${emp.lastName}';
        tableEntity.associateId = emp.employeeId;
        await db.tableEntitys.put(tableEntity);
      }
      await db.tableReservationEntitys.put(table);
    });
  }

  Future<void> completeReservation(TableReservationEntity table) async {
    await db.writeTxn(() async {
      table.status = TableReservationStatus.completed;
      // Get the tableEntity and update the status
      if (table.tableId != null) {
        final tableEntity = await db.tableEntitys.where().tableIdEqualTo(table.tableId!).findFirst();
        tableEntity!.status = TableStatus.available;
        tableEntity.customerName = '';
        tableEntity.associateName = '';
        tableEntity.associateId = '';
        await db.tableEntitys.put(tableEntity);
      }
      await db.tableReservationEntitys.put(table);
    });
  }
}