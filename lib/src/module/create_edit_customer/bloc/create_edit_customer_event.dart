part of 'create_edit_customer_bloc.dart';

@immutable
abstract class CreateCustomerEvent {}

class OnCreateCustomer extends CreateCustomerEvent {
  final ContactEntity customer;

  OnCreateCustomer({ required this.customer });
}

class OnEditCustomer extends CreateCustomerEvent{}