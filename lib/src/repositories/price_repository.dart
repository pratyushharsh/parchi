import 'package:isar/isar.dart';

import '../database/db_provider.dart';
import '../entity/pos/item_entity.dart';

class PriceRepository with DatabaseProvider {

  Future<double> findPriceForItemId(String id) async {
    ItemEntity? item = await db.itemEntitys.where().productIdEqualTo(id).findFirst();
    if (item == null) {
      return 0.0;
    }
    if (item.salePrice != null) {
      return item.salePrice!;
    } else if (item.listPrice != null) {
      return item.listPrice!;
    } else {
      return 0.0;
    }
  }
}