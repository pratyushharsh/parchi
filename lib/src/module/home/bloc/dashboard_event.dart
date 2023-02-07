part of 'dashboard_bloc.dart';

@immutable
abstract class DashboardEvent {}

class DashboardInitialEvent extends DashboardEvent {}

class DashboardChangeTabEvent extends DashboardEvent {
  final int index;

  DashboardChangeTabEvent({required this.index});
}