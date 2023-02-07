part of 'dashboard_bloc.dart';

class DashboardState {
  final int index;

  DashboardState({required this.index});

  DashboardState copyWith({int? index}) {
    return DashboardState(index: index ?? this.index);
  }
}
