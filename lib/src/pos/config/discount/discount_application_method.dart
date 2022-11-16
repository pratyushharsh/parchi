class DiscountApplicationMethod {
  final Map<String, DiscountApplicationMethod> _value = {};
  final String name;
  DiscountApplicationMethod(this.name) {
    _value[name] = this;
  }
  static final DiscountApplicationMethod lineItem = DiscountApplicationMethod("LINE_ITEM");
  static final DiscountApplicationMethod transaction = DiscountApplicationMethod("TRANSACTION");
  static final DiscountApplicationMethod group = DiscountApplicationMethod("GROUP");
}