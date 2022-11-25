import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:isar/isar.dart';

import '../database/db_provider.dart';
import '../entity/pos/country_entity.dart';
import '../entity/pos/entity.dart';

class ParchiImageCacheManger extends CacheManager {
  static const key = 'parchiCachedImageData';

  static final ParchiImageCacheManger _instance = ParchiImageCacheManger._();
  factory ParchiImageCacheManger() {
    return _instance;
  }

  ParchiImageCacheManger._() : super(Config(key, stalePeriod: const Duration(days: 7)));
}

enum SettingsType {
  country
}

class SettingsCacheManager with DatabaseProvider {
  static final Map<SettingsType, dynamic> _cache= {};
  static final Map<SettingsType, dynamic> _default = {};
  static final SettingsCacheManager _instance = SettingsCacheManager._();
  factory SettingsCacheManager() {
    return _instance;
  }

  SettingsCacheManager._();

  Future<void> clearCache() async {
    db.countryEntitys.where().findAllSync();
    _cache.clear();
  }

  dynamic getDefaultElement(SettingsType type) {
    if (_default.containsKey(type)) {
      return _default[type];
    }
    switch (type) {
      case SettingsType.country:
        var defaultCountry = defaultInstance.countryEntitys.filter().iso2EqualTo('IN').findFirstSync();
        _default[type] = defaultCountry;
        return defaultCountry;
    }
  }

  dynamic getElement(SettingsType type) {
    if (_cache.containsKey(type)) {
      return _cache[type];
    }
    switch (type) {
      case SettingsType.country:
        final country = defaultInstance.countryEntitys.where().findAllSync();
        _cache[type] = country;
        return country;
    }
  }
}