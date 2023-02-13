import 'package:isar/isar.dart';
import 'package:logging/logging.dart';

import '../database/db_provider.dart';
import '../entity/pos/entity.dart';
import '../module/list_all_item/bloc/list_all_item_bloc.dart';
import '../util/helper/rest_api.dart';

class ProductRepository with DatabaseProvider {
  final log = Logger('ProductRepository');

  final RestApiClient restClient;

  ProductRepository({required this.restClient});

  Future<ItemEntity?> getProductById(String productId) {
    return db.itemEntitys.getByProductId(productId);
  }

  Future<void> createNewProduct(ItemEntity product) {
    product.lastChangedAt = DateTime.now();
    product.syncState = 0;
    return db.writeTxn(() => db.itemEntitys.putByProductId(product));
  }

  Future<void> updateProduct(ItemEntity product) {
    if (product.id == null) {
      log.severe('Product id is null');
      return Future.value();
    }
    product.lastChangedAt = DateTime.now();
    product.syncState = 200;
    return db.writeTxn(() => db.itemEntitys.putByProductId(product));
  }

  Future<List<ItemEntity>> searchProductByFilter(String filter,
      {int limit = 10}) {
    return db.itemEntitys
        .where()
        .productIdEqualTo(filter)
        .or()
        .descriptionWordsElementStartsWith(filter)
        .limit(limit)
        .findAll();
  }

  Future<List<ItemEntity>> getAllProducts() async {
    return db.itemEntitys.where().findAll();
  }

  Future<List<ItemEntity>> searchProducts(
      ProductFilterCriteria filterCriteria) async {
    var q = db.itemEntitys.where();

    QueryBuilder<ItemEntity, ItemEntity, QAfterWhereClause>? qb;
    bool first = true;

    if (filterCriteria.filter != null && filterCriteria.filter!.isNotEmpty) {
      qb = q
          .productIdEqualTo(filterCriteria.filter!)
          .or()
          .descriptionWordsElementStartsWith(filterCriteria.filter!);
      first = false;
    }

    if (filterCriteria.brands.isNotEmpty) {
      for (var brand in filterCriteria.brands) {
        if (first) {
          first = false;
          qb = q.brandEqualTo(brand);
        } else {
          qb = qb!.or().brandEqualTo(brand);
        }
      }
    }

    if (filterCriteria.categories.isNotEmpty) {
      QueryBuilder<ItemEntity, ItemEntity, QAfterFilterCondition>? fil;
      for (var category in filterCriteria.categories) {
        if (fil == null) {
          first = false;
          fil = q.filter().categoryElementContains(category);
        } else {
          fil = fil.or().categoryElementContains(category);
        }
      }

      if (fil != null) {
        QueryBuilder<ItemEntity, ItemEntity, QAfterSortBy>? sortBy;
        switch(filterCriteria.sortBy) {
          case ProductFilterSortByCriteria.priceLowToHigh:
            sortBy = fil.sortBySalePrice();
            break;
          case ProductFilterSortByCriteria.priceHighToLow:
            sortBy = fil.sortBySalePriceDesc();
            break;
          case ProductFilterSortByCriteria.nameAtoZ:
            sortBy = fil.sortByDisplayName();
            break;
          case ProductFilterSortByCriteria.nameZtoA:
            sortBy = fil.sortByDisplayNameDesc();
            break;
          default:
            sortBy = fil.sortByCreateTimeDesc();
            break;
        }

        List <ItemEntity> recommendation = await sortBy
            .offset(filterCriteria.offset)
            .limit(filterCriteria.limit)
            .findAll();

        // Find product by id
        return sortBy
            .offset(filterCriteria.offset)
            .limit(filterCriteria.limit)
            .findAll();
      }
    }

    if (qb != null) {
      QueryBuilder<ItemEntity, ItemEntity, QAfterSortBy>? sortBy;
      switch(filterCriteria.sortBy) {
        case ProductFilterSortByCriteria.priceLowToHigh:
          sortBy = qb.sortBySalePrice();
          break;
        case ProductFilterSortByCriteria.priceHighToLow:
          sortBy = qb.sortBySalePriceDesc();
          break;
        case ProductFilterSortByCriteria.nameAtoZ:
          sortBy = qb.sortByDisplayName();
          break;
        case ProductFilterSortByCriteria.nameZtoA:
          sortBy = qb.sortByDisplayNameDesc();
          break;
        default:
          sortBy = qb.sortByCreateTimeDesc();
          break;
      }
      return sortBy
          .offset(filterCriteria.offset)
          .limit(filterCriteria.limit)
          .findAll();
    } else {

      QueryBuilder<ItemEntity, ItemEntity, QAfterSortBy>? sortBy;
      switch(filterCriteria.sortBy) {
        case ProductFilterSortByCriteria.priceLowToHigh:
          sortBy = q.sortBySalePrice();
          break;
        case ProductFilterSortByCriteria.priceHighToLow:
          sortBy = q.sortBySalePriceDesc();
          break;
        case ProductFilterSortByCriteria.nameAtoZ:
          sortBy = q.sortByDisplayName();
          break;
        case ProductFilterSortByCriteria.nameZtoA:
          sortBy = q.sortByDisplayNameDesc();
          break;
        default:
          sortBy = q.sortByCreateTimeDesc();
          break;
      }

      return sortBy
          .offset(filterCriteria.offset)
          .limit(filterCriteria.limit)
          .findAll();
    }
  }

  Future<List<String>> getAllProductsBrands() async {
    var brands = await db.itemEntitys.where().distinctByBrand().findAll();
    return brands.where((e) => (e.brand != null && e.brand!.isNotEmpty)).map((e) => e.brand!).toList();
  }

  Future<List<String>> getAllCategory() async {
    var category =
        await db.itemEntitys.where().distinctByCategory().findAll();
    Set<String> set = {};
    for (var c in category) {
      set.addAll(c.category.where((element) => element.isNotEmpty));
    }
    return set.toList();
  }
}
