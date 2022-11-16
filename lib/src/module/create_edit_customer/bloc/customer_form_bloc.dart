import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../entity/pos/contact_entity.dart';
import '../../../entity/pos/address.dart';

part 'customer_form_event.dart';
part 'customer_form_state.dart';

class CustomerFormBloc extends Bloc<CustomerFormEvent, CustomerFormState> {
  CustomerFormBloc() : super(CustomerFormState()) {
    on<OnCustomerFirstNameChange>(_onCustomerFirstNameChange);
    on<OnCustomerLastNameChange>(_onCustomerLastNameChange);
    on<OnCustomerEmailChange>(_onCustomerEmailChange);
    on<OnCustomerPhoneNumberChange>(_onCustomerPhoneNumberChange);
    on<OnCustomerBillingAddressChange>(_onCustomerBillingAddressChange);
    on<OnCustomerShippingAddressChange>(_onCustomerShippingAddressChange);
    on<OnCustomerPanCardChange>(_onCustomerPanCardChange);
    on<OnCustomerGstinChange>(_onCustomerGstinChange);
    on<OnBillingAddressSameAsShippingAddress>(
        _onBillingAddressSameAsShippingAddress);
    on<LoadCustomer>(_onLoadCustomer);
    on<NewCustomer>(_onNewCustomer);
  }

  void _onNewCustomer(
      NewCustomer event, Emitter<CustomerFormState> emit) {
    emit(state.copyWith(status: CustomerFormStatus.newCustomer));
  }

  void _onLoadCustomer(LoadCustomer event, Emitter<CustomerFormState> emit) {
    emit(state.copyWith(status: CustomerFormStatus.loadedExistingCustomer));
    emit(state.copyWith(
      id: event.contactEntity.id,
      contactId: event.contactEntity.contactId,
      firstName: event.contactEntity.firstName,
      lastName: event.contactEntity.lastName,
      email: event.contactEntity.email,
      phoneNumber: event.contactEntity.phoneNumber,
      billingAddress: event.contactEntity.billingAddress,
      shippingAddress: event.contactEntity.shippingAddress,
      panCard: event.contactEntity.panCard,
      gstin: event.contactEntity.gstin,
      status: CustomerFormStatus.loadingExistingCustomerSuccess,
      sameAddress: event.contactEntity.billingAddress ==
          event.contactEntity.shippingAddress,
    ));
  }

  void _onCustomerFirstNameChange(
      OnCustomerFirstNameChange event, Emitter<CustomerFormState> emit) async {
    emit(state.copyWith(firstName: event.firstName));
  }

  void _onCustomerLastNameChange(
      OnCustomerLastNameChange event, Emitter<CustomerFormState> emit) async {
    emit(state.copyWith(lastName: event.lastName));
  }

  void _onCustomerEmailChange(
      OnCustomerEmailChange event, Emitter<CustomerFormState> emit) async {
    emit(state.copyWith(email: event.email));
  }

  void _onCustomerPhoneNumberChange(OnCustomerPhoneNumberChange event,
      Emitter<CustomerFormState> emit) async {
    emit(state.copyWith(phoneNumber: event.phoneNumber));
  }

  void _onCustomerBillingAddressChange(OnCustomerBillingAddressChange event,
      Emitter<CustomerFormState> emit) async {
    emit(state.copyWith(billingAddress: event.billingAddress));
  }

  void _onCustomerShippingAddressChange(OnCustomerShippingAddressChange event,
      Emitter<CustomerFormState> emit) async {
    emit(state.copyWith(shippingAddress: event.shippingAddress));
  }

  void _onCustomerPanCardChange(
      OnCustomerPanCardChange event, Emitter<CustomerFormState> emit) async {
    emit(state.copyWith(panCard: event.panCard));
  }

  void _onCustomerGstinChange(
      OnCustomerGstinChange event, Emitter<CustomerFormState> emit) async {
    emit(state.copyWith(gstin: event.gstin));
  }

  void _onBillingAddressSameAsShippingAddress(
      OnBillingAddressSameAsShippingAddress event,
      Emitter<CustomerFormState> emit) async {
    emit(state.copyWith(sameAddress: event.sameAddress));
  }
}
