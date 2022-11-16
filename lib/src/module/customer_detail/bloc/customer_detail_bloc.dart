import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:logging/logging.dart';
import 'package:meta/meta.dart';

import '../../../entity/pos/entity.dart';
import '../../../repositories/customer_repository.dart';

part 'customer_detail_event.dart';
part 'customer_detail_state.dart';

class CustomerDetailBloc extends Bloc<CustomerDetailEvent, CustomerDetailState> {
  final log = Logger('CreateNewReceiptBloc');
  final String customerId;
  final CustomerRepository customerRepository;
  CustomerDetailBloc({required this.customerId, required this.customerRepository }) : super(const CustomerDetailState()) {
    on<LoadCustomerPurchaseList>(_onLoadCustomerPurchaseListEvent);
  }

  void _onLoadCustomerPurchaseListEvent(LoadCustomerPurchaseList event,
      Emitter<CustomerDetailState> emit) async {
    emit(state.copyWith(purchaseHistoryStatus: CustomerPurchaseHistoryStatus.loading));
    try {
      List<TransactionHeaderEntity> data = await customerRepository.getPurchaseListByCustomerId(customerId);
      emit(state.copyWith(purchaseHistoryStatus: CustomerPurchaseHistoryStatus.success, purchaseHistory: data));
    } catch (e) {
      log.severe(e);
      emit(state.copyWith(purchaseHistoryStatus: CustomerPurchaseHistoryStatus.failure));
    }
  }
}
