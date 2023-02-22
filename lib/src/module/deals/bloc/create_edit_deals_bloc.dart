import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'create_edit_deals_event.dart';
part 'create_edit_deals_state.dart';

class CreateEditDealsBloc extends Bloc<CreateEditDealsEvent, CreateEditDealsState> {
  CreateEditDealsBloc() : super(CreateEditDealsInitial()) {
    on<CreateEditDealsEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
