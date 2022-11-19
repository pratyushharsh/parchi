part of 'list_all_item_bloc.dart';

enum ListAllItemStatus {
  initial,
  loading,
  success,
  failure,
  loadingNextProducts
}

class ListAllItemState {
  final ListAllItemStatus status;
  final List<String> brands;
  final List<String> categories;
  final List<ProductEntity> products;
  final ProductFilterCriteria filterCriteria;
  final bool end;

  ListAllItemState(
      {this.status = ListAllItemStatus.initial,
      this.brands = const [],
      this.categories = const [],
      this.filterCriteria = const ProductFilterCriteria(),
      this.end = false,
      this.products = const <ProductEntity>[]});

  ListAllItemState copyWith(
      {ListAllItemStatus? status,
      List<String>? brands,
      List<String>? categories,
      List<ProductEntity>? products,
      bool? end,
      ProductFilterCriteria? filterCriteria}) {
    return ListAllItemState(
        status: status ?? this.status,
        brands: brands ?? this.brands,
        categories: categories ?? this.categories,
        products: products ?? this.products,
        end: end ?? this.end,
        filterCriteria: filterCriteria ?? this.filterCriteria);
  }
}

class ProductFilterCriteria {
  final String? filter;
  final List<String> brands;
  final List<String> categories;
  final int limit;
  final int offset;

  ProductFilterCriteria copyWith({
    String? filter,
    List<String>? brands,
    List<String>? categories,
    int? limit,
    int? offset,
  }) {
    return ProductFilterCriteria(
      filter: filter ?? this.filter,
      brands: brands ?? this.brands,
      categories: categories ?? this.categories,
      limit: limit ?? this.limit,
      offset: offset ?? this.offset,
    );
  }

  const ProductFilterCriteria(
      {this.filter,
      this.limit = 20,
      this.offset = 0,
      this.brands = const [],
      this.categories = const []});
}
