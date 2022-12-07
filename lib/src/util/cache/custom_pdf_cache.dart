import 'dart:io';
import 'dart:typed_data';
import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:path_provider/path_provider.dart';
import 'package:printing/printing.dart';

class CustomPdfCache extends PdfBaseCache {

  String basePath = "";

  CustomPdfCache() {
    init();
  }

  String generateMd5(String input) {
    return md5.convert(utf8.encode(input)).toString();
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
    if (key.startsWith("http") || key.startsWith("https")) {
      key = generateMd5(key);
    }

    File file = File(basePath + key);
    return file.writeAsBytes(bytes);
  }

  @override
  Future<void> clear() {
      return Directory(basePath).delete(recursive: true);
  }

  @override
  Future<bool> contains(String key) {
    // If key is http or https then hash it ans check
    if (key.startsWith("http") || key.startsWith("https")) {
      key = generateMd5(key);
    }

    return File(basePath + key).exists();
  }

  @override
  Future<Uint8List?> get(String key) {
    // If key is http or https then hash abd check if exists
    if (key.startsWith("http") || key.startsWith("https")) {
      key = generateMd5(key);
    }

    return File(basePath + key).readAsBytes();
  }

  @override
  Future<void> remove(String key) {
    if (key.startsWith("http") || key.startsWith("https")) {
      key = generateMd5(key);
    }
    return File(basePath + key).delete();
  }

}