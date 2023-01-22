import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

import '../entity/pos/entity.dart';
import 'store_config_manager.dart';

mixin SequenceConfig {

  String generateSequence(SequenceEntity sequence) {
    String pattern = sequence.pattern;

    String res = pattern.replaceAllMapped(RegExp(r'{(.+?)}'), (Match m) {
      String key = m.group(1)!;
      if (key == "counter") {
        return sequence.nextSeq.toString();
      } else if (key.startsWith('date(')) {
        String format = key.substring(5, key.length - 1);
        DateFormat dateFormatter = DateFormat(format);
        return dateFormatter.format(DateTime.now());
      } else if (key == "uuid") {
        const uuid = Uuid();
        return uuid.v1();
      } else if (key == "tbase36") {
        return timestampToBase36(DateTime.now().millisecondsSinceEpoch);
      } else if (key == "store") {
        return timestampToBase36(StoreConfigCacheManager.storeId);
      } else if (key == "wkst") {
        return timestampToBase36(StoreConfigCacheManager.workstationId);
      }
      return key;
    });
    return res;
  }

  String timestampToBase36(int data) {
    if (data < 0) {
      throw ArgumentError.value(data, 'data', 'must be positive');
    }
    return data.toRadixString(36).toUpperCase();
  }
}