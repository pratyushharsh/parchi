import 'package:path_provider/path_provider.dart';

class Constants {
  static const printAndEmail = "PRINT_AND_EMAIL";
  static const print = "PRINT";
  static const cancel = "CANCEL";
  static String baseImagePath = "";
  static String basePath = "";

  static Future<String> getImageBasePath() async {
    final appDoc = await getApplicationSupportDirectory();
    baseImagePath = appDoc.path + "/images/";
    return baseImagePath;
  }

  static Future<String> getTmpPath() async {
    final appDoc = await getTemporaryDirectory();
    return appDoc.path;
  }
}

class UrlConstants {
  static const sampleProductDataUrl = "https://xpos-user-dev.s3.ap-south-1.amazonaws.com/feed_data/product_min.zip";
  static const sampleProductsImagesUrl = "https://xpos-user-dev.s3.ap-south-1.amazonaws.com/feed_data/parchi_image_min.zip";
  static const fullProductDataUrl = "https://xpos-user-dev.s3.ap-south-1.amazonaws.com/feed_data/products_full_load.zip";
  static const fullProductsImagesUrl = "https://xpos-user-dev.s3.ap-south-1.amazonaws.com/feed_data/parchi_image.zip";
}