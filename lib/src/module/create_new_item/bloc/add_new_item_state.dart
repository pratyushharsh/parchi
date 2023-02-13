part of 'add_new_item_bloc.dart';

enum AddNewItemStatus { initial, addingProduct, modifying, existingProduct, addingSuccess, addingFailure }

class AddNewItemState {
  final String? displayName;
  final String? description;
  final double? listPrice;
  final double? salePrice;
  final CodeValueEntity? uom;
  final bool enable;
  final String? brand;
  final String? skuCode;
  final String? barcode;
  final String? hsn;
  final String? color;
  final String? size;
  final TaxGroupEntity? taxGroupId;
  final List<String> category;
  final List<String> imageUrl;
  final bool priceIncludeTax;
  final ItemEntity? existingProduct;
  final AddNewItemStatus status;


  AddNewItemState({
    this.displayName,
    this.description,
    this.listPrice,
    this.salePrice,
    this.uom,
    this.enable = true,
    this.brand,
    this.skuCode,
    this.barcode,
    this.hsn,
    this.color,
    this.size,
    this.taxGroupId,
    this.category = const [],
    this.imageUrl = const [],
    this.priceIncludeTax = false,
    this.existingProduct,
    this.status = AddNewItemStatus.initial,
  });

  AddNewItemState copyWith({
    String? displayName,
    String? description,
    double? listPrice,
    double? salePrice,
    CodeValueEntity? uom,
    bool? enable,
    String? brand,
    String? skuCode,
    String? barcode,
    String? hsn,
    String? color,
    String? size,
    TaxGroupEntity? taxGroupId,
    List<String>? category,
    List<String>? imageUrl,
    bool? priceIncludeTax,
    ItemEntity? existingProduct,
    AddNewItemStatus? status,
  }) {
    return AddNewItemState(
      displayName: displayName ?? this.displayName,
      description: description ?? this.description,
      listPrice: listPrice ?? this.listPrice,
      salePrice: salePrice ?? this.salePrice,
      uom: uom ?? this.uom,
      enable: enable ?? this.enable,
      brand: brand ?? this.brand,
      skuCode: skuCode ?? this.skuCode,
      barcode: barcode ?? this.barcode,
      hsn: hsn ?? this.hsn,
      color: color ?? this.color,
      size: size ?? this.size,
      taxGroupId: taxGroupId ?? this.taxGroupId,
      category: category ?? this.category,
      imageUrl: imageUrl ?? this.imageUrl,
      priceIncludeTax: priceIncludeTax ?? this.priceIncludeTax,
      existingProduct: existingProduct ?? this.existingProduct,
      status: status ?? this.status,
    );
  }
}