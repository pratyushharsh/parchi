import 'package:isar/isar.dart';

part 'item_price_entity.g.dart';

@Collection()
class ItemPriceEntity {
  Id? id;

  @Index(composite: [CompositeIndex("pricePropertyCode"), CompositeIndex("effectiveDate"), CompositeIndex("priceQuantity")])
  String productId;
  String pricePropertyCode;
  DateTime effectiveDate;
  DateTime? expiryDate;
  double price;
  double priceQuantity;

  ItemPriceEntity({
    this.id,
    required this.productId,
    required this.pricePropertyCode,
    required this.effectiveDate,
    this.expiryDate,
    required this.price,
    required this.priceQuantity,
  });
}