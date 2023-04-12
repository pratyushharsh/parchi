import 'package:isar/isar.dart';

part 'table_entity.g.dart';

@Collection()
class TableEntity {
  Id? id;

  @Index(unique: true, type: IndexType.value, replace: true)
  String tableId;
  int tableCapacity;

  @Enumerated(EnumType.name)
  TableStatus status;

  @Index(type: IndexType.value)
  String? floorId;
  String? associateId;
  String? associateName;
  String? customerId;
  String? customerName;
  String? orderId;
  DateTime? orderTime;
  double x;
  double y;
  double scale;
  double rotation;

  TableEntity({
    required this.tableId,
    required this.tableCapacity,
    this.status = TableStatus.available,
    this.floorId,
    this.associateId,
    this.associateName,
    this.customerId,
    this.customerName,
    this.orderId,
    this.orderTime,
    this.x = 0.0,
    this.y = 0.0,
    this.scale = 1,
    this.rotation = 0,
  });
}

enum TableStatus { available, occupied, reserved, dirty }