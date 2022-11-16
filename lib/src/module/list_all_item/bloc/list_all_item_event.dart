part of 'list_all_item_bloc.dart';

@immutable
abstract class ListAllItemEvent {}

class LoadAllItems extends ListAllItemEvent {}

class LoadNextProduct extends ListAllItemEvent {}

class SearchProductByNameFilter extends ListAllItemEvent {
  final String filterString;

  SearchProductByNameFilter(this.filterString);
}