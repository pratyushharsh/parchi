part of 'create_edit_customer_bloc.dart';

enum CreateEditCustomerStatus {
  initial,
  loading,
  loadingExistingCustomer,
  loadedExistingCustomer,
  newCustomer,
  addingCustomer,
  addingSuccess,
  addingFailure
}

enum CustomerDisplayMode { edit, create }

class CreateEditCustomerState extends Equatable {
  final CreateEditCustomerStatus status;
  final CustomerDisplayMode mode;
  final ContactEntity? customer;
  final List<TransactionHeaderEntity> purchaseHistory;

  const CreateEditCustomerState(
      {this.status = CreateEditCustomerStatus.initial, required this.mode, this.customer, this.purchaseHistory = const []});

  CreateEditCustomerState copyWith({
    CreateEditCustomerStatus? status,
    CustomerDisplayMode? mode,
    ContactEntity? customer,
    List<TransactionHeaderEntity>? purchaseHistory,
  }) {
    return CreateEditCustomerState(
      status: status ?? this.status,
      mode: mode ?? this.mode,
      customer: customer ?? this.customer,
      purchaseHistory: purchaseHistory ?? this.purchaseHistory,
    );
  }

  @override
  List<Object?> get props => [status, mode, customer, purchaseHistory];
}
