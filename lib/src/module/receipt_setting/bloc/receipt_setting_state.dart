part of 'receipt_setting_bloc.dart';

enum ReceiptSettingStatus { initial, modified, loading, failure, success, initLoad }

class ReceiptSettingState extends Equatable {
  final ReceiptSettingStatus status;
  final String storeNumber;
  final String tagLine;
  final String storeAddress;
  final String footerTitle;
  final String footerSubtitle;

  const ReceiptSettingState(
      {this.status = ReceiptSettingStatus.initial,
      this.storeNumber = "",
      this.tagLine = "",
      this.storeAddress = "",
      this.footerTitle = "",
      this.footerSubtitle = ""});

  @override
  List<Object?> get props => [status, storeNumber, tagLine, storeAddress, footerTitle, footerSubtitle];

  ReceiptSettingState copyWith({
    ReceiptSettingStatus? status,
    String? storeNumber,
    String? tagLine,
    String? storeAddress,
    String? footerTitle,
    String? footerSubtitle,
  }) {
    return ReceiptSettingState(
      status: status ?? this.status,
      storeNumber: storeNumber ?? this.storeNumber,
      tagLine: tagLine ?? this.tagLine,
      storeAddress: storeAddress ?? this.storeAddress,
      footerTitle: footerTitle ?? this.footerTitle,
      footerSubtitle: footerSubtitle ?? this.footerSubtitle,
    );
  }
}
