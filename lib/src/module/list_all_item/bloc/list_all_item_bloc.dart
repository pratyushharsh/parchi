import 'package:bloc/bloc.dart';
import 'package:isar/isar.dart';
import 'package:logging/logging.dart';
import 'package:meta/meta.dart';

import '../../../database/db_provider.dart';
import '../../../entity/pos/entity.dart';
import '../../../repositories/product_repository.dart';

part 'list_all_item_event.dart';
part 'list_all_item_state.dart';

class ListAllItemBloc extends Bloc<ListAllItemEvent, ListAllItemState>
    with DatabaseProvider {
  final log = Logger('ListAllItemBloc');

  ProductRepository productRepository;

  ListAllItemBloc({required this.productRepository})
      : super(ListAllItemState()) {
    on<InitProductSearch>(_onInitProductSearch);
    on<LoadAllItems>(_onLoadItem);
    on<LoadNextProduct>(_onLoadNextProducts);
    on<SearchProductByNameFilter>(_filerProductsByDisplayName);
    on<AddProductByBrandFilter>(_addProductByBrandFilter);
    on<RemoveProductByBrandFilter>(_removeProductByBrandFilter);
    on<RefreshProduct>(_onRefreshProduct);
    on<AddCategoryFilter>(_addCategoryFilter);
    on<RemoveCategoryFilter>(_removeCategoryFilter);
    on<ProductFilterSortByCriteriaEvent>(_onProductFilterSortByCriteriaEvent);
  }

  void _onInitProductSearch(
      InitProductSearch event, Emitter<ListAllItemState> emit) async {
    // add(LoadAllItems());
    // Load All Categories
    var brands = await productRepository.getAllProductsBrands();
    var category = await productRepository.getAllCategory();
    emit(state.copyWith(brands: brands, categories: category));
  }

  void _onLoadItem(LoadAllItems event, Emitter<ListAllItemState> emit) async {
    try {
      emit(state.copyWith(status: ListAllItemStatus.loading));
      // @TODO Revisit this sort by feature and brand filter is not working.
      if (state.filterCriteria.filter == null ||
          state.filterCriteria.filter!.isEmpty) {
        var prod = await productRepository.searchProducts(state.filterCriteria);
        emit(state.copyWith(
            products: prod, status: ListAllItemStatus.success, end: true));
        return;
      } else {
        var prod = await productRepository.searchProductByFilter(state.filterCriteria.filter!);
        emit(state.copyWith(products: prod, status: ListAllItemStatus.success));
      }
    } catch (e, st) {
      log.severe(e, e, st);
      emit(state.copyWith(status: ListAllItemStatus.failure));
    }
  }

  void _onLoadNextProducts(
      LoadNextProduct event, Emitter<ListAllItemState> emit) async {
    var offset = state.filterCriteria.offset + state.products.length;
    emit(state.copyWith(
        status: ListAllItemStatus.loadingNextProducts,
        filterCriteria: state.filterCriteria.copyWith(offset: offset)));
    try {
      var newProducts =
          await productRepository.searchProducts(state.filterCriteria);
      emit(state.copyWith(
          status: ListAllItemStatus.success,
          products: [...state.products, ...newProducts],
          end: newProducts.isEmpty));
    } catch (e) {
      log.severe(e);
      emit(state.copyWith(
        status: ListAllItemStatus.failure,
      ));
    }
  }

  void _filerProductsByDisplayName(
      SearchProductByNameFilter event, Emitter<ListAllItemState> emit) async {
    var fc = state.filterCriteria;
    emit(state.copyWith(
        filterCriteria: fc.copyWith(filter: event.filterString)));
    add(LoadAllItems());
  }

  void _addProductByBrandFilter(
      AddProductByBrandFilter event, Emitter<ListAllItemState> emit) async {
    var fc = state.filterCriteria;

    if (!fc.brands.contains(event.brand)) {
      emit(state.copyWith(
          filterCriteria:
              fc.copyWith(brands: [...fc.brands, event.brand], offset: 0)));
      add(LoadAllItems());
    }
  }

  void _removeProductByBrandFilter(
      RemoveProductByBrandFilter event, Emitter<ListAllItemState> emit) async {
    var fc = state.filterCriteria;
    if (fc.brands.contains(event.brand)) {
      emit(state.copyWith(
          filterCriteria: fc.copyWith(
              brands:
                  fc.brands.where((element) => element != event.brand).toList(),
              offset: 0)));
      add(LoadAllItems());
    }
  }

  void _onRefreshProduct(
      RefreshProduct event, Emitter<ListAllItemState> emit) async {
    emit(state.copyWith(
        filterCriteria: state.filterCriteria.copyWith(offset: 0)));
    add(LoadAllItems());
  }

  void _addCategoryFilter(
      AddCategoryFilter event, Emitter<ListAllItemState> emit) async {
    var fc = state.filterCriteria;

    if (!fc.categories.contains(event.category)) {
      emit(
        state.copyWith(
          filterCriteria: fc.copyWith(
              categories: [...fc.categories, event.category], offset: 0),
        ),
      );
      add(LoadAllItems());
    }
  }

  void _removeCategoryFilter(
      RemoveCategoryFilter event, Emitter<ListAllItemState> emit) async {
    var fc = state.filterCriteria;
    if (fc.categories.contains(event.category)) {
      emit(state.copyWith(
          filterCriteria: fc.copyWith(
              categories: fc.categories
                  .where((element) => element != event.category)
                  .toList(),
              offset: 0)));
      add(LoadAllItems());
    }
  }

  void _onProductFilterSortByCriteriaEvent(
      ProductFilterSortByCriteriaEvent event,
      Emitter<ListAllItemState> emit) async {
    var fc = state.filterCriteria;
    emit(state.copyWith(
        filterCriteria: fc.copyWith(sortBy: event.criteria, offset: 0)));
    add(LoadAllItems());
  }
}
