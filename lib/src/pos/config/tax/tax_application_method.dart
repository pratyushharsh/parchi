class TaxApplicationMethod {
  final Map<String, TaxApplicationMethod> _value = {};
  final String name;
  TaxApplicationMethod(this.name) {
    _value[name] = this;
  }
  static final TaxApplicationMethod all = TaxApplicationMethod("ALL");
}