import 'dart:convert';
import 'dart:io';

import 'package:archive/archive_io.dart';
import 'package:isar/isar.dart';
import 'package:logging/logging.dart';
import 'package:http/http.dart' as http;

import 'background_sync.dart';
import '../../entity/pos/entity.dart';

///
/// Status of the product sync
/// 0 - Not Synced
/// 400 - Image Updated Data Need to sync back.
/// 600 - Image Needs to be uploaded.
/// 1000 - Synced
///

class BackgroundProductSync extends BackgroundEntitySync {
  final String baseUrl;
  final String storeId;
  bool imageSyncInProgress = false;

  static Logger log = Logger('BackgroundProductSync');

  BackgroundProductSync({required this.baseUrl, required this.storeId});

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

      // Check if any products image needs to be updated.
      var syncState = 1000;
      if (tmp['imageUrl'] != null) {
        List images = tmp['imageUrl'] as List;
        for (var image in images) {
          if (image.toString().startsWith('file:/')) {
            syncState = 600;
            break;
          }
        }
      }
      tmp['syncState'] = syncState;
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
    // await tmpDir.delete(recursive: true);
  }

  Future<ImageKitUploadResponse> uploadImageToImageKit(
      String imageDir, String fileName, String storeId, String imageId) async {
    // Fetch the file
    final tokenResp = await http.get(
      Uri.parse('$baseUrl/business/$storeId/image/token'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    log.info('Response: ${tokenResp.body}');
    Map<String, dynamic> responseJson;
    if (tokenResp.statusCode == 200) {
      responseJson = json.decode(tokenResp.body);
    } else {
      throw Exception('Failed to load data');
    }

    // construct the request
    var uri = Uri.https('upload.imagekit.io', '/api/v1/files/upload');
    var request = http.MultipartRequest('POST', uri)
      ..fields['publicKey'] = 'public_Meql/vuDgEH948bofreYb2IpHCc='
      ..fields['signature'] = responseJson['signature']
      ..fields['expire'] = '${responseJson['expires']}'
      ..fields['token'] = responseJson['token']
      ..fields['fileName'] = fileName.split("/").last
      ..fields['folder'] = 'parchi-dev/$storeId/$imageId'
      ..files.add(await http.MultipartFile.fromPath(
        'file',
        '$imageDir/$fileName',
      ));
    var response = await request.send();
    print(response.statusCode);
    if (response.statusCode == 200) {
      var resp = await response.stream.bytesToString();
      var jsonResp = json.decode(resp);
      return ImageKitUploadResponse(
          inputFileName: fileName, outputFilePath: jsonResp['filePath']);
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<void> getProductImageToSync(String imageDir) async {
    if (imageSyncInProgress) {
      return;
    }
    imageSyncInProgress = true;

    var products =
        await db.productEntitys.where().syncStateEqualTo(600).findAll();

    log.info("Products Image To Sync to sync: ${products.length}");
    if (products.isNotEmpty) {
      for (var product in products) {
        // Find the list of images to be updated
        List<String> images =
            product.imageUrl.where((e) => e.startsWith('file:/')).toList();
        if (images.isNotEmpty) {
          log.info("Uploading ${images.length} images for product: ${product.productId}");
          // @TODO Handle Error
          var res = await Future.wait(images.map((e) => uploadImageToImageKit(
              imageDir, e.substring(6), storeId, product.productId!)));
          // Get the product and update the image url.

          await db.writeTxn(
            () async {
              var p = await db.productEntitys.getByProductId(product.productId);
              if (p != null) {
                List<String> updatedImages = [];
                for (var image in p.imageUrl) {
                  if (image.startsWith('file:/')) {
                    var tmp = res.firstWhere(
                        (e) => e.inputFileName == image.substring(6));
                    updatedImages.add('imagekit:/${tmp.outputFilePath}');
                  } else {
                    updatedImages.add(image);
                  }
                }

                p.imageUrl = updatedImages;
                p.syncState = 400;
                return db.productEntitys.put(p);
              }
            },
          );
        }
      }
    }
    imageSyncInProgress = false;
  }
}

class ImageKitUploadResponse {
  final String inputFileName;
  final String outputFilePath;

  ImageKitUploadResponse(
      {required this.inputFileName, required this.outputFilePath});
}
