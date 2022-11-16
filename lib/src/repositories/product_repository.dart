import 'package:isar/isar.dart';
import 'package:logging/logging.dart';

import '../database/db_provider.dart';
import '../entity/pos/entity.dart';
import '../util/helper/rest_api.dart';

class ProductRepository with DatabaseProvider {
  final log = Logger('ProductRepository');

  final RestApiClient restClient;

  ProductRepository({required this.restClient});

  Future<ProductEntity?> getProductById(String productId) {
    return db.productEntitys.getByProductId(productId);
  }

  Future<void> createNewProduct(ProductEntity product) {
    product.lastChangedAt = DateTime.now();
    product.syncState = 0;
    return db.writeTxn(() => db.productEntitys.putByProductId(product));
  }

  Future<void> updateProduct(ProductEntity product) {
    if (product.id == null) {
      log.severe('Product id is null');
      return Future.value();
    }
    product.lastChangedAt = DateTime.now();
    product.syncState = 200;
    return db.writeTxn(() => db.productEntitys.putByProductId(product));
  }

  Future<List<ProductEntity>> searchProductByFilter(String filter, {int limit = 10}) {
     return db.productEntitys
        .where()
        .productIdEqualTo(filter)
        .or()
        .descriptionWordsElementStartsWith(filter)
        .limit(limit)
        .findAll();
  }

  Future<List<ProductEntity>> getAllProducts() async {
    return db.productEntitys.where().findAll();
  }
}