import 'package:isar/isar.dart';

import '../database/db_provider.dart';
import '../entity/pos/deals_entity.dart';

class DealsRepository with DatabaseProvider {

  Future<List<DealsEntity>> getDealsByStoreId(String storeId) async {
    return db.dealsEntitys.where().findAll();
  }

  Future<List<DealsEntity>> getDealsByItemId(String itemId) async {
    return db.dealsEntitys.where().findAll();
  }

  Future<List<DealsEntity>> getDealsByDepartmentId(String department) async {
    return db.dealsEntitys.where().findAll();
  }

  Future<DealsEntity> getDealsById(String dealId) async {
    DealsEntity?  res = await db.dealsEntitys.where().dealIdEqualTo(dealId).findFirst();
    if (res == null) {
      throw Exception('Deal not found');
    }
    return res;
  }

}