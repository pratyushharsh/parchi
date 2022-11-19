import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:logging/logging.dart';


import '../../../config/transaction_config.dart';
import '../../../entity/pos/entity.dart';
import '../../../model/hsn_tax_summary.dart';
import '../../../model/model.dart';
import '../../../repositories/repository.dart';
import '../../authentication/bloc/authentication_bloc.dart';

part 'receipt_display_event.dart';
part 'receipt_display_state.dart';

class ReceiptDisplayBloc
    extends Bloc<ReceiptDisplayEvent, ReceiptDisplayState> {
  final log = Logger('ReceiptDisplayBloc');
  final int transId;
  final SettingsRepository settingsRepo;
  final AuthenticationBloc authBloc;
  final TransactionRepository transactionRepo;

  ReceiptDisplayBloc(
      {required this.transId,
      required this.settingsRepo,
      required this.authBloc, required this.transactionRepo})
      : super(ReceiptDisplayState(taxSummary: List.empty())) {
    on<FetchReceiptDataEvent>(_onFetchReceiptData);
    on<UpdateReceiptStatusEvent>(_onUpdateReceiptStatusEvent);
    on<UpdateGlobalKey>(_onUpdateGlobalKeys);
    on<MockUpdateReceiptSettingData>(_onMockUpdateReceiptSettingData);
  }

  void _onFetchReceiptData(
      ReceiptDisplayEvent event, Emitter<ReceiptDisplayState> emit) async {
    try {
      ReceiptSettingsModel recSetting = await settingsRepo.getReceiptSettings();
      emit(
        state.copyWith(
            status: ReceiptDisplayStatus.loading, receiptSettings: recSetting),
      );

      TransactionHeaderEntity? transaction =
          await transactionRepo.getTransaction(transId);

      // build tax detail
      // HashMap<String, List<TransactionLineItemEntity>> hsnCategory = HashMap();
      // for (TransactionLineItemEntity li in transaction.lineItems.toList()) {
      //   if (li.hsn == null) continue;
      //   hsnCategory.putIfAbsent(li.hsn!, () => List.empty(growable: true));
      //   hsnCategory[li.hsn!]?.add(li);
      // }

      // var taxDetail = hsnCategory.entries
      //     .map((e) => HsnTaxSummary(
      //         hsn: e.key,
      //         amount: e.value.fold(0.0,
      //             (previousValue, element) => previousValue + element.amount),
      //         cgstRate: e.value.first.taxRate / 2,
      //         cgstAmount: (e.value.fold<double>(
      //                 0.0,
      //                 (previousValue, element) =>
      //                     previousValue + element.taxAmount)) /
      //             2,
      //         sgstRate: e.value.first.taxRate / 2,
      //         sgstAmont: e.value.fold<double>(
      //                 0.0,
      //                 (previousValue, element) =>
      //                     previousValue + element.taxAmount) /
      //             2,
      //         taxTotal: e.value.fold(
      //             0.0,
      //             (previousValue, element) =>
      //                 previousValue + element.taxAmount)))
      //     .toList(growable: false);

      emit(state.copyWith(
          header: transaction,
          lineItems: transaction!.lineItems.toList(),
          status: ReceiptDisplayStatus.success,
          taxSummary: []));
    } catch (e, s) {
      log.severe(s);
      emit(state.copyWith(status: ReceiptDisplayStatus.failure));
    }
  }

  void _onUpdateReceiptStatusEvent(
      UpdateReceiptStatusEvent event, Emitter<ReceiptDisplayState> emit) async {
    try {
      // @TODO
      // var data = await db.transactionDao
      //     .updateTransactionStatus(transId, event.status);
      // if (data) {
      //   add(FetchReceiptDataEvent());
      // }
    } catch (e) {
      log.severe(e);
    }
  }

  void _onUpdateGlobalKeys(
      UpdateGlobalKey event, Emitter<ReceiptDisplayState> emit) async {
    emit(state.copyWith(globalKeys: event.globalKey));
  }

  void _onMockUpdateReceiptSettingData(
      MockUpdateReceiptSettingData event, Emitter<ReceiptDisplayState> emit) async {
    emit(state.copyWith(receiptSettings: event.receiptSettingData));
  }
}
