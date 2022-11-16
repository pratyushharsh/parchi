import 'dart:io';

import 'package:archive/archive_io.dart';
import 'package:isar/isar.dart';
import 'package:logging/logging.dart';

import 'background_sync.dart';
import '../../entity/pos/entity.dart';

class BackgroundProductSync extends BackgroundEntitySync {
  static Logger log = Logger('BackgroundProductSync');

  @override
  Future<List<Map<String, dynamic>>> exportData() async {
    return await db.productEntitys
        .where()
        .syncStateIsNull()
        .or()
        .syncStateLessThan(500)
        .exportJson();
  }

  @override
  Future<void> importData(List data, int lastSyncAt) async {
    List<Map<String, dynamic>> products = [];
    for (var product in data) {
      var tmp = Map<String, dynamic>.from(product);
      tmp['syncState'] = 1000;
      tmp['descriptionWords'] = Isar.splitWords(tmp['displayName']);
      products.add(tmp);
    }

    await db.writeTxn(() async {
      if (products.isNotEmpty) {
        await db.productEntitys.importJson(products);
      }
      await updateSyncEntityTimestamp(lastSyncAt);
    });
  }

  @override
  String get type => productSync;

  Future<void> createZipForProductImages(List<Map<String, dynamic>> products,
      String imageDir, String tmpDirPath) async {
    // Get all the products;
    // create a file and move to tmp location.
    Directory x = Directory(tmpDirPath);
    var tmpDir = await x.createTemp('image_export');
    log.info('Exporting Data to $tmpDir');
    log.info('Products: $products');
    for (var product in products) {
      if (product['imageUrl'] != null) {
        List<String> productImages = List.from(product['imageUrl']);
        var urls = productImages
            .where((e) => e.startsWith('file:/'))
            .map((e) => '$imageDir${e.substring(6)}')
            .toList();
        for (var url in urls) {
          var fileName = '${product['productId']}/${url.split('/').last}';
          var sourceFile = File(url);
          var destFile = File('${tmpDir.path}/$fileName');
          if (!await destFile.exists()) {
            await destFile.create(recursive: true);
          }
          await sourceFile.copy('${tmpDir.path}/$fileName');
        }
      }
    }
    var encoder = ZipFileEncoder();
    encoder.zipDirectory(tmpDir, filename: '$tmpDirPath/log_iso.zip');
    await tmpDir.delete(recursive: true);
  }
}
