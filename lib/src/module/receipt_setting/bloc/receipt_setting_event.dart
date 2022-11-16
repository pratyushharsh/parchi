part of 'receipt_setting_bloc.dart';

@immutable
abstract class ReceiptSettingEvent {}

class OnStoreNumberChange extends ReceiptSettingEvent {
  final String value;

  OnStoreNumberChange({ required this.value });
}

class OnTaglineChange extends ReceiptSettingEvent {
  final String value;

  OnTaglineChange({ required this.value });
}

class OnStoreAddressChange extends ReceiptSettingEvent {
  final String value;

  OnStoreAddressChange({ required this.value });
}

class OnStoreFooterTitleChange extends ReceiptSettingEvent {
  final String value;

  OnStoreFooterTitleChange({ required this.value });
}

class OnStoreFooterSubTitleChange extends ReceiptSettingEvent {
  final String value;

  OnStoreFooterSubTitleChange({ required this.value });
}

class OnSaveReceiptEvent extends ReceiptSettingEvent {
}

class OnInitReceiptSettingEvent extends ReceiptSettingEvent {}