import 'package:isar/isar.dart';

import '../database/db_provider.dart';
import '../entity/pos/deals_entity.dart';

class DealsRepository with DatabaseProvider {

  Future<List<DealsEntity>> getDealsByStoreId(String storeId) async {
    return db.dealsEntitys.where().findAll();
  }

  Future<List<DealsEntity>> getDealsByItemId(String itemId) async {
    List<DealsEntity> de = await db.dealsEntitys.where().dealRefElementEqualTo("${MatchingField.item.value}#$itemId").findAll();
    return de;
  }

  Future<List<DealsEntity>> getDealsByDepartmentId(String department) async {
    return db.dealsEntitys.where().findAll();
  }

  Future<List<DealsEntity>> getAllDeals() async {
    return db.dealsEntitys.where().findAll();
  }

  Future<DealsEntity> getDealById(String dealId) async {
    DealsEntity?  res = await db.dealsEntitys.where().dealIdEqualTo(dealId).findFirst();
    if (res == null) {
      throw Exception('Deal not found');
    }
    return res;
  }

  Future<DealsEntity> saveDeal(DealsEntity deal) async {
    await db.writeTxn(() async {
      await db.dealsEntitys.put(deal);
    });
    return deal;
  }

}