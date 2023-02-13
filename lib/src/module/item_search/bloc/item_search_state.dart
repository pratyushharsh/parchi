part of 'item_search_bloc.dart';

enum ItemSearchStatus { initial, loading, success, failure }

class ItemSearchState {
  final ItemSearchStatus status;
  final List<ItemEntity> products;
  final SearchFilter filter;

  ItemSearchState(
      {this.status = ItemSearchStatus.initial,
      this.filter = const SearchFilter(filterText: ""),
      this.products = const <ItemEntity>[]});

  ItemSearchState copyWith({
    ItemSearchStatus? status,
    List<ItemEntity>? products,
    SearchFilter? filter,
  }) {
    return ItemSearchState(
      status: status ?? this.status,
      products: products ?? this.products,
      filter: filter ?? this.filter,
    );
  }
}

class SearchFilter {
  final String filterText;

  const SearchFilter({required this.filterText});

  SearchFilter copyWith({
    String? filterText,
  }) {
    return SearchFilter(
      filterText: filterText ?? this.filterText,
    );
  }
}
