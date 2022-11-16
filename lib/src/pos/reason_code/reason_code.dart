class PriceModifierReasonCode {
  final Map<String, PriceModifierReasonCode> _value = {};
  final String code;
  PriceModifierReasonCode(this.code) {
    _value[code] = this;
  }
  static final PriceModifierReasonCode discountAmount = PriceModifierReasonCode("DISCOUNT_AMOUNT");
  static final PriceModifierReasonCode discountPercent = PriceModifierReasonCode("DISCOUNT_PERCENT");
  static final PriceModifierReasonCode discountGroup = PriceModifierReasonCode("DISCOUNT_GROUP");
}