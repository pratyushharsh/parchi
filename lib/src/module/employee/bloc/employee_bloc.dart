import 'package:bloc/bloc.dart';
import 'package:logging/logging.dart';
import 'package:meta/meta.dart';

import '../../../model/api/get_employee_response.dart';
import '../../../repositories/employee_repository.dart';

part 'employee_event.dart';
part 'employee_state.dart';

class EmployeeBloc extends Bloc<EmployeeEvent, EmployeeState> {

  final log = Logger('EmployeeBloc');
  final EmployeeRepository employeeRepository;
  final String storeId;

  EmployeeBloc({ required this.employeeRepository, required this.storeId }) : super(EmployeeState()) {
    on<FetchAllEmployeeEvent>(_onFetchAllEmployeeEvent);
  }

  void _onFetchAllEmployeeEvent(FetchAllEmployeeEvent event, Emitter<EmployeeState> emit) async {
    emit(state.copyWith(status: EmployeeListStatus.loading));
    try {
      var data = await employeeRepository.getEmployeeByStoreId(storeId);
      emit(state.copyWith(employees: data, status: EmployeeListStatus.loaded));
    } catch (e) {
      log.severe(e);
      emit(state.copyWith(status: EmployeeListStatus.error));
    }
  }
}
