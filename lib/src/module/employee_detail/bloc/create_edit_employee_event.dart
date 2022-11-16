part of 'create_edit_employee_bloc.dart';

@immutable
abstract class CreateEditEmployeeEvent {}

class LoadExistingUser extends CreateEditEmployeeEvent {}

class OnLoadExistingEmployee extends CreateEditEmployeeEvent {
  final EmployeeEntity? employee;

  OnLoadExistingEmployee(this.employee);
}

class OnEmployeeFirstNameChanged extends CreateEditEmployeeEvent {
  final String firstName;

  OnEmployeeFirstNameChanged(this.firstName);
}

class OnEmployeeMiddleNameChanged extends CreateEditEmployeeEvent {
  final String middleName;

  OnEmployeeMiddleNameChanged(this.middleName);
}

class OnEmployeeLastNameChanged extends CreateEditEmployeeEvent {
  final String lastName;

  OnEmployeeLastNameChanged(this.lastName);
}

class OnEmployeePhoneChanged extends CreateEditEmployeeEvent {
  final String phone;

  OnEmployeePhoneChanged(this.phone);
}

class OnEmployeeEmailChanged extends CreateEditEmployeeEvent {
  final String email;

  OnEmployeeEmailChanged(this.email);
}

class OnEmployeeLocaleChanged extends CreateEditEmployeeEvent {
  final String locale;

  OnEmployeeLocaleChanged(this.locale);
}

class OnEmployeeProfileChanged extends CreateEditEmployeeEvent {
  final String profile;

  OnEmployeeProfileChanged(this.profile);
}

class OnCreateNewEmployee extends CreateEditEmployeeEvent {}

class OnSaveEmployee extends CreateEditEmployeeEvent {}