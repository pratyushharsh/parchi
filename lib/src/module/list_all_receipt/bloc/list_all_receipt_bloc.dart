
import 'package:bloc/bloc.dart';
import 'package:isar/isar.dart';
import 'package:logging/logging.dart';
import 'package:meta/meta.dart';


import '../../../database/db_provider.dart';
import '../../../entity/pos/entity.dart';

part 'list_all_receipt_event.dart';
part 'list_all_receipt_state.dart';

class ListAllReceiptBloc extends Bloc<ListAllReceiptEvent, ListAllReceiptState> with DatabaseProvider {

  final log = Logger('ListAllReceiptBloc');

  ListAllReceiptBloc() : super(ListAllReceiptState()) {
    on<LoadAllReceipt>(_onLoadAllReceipt);
  }

  void _onLoadAllReceipt(LoadAllReceipt event, Emitter<ListAllReceiptState> emit) async {
    try {
      emit(state.copyWith(status: ListAllReceiptStatus.loading));
      var receipts = await db.transactionHeaderEntitys.where().sortByBeginDatetimeDesc().findAll();
      emit(state.copyWith(receipts: receipts, status: ListAllReceiptStatus.success));
    } catch (e) {
      log.severe(e);
      emit(state.copyWith(status: ListAllReceiptStatus.failure));
    }
  }
}
