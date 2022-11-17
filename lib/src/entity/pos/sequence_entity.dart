import 'package:isar/isar.dart';

part 'sequence_entity.g.dart';

// enum SequenceType {
//   item,
//   trans,
//   customer
//
//
// }

enum SequenceType {
  item("ITEM"),
  customer("CUSTOMER"),
  employee("EMPLOYEE"),
  invoice("INVOICE"),
  order("ORDER"),
  reasonCode("REASON_CODE"),
  transaction("TRANSACTION");

  const SequenceType(this.value);
  final String value;
}

@Collection()
class SequenceEntity {
  Id? id;

  @Index(unique: true, caseSensitive: true, replace: true, type: IndexType.value)
  @Enumerated(EnumType.name)
  final SequenceType name;
  int nextSeq;
  String pattern;
  DateTime createAt;
  DateTime? lastSeqCreatedAt;

  @Index(type: IndexType.value)
  DateTime? lastChangedAt;

  @Index(type: IndexType.value)
  DateTime? lastSyncAt;

  @Index(type: IndexType.value)
  int? syncState;

  SequenceEntity({required this.name, required this.nextSeq, required this.pattern, required this.createAt});
}