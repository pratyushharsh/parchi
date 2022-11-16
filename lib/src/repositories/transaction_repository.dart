
import 'package:logging/logging.dart';

import '../database/db_provider.dart';
import '../entity/pos/entity.dart';
import '../util/helper/rest_api.dart';

class TransactionRepository with DatabaseProvider {
  final log = Logger('TransactionRepository');

  final RestApiClient restClient;

  TransactionRepository({required this.restClient });

  Future<TransactionHeaderEntity> createNewSale(TransactionHeaderEntity header) async {
    await db.writeTxn(() async {
      header.lastChangedAt = DateTime.now();
      header.syncState = 100;
      await db.transactionHeaderEntitys.put(header);
    });
    return header;
  }

  Future<TransactionHeaderEntity?> getTransaction(int id) async {
    TransactionHeaderEntity? order = await db.transactionHeaderEntitys.get(id);
    if (order != null) {
      return order;
    }
    return null;
  }

  // @TODO
  Future<List<TransactionLineItemEntity>> getLineItemWithOriginalTransactionNo(int id) async {
    // var order = await db.transactionHeaderEntitys.where().lineItemsProperty().originalTransSeqProperty().equalTo(id).findAll();
    return [];
  }
}