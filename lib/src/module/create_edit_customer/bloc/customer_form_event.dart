part of 'customer_form_bloc.dart';

@immutable
abstract class CustomerFormEvent {}

class NewCustomer extends CustomerFormEvent {}

class LoadCustomer extends CustomerFormEvent {
  final ContactEntity contactEntity;
  LoadCustomer(this.contactEntity);
}

class OnCustomerFirstNameChange extends CustomerFormEvent {
  final String firstName;

  OnCustomerFirstNameChange({ required this.firstName });
}

class OnCustomerLastNameChange extends CustomerFormEvent {
  final String lastName;

  OnCustomerLastNameChange({ required this.lastName });
}

class OnCustomerEmailChange extends CustomerFormEvent {
  final String email;

  OnCustomerEmailChange({ required this.email });
}

class OnCustomerPhoneNumberChange extends CustomerFormEvent {
  final String phoneNumber;

  OnCustomerPhoneNumberChange({ required this.phoneNumber });
}

class OnCustomerBillingAddressChange extends CustomerFormEvent {
  final Address billingAddress;

  OnCustomerBillingAddressChange({ required this.billingAddress });
}

class OnCustomerShippingAddressChange extends CustomerFormEvent {
  final Address shippingAddress;

  OnCustomerShippingAddressChange({ required this.shippingAddress });
}

class OnCustomerPanCardChange extends CustomerFormEvent {
  final String panCard;

  OnCustomerPanCardChange({ required this.panCard });
}

class OnCustomerGstinChange extends CustomerFormEvent {
  final String gstin;

  OnCustomerGstinChange({ required this.gstin });
}

class OnBillingAddressSameAsShippingAddress extends CustomerFormEvent {
  final bool sameAddress;

  OnBillingAddressSameAsShippingAddress({ required this.sameAddress });
}