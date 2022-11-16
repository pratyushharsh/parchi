class HsnTaxSummary {
  final String hsn;
  final double amount;
  final double cgstRate;
  final double cgstAmount;
  final double sgstRate;
  final double sgstAmont;
  final double taxTotal;

  HsnTaxSummary(
      {required this.hsn,
      required this.amount,
      required this.cgstRate,
      required this.cgstAmount,
      required this.sgstRate,
      required this.sgstAmont,
      required this.taxTotal});
}
