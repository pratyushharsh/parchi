part of 'receipt_display_bloc.dart';

enum ReceiptDisplayStatus { initial, loading, success, failure }

class ReceiptDisplayState extends Equatable {
  final ReceiptDisplayStatus status;
  final TransactionHeaderEntity? header;
  final ReceiptSettingsModel? receiptSettings;
  final List<TransactionLineItemEntity>? lineItems;
  final List<HsnTaxSummary> taxSummary;
  final List<GlobalKey> globalKeys;

  const ReceiptDisplayState(
      {this.status = ReceiptDisplayStatus.initial,
      this.header,
      this.lineItems,
      this.receiptSettings,
      this.globalKeys = const [],
      required this.taxSummary});

  @override
  List<Object?> get props =>
      [status, header, lineItems, receiptSettings, taxSummary];

  ReceiptDisplayState copyWith({
    ReceiptDisplayStatus? status,
    TransactionHeaderEntity? header,
    ReceiptSettingsModel? receiptSettings,
    List<TransactionLineItemEntity>? lineItems,
    List<HsnTaxSummary>? taxSummary,
    List<GlobalKey>? globalKeys,
  }) {
    return ReceiptDisplayState(
        status: status ?? this.status,
        header: header ?? this.header,
        receiptSettings: receiptSettings ?? this.receiptSettings,
        lineItems: lineItems ?? this.lineItems,
        taxSummary: taxSummary ?? this.taxSummary,
        globalKeys: globalKeys ?? this.globalKeys);
  }
}
