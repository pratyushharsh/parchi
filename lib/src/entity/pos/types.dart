class EntityType {

  final String type;
  EntityType._(this.type);

  static final EntityType product = EntityType._("PRODUCT");
  static final EntityType contact = EntityType._("CONTACT");
  static final EntityType transaction = EntityType._("TRANS");
  static final EntityType store = EntityType._("STORE");

  @override
  String toString() {
    return type;
  }
}