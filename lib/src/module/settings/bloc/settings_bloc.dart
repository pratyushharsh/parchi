
import 'package:bloc/bloc.dart';
import 'package:logging/logging.dart';
import 'package:meta/meta.dart';

import '../../../model/api/api.dart';
import '../../../repositories/employee_repository.dart';
import '../../authentication/bloc/authentication_bloc.dart';

part 'settings_event.dart';
part 'settings_state.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {

  final Logger log = Logger('SettingsBloc');
  final EmployeeRepository employeeRepository;
  final AuthenticationBloc authenticationBloc;

  SettingsBloc({required this.employeeRepository, required this.authenticationBloc}) : super(const SettingsState()) {
    on<FetchUserBusiness>(_onFetchUserBusiness);
  }

  void _onFetchUserBusiness(FetchUserBusiness event, Emitter<SettingsState> emit) async {
    emit(state.copyWith(status: SettingsStatus.loadingBusiness, business: []));
    try {
      final business = await employeeRepository.getBusinessAssociatedWithUser(authenticationBloc.state.user!.username!);
      emit(state.copyWith(status: SettingsStatus.loadingBusinessSuccess, business: business));
    } catch (e) {
      log.severe(e);
      emit(state.copyWith(status: SettingsStatus.loadingBusinessFailure, error: e.toString()));
    }
  }
}
