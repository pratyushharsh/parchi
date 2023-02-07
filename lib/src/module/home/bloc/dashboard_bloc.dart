import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'dashboard_event.dart';
part 'dashboard_state.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  DashboardBloc() : super(DashboardState(index: 2)) {
    on<DashboardChangeTabEvent>(_onDashboardChangeTabEvent);
  }

  void _onDashboardChangeTabEvent(DashboardChangeTabEvent event, Emitter<DashboardState> emit) {
    emit(state.copyWith(index: event.index));
  }
}
