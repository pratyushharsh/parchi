import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:logging/logging.dart';
import 'package:meta/meta.dart';
import 'package:uuid/uuid.dart';

import '../../../config/constants.dart';
import '../../../entity/config/code_value_entity.dart';
import '../../../entity/pos/entity.dart';
import '../../../repositories/repository.dart';

part 'add_new_item_event.dart';
part 'add_new_item_state.dart';

class AddNewItemBloc extends Bloc<AddNewItemEvent, AddNewItemState> {
  final log = Logger('AddNewItemBloc');

  final ProductRepository productRepository;
  final ConfigRepository configRepository;
  final TaxRepository taxRepository;
  final SequenceRepository sequenceRepository;

  var uuid = const Uuid();

  AddNewItemBloc({ required this.productRepository, required this.configRepository, required this.taxRepository, required this.sequenceRepository }) : super(AddNewItemState()) {
    on<LoadExistingProduct>(_onLoadExistingProduct);
    on<DisplayNameChangedEvent>(_onDisplayNameChangedEvent);
    on<DescriptionChangedEvent>(_onDescriptionChangedEvent);
    on<ListPriceChangedEvent>(_onListPriceChangedEvent);
    on<SalePriceChangedEvent>(_onSalePriceChangedEvent);
    on<UomChangedEvent>(_onUomChangedEvent);
    on<ProductEnabledChangedEvent>(_onProductEnabledChangedEvent);
    on<BrandChangedEvent>(_onBrandChangedEvent);
    on<SkuCodeChangedEvent>(_onSkuCodeChangedEvent);
    on<BarcodeChangedEvent>(_onBarcodeChangedEvent);
    on<HsnChangedEvent>(_onHsnChangedEvent);
    on<TaxGroupIdChangedEvent>(_onTaxGroupIdChangedEvent);
    on<AddNewCategoryEvent>(_onAddNewCategoryEvent);
    on<RemoveCategoryEvent>(_onRemoveCategoryEvent);
    on<AddImageUrlsEvent>(_onAddImageUrlsEvent);
    on<RemoveImageUrlsEvent>(_onRemoveImageUrlsEvent);
    on<PriceIncludeTaxChangedEvent>(_onPriceIncludeTaxChangedEvent);
    on<SaveProductEvent>(_onSaveProductEvent);
  }

  void _onLoadExistingProduct(
      LoadExistingProduct event, Emitter<AddNewItemState> emit) async {
    if (event.productId == null) return;
    var product = await productRepository.getProductById(event.productId!);
    if (product != null) {

      // Fetch UOM
      CodeValueEntity? uom = await configRepository.getCodeByCategoryAndCodeAsync('UOM', product.uom);
      // Fetch Taxgroup
      TaxGroupEntity? taxGroup = await taxRepository.getTaxGroupIdAsync(product.taxGroupId);

      emit(state.copyWith(
        existingProduct: product,
        displayName: product.displayName,
        description: product.description,
        listPrice: product.listPrice,
        salePrice: product.salePrice,
        uom: uom,
        enable: product.enable,
        brand: product.brand,
        skuCode: product.skuCode,
        hsn: product.hsn,
        taxGroupId: taxGroup,
        category: product.category,
        imageUrl: product.imageUrl,
        status: AddNewItemStatus.existingProduct,
      ));
    }
  }

  void _onDisplayNameChangedEvent(
      DisplayNameChangedEvent event, Emitter<AddNewItemState> emit) {
    emit(state.copyWith(displayName: event.displayName, status: AddNewItemStatus.modifying));
  }

  void _onDescriptionChangedEvent(
      DescriptionChangedEvent event, Emitter<AddNewItemState> emit) {
    emit(state.copyWith(description: event.description, status: AddNewItemStatus.modifying));
  }

  void _onListPriceChangedEvent(
      ListPriceChangedEvent event, Emitter<AddNewItemState> emit) {
    emit(state.copyWith(listPrice: event.price, status: AddNewItemStatus.modifying));
  }

  void _onSalePriceChangedEvent(
      SalePriceChangedEvent event, Emitter<AddNewItemState> emit) {
    emit(state.copyWith(salePrice: event.price, status: AddNewItemStatus.modifying));
  }

  void _onUomChangedEvent(
      UomChangedEvent event, Emitter<AddNewItemState> emit) {
    emit(state.copyWith(uom: event.uom, status: AddNewItemStatus.modifying));
  }

  void _onProductEnabledChangedEvent(
      ProductEnabledChangedEvent event, Emitter<AddNewItemState> emit) {
    emit(state.copyWith(enable: event.enabled, status: AddNewItemStatus.modifying));
  }

  void _onBrandChangedEvent(
      BrandChangedEvent event, Emitter<AddNewItemState> emit) {
    emit(state.copyWith(brand: event.brand, status: AddNewItemStatus.modifying));
  }

  void _onSkuCodeChangedEvent(
      SkuCodeChangedEvent event, Emitter<AddNewItemState> emit) {
    emit(state.copyWith(skuCode: event.skuCode, status: AddNewItemStatus.modifying));
  }

  void _onBarcodeChangedEvent(
      BarcodeChangedEvent event, Emitter<AddNewItemState> emit) {
    emit(state.copyWith(barcode: event.barcode, status: AddNewItemStatus.modifying));
  }

