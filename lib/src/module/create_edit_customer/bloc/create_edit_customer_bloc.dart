import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:isar/isar.dart';
import 'package:logging/logging.dart';
import 'package:meta/meta.dart';

import '../../../entity/pos/entity.dart';
import '../../../database/db_provider.dart';
import '../../../repositories/repository.dart';

part 'create_edit_customer_event.dart';
part 'create_edit_customer_state.dart';

class CreateEditCustomerBloc
    extends Bloc<CreateCustomerEvent, CreateEditCustomerState> with DatabaseProvider {
  final log = Logger('CreateEditCustomerBloc');
  final SequenceRepository sequenceRepository;
  final CustomerRepository customerRepository;
  final bool editMode;
  final String? customerId;

  CreateEditCustomerBloc(
      {
      required this.sequenceRepository,
      required this.customerRepository,
      this.editMode = false,
      this.customerId})
      : assert(editMode ? customerId != null : true),
        super(CreateEditCustomerState(
            mode: editMode
                ? CustomerDisplayMode.edit
                : CustomerDisplayMode.create)) {
    on<OnCreateCustomer>(_onAddNewCustomer);
    on<OnEditCustomer>(_onEditCustomer);
  }

  void _onAddNewCustomer(
      OnCreateCustomer event, Emitter<CreateEditCustomerState> emit) async {
    try {
      emit(state.copyWith(status: CreateEditCustomerStatus.addingCustomer));

      var contactId = event.customer.contactId;
      if (event.customer.contactId == 'Dummy') {
        int cid =
            (await sequenceRepository.getNextSequence(SequenceType.customer))
                .nextSeq;
        contactId = 'C$cid';
      }


      ContactEntity ce = ContactEntity(
        contactId: contactId,
        firstName: event.customer.firstName,
        email: event.customer.email,
        phoneNumber: event.customer.phoneNumber,
        billingAddress: event.customer.billingAddress,
        shippingAddress: event.customer.shippingAddress,
        gstin: event.customer.gstin,
        panCard: event.customer.panCard,
        storeId: '',
        createTime: DateTime.now(),
        lastName: event.customer.lastName,
      );
      await customerRepository.createOrUpdateCustomer(ce);
      emit(state.copyWith(status: CreateEditCustomerStatus.addingSuccess));
    } catch (e) {
      log.severe(e);
      emit(state.copyWith(status: CreateEditCustomerStatus.addingFailure));
    }
  }

  void _onEditCustomer(
      OnEditCustomer event, Emitter<CreateEditCustomerState> emit) async {
    if (customerId == null) {
      emit(state.copyWith(status: CreateEditCustomerStatus.newCustomer));
      return;
    }

    try {
      emit(state.copyWith(
          status: CreateEditCustomerStatus.loadedExistingCustomer));
      ContactEntity? ce = await customerRepository.getCustomerById(customerId!);
      List<TransactionHeaderEntity> purchaseHistory =
          await customerRepository.getPurchaseListByCustomerId(customerId!);
      emit(state.copyWith(
          status: CreateEditCustomerStatus.loadedExistingCustomer,
          customer: ce,
          purchaseHistory: purchaseHistory));
    } catch (e) {
      log.severe(e);
      emit(state.copyWith(status: CreateEditCustomerStatus.addingFailure));
    }
  }
}
