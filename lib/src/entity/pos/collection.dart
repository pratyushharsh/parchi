import 'package:isar/isar.dart';

part 'collection.g.dart';

@Collection()
class CollectionEntity {
  final Id? id;

  @Index(unique: true, type: IndexType.value, replace: true)
  final String collectionId;
  final String name;
  final String? description;
  final String? longDescription;
  final bool active;
  final String? backgroundImage;

  CollectionEntity(
      {this.id,
      required this.collectionId,
      required this.name,
      this.description,
      this.longDescription,
      this.active = true,
      this.backgroundImage});
}
