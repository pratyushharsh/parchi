import 'package:isar/isar.dart';
import 'package:logging/logging.dart';

import '../database/db_provider.dart';
import '../entity/pos/entity.dart';
import '../module/list_all_receipt/bloc/list_all_receipt_bloc.dart';
import '../util/helper/rest_api.dart';

class TransactionRepository with DatabaseProvider {
  final log = Logger('TransactionRepository');

  final RestApiClient restClient;

  TransactionRepository({required this.restClient});

  Future<TransactionHeaderEntity> createNewSale(
      TransactionHeaderEntity header) async {
    await db.writeTxn(() async {
      header.lastChangedAt = DateTime.now();
      header.syncState = 100;
      await db.transactionHeaderEntitys.put(header);
    });
    return header;
  }

  Future<TransactionHeaderEntity?> getTransaction(String id) async {
    TransactionHeaderEntity? order = await db.transactionHeaderEntitys.getByTransId(id);
    if (order != null) {
      return order;
    }
    return null;
  }

  // @TODO
  Future<List<TransactionLineItemEntity>> getLineItemWithOriginalTransactionNo(
      String id) async {
    // db.transactionHeaderEntitys.where().returnRefElementEqualTo
    // var order = await db.transactionHeaderEntitys.where().lineItemsProperty().originalTransSeqProperty().equalTo(id).findAll();
    return [];
  }

  Future<List<TransactionHeaderEntity>> searchTransaction(
      TransactionFilterCriteria criteria) async {

    DateTime start = criteria.dateRange?.start ??
        DateTime.now().subtract(const Duration(days: 60));
    DateTime end = criteria.dateRange?.end ?? DateTime.now();

    var query = db.transactionHeaderEntitys;

    QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity,
        QAfterWhereClause>? whereQuery;
    if (criteria.search != null && criteria.search!.isNotEmpty) {
      whereQuery = query.where().transIdEqualTo(criteria.search!).or().transIdStartsWith(criteria.search!);
    }

    if (criteria.status != null) {
      if (whereQuery != null) {
        whereQuery = whereQuery.or().statusEqualTo(criteria.status!);
      } else {
        whereQuery = query.where().statusEqualTo(criteria.status!);
      }
    }

    if (criteria.transactionTypes.isNotEmpty) {
      if (whereQuery != null) {
       for(var type in criteria.transactionTypes) {
         whereQuery = whereQuery!.or().transactionTypeEqualTo(type);
       }
      } else {
        bool first = true;
        for(var type in criteria.transactionTypes) {
          if (first) {
            whereQuery = query.where().transactionTypeEqualTo(type);
            first = false;
          } else {
            whereQuery = whereQuery!.or().transactionTypeEqualTo(type);
          }
        }
      }
    }

    QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity,
        QAfterFilterCondition>? filterQuery;
    if (whereQuery != null) {
      filterQuery = whereQuery.filter().businessDateBetween(start, end);
    } else {
      filterQuery = query.filter().businessDateBetween(start, end);
    }


    late QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity, QAfterSortBy> sortQuery;
    switch (criteria.sortBy) {
      case TransactionSortByCriteria.date:
        sortQuery = filterQuery.sortByBusinessDate();
        break;
      case TransactionSortByCriteria.dateDesc:
        sortQuery = filterQuery.sortByBusinessDateDesc();
        break;
      case TransactionSortByCriteria.amount:
        sortQuery = filterQuery.sortByTotal();
        break;
      case TransactionSortByCriteria.amountHighToLow:
        sortQuery = filterQuery.sortByTotalDesc();
        break;
    }
    return sortQuery.offset(criteria.offset).limit(criteria.limit).findAll();
  }
}
