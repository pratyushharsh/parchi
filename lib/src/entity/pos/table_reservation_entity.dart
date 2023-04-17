
import 'package:isar/isar.dart';

part 'table_reservation_entity.g.dart';

enum TableReservationStatus {
  pending,
  confirmed,
  canceled,
  completed
}

@Collection()
class TableReservationEntity {
  final Id? id;

  final String customerName;
  final String customerPhone;
  final String? customerId;
  final DateTime? reservationTime;
  final int? numberOfGuest;
  final String? note;
  final String? tableId;
  final String? createdBy;
  final DateTime? createdAt;

  @Index()
  @Enumerated(EnumType.name)
  TableReservationStatus? status;

  TableReservationEntity({
    this.id,
    required this.customerName,
    required this.customerPhone,
    this.customerId,
    this.reservationTime,
    this.numberOfGuest,
    this.note,
    this.tableId,
    this.createdBy,
    this.createdAt,
    this.status,
  });
}