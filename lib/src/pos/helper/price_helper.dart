import 'package:logging/logging.dart';

import '../../entity/pos/entity.dart';
import '../../repositories/product_repository.dart';
import '../calculator/price_calculator.dart';

class PriceHelper {
  Logger log = Logger('PriceHelper');



  double findPriceForItem(ItemEntity product) {
    if (product.salePrice != null) {
      return product.salePrice!;
    } else if (product.listPrice != null) {
      return product.listPrice!;
    } else {
      log.warning('No price found for product ${product.id}');
      return 0.0;
    }
  }

  // double findPriceForItemById(String itemId) {
  //   if (product.salePrice != null) {
  //     return product.salePrice!;
  //   } else if (product.listPrice != null) {
  //     return product.listPrice!;
  //   } else {
  //     log.warning('No price found for product ${product.id}');
  //     return 0.0;
  //   }
  // }

  void recalculatePriceForLineItems(List<TransactionLineItemEntity> lineItems) {
    /// For each item perform the following:

    // Loop over all the line item to fetch the best price for the item based on the price rules and apply the price to the line item

    // Fetch the best deals for the item based on the deals rules

    // Apply the deals to the line item

    // Apply the discount to the line item

    // Calculate the tax for the line item

    // Calculate the total for the line item

  }

  void recalculatePriceForLineItem(TransactionLineItemEntity lineItem) {

  }
}