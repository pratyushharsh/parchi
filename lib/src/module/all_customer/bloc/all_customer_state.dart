part of 'all_customer_bloc.dart';

enum AllCustomerStatus { initial, loading, success, failure }

class AllCustomerState {
  final AllCustomerStatus status;
  final List<ContactEntity> customers;

  AllCustomerState(
      {this.status = AllCustomerStatus.initial, this.customers = const []});

  AllCustomerState copyWith(
      {AllCustomerStatus? status, List<ContactEntity>? customers}) {
    return AllCustomerState(
        status: status ?? this.status, customers: customers ?? this.customers);
  }
}
