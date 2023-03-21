import 'package:isar/isar.dart';

part 'table_entity.g.dart';

@Collection()
class TableEntity {
  Id? id;

  @Index(unique: true, type: IndexType.value, replace: false)
  String tableId;
  int tableCapacity;

  @Enumerated(EnumType.name)
  TableStatus status;
  String? associateId;
  String? associateName;
  String? customerId;
  String? customerName;
  String? orderId;
  DateTime? orderTime;

  TableEntity({
    required this.tableId,
    required this.tableCapacity,
    this.status = TableStatus.available,
    this.associateId,
    this.associateName,
    this.customerId,
    this.customerName,
    this.orderId,
    this.orderTime,
  });
}

enum TableStatus { available, occupied, reserved, dirty }