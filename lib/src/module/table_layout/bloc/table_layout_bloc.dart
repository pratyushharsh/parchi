import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../entity/pos/table_entity.dart';
import '../../../repositories/table_repository.dart';

part 'table_layout_event.dart';
part 'table_layout_state.dart';

class TableLayoutBloc extends Bloc<TableLayoutEvent, TableLayoutState> {
  final TableRepository tableRepository;
  TableLayoutBloc({ required this.tableRepository }) : super(TableLayoutState()) {
    on<FetchAllTables>(_onFetchAllTables);
  }

  void _onFetchAllTables(FetchAllTables event, Emitter<TableLayoutState> emit) async {
    final tables = await tableRepository.getAllTables();
    emit(state.copyWith(tables: tables));
  }



}
