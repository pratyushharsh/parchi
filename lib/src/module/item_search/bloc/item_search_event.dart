part of 'item_search_bloc.dart';

@immutable
abstract class ItemSearchEvent {}

class SearchItemByFilter extends ItemSearchEvent {
  final String filter;

  SearchItemByFilter(this.filter);
}