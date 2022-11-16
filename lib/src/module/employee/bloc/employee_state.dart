part of 'employee_bloc.dart';

enum EmployeeListStatus {
  initial,
  loading,
  loaded,
  error,
}

class EmployeeState {
  final List<StoreEmployee> employees;
  final EmployeeListStatus status;

  EmployeeState({
    this.employees = const [],
    this.status = EmployeeListStatus.initial,
  });

  EmployeeState copyWith({
    List<StoreEmployee>? employees,
    EmployeeListStatus? status,
  }) {
    return EmployeeState(
      employees: employees ?? this.employees,
      status: status ?? this.status,
    );
  }
}
