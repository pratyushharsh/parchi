import 'package:isar/isar.dart';

part 'discount_entity.g.dart';

@Collection()
class DiscountEntity {
  final Id? id;

  @Index(unique: true)
  final String discountId;
  final String discountCode;
  final String description;
  final String? discountGroupCode;
  final double? percent;
  final double? amount;
  final String discountType;

  DiscountEntity(
      {this.id,
      required this.discountId,
      required this.discountCode,
      this.percent,
      required this.description,
      this.discountGroupCode,
      this.amount,
      required this.discountType})
      : assert(percent != null || amount != null);
}
