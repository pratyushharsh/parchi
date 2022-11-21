import 'package:intl/intl.dart';

import '../database/db_provider.dart';
import '../entity/pos/entity.dart';

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
      }
      return key;
    });

    return res;
  }
}