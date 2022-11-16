part of 'customer_search_bloc.dart';

enum CustomerSearchStateStatus { initial, loading, success, failure, searching, complete }

class CustomerSearchState extends Equatable {
  final List<ContactEntity> customerSuggestion;
  final List<ContactEntity> phoneBookSuggestion;
  final CustomerSearchStateStatus status;

  const CustomerSearchState(
      {this.customerSuggestion = const [],
      this.phoneBookSuggestion = const [],
      this.status = CustomerSearchStateStatus.initial});

  @override
  List<Object?> get props => [customerSuggestion, phoneBookSuggestion];

  CustomerSearchState copyWith({
    List<ContactEntity>? customerSuggestion,
    List<ContactEntity>? phoneBookSuggestion,
    CustomerSearchStateStatus? status,
  }) {
    return CustomerSearchState(
      customerSuggestion: customerSuggestion ?? this.customerSuggestion,
      phoneBookSuggestion: phoneBookSuggestion ?? this.phoneBookSuggestion,
      status: status ?? this.status,
    );
  }
}
