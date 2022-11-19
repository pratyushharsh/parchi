part of 'all_customer_bloc.dart';

enum AllCustomerStatus { initial, loading, loadingNext, success, failure }

class AllCustomerState {
  final AllCustomerStatus status;
  final List<ContactEntity> customers;
  final CustomerSearchFilter filter;

  AllCustomerState(
      {this.status = AllCustomerStatus.initial,
      this.customers = const [],
      this.filter = const CustomerSearchFilter()});

  AllCustomerState copyWith(
      {AllCustomerStatus? status,
      List<ContactEntity>? customers,
      CustomerSearchFilter? filter}) {
    return AllCustomerState(
        status: status ?? this.status,
        customers: customers ?? this.customers,
        filter: filter ?? this.filter);
  }
}

enum CustomerFilterSortBy {
  name("Name (A-Z)"),
  nameDesc("Name (Z-A)"),
  date("Date (Newest)"),
  dateDesc("Date (Oldest)");

  final String value;
  const CustomerFilterSortBy(this.value);
}

class CustomerSearchFilter {
  final String searchQuery;
  final CustomerFilterSortBy sortBy;
  final int limit;
  final int offset;

  const CustomerSearchFilter(
      {this.searchQuery = "", this.sortBy = CustomerFilterSortBy.dateDesc, this.limit = 20, this.offset = 0});

  CustomerSearchFilter copyWith(
      {String? searchQuery, CustomerFilterSortBy? sortBy, int? limit, int? offset}) {
    return CustomerSearchFilter(
        searchQuery: searchQuery ?? this.searchQuery,
        sortBy: sortBy ?? this.sortBy,
        limit: limit ?? this.limit,
        offset: offset ?? this.offset);
  }
}
