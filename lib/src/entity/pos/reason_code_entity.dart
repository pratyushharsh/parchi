import 'package:isar/isar.dart';

part 'reason_code_entity.g.dart';

@Collection()
class ReasonCodeEntity {

  final Id? id;

  @Index(composite: [CompositeIndex("reasonCode")])
  final String reasonTypeCode;
  final String reasonCode;
  final String description;
  final String? parentCode;
  final bool commentRequired;

  const ReasonCodeEntity({
    this.id,
    required this.reasonTypeCode,
    required this.reasonCode,
    required this.description,
    this.parentCode,
    required this.commentRequired,
  });

  @override
  String toString() {
    return 'ReasonCodeEntity{id: $id, reasonTypeCode: $reasonTypeCode, reasonCode: $reasonCode, description: $description, parentCode: $parentCode, commentRequired: $commentRequired}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ReasonCodeEntity &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          reasonTypeCode == other.reasonTypeCode &&
          reasonCode == other.reasonCode &&
          description == other.description &&
          parentCode == other.parentCode &&
          commentRequired == other.commentRequired;

  @override
  int get hashCode =>
      id.hashCode ^
      reasonTypeCode.hashCode ^
      reasonCode.hashCode ^
      description.hashCode ^
      parentCode.hashCode ^
      commentRequired.hashCode;
}

