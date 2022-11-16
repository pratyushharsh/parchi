import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../entity/pos/employee_entity.dart';
import '../../../model/api/create_store_employee_request.dart';
import '../../../repositories/employee_repository.dart';
import '../../authentication/bloc/authentication_bloc.dart';
import '../../create_edit_customer/customer_validator.dart';
import '../employee_input_validator.dart';

part 'create_edit_employee_event.dart';
part 'create_edit_employee_state.dart';

class CreateEditEmployeeBloc
    extends Bloc<CreateEditEmployeeEvent, CreateEditEmployeeState> {
  final EmployeeRepository employeeRepository;
  final AuthenticationBloc authenticationBloc;

  CreateEditEmployeeBloc(
      {required this.employeeRepository, required this.authenticationBloc})
      : super(CreateEditEmployeeState()) {
    on<OnLoadExistingEmployee>(_onLoadExistingEmployee);
    on<OnEmployeeFirstNameChanged>(_onEmployeeFirstNameChanged);
    on<OnEmployeeMiddleNameChanged>(_onEmployeeMiddleNameChanged);
    on<OnEmployeeLastNameChanged>(_onEmployeeLastNameChanged);
    on<OnEmployeePhoneChanged>(_onEmployeePhoneChanged);
    on<OnEmployeeEmailChanged>(_onEmployeeEmailChanged);
    on<OnEmployeeLocaleChanged>(_onEmployeeLocaleChanged);
    on<OnEmployeeProfileChanged>(_onEmployeeProfileChanged);
    on<OnCreateNewEmployee>(_onCreateNewEmployee);
    on<OnSaveEmployee>(_onSaveEmployee);
  }

  void _onLoadExistingEmployee(OnLoadExistingEmployee event,
      Emitter<CreateEditEmployeeState> emit) async {
    if (event.employee == null) {
      emit(state.copyWith(status: CreateEditEmployeeStatus.newUser));
      return;
    }
    emit(state.copyWith(status: CreateEditEmployeeStatus.loading));

    emit(state.copyWith(
        employeeId: event.employee!.employeeId,
        firstName: event.employee!.firstName,
        middleName: event.employee!.middleName,
        lastName: event.employee!.lastName,
        email: event.employee!.email,
        phone: event.employee!.phone,
        locale: event.employee!.locale,
        status: CreateEditEmployeeStatus.existingUser,
        newEmployee: false));
  }

  void _onEmployeeFirstNameChanged(
      OnEmployeeFirstNameChanged event, Emitter<CreateEditEmployeeState> emit) {
    emit(state.copyWith(
        firstName: event.firstName,
        status: CreateEditEmployeeStatus.modifying));
  }

  void _onEmployeeMiddleNameChanged(OnEmployeeMiddleNameChanged event,
      Emitter<CreateEditEmployeeState> emit) {
    emit(state.copyWith(
        middleName: event.middleName,
        status: CreateEditEmployeeStatus.modifying));
  }

  void _onEmployeeLastNameChanged(
      OnEmployeeLastNameChanged event, Emitter<CreateEditEmployeeState> emit) {
    emit(state.copyWith(
        lastName: event.lastName, status: CreateEditEmployeeStatus.modifying));
  }

  void _onEmployeePhoneChanged(
      OnEmployeePhoneChanged event, Emitter<CreateEditEmployeeState> emit) {
    emit(state.copyWith(
        phone: event.phone, status: CreateEditEmployeeStatus.modifying));
  }

  void _onEmployeeEmailChanged(
      OnEmployeeEmailChanged event, Emitter<CreateEditEmployeeState> emit) {
    emit(state.copyWith(
        email: event.email, status: CreateEditEmployeeStatus.modifying));
  }

  void _onEmployeeLocaleChanged(
      OnEmployeeLocaleChanged event, Emitter<CreateEditEmployeeState> emit) {
    emit(state.copyWith(
        locale: event.locale, status: CreateEditEmployeeStatus.modifying));
  }

  void _onEmployeeProfileChanged(
      OnEmployeeProfileChanged event, Emitter<CreateEditEmployeeState> emit) {
    emit(state.copyWith(
        profile: event.profile, status: CreateEditEmployeeStatus.modifying));
  }

  void _onCreateNewEmployee(
      OnCreateNewEmployee event, Emitter<CreateEditEmployeeState> emit) async {
    try {
      emit(state.copyWith(status: CreateEditEmployeeStatus.newUserCreating));

      // Build Phone number based on the aws cognito specification.
      // https://docs.aws.amazon.com/cognito/latest/developerguide/user-pool-settings-attributes.html
      final phone = '+${state.phone.replaceAll(RegExp(r'[^0-9]'),'')}';

      await employeeRepository.createNewEmployeeForStore(
          CreateStoreEmployeeRequest(
              firstName: state.firstName,
              lastName: state.lastName,
              businessId: authenticationBloc.state.store!.rtlLocId.toString(),
              phone: phone,
              createdUserId: authenticationBloc.state.employee!.phone,
              locale: state.locale));
      emit(state.copyWith(status: CreateEditEmployeeStatus.newUserCreated));
    } catch (e) {
      emit(state.copyWith(
          status: CreateEditEmployeeStatus.newUserCreationError,
          error: e.toString()));
    }
  }

  void _onSaveEmployee(
      OnSaveEmployee event, Emitter<CreateEditEmployeeState> emit) async {
    try {
      emit(state.copyWith(status: CreateEditEmployeeStatus.userUpdating));
      await employeeRepository.updateEmployee(
          UpdateEmployeeRequest(
            firstName: state.firstName,
            middleName: state.middleName,
            lastName: state.lastName,
            email: state.email,
            locale: state.locale,
          ),
          state.employeeId!);
      emit(state.copyWith(status: CreateEditEmployeeStatus.userUpdated));
    } catch (e) {
      emit(state.copyWith(
          status: CreateEditEmployeeStatus.userUpdateError,
          error: e.toString()));
    }
  }
}
