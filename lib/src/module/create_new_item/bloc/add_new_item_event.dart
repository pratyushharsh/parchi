part of 'add_new_item_bloc.dart';

@immutable
abstract class AddNewItemEvent {}

class LoadExistingProduct extends AddNewItemEvent {
  final String? productId;
  LoadExistingProduct(this.productId);
}

class DisplayNameChangedEvent extends AddNewItemEvent {
  final String displayName;

  DisplayNameChangedEvent(this.displayName);
}

class DescriptionChangedEvent extends AddNewItemEvent {
  final String description;

  DescriptionChangedEvent(this.description);
}

class ListPriceChangedEvent extends AddNewItemEvent {
  final double price;

  ListPriceChangedEvent(this.price);
}

class SalePriceChangedEvent extends AddNewItemEvent {
  final double price;

  SalePriceChangedEvent(this.price);
}

class UomChangedEvent extends AddNewItemEvent {
  final CodeValueEntity uom;

  UomChangedEvent(this.uom);
}

class ProductEnabledChangedEvent extends AddNewItemEvent {
  final bool enabled;

  ProductEnabledChangedEvent(this.enabled);
}

class BrandChangedEvent extends AddNewItemEvent {
  final String brand;

  BrandChangedEvent(this.brand);
}

class SkuCodeChangedEvent extends AddNewItemEvent {
  final String skuCode;

  SkuCodeChangedEvent(this.skuCode);
}

class BarcodeChangedEvent extends AddNewItemEvent {
  final String barcode;

  BarcodeChangedEvent(this.barcode);
}

class HsnChangedEvent extends AddNewItemEvent {
  final String hsn;

  HsnChangedEvent(this.hsn);
}

class TaxGroupIdChangedEvent extends AddNewItemEvent {
  final TaxGroupEntity taxGroupId;

  TaxGroupIdChangedEvent(this.taxGroupId);
}

class AddNewCategoryEvent extends AddNewItemEvent {
  final String category;

  AddNewCategoryEvent(this.category);
}

class RemoveCategoryEvent extends AddNewItemEvent {
  final String category;

  RemoveCategoryEvent(this.category);
}

class AddImageUrlsEvent extends AddNewItemEvent {
  final List<String> imageUrls;

  AddImageUrlsEvent(this.imageUrls);
}

class RemoveImageUrlsEvent extends AddNewItemEvent {
  final String url;

  RemoveImageUrlsEvent(this.url);
}

class PriceIncludeTaxChangedEvent extends AddNewItemEvent {
  final bool priceIncludeTax;

  PriceIncludeTaxChangedEvent(this.priceIncludeTax);
}

class SizeChangedEvent extends AddNewItemEvent {
  final String size;

  SizeChangedEvent(this.size);
}

class ColorChangedEvent extends AddNewItemEvent {
  final String color;

  ColorChangedEvent(this.color);
}

class SaveProductEvent extends AddNewItemEvent {}

class AddNewItemModifier extends AddNewItemEvent {
  final ItemModifier modifier;

  AddNewItemModifier(this.modifier);
}