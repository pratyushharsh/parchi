import 'dart:collection';

import 'package:isar/isar.dart';
import 'package:logging/logging.dart';
import 'package:path_provider/path_provider.dart';

import '../entity/config/code_value_entity.dart';
import '../entity/pos/entity.dart';

mixin DatabaseProvider {
  static final log = Logger('DatabaseProvider');
  static const defaultDbName = 'default';
  static final Map<String, Isar> _dbMap = HashMap<String, Isar>();
  static String _currentKey = defaultDbName;
  static bool _isIsolated = false;

  Isar get db => _dbMap[_currentKey]!;

  Isar get defaultInstance => _dbMap[defaultDbName]!;

  static Future<void> ensureInitialized({String name = defaultDbName, bool isolateInit = false}) async {
    _isIsolated = isolateInit;
    await switchDatabase(name);
  }

  static Future<Isar> _openDatabase(String name) async {
    String? path;
    bool inspector = false;

    if (!_isIsolated) {
      path = (await getApplicationDocumentsDirectory()).path;
      log.info("Creating new database connection at $path");
      inspector = true;
    }

    return await Isar.open([
      RetailLocationEntitySchema,
      ContactEntitySchema,
      EmployeeEntitySchema,
      EmployeeRoleEntitySchema,
      ItemEntitySchema,
      CollectionEntitySchema,
      SequenceEntitySchema,
      SettingEntitySchema,
      SyncEntitySchema,
      TransactionHeaderEntitySchema,
      CodeValueEntitySchema,
      ReasonCodeEntitySchema,
      TaxGroupEntitySchema,
      ReportConfigEntitySchema,
      CountryEntitySchema
    ], inspector: inspector, directory: path, name: name, maxSizeMiB: 2048);
  }

  static Future<void> switchDatabase(String name) async {
    log.info("Switching database to $name");
    if (_dbMap.containsKey(name)) {
      _currentKey = name;
    } else {
      _dbMap[name] = await _openDatabase(name);
      _currentKey = name;
    }
  }

  static Future<void> closeAllDatabaseExceptDefault() async {
    log.info("Closing all database except default");
    for (var key in _dbMap.keys) {
      if (key != defaultDbName) {
        await _dbMap[key]!.close(deleteFromDisk: true);
        _dbMap.remove(key);
      }
    }
  }
}
