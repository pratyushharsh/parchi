part of 'employee_bloc.dart';

@immutable
abstract class EmployeeEvent {}

class FetchAllEmployeeEvent extends EmployeeEvent {}