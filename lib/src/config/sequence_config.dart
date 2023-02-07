import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

import '../entity/pos/entity.dart';
import 'store_config_manager.dart';

mixin SequenceConfig {

  String generateSequence(SequenceEntity sequence) {
    String pattern = sequence.pattern;

    String res = pattern.replaceAllMapped(RegExp(r'{(.+?)}'), (Match m) {
      String key = m.group(1)!;
      // parse the data for each key
      return _functionVariable(key, sequence);
    });
    return res;
  }

  String _functionVariable(String key, SequenceEntity sequence) {
    if (key.startsWith('pad(')) {
      String data = key.substring(4, key.length - 1);
      List<String> parts = data.split(',');
      String value = parts[0];
      int length = int.parse(parts[1]);
      String padChar = parts[2];
      return _functionVariable(value, sequence).padLeft(length, padChar);
    } else if (key.startsWith('padr(')) {
      String data = key.substring(5, key.length - 1);
      List<String> parts = data.split(',');
      String value = parts[0];
      int length = int.parse(parts[1]);
      String padChar = parts[2];
      return _functionVariable(value, sequence).padRight(length, padChar);
    } else if (key.startsWith('replace(')) {
      String data = key.substring(8, key.length - 1);
      List<String> parts = data.split(',');
      String value = parts[0];
      String oldValue = parts[1];
      String newValue = parts[2];
      return _functionVariable(newValue, sequence).replaceAll(oldValue, _functionVariable(newValue, sequence));
    } else if (key.startsWith('substring(')) {
      String data = key.substring(10, key.length - 1);
      List<String> parts = data.split(',');
      String value = parts[0];
      int start = int.parse(parts[1]);
      int end = int.parse(parts[2]);
      return _functionVariable(value, sequence).substring(start, end);
    } else if (key.startsWith('trim(')) {
      String data = key.substring(5, key.length - 1);
      List<String> parts = data.split(',');
      String value = parts[0];
      String trimChar = parts[1];
      return _functionVariable(value, sequence).trimLeft().trimRight();
    } else if (key.startsWith('upper(')) {
      String data = key.substring(6, key.length - 1);
      List<String> parts = data.split(',');
      String value = parts[0];
      return _functionVariable(value, sequence).toUpperCase();
    } else if (key.startsWith('lower(')) {
      String data = key.substring(6, key.length - 1);
      List<String> parts = data.split(',');
      String value = parts[0];
      return _functionVariable(value, sequence).toLowerCase();
    } else if (key == "counter") {
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
      return '${StoreConfigCacheManager.storeId}';
    } else if (key == "wkst") {
      return timestampToBase36(StoreConfigCacheManager.workstationId);
    }
    return key;
  }

  String timestampToBase36(int data) {
    if (data < 0) {
      throw ArgumentError.value(data, 'data', 'must be positive');
    }
    return data.toRadixString(36).toUpperCase();
  }
}