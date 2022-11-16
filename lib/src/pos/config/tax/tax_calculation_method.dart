class TaxCalculationMethod {
  final Map<String, TaxCalculationMethod> _value = {};
  final String name;
  TaxCalculationMethod(this.name) {
    _value[name] = this;
  }

  static final TaxCalculationMethod amount = TaxCalculationMethod("AMOUNT");
  static final TaxCalculationMethod percentage = TaxCalculationMethod("PERCENTAGE");
}