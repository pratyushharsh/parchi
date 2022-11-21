import 'package:flutter_cache_manager/flutter_cache_manager.dart';

class ParchiImageCacheManger extends CacheManager {
  static const key = 'parchiCachedImageData';

  static final ParchiImageCacheManger _instance = ParchiImageCacheManger._();
  factory ParchiImageCacheManger() {
    return _instance;
  }

  ParchiImageCacheManger._() : super(Config(key, stalePeriod: const Duration(days: 7)));
}