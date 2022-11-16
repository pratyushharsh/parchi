import 'package:isar/isar.dart';

import '../database/db_provider.dart';
import '../entity/config/code_value_entity.dart';

class ConfigRepository with DatabaseProvider {

  ConfigRepository();

  Future<List<CodeValueEntity>> getCodeByCategory(String category) {
    return defaultInstance.codeValueEntitys.where().categoryEqualTo(category).findAll();
  }

  CodeValueEntity? getCodeByCategoryAndCode(String category, String? code) {
    if (category.isEmpty || (code == null || code.isEmpty)) {
      return null;
    }
    return defaultInstance.codeValueEntitys.getByCategoryCodeSync(category, code);
  }

  Future<CodeValueEntity?> getCodeByCategoryAndCodeAsync(String category, String? code) async {
    if (category.isEmpty || (code == null || code.isEmpty)) {
      return null;
    }
    return defaultInstance.codeValueEntitys.getByCategoryCode(category, code);
  }
}