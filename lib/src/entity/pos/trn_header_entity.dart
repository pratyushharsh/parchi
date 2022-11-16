import 'package:isar/isar.dart';

import 'address.dart';
import 'entity.dart';

part 'trn_header_entity.g.dart';

@Collection()
class TransactionHeaderEntity {
  final Id transId;

  final int storeId;
  final String storeLocale;
  final String storeCurrency;
  final String transactionType;
  final DateTime businessDate;
  final DateTime beginDatetime;
  DateTime? endDateTime;
  double total;
  double taxTotal;
  double subtotal;
  double discountTotal;
  double roundTotal;
  String status;
  bool isVoid;

  @Index()
  String? customerId;

  @Index()
  String? customerPhone;

  Address? shippingAddress;

  Address? billingAddress;
  String? customerName;

  @Index(type: IndexType.value)
  DateTime? lastChangedAt;

  @Index(type: IndexType.value)
  DateTime? lastSyncAt;

  @Index(type: IndexType.value)
  int? syncState;

  final String? associateId;
  final String? associateName;
  final String? notes;

  List<TransactionLineItemEntity> lineItems;
  List<TransactionPaymentLineItemEntity> paymentLineItems;

  // final lineItems = IsarLinks<TransactionLineItemEntity>();
  // final paymentLineItems = IsarLinks<TransactionPaymentLineItemEntity>();

  TransactionHeaderEntity(
      {required this.transId,
      required this.storeId,
      required this.storeLocale,
      required this.storeCurrency,
      required this.businessDate,
      required this.beginDatetime,
      required this.transactionType,
      this.endDateTime,
      this.isVoid = false,
      required this.total,
      required this.taxTotal,
      required this.subtotal,
      required this.roundTotal,
      required this.discountTotal,
      required this.status,
      this.lineItems = const [],
      this.paymentLineItems = const [],
      this.customerId,
      this.customerPhone,
      this.shippingAddress,
      this.billingAddress,
      this.customerName,
      this.notes,
      this.lastChangedAt,
      this.lastSyncAt,
      this.syncState,
      this.associateId,
      this.associateName});
}
