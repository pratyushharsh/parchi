import 'package:isar/isar.dart';

// @Entity(tableName: 'product', indices: [
//   Index(value: ['description']),
//   Index(value: ['skuCode'], unique: true)
// ])
part 'item_entity.g.dart';

@Collection()
class ItemEntity {
  Id? id;

  @Index(unique: true, type: IndexType.value, replace: true, name: 'product')
  String productId;
  String? skuId;

  String displayName;
  String? description;
  double? listPrice;
  double? salePrice;
  String uom;
  bool enable;

  @Index()
  String? brand;
  String? skuCode;
  String? hsn;
  String? taxGroupId;
  String? color;
  String? size;

  @Index()
  List<String> category;
  List<String> imageUrl;
  late DateTime createTime;

  @Index(type: IndexType.value)
  DateTime? lastChangedAt;

  @Index(type: IndexType.value)
  DateTime? lastSyncAt;

  @Index(type: IndexType.value)
  int? syncState;

  @Index(type: IndexType.value)
  List<String> upc;

  List<ItemImage> images = [];

  List<ItemModifier> modifiers = [];

  @Index(type: IndexType.value, caseSensitive: false)
  List<String> get descriptionWords => Isar.splitWords(displayName);

  ItemEntity({
    this.id,
    required this.productId,
    required this.displayName,
    this.description,
    required this.listPrice,
    required this.salePrice,
    required this.uom,
    required this.enable,
    this.brand,
    this.skuCode,
    this.hsn,
    this.taxGroupId,
    this.color,
    this.size,
    this.category = const [],
    this.imageUrl = const [],
    this.modifiers = const [],
    this.upc = const [],
    required this.createTime,
    this.syncState,
    this.lastSyncAt,
    this.lastChangedAt,
  });
}

@embedded
class ItemImage {
  int sort;
  String? imageUrl;
  String? label;

  ItemImage({
    this.sort = 0,
    this.imageUrl,
    this.label,
  });
}

@embedded
class ItemModifier {
  String? uuid;
  String? name;
  double? price;

  ItemModifier({
    this.uuid,
    this.name,
    this.price,
  });
}