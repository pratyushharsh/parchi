import 'package:logging/logging.dart';

import '../../entity/pos/entity.dart';

class PriceHelper {
  Logger log = Logger('PriceHelper');

  double findPriceForItem(ProductEntity product) {
    if (product.salePrice != null) {
      return product.salePrice!;
    } else if (product.listPrice != null) {
      return product.listPrice!;
    } else {
      log.warning('No price found for product ${product.id}');
      return 0.0;
    }
  }
}