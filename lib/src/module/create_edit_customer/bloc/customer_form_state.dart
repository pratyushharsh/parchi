part of 'customer_form_bloc.dart';

enum CustomerFormStatus {
  initial,
  loadedExistingCustomer,
  loadingExistingCustomerSuccess,
  newCustomer,
  loading,
  loaded,
  error,
}

class CustomerFormState {
  final int? id;
  final String? contactId;
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? phoneNumber;
  final Address? billingAddress;
  final Address? shippingAddress;
  final String? panCard;
  final String? gstin;
  final bool sameAddress;
  final CustomerFormStatus status;

  CustomerFormState(
      {this.id,
      this.contactId,
      this.firstName,
      this.lastName,
      this.email,
      this.phoneNumber,
      this.billingAddress,
      this.shippingAddress,
      this.panCard,
      this.status = CustomerFormStatus.initial,
      this.sameAddress = true,
      this.gstin});

  CustomerFormState copyWith(
      {int? id,
      String? contactId,
      String? firstName,
      String? lastName,
      String? email,
      String? phoneNumber,
      Address? billingAddress,
      Address? shippingAddress,
      String? panCard,
      String? gstin,
      CustomerFormStatus? status,
      bool? sameAddress}) {
    return CustomerFormState(
        id: id ?? this.id,
        contactId: contactId ?? this.contactId,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        email: email ?? this.email,
        phoneNumber: phoneNumber ?? this.phoneNumber,
        billingAddress: billingAddress ?? this.billingAddress,
        shippingAddress: shippingAddress ?? this.shippingAddress,
        panCard: panCard ?? this.panCard,
        gstin: gstin ?? this.gstin,
        status: status ?? this.status,
        sameAddress: sameAddress ?? this.sameAddress);
  }
}
