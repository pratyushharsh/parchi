import 'package:isar/isar.dart';
import 'package:logging/logging.dart';

import '../database/db_provider.dart';
import '../entity/pos/entity.dart';
import '../module/all_customer/bloc/all_customer_bloc.dart';
import '../util/helper/rest_api.dart';

class CustomerRepository with DatabaseProvider {
  final log = Logger('CustomerRepository');

  final RestApiClient restClient;

  CustomerRepository({required this.restClient});

  Future<void> createOrUpdateCustomer(ContactEntity customer) async {
    try {
      db.writeTxn(() => db.contactEntitys.putByContactId(customer));
    } catch (e) {
      log.severe(e);
    }
  }

  Future<ContactEntity?> getCustomerById(String customerId) async {
    try {
      var data = await db.contactEntitys
          .where()
          .contactIdEqualTo(customerId)
          .findFirst();
      return data;
    } catch (e) {
      log.severe(e);
    }
    return null;
  }

  Future<List<TransactionHeaderEntity>> getPurchaseListByCustomerId(
      String customerId) {
    return db.transactionHeaderEntitys
        .where()
        .customerIdEqualTo(customerId)
        .sortByBusinessDateDesc()
        .findAll();
  }

  Future<List<ContactEntity>> searchCustomer(
      CustomerSearchFilter filter) async {
    var query = db.contactEntitys.where();

    QueryBuilder<ContactEntity, ContactEntity, QAfterFilterCondition>?
        queryBuilder;

    if (filter.searchQuery.isNotEmpty) {
      queryBuilder = db.contactEntitys
          .filter()
          .firstNameContains(filter.searchQuery)
          .or()
          .lastNameContains(filter.searchQuery)
          .or()
          .emailContains(filter.searchQuery)
          .or()
          .phoneNumberEqualTo(filter.searchQuery);
    }

    QueryBuilder<ContactEntity, ContactEntity, QAfterSortBy> sortByQuery;
    if (queryBuilder != null) {
      switch(filter.sortBy) {
        case CustomerFilterSortBy.name:
          sortByQuery = queryBuilder.sortByFirstName();
          break;
        case CustomerFilterSortBy.nameDesc:
          sortByQuery = queryBuilder.sortByFirstNameDesc();
          break;
        case CustomerFilterSortBy.date:
          sortByQuery = queryBuilder.sortByCreateTime();
          break;
        case CustomerFilterSortBy.dateDesc:
          sortByQuery = queryBuilder.sortByCreateTimeDesc();
          break;
      }
    } else {
      switch(filter.sortBy) {
        case CustomerFilterSortBy.name:
          sortByQuery = query.sortByFirstName();
          break;
        case CustomerFilterSortBy.nameDesc:
          sortByQuery = query.sortByFirstNameDesc();
          break;
        case CustomerFilterSortBy.date:
          sortByQuery = query.sortByCreateTime();
          break;
        case CustomerFilterSortBy.dateDesc:
          sortByQuery = query.sortByCreateTimeDesc();
          break;
      }
    }
    return sortByQuery.offset(filter.offset).limit(filter.limit).findAll();
  }
}
