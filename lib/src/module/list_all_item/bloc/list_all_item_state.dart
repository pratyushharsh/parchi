part of 'list_all_item_bloc.dart';

enum ListAllItemStatus { initial, loading, success, failure, loadingNextProducts }

class ListAllItemState {
  final ListAllItemStatus status;
  final List<ProductEntity> products;
  final ProductFilterCriteria filterCriteria;
  final bool end;

  ListAllItemState(
      {this.status = ListAllItemStatus.initial,
      this.filterCriteria = const ProductFilterCriteria(),
      this.end = false,
      this.products = const <ProductEntity>[]});

  ListAllItemState copyWith(
      {ListAllItemStatus? status,
      List<ProductEntity>? products,
      bool? end,
      ProductFilterCriteria? filterCriteria}) {
    return ListAllItemState(
        status: status ?? this.status,
        products: products ?? this.products,
        end: end ?? this.end,
        filterCriteria: filterCriteria ?? this.filterCriteria);
  }
}

class ProductFilterCriteria {
  final String? filter;
  final int limit;

  const ProductFilterCriteria({this.filter, this.limit = 20});

  ProductFilterCriteria copyWith({
    String? filter,
    int? limit,
  }) {
    return ProductFilterCriteria(
      filter: filter ?? this.filter,
      limit: limit ?? this.limit,
    );
  }
}
