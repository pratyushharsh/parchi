import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../repositories/bulk_repositoty.dart';

part 'bulk_import_event.dart';
part 'bulk_import_state.dart';

class BulkImportBloc extends Bloc<BulkImportEvent, BulkImportState> {
  final BulkImportRepository bulkImportRepository;

  BulkImportBloc({
    required this.bulkImportRepository,
  }) : super(const BulkImportState()) {
    on<BulkTaxImportEventImport>(_onImportTaxData);
  }

  Future<void> _onImportTaxData(
    BulkTaxImportEventImport event,
    Emitter<BulkImportState> emit,
  ) async {
    emit(state.copyWith(status: BulkImportStatus.loading));
    try {
      await bulkImportRepository.importTaxData(event.filePath);
      emit(state.copyWith(status: BulkImportStatus.success));
    } catch (e) {
      emit(state.copyWith(status: BulkImportStatus.failure, message: e.toString()));
    }
  }
}
