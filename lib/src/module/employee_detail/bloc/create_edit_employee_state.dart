part of 'create_edit_employee_bloc.dart';

enum CreateEditEmployeeStatus {
  initial,
  loading,
  modifying,
  existingUser,
  newUser,
  success,
  newUserCreating,
  newUserCreated,
  newUserCreationError,
  userUpdating,
  userUpdated,
  userUpdateError,
}

class CreateEditEmployeeState {
  final String? employeeId;
  final String firstName;
  final String middleName;
  final String lastName;
  final String phone;
  final String email;
  final String locale;
  final String profile;
  final String? error;
  final bool newEmployee;
  final CreateEditEmployeeStatus status;

  bool get isValid {
    if (NewEmployeeFieldValidator.validateEmployeeEmail(email) != null) {
      return false;
    }

    if (NewEmployeeFieldValidator.validatePhone(phone) != null) {
      return false;
    }

    if (NewPartyFieldValidator.validatePartyName(firstName) != null) {
      return false;
    }

    if (NewPartyFieldValidator.validatePartyName(lastName) != null) {
      return false;
    }
    return true;
  }

  CreateEditEmployeeState(
      {this.employeeId,
      this.firstName = '',
      this.middleName = '',
      this.lastName = '',
      this.phone = '',
      this.email = '',
      this.locale = '',
      this.profile = '',
      this.error,
      this.newEmployee = true,
      this.status = CreateEditEmployeeStatus.initial});

  CreateEditEmployeeState copyWith(
      {String? employeeId,
      String? firstName,
      String? middleName,
      String? lastName,
      String? phone,
      String? email,
      String? locale,
      String? profile,
      String? error,
      bool? newEmployee,
      CreateEditEmployeeStatus? status}) {
    return CreateEditEmployeeState(
        employeeId: employeeId ?? this.employeeId,
        firstName: firstName ?? this.firstName,
        middleName: middleName ?? this.middleName,
        lastName: lastName ?? this.lastName,
        phone: phone ?? this.phone,
        email: email ?? this.email,
        locale: locale ?? this.locale,
        profile: profile ?? this.profile,
        error: error ?? this.error,
        newEmployee: newEmployee ?? this.newEmployee,
        status: status ?? this.status);
  }
}
