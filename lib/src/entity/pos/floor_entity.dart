import 'package:isar/isar.dart';

part 'floor_entity.g.dart';

@Collection()
class FloorEntity {
  Id? id;

  @Index(unique: true, type: IndexType.value, replace: false)
  String floorId;

  String description;
  double width;
  double height;

  DateTime? createdAt;
  DateTime? updatedAt;

  FloorEntity({
    required this.floorId,
    required this.description,
    required this.width,
    required this.height,
    this.createdAt,
    this.updatedAt,
  });
}