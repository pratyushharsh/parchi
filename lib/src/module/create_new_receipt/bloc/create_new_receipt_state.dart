part of 'create_new_receipt_bloc.dart';

enum CreateNewReceiptStatus {
  initial,
  created,

  inProgress,

  saleError,
  saleComplete,
  paymentAwaiting,

  quantityUpdate,
  priceUpdate,
  discountUpdate,

  loading,
  success,
  error
}

enum CustomerAction { remove, add }

enum SaleStep { item, payment, customer, complete, printAndEmail, confirmed }

class CustomerAddress {
  final Address? shippingAddress;
  final Address? billingAddress;

  const CustomerAddress({this.shippingAddress, this.billingAddress});

  CustomerAddress copyWith(
      {Address? shippingAddress, Address? billingAddress}) {
    return CustomerAddress(
      shippingAddress: shippingAddress ?? this.shippingAddress,
      billingAddress: billingAddress ?? this.billingAddress,
    );
  }
}

class CreateNewReceiptState extends Equatable {
  final String transSeq;
  final bool inProgress;
  final TransactionHeaderEntity? transactionHeader;
  final List<TransactionLineItemEntity> lineItem;
  final List<TransactionPaymentLineItemEntity> tenderLine;
  final Map<String, ProductEntity> productMap;
  final ContactEntity? customer;
  final CreateNewReceiptStatus status;
  final CustomerAddress? customerAddress;
  final SaleStep step;

  const CreateNewReceiptState({
    this.transSeq = '',
    this.inProgress = false,
    this.lineItem = const [],
    this.transactionHeader,
    this.tenderLine = const [],
    this.productMap = const {},
    required this.status,
    this.step = SaleStep.item,
    this.customer,
    this.customerAddress,
  }): assert(transSeq != '' ? transactionHeader != null : true);

  bool get isCustomerPresent {
    return customer != null;
  }

  double get total {
    return lineItem.fold(
        0.0, (previousValue, element) => previousValue + (!element.isVoid ? element.grossAmount! : 0.0));
  }

  double get subTotal {
    return lineItem.fold(
        0.0, (previousValue, element) => previousValue + (!element.isVoid ? element.netAmount! : 0.0));
  }

  double get discount {
    return lineItem.fold(0.0,
        (previousValue, element) => previousValue + (!element.isVoid ? element.discountAmount! : 0.0));
  }

  double get tax {
    return lineItem.fold(
        0.0, (previousValue, element) => previousValue + (!element.isVoid ? element.taxAmount! : 0.0));
  }

  double get items {
    return lineItem.fold(
        0.0, (previousValue, element) => previousValue + (!element.isVoid ? element.quantity! : 0.0));
  }

  double get paidAmount {
    return tenderLine.fold(
        0.0, (previousValue, element) => previousValue + (!element.isVoid ? element.amount! : 0.0));
  }

  double get amountDue {
    return total - paidAmount - roundedAmount;
  }

  double get roundedAmount {
    var rawAmount = total - paidAmount;
    var roundedAmount = (rawAmount * 100).roundToDouble() / 100;
    return (total - paidAmount) - roundedAmount;
  }

  @override
  List<Object?> get props => [
        transactionHeader,
        lineItem,
        transSeq,
        status,
        productMap,
        step,
        tenderLine,
        customer,
        customerAddress,
      ];

  CreateNewReceiptState copyWith({
    String? transSeq,
    bool? inProgress,
    TransactionHeaderEntity? transactionHeader,
    List<TransactionLineItemEntity>? lineItem,
    List<TransactionPaymentLineItemEntity>? tenderLine,
    ContactEntity? customer,
    Map<String, ProductEntity>? productMap,
    CreateNewReceiptStatus? status,
    SaleStep? step,
    CustomerAction? customerAction,
    CustomerAddress? customerAddress,
  }) {
    return CreateNewReceiptState(
      transSeq: transSeq ?? this.transSeq,
      inProgress: inProgress ?? this.inProgress,
      transactionHeader: transactionHeader ?? this.transactionHeader,
      lineItem: lineItem ?? this.lineItem,
      tenderLine: tenderLine ?? this.tenderLine,
      productMap: productMap ?? this.productMap,
      customer: customerAction != null
          ? (CustomerAction.remove == customerAction
              ? null
              : (customer ?? this.customer))
          : (customer ?? this.customer),
      status: status ?? this.status,
      step: step ?? this.step,
      customerAddress: customerAddress ?? this.customerAddress,
    );
  }
}
