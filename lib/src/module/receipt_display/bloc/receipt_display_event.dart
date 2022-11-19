part of 'receipt_display_bloc.dart';

@immutable
abstract class ReceiptDisplayEvent {}

class FetchReceiptDataEvent extends ReceiptDisplayEvent{}

class UpdateReceiptStatusEvent extends ReceiptDisplayEvent{
  final TransactionStatus status;
  UpdateReceiptStatusEvent(this.status);
}

class UpdateGlobalKey extends ReceiptDisplayEvent {
  final List<GlobalKey> globalKey;

  UpdateGlobalKey(this.globalKey);
}

class MockUpdateReceiptSettingData extends ReceiptDisplayEvent {
  final ReceiptSettingsModel receiptSettingData;

  MockUpdateReceiptSettingData(this.receiptSettingData);
}