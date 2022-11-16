import 'entity.dart';

abstract class BaseEntity extends DynamoEntity {

  String getPK();

  String getSK();

  String getStoreId();

  EntityType type();

  String lastUpdatedAtISOString();

  Map<String, String> getKeys() {
    return {
      "PK": getPK(),
      "SK": getSK(),
      "GPK1": "${getStoreId()}#${type().type}",
      "GSK1": lastUpdatedAtISOString()
    };
  }

  Map<String, dynamic> toDaoJson() {
    Map<String, dynamic> res = {};
    res.addAll(toMap());
    res.addAll(getKeys());
    return res;
  }
}

abstract class DynamoEntity {

  Map<String, dynamic> toMap();

  static DynamoEntity? fromMap(Map<String, dynamic> map) {
    return null;
  }
}