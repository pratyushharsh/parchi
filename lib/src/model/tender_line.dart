class TenderLineItem {
  final int transSeq;
  final int lineItemSequence;
  final double amount;
  final DateTime beginDate;
  final DateTime? endDate;
  final String currencyId;
  final String tenderId;
  final String tenderStatusCode;

  TenderLineItem(
      {required this.transSeq,
      required this.lineItemSequence,
      required this.beginDate,
      required this.amount,
      this.endDate,
      required this.currencyId,
      required this.tenderId,
      required this.tenderStatusCode});
}
