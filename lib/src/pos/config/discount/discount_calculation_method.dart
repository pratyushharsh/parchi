class DiscountCalculationMethod {
  final Map<String, DiscountCalculationMethod> _value = {};
  final String name;
  DiscountCalculationMethod(this.name) {
    _value[name] = this;
  }

  static final DiscountCalculationMethod amount = DiscountCalculationMethod("AMOUNT");
  static final DiscountCalculationMethod percentage = DiscountCalculationMethod("PERCENTAGE");
  static final DiscountCalculationMethod group = DiscountCalculationMethod("GROUP");
}