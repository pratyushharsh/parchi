import 'package:isar/isar.dart';

part 'setting_entity.g.dart';

@Collection()
class SettingEntity {

  final Id? id;

  final String category;
  final String subCategory;
  final String value;
  final DateTime? createAt;
  final DateTime? updatedAt;

  SettingEntity(
      {this.id,
        required this.category,
      required this.subCategory,
      required this.value,
      this.createAt,
      this.updatedAt});
}
