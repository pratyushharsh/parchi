import 'dart:convert';
import 'dart:io';

import 'package:logging/logging.dart';

import '../database/db_provider.dart';
import '../entity/pos/tax_group_entity.dart';
import '../util/helper/rest_api.dart';

class BulkImportRepository with DatabaseProvider {
  final log = Logger('BulkImportRepository');

  final RestApiClient restClient;

  BulkImportRepository({required this.restClient});

  Future<void> importTaxData(String filePath) async {
    try {
      final input = await File(filePath).readAsBytes();
      await db.writeTxn(() async {
        await db.taxGroupEntitys.importJsonRaw(input);
      });
    } catch (e) {
      log.severe(e);
    }
  }
}