  void _onHsnChangedEvent(
      HsnChangedEvent event, Emitter<AddNewItemState> emit) {
    emit(state.copyWith(hsn: event.hsn, status: AddNewItemStatus.modifying));
  }

  void _onTaxGroupIdChangedEvent(
      TaxGroupIdChangedEvent event, Emitter<AddNewItemState> emit) {
    emit(state.copyWith(taxGroupId: event.taxGroupId, status: AddNewItemStatus.modifying));
  }

  void _onAddNewCategoryEvent(
      AddNewCategoryEvent event, Emitter<AddNewItemState> emit) {
    emit(state.copyWith(category: state.category..add(event.category), status: AddNewItemStatus.modifying));
  }

  void _onRemoveCategoryEvent(
      RemoveCategoryEvent event, Emitter<AddNewItemState> emit) {
    emit(state.copyWith(category: state.category..remove(event.category), status: AddNewItemStatus.modifying));
  }

  void _onAddImageUrlsEvent(
      AddImageUrlsEvent event, Emitter<AddNewItemState> emit) {
    List<String> imageUrls = [...state.imageUrl, ...event.imageUrls];
    emit(state.copyWith(imageUrl: imageUrls, status: AddNewItemStatus.modifying));
  }

  void _onRemoveImageUrlsEvent(
      RemoveImageUrlsEvent event, Emitter<AddNewItemState> emit) {
    emit(state.copyWith(imageUrl: state.imageUrl..remove(event.url), status: AddNewItemStatus.modifying));
  }

  void _onPriceIncludeTaxChangedEvent(
      PriceIncludeTaxChangedEvent event, Emitter<AddNewItemState> emit) {
    emit(state.copyWith(priceIncludeTax: event.priceIncludeTax, status: AddNewItemStatus.modifying));
  }

  void _onSaveProductEvent(SaveProductEvent event, Emitter<AddNewItemState> emit) async {
    if (state.status == AddNewItemStatus.addingProduct) return;
    emit(state.copyWith(status: AddNewItemStatus.addingProduct));
    try {
      if (state.existingProduct != null) {
        // Update existing product
        var product = ProductEntity(
          id: state.existingProduct!.id,
          productId: state.existingProduct!.productId,
          displayName: state.displayName ?? state.existingProduct!.displayName,
          description: state.description ?? state.existingProduct!.description,
          listPrice: state.listPrice ?? state.existingProduct!.listPrice,
          salePrice: state.salePrice ?? state.existingProduct!.salePrice,
          uom: state.uom?.code ?? state.existingProduct!.uom,
          enable: state.enable,
          brand: state.brand ?? state.existingProduct!.brand,
          skuCode: state.skuCode ?? state.existingProduct!.skuCode,
          // barcode: state.barcode ?? state.existingProduct!.barcode,
          hsn: state.hsn ?? state.existingProduct!.hsn,
          taxGroupId: state.taxGroupId?.groupId ??
              state.existingProduct!.taxGroupId,
          category: state.category,
          imageUrl: state.imageUrl,
          createTime: state.existingProduct!.createTime,
          lastChangedAt: DateTime.now(),
        );
        product = await _uploadImageToStagingArea(product);
        await productRepository.updateProduct(product);
        emit(state.copyWith(status: AddNewItemStatus.addingSuccess, existingProduct: product));
      } else {
        // Create new product
        // Generate new product id
        var prodSeq = await sequenceRepository.getNextSequence(
            SequenceType.item);

        var product = ProductEntity(
          productId: prodSeq.nextSeq.toString(),
          displayName: state.displayName!,
          description: state.description,
          listPrice: state.listPrice,
          salePrice: state.salePrice,
          uom: state.uom?.code ?? 'EA',
          enable: state.enable,
          brand: state.brand,
          skuCode: state.skuCode,
          hsn: state.hsn,
          taxGroupId: state.taxGroupId?.groupId,
          category: state.category,
          imageUrl: state.imageUrl,
          createTime: DateTime.now(),
        );
        product = await _uploadImageToStagingArea(product);
        await productRepository.createNewProduct(product);
        emit(state.copyWith(
            status: AddNewItemStatus.addingSuccess, existingProduct: product));
      }
    } catch (e, st) {
      log.severe('Error while adding new product', e, st);
      emit(state.copyWith(status: AddNewItemStatus.addingFailure));
    }
  }

  Future<ProductEntity> _uploadImageToStagingArea(ProductEntity product) async {
    var imageUrls = <String>[];
    for (var url in product.imageUrl) {
      if (url.startsWith('fileRaw:/')) {
        var filePath = '${Constants.baseImagePath}${product.productId}';
        if(!Directory(filePath).existsSync()) {
          await Directory(filePath).create(recursive: true);
        }

        var fileName = '${product.productId}/${uuid.v1()}.jpg';
        var file = File(url.replaceFirst('fileRaw:/', ''));
        await file.copy('${Constants.baseImagePath}$fileName');
        log.info('File copied to ${Constants.baseImagePath}$fileName');
        imageUrls.add('file:/$fileName');
      } else  {
        imageUrls.add(url);
      }
    }
    product.imageUrl = imageUrls;
    return product;
  }
}
