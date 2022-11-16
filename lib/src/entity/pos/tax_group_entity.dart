import 'package:isar/isar.dart';

import 'tax_rule_entity.dart';

part 'tax_group_entity.g.dart';

@Collection()
class TaxGroupEntity {
  final Id? id;

  @Index(unique: true, replace: true)
  final String groupId;
  final String name;
  final String description;

  List<TaxRuleEntity> taxRules;

  late DateTime createTime;

  @Index(type: IndexType.value)
  DateTime? lastChangedAt;

  @Index(type: IndexType.value)
  DateTime? lastSyncAt;

  @Index(type: IndexType.value)
  int? syncState;

  TaxGroupEntity(
      {this.id,
      required this.groupId,
      required this.name,
      required this.description,
      this.taxRules = const [],
      required this.createTime,
      this.syncState,
      this.lastSyncAt,});
}