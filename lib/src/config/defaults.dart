import '../entity/config/code_value_entity.dart';

class DefaultConfig {
  static CodeValueEntity uom() {
    return CodeValueEntity(
        category: 'UOM',
        code: 'EA',
        description: 'Each');
  }
}