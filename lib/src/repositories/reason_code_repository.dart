import 'package:isar/isar.dart';
import 'package:logging/logging.dart';

import '../database/db_provider.dart';
import '../entity/pos/reason_code_entity.dart';
import '../util/helper/rest_api.dart';

class ReasonCodeRepository with DatabaseProvider {
  final log = Logger('ReasonCodeRepository');

  final RestApiClient restClient;

  ReasonCodeRepository({required this.restClient});

  Future<List<ReasonCodeEntity>> getReasonCodeByTypeCode(String reasonTypeCode) {
    try {
      var data = defaultInstance.reasonCodeEntitys.where().findAll();
      return data;
    }catch (e) {
      log.severe(e);
    }
    return Future.value(List<ReasonCodeEntity>.empty());
  }
}