
import 'package:bloc/bloc.dart';
import 'package:isar/isar.dart';
import 'package:logging/logging.dart';
import 'package:meta/meta.dart';

import '../../../database/db_provider.dart';
import '../../../entity/pos/contact_entity.dart';
import '../../../repositories/customer_repository.dart';

part 'all_customer_event.dart';
part 'all_customer_state.dart';

class AllCustomerBloc extends Bloc<AllCustomerEvent, AllCustomerState> {

  final log = Logger('AllCustomerBloc');

  CustomerRepository customerRepository;

  AllCustomerBloc({ required this.customerRepository }) : super(AllCustomerState()) {
    on<InitCustomerSearch>(_onInitCustomerSearch);
    on<LoadAllCustomer>(_onLoadCustomers);
    on<LoadNextCustomer>(_onLoadNextCustomers);
    on<SearchCustomerFilter>(_onSearchCustomerFilter);
    on<SortCustomerFilter>(_onSortCustomerFilter);
  }

  void _onInitCustomerSearch(InitCustomerSearch event, Emitter<AllCustomerState> emit) {
    add(LoadAllCustomer());
  }

  void _onLoadCustomers(LoadAllCustomer event, Emitter<AllCustomerState> emit) async {
    try {
      emit(state.copyWith(status: AllCustomerStatus.loading));
      var customers = await customerRepository.searchCustomer(state.filter);
      emit(state.copyWith(customers: customers, status: AllCustomerStatus.success));
    } catch (e) {
      log.severe(e);
      emit(state.copyWith(status: AllCustomerStatus.failure));
    }
  }

  void _onLoadNextCustomers(LoadNextCustomer event, Emitter<AllCustomerState> emit) async {
    var offset = state.filter.offset + state.customers.length;
    emit(state.copyWith(
        status: AllCustomerStatus.loadingNext,
        filter: state.filter.copyWith(offset: offset)));
    try {
      var newCustomers = await customerRepository.searchCustomer(state.filter);
      emit(state.copyWith(
          customers: state.customers + newCustomers,
          status: AllCustomerStatus.success));
    } catch (e) {
      log.severe(e);
      emit(state.copyWith(status: AllCustomerStatus.failure));
    }
  }

  void _onSearchCustomerFilter(SearchCustomerFilter event, Emitter<AllCustomerState> emit) async {
    emit(state.copyWith(filter: state.filter.copyWith(searchQuery: event.searchQuery, offset: 0)));
    add(LoadAllCustomer());
  }

  void _onSortCustomerFilter(SortCustomerFilter event, Emitter<AllCustomerState> emit) async {
    emit(state.copyWith(filter: state.filter.copyWith(sortBy: event.sortBy, offset: 0)));
    add(LoadAllCustomer());
  }
}
