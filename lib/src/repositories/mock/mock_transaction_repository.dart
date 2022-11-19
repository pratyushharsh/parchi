import 'package:isar/isar.dart';


import '../../entity/pos/address.dart';
import '../../entity/pos/entity.dart';
import '../../util/helper/rest_api.dart';
import '../transaction_repository.dart';

class MockTransactionRepository extends TransactionRepository {
  MockTransactionRepository(
      {required RestApiClient restClient})
      : super(restClient: restClient);

  @override
  Future<TransactionHeaderEntity> createNewSale(TransactionHeaderEntity header) async {
    throw UnimplementedError('Cannot Implement in the Mock Interface');
  }

  @override
  Future<TransactionHeaderEntity?> getTransaction(String id) async {

    var pi = List<int>.generate(5, (index) => index + 1).map((e) => TransactionPaymentLineItemEntity(
      transId: '8721',
      isVoid: false,
      tenderId: "CASH",
      currencyId: "INR",
      beginDate: DateTime.now(),
      endDate: DateTime.now(),
      amount: 100.0,
      paymentSeq: e,
      authCode: "7852387632",
      tenderStatusCode: "APPROVED",
    )).toList();

    var li =  List<int>.generate(10, (i) => i + 1).map((e) {
      var t = TransactionLineItemEntity(
        unitCost: 100,
        itemIdEntryMethod: EntryMethod.keyboard,
        itemId: 'TEST00001',
        transSeq: '1000',
        lineItemSeq: e,
        itemDescription: 'Test Item',
        quantity: 5,
        unitPrice: 20,
        extendedAmount: 100,
        netAmount: 128,
        grossAmount: 100,
        hsn: '1234$e',
        uom: 'EA',
        priceOverride: false,
        priceOverrideAmount: null,
        priceOverrideReason: null,
        returnedQuantity: null,
        isVoid: false,
        originalPosId: null,
        originalTransSeq: null,
        originalLineItemSeq: null,
        originalBusinessDate: null,
        returnReasonCode: null,
        returnComment: null,
        returnTypeCode: null,
        nonReturnableFlag: false,
        nonExchangeableFlag: false,
        baseUnitPrice: 100,
        storeId: 99999,
        businessDate: DateTime.now(),
        posId: 99999,
        category: 'Test',
        taxAmount: 28.00,
        priceEntryMethod: 'Keyboard',
        serialNumber: null,
        discountAmount: 0.00,
        returnFlag: false,
      );

      TransactionLineItemTaxModifier cgst = TransactionLineItemTaxModifier(
        transSeq: '1000',
        lineItemSeq: 1,
        authorityId: 'GST',
        authorityName: 'INGST',
        authorityType: 'INGST',
        taxGroupId: 'GST28',
        taxRuleId: 'CGST',
        taxRuleName: 'CGST 14%',
        taxableAmount: 100,
        taxAmount: 28,
        taxPercent: 28,
        originalTaxableAmount: 100,
        rawTaxPercentage: 28,
        rawTaxAmount: 28,
        taxOverride: false,
        taxOverrideAmount: null,
        taxOverridePercent: null,
      );
      TransactionLineItemTaxModifier sgst = TransactionLineItemTaxModifier(
        transSeq: '1000',
        lineItemSeq: 1,
        authorityId: 'GST',
        authorityName: 'INGST',
        authorityType: 'INGST',
        taxGroupId: 'GST28',
        taxRuleId: 'CGST',
        taxRuleName: 'CGST 14%',
        taxableAmount: 100,
        taxAmount: 28,
        taxPercent: 28,
        originalTaxableAmount: 100,
        rawTaxPercentage: 28,
        rawTaxAmount: 28,
        taxOverride: false,
        taxOverrideAmount: null,
        taxOverridePercent: null,
      );
      t.taxModifiers = [cgst, sgst];
      return t;
    }).toList();

    TransactionHeaderEntity header = TransactionHeaderEntity(
      transId: '1000',
      storeId: 99999,
      storeCurrency: 'INR',
      storeLocale: 'en_IN',
      businessDate: DateTime.now(),
      beginDatetime: DateTime.now(),
      transactionType: TransactionType.sale,
        endDateTime: DateTime.now(),
      isVoid: false,
      shippingAddress: Address(
        address1: 'Test Address',
        address2: 'Test Address',
        city: 'Test City',
        state: 'Test State',
        country: 'Test Country',
        zipcode: '123456',
      ),
      billingAddress: Address(
        address1: 'Test Billing Line 1',
        address2: 'Billing Line 2',
        city: 'Test City',
        state: 'Test State',
        country: 'Test Country',
        zipcode: '123456',
      ),
      total: 128,
      taxTotal: 28,
      subtotal: 100,
      roundTotal: 0.00,
      discountTotal: 0.00,
      status: TransactionStatus.completed,
    );
    header.lineItems = li;
    header.paymentLineItems = pi;

    return header;
  }

  @override
  Future<List<TransactionLineItemEntity>> getLineItemWithOriginalTransactionNo(
      String id) async {
    throw UnimplementedError('Cannot Implement in the Mock Interface');
  }
}
