class SyncDataRequest {
  final List<Map<String, dynamic>>? products;
  final List<Map<String, dynamic>>? transactions;
  final List<Map<String, dynamic>>? customers;

  SyncDataRequest({this.products, this.transactions, this.customers});

  Map<String, dynamic> toMap() {
    return {
      "product": products,
      "transaction": transactions,
      "customers": customers
    };
  }
}

class ImportDataFromServer {
  final String storeId;
  final String type;
  String? lastSyncAt;

  ImportDataFromServer({
    required this.storeId,
    required this.type,
    this.lastSyncAt
  });

  Map<String, dynamic> toMap() {
    return {
      'store_id': storeId,
      'type': type,
      'last_sync_at': lastSyncAt,
    };
  }
}