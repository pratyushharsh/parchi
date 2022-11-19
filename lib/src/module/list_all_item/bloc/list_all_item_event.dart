part of 'list_all_item_bloc.dart';

@immutable
abstract class ListAllItemEvent {}

class InitProductSearch extends ListAllItemEvent {}

class LoadAllItems extends ListAllItemEvent {}

class RefreshProduct extends ListAllItemEvent {}

class LoadNextProduct extends ListAllItemEvent {}

class SearchProductByNameFilter extends ListAllItemEvent {
  final String filterString;

  SearchProductByNameFilter(this.filterString);
}

class AddProductByBrandFilter extends ListAllItemEvent {
  final String brand;

  AddProductByBrandFilter(this.brand);
}

class RemoveProductByBrandFilter extends ListAllItemEvent {
  final String brand;

  RemoveProductByBrandFilter(this.brand);
}

class AddCategoryFilter extends ListAllItemEvent {
  final String category;

  AddCategoryFilter(this.category);
}

class RemoveCategoryFilter extends ListAllItemEvent {
  final String category;

  RemoveCategoryFilter(this.category);
}