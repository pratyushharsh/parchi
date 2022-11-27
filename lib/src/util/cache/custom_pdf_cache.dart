import 'dart:io';
import 'dart:typed_data';

import 'package:path_provider/path_provider.dart';
import 'package:printing/printing.dart';

class CustomPdfCache extends PdfBaseCache {

  String basePath = "";

  CustomPdfCache() {
    init();
  }

  init() async {
    final dir = await getApplicationSupportDirectory();
    basePath = "${dir.path}/pdf_cache/";
    Directory cacheDir = Directory(basePath);
    if (!await cacheDir.exists()) {
      await cacheDir.create(recursive: true);
    }
  }

  @override
  Future<void> add(String key, Uint8List bytes) {
    File file = File(basePath + key);
    return file.writeAsBytes(bytes);
  }

  @override
  Future<void> clear() {
      return Directory(basePath).delete(recursive: true);
  }

  @override
  Future<bool> contains(String key) {
    return File(basePath + key).exists();
  }

  @override
  Future<Uint8List?> get(String key) {
    return File(basePath + key).readAsBytes();
  }

  @override
  Future<void> remove(String key) {
    return File(basePath + key).delete();
  }

}