part of 'create_new_receipt_bloc.dart';

@immutable
abstract class CreateNewReceiptEvent {}

class AddItemToReceipt extends CreateNewReceiptEvent {
  final ItemEntity product;

  AddItemToReceipt(this.product);
}

class OnQuantityUpdate extends CreateNewReceiptEvent {
  final TransactionLineItemEntity saleLine;
  final double quantity;
  final String reason;

  OnQuantityUpdate({required this.saleLine, required this.quantity, required this.reason});
}

class OnUnitPriceUpdate extends CreateNewReceiptEvent {
  final TransactionLineItemEntity saleLine;
  final double unitPrice;
  final String reason;

  OnUnitPriceUpdate({required this.saleLine, required this.unitPrice, required this.reason});
}

class OnInitiateNewTransaction extends CreateNewReceiptEvent {
  final String? transSeq;
  final bool isReturn;
  final TableEntity? table;

  OnInitiateNewTransaction({this.transSeq, this.isReturn = false, this.table});
}

class OnCreateNewTransaction extends CreateNewReceiptEvent {}

class OnCustomerPhoneChange extends CreateNewReceiptEvent {
  final String? phone;
  OnCustomerPhoneChange({this.phone});
}

class OnCustomerSelect extends CreateNewReceiptEvent {
  final ContactEntity contact;
  OnCustomerSelect(this.contact);
}

class OnAddNewTenderLine extends CreateNewReceiptEvent {
  final String tenderType;
  final double amount;

  OnAddNewTenderLine({required this.tenderType, required this.amount });
}

class OnChangeSaleStep extends CreateNewReceiptEvent {
  final SaleStep step;

  OnChangeSaleStep(this.step);
}

class _VerifyOrderAndEmitState extends CreateNewReceiptEvent {}

class OnReturnLineItemEvent extends CreateNewReceiptEvent {
  final Map<TransactionLineItemEntity, ReturnLineItemParameters> returnMap;
  OnReturnLineItemEvent(this.returnMap);
}

class OnApplyLineItemDiscountAmount extends CreateNewReceiptEvent {
  final TransactionLineItemEntity saleLine;
  final String reason;
  final double discountAmount;
  OnApplyLineItemDiscountAmount({required this.saleLine, required this.discountAmount, required this.reason,});
}

class OnApplyLineItemDiscountPercent extends CreateNewReceiptEvent {
  final TransactionLineItemEntity saleLine;
  final String reason;
  final double discountPercent;
  OnApplyLineItemDiscountPercent({required this.saleLine, required this.discountPercent, required this.reason,});
}

class OnChangeLineItemTaxAmount extends CreateNewReceiptEvent {
  final TransactionLineItemEntity saleLine;
  final String reason;
  final double taxAmount;
  OnChangeLineItemTaxAmount({required this.saleLine, required this.taxAmount, required this.reason,});
}

class OnChangeLineItemTaxPercent extends CreateNewReceiptEvent {
  final TransactionLineItemEntity saleLine;
  final String reason;
  final double taxPercent;
  OnChangeLineItemTaxPercent({required this.saleLine, required this.taxPercent, required this.reason,});
}

class OnCustomerRemove extends CreateNewReceiptEvent {}

class OnChangeCustomerBillingAddress extends CreateNewReceiptEvent {
  final Address address;
  OnChangeCustomerBillingAddress(this.address);
}

class OnChangeCustomerShippingAddress extends CreateNewReceiptEvent {
  final Address address;
  OnChangeCustomerShippingAddress(this.address);
}

class OnSuspendTransaction extends CreateNewReceiptEvent {}

class OnCancelTransaction extends CreateNewReceiptEvent {}

class OnLineItemVoid extends CreateNewReceiptEvent {
  final TransactionLineItemEntity saleLine;
  OnLineItemVoid({required this.saleLine});
}

class OnTenderLineVoid extends CreateNewReceiptEvent {
  final TransactionPaymentLineItemEntity tenderLine;
  OnTenderLineVoid({required this.tenderLine});
}

class OnPartialPayment extends CreateNewReceiptEvent {}

class InitiateReturn extends CreateNewReceiptEvent {}