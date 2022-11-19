import 'package:isar/isar.dart';
part 'trn_payment_line_item.g.dart';

@embedded
class TransactionPaymentLineItemEntity {

  String? transId;
  int? paymentSeq;
  double? amount;
  DateTime? beginDate;
  DateTime? endDate;
  String? currencyId;
  String? tenderId;
  String? tenderStatusCode;
  String? authCode;
  String? token;
  bool isVoid;

  TransactionPaymentLineItemEntity(
      {
      this.transId,
      this.paymentSeq,
      this.amount,
      this.beginDate,
      this.endDate,
      this.currencyId,
      this.tenderId,
      this.tenderStatusCode,
      this.authCode,
      this.token,
      this.isVoid = false});
}
