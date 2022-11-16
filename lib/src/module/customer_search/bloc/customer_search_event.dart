part of 'customer_search_bloc.dart';

abstract class CustomerSearchEvent {
  const CustomerSearchEvent();
}

class OnCustomerNameChange extends CustomerSearchEvent {
  final String? name;
  OnCustomerNameChange({this.name});
}

class OnSearchComplete extends CustomerSearchEvent {}