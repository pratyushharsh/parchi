part of 'all_customer_bloc.dart';

@immutable
abstract class AllCustomerEvent {}

class InitCustomerSearch extends AllCustomerEvent {}

class LoadAllCustomer extends AllCustomerEvent {}

class LoadNextCustomer extends AllCustomerEvent {}

class SearchCustomerFilter extends AllCustomerEvent {
  final String searchQuery;
  SearchCustomerFilter(this.searchQuery);
}

class SortCustomerFilter extends AllCustomerEvent {
  final CustomerFilterSortBy sortBy;
  SortCustomerFilter(this.sortBy);
}