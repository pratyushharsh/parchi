import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'package:meta/meta.dart';

import '../../../config/sequence_config.dart';
import '../../../entity/pos/address.dart';
import '../../../entity/pos/entity.dart';
import '../../../entity/pos/table_entity.dart';
import '../../../pos/calculator/deals_calculator.dart';
import '../../../pos/calculator/price_calculator.dart';
import '../../../pos/calculator/tax_calculator.dart';
import '../../../pos/calculator/total_calculator.dart';
import '../../../pos/config/config.dart';
import '../../../pos/helper/deals_helper.dart';
import '../../../pos/helper/pos_helper.dart';
import '../../../pos/helper/price_helper.dart';
import '../../../repositories/repository.dart';
import '../../../repositories/table_repository.dart';
import '../../authentication/bloc/authentication_bloc.dart';
import '../../error/bloc/error_notification_bloc.dart';
import '../../return_order/bloc/return_order_bloc.dart';

part 'create_new_receipt_event.dart';
part 'create_new_receipt_state.dart';

class CreateNewReceiptBloc
    extends Bloc<CreateNewReceiptEvent, CreateNewReceiptState>
    with SequenceConfig {
  final log = Logger('CreateNewReceiptBloc');
  final AuthenticationBloc authenticationBloc;
  final SequenceRepository sequenceRepository;
  final TransactionRepository transactionRepository;
  final ProductRepository productRepository;
  final CustomerRepository customerRepository;
  final TableRepository tableRepository;
  final ErrorNotificationBloc errorNotificationBloc;
  final TaxHelper taxHelper;
  final PriceHelper priceHelper;
  final DiscountHelper discountHelper;
  final DealsHelper dealsHelper;

  final TaxModifierCalculator taxModifierCalculator;
  final PriceCalculator priceCalculator;
  final TotalCalculator totalCalculator;
  final DealsCalculator dealsCalculator;

  CreateNewReceiptBloc(
      {required this.transactionRepository,
      required this.authenticationBloc,
      required this.productRepository,
      required this.customerRepository,
      required this.tableRepository,
      required this.taxHelper,
      required this.priceHelper,
      required this.discountHelper,
      required this.sequenceRepository,
      required this.errorNotificationBloc,
      required this.taxModifierCalculator,
      required this.dealsHelper,
      required this.priceCalculator,
      required this.totalCalculator,
      required this.dealsCalculator})
      : super(const CreateNewReceiptState(
            status: CreateNewReceiptStatus.initial)) {
    on<AddItemToReceipt>(_onAddNewLineItem);
    on<OnQuantityUpdate>(_onQuantityUpdate);
    on<OnUnitPriceUpdate>(_onPriceUpdate);
    on<OnApplyLineItemDiscountAmount>(_onLineItemDiscountAmount);
    on<OnApplyLineItemDiscountPercent>(_onLineItemDiscountPercent);
    on<OnChangeLineItemTaxAmount>(_onChangeLineItemTaxAmount);
    on<OnChangeLineItemTaxPercent>(_onChangeLineItemTaxPercent);
    on<OnInitiateNewTransaction>(_onInitiateTransaction);
    on<OnCreateNewTransaction>(_onCreateNewTransaction);
    on<OnCustomerSelect>(_onCustomerSelectEvent);
    on<OnCustomerRemove>(_onCustomerRemoveEvent);
    on<OnAddNewTenderLine>(_onAddNewTenderLineItem);
    on<OnChangeSaleStep>(_onChangeSaleStep);
    on<_VerifyOrderAndEmitState>(_onVerifyOrderAndEmitStep);
    on<OnReturnLineItemEvent>(_onReturnLineItem);
    on<OnChangeCustomerBillingAddress>(_onChangeCustomerBillingAddress);
    on<OnChangeCustomerShippingAddress>(_onChangeCustomerShippingAddress);
    on<OnSuspendTransaction>(_onSuspendTransaction);
    on<OnCancelTransaction>(_onCancelTransaction);
    on<OnLineItemVoid>(_onLineItemVoid);
    on<OnTenderLineVoid>(_onTenderLineVoid);
    on<OnPartialPayment>(_onPartialPayment);
    on<OnAdditionalLineModifierChange>(_onAdditionalLineModifierChange);
  }

  void _onInitiateTransaction(OnInitiateNewTransaction event,
      Emitter<CreateNewReceiptState> emit) async {
    emit(state.copyWith(table: event.table,));

    if (event.transSeq != null) {
      final transaction =
          await transactionRepository.getTransaction(event.transSeq!);

      if (transaction != null) {
        Map<String, ItemEntity> pm = Map.from(state.productMap);

        for (final lineItem in transaction.lineItems) {
          final product =
              await productRepository.getProductById(lineItem.itemId!);
          if (product != null) {
            pm[product.productId!] = product;
          }
        }

        // Fetch Customer if present
        ContactEntity? customer;
        if (transaction.customerId != null) {
          customer =
              await customerRepository.getCustomerById(transaction.customerId!);
        }

        emit(state.copyWith(
          transSeq: transaction.transId,
          transactionHeader: transaction,
          lineItem: transaction.lineItems,
          tenderLine: transaction.paymentLineItems,
          step: SaleStep.item,
          status: CreateNewReceiptStatus.initial,
          productMap: pm,
          customerAddress: CustomerAddress(
            billingAddress: transaction.billingAddress,
            shippingAddress: transaction.shippingAddress,
          ),
          customer: customer,
        ));
        return;
      }
    }

    if (event.isReturn) {
      emit(state.copyWith(
        isReturn: true,
      ));
    }
  }

  void _onAddNewLineItem(
      AddItemToReceipt event, Emitter<CreateNewReceiptState> emit) async {

    // @TODO Check if the header is created otherwise create new transaction header
    if (state.transactionHeader == null) {
      var header = await _createNewTransactionHeader();
      emit(state.copyWith(transactionHeader: header, transSeq: header.transId));
    }

    int seq = state.lineItem.length;

    RetailLocationEntity? store = authenticationBloc.state.store;
    if (store == null) throw Exception("Store Not Found");

    // @TODO Change the business date from DateTime.now() to actual business date.
    // @TODO Change the pos id also
    // @TODO Change the entry method also
    // @TODO Fetch the price from pricing module for the item and add.

    // Check if item already exist then increase the quantity
    // for (final lineItem in state.lineItem) {
    //   if (lineItem.itemId == event.product.productId) {
    //     add(OnQuantityUpdate(
    //       saleLine: lineItem,
    //       quantity: lineItem.quantity! + 1,
    //       reason: '',
    //     ));
    //     return;
    //   }
    // }

    try {

      double itemPrice = 0.00;
      TransactionLineItemEntity newLine = TransactionLineItemEntity(
          storeId: authenticationBloc.state.store!.rtlLocId,
          businessDate: DateTime.now(),
          posId: 1,
          currency: store.currencyId,
          transSeq: state.transSeq,
          lineItemSeq: seq + 1,
          itemId: event.product.productId,
          itemDescription: event.product.displayName,
          itemSize: event.product.size,
          itemColor: event.product.color,
          quantity: 1,
          uom: event.product.uom,
          hsn: event.product.hsn,
          itemIdEntryMethod: EntryMethod.keyboard,
          priceEntryMethod: EntryMethod.keyboard,
          unitPrice: itemPrice,
          baseUnitPrice: itemPrice,
          discountAmount: 0.0,
          netAmount: itemPrice * 1,
          grossAmount: itemPrice,
          taxAmount: 0.00,
          extendedAmount: itemPrice * 1,
          taxGroupId: event.product.taxGroupId,
          unitCost: 0.0,
      );

      List<TransactionLineItemEntity> newList = [...state.lineItem, newLine];

      // Price Calculator
      newList = await priceCalculator.handleLineItemEvent(newList);

      // Deals Calculator
      newList = await dealsCalculator.handleLineItemEvent(newList);

      // Discount Calculator

      // Tax Calculator
      newList = await taxModifierCalculator.handleLineItemEvent(newList);

      // Total Calculator
      newList = await totalCalculator.handleLineItemEvent(newList);

      Map<String, ItemEntity> pm = Map.from(state.productMap);
      pm.putIfAbsent(event.product.productId, () => event.product);
      emit(state.copyWith(
          lineItem: newList,
          step: SaleStep.item,
          productMap: pm,
          inProgress: true));
      add(_VerifyOrderAndEmitState());
    } catch (e, st) {
      log.severe(e, e, st);
      errorNotificationBloc.add(ErrorEvent(e.toString()));
    }
  }

  // Create a transaction header if this is a new transaction.
  Future<TransactionHeaderEntity> _createNewTransactionHeader() async {
    RetailLocationEntity? store = authenticationBloc.state.store;
    if (store == null) throw Exception("Store Not Found");

    // @TODO Generate New Sequence.
    var newTransactionSequence =
        (await sequenceRepository.getNextSequence(SequenceType.transaction));
    var nextSeq = generateSequence(newTransactionSequence);

    var currentEmployee = authenticationBloc.state.employee;
    TransactionHeaderEntity header = TransactionHeaderEntity(
        transId: nextSeq,
        businessDate: DateTime.now(),
        beginDatetime: DateTime.now(),
        storeCurrency: store.currencyId ?? 'INR',
        storeLocale: store.locale ?? 'en_IN',
        storeId: store.rtlLocId,
        transactionType: TransactionType.sale,
        total: 0.0,
        taxTotal: 0.0,
        subtotal: 0.0,
        roundTotal: 0.00,
        discountTotal: 0.00,
        status: TransactionStatus.created,
        associateId: currentEmployee!.employeeId,
        associateName:
            '${currentEmployee.firstName} ${currentEmployee.lastName}',
        locked: true);

    try {
      TransactionHeaderEntity trn = await transactionRepository.createNewSale(header);
      return trn;
    } catch (e, st) {
      log.severe(e, e, st);
      throw Exception("Error creating new transaction");
    }
  }

  // @TODO List different transaction status INITIATED, SALE_COMPLETED, SUSPENDED, CANCELLED, RETURNED, EXCHANGED
  Future<TransactionHeaderEntity> _manageOrder(TransactionStatus status) async {
    TransactionHeaderEntity transaction = state.transactionHeader!;

    transaction.total = state.total;
    transaction.taxTotal = state.tax;
    transaction.subtotal = state.subTotal;
    transaction.roundTotal = 0.0;
    transaction.discountTotal = 0.0;

    // Set the status of the transaction
    transaction.status = status;

    // Set the end date time of the transaction
    transaction.endDateTime = DateTime.now();

    // Set the associate id and name
    // transaction.associateId = currentEmployee!.employeeId;
    // transaction.associateName =
    //     '${currentEmployee.firstName} ${currentEmployee.lastName}';

    // Set Customer and its address
    if (state.customer != null) {
      transaction.customerId = state.customer?.contactId;
      transaction.customerName =
          '${state.customer?.firstName} ${state.customer?.lastName}';
    }

    transaction.shippingAddress = state.customerAddress?.shippingAddress;
    transaction.billingAddress = state.customerAddress?.billingAddress;

    List<TransactionLineItemEntity> lineItems = state.lineItem;
    transaction.lineItems = lineItems;
    transaction.paymentLineItems = state.tenderLine;

    double discountAmount =
        discountHelper.calculateTransactionDiscountTotal(transaction);
    double taxAmount = taxHelper.calculateTransactionTaxAmount(transaction);

    transaction.discountTotal = discountAmount;
    transaction.taxTotal = taxAmount;

    List<String> returnLine = [];
    // Find all line item that is returned
    


    // Create If Contact Does not exist else override
    if (state.customer != null) {
      try {
        await customerRepository.createOrUpdateCustomer(state.customer!);
      } catch (e) {
        log.severe(e);
      }
    }

    // Release lock
    transaction.locked = false;

    try {
      TransactionHeaderEntity trn = await transactionRepository.createNewSale(transaction);
      if (state.table != null) {
        state.table!.status = TableStatus.occupied;
        state.table!.orderId = trn.transId;
        state.table!.associateId = trn.associateId;
        state.table!.associateName = trn.associateName;
        state.table!.orderTime = trn.beginDatetime;
        state.table!.customerId = trn.customerId;
        state.table!.customerName = trn.customerName;

        if (status == TransactionStatus.completed || status == TransactionStatus.cancelled) {
          state.table!.status = TableStatus.available;
          state.table!.orderId = null;
          state.table!.associateId = null;
          state.table!.associateName = null;
          state.table!.orderTime = null;
          state.table!.customerId = null;
          state.table!.customerName = null;
        }
        await tableRepository.reserveTable(state.table!);
      }
      return trn;
    } catch (e, st) {
      log.severe(e, e, st);
      throw Exception("Error creating Transaction");
    }
  }

  void _onCreateNewTransaction(
      OnCreateNewTransaction event, Emitter<CreateNewReceiptState> emit) async {
    try {
      var txn = await _manageOrder(TransactionStatus.completed);
      emit(state.copyWith(
          transactionHeader: txn,
          status: CreateNewReceiptStatus.saleComplete,
          step: SaleStep.printAndEmail,
        inProgress: false
      ));
    } catch (e, st) {
      log.severe(e, e, st);
      emit(state.copyWith(status: CreateNewReceiptStatus.error));
    }
  }

  void _onSuspendTransaction(
      OnSuspendTransaction event, Emitter<CreateNewReceiptState> emit) async {
    try {
      var txn = await _manageOrder(TransactionStatus.suspended);
      emit(state.copyWith(
          transactionHeader: txn,
          status: CreateNewReceiptStatus.saleComplete,
          step: SaleStep.confirmed,
        inProgress: false,
      ));
    } catch (e) {
      log.severe(e);
      emit(state.copyWith(status: CreateNewReceiptStatus.error));
    }
  }

  void _onCancelTransaction(
      OnCancelTransaction event, Emitter<CreateNewReceiptState> emit) async {
    // Check if any tender not voided is present.
    if (state.tenderLine.any((element) => !element.isVoid)) {
      errorNotificationBloc
          .add(ErrorEvent("Please Void all Tender to cancel the transaction."));
      return;
    }

    try {
      var txn = await _manageOrder(TransactionStatus.cancelled);
      emit(state.copyWith(
          transactionHeader: txn,
          status: CreateNewReceiptStatus.saleComplete,
          step: SaleStep.confirmed, inProgress: false,));
    } catch (e) {
      log.severe(e);
      emit(state.copyWith(status: CreateNewReceiptStatus.error));
    }
  }

  void _onPartialPayment(
      OnPartialPayment event, Emitter<CreateNewReceiptState> emit) async {
    try {
      var txn = await _manageOrder(TransactionStatus.partialPayment);
      emit(state.copyWith(
          transactionHeader: txn,
          status: CreateNewReceiptStatus.saleComplete,
          step: SaleStep.confirmed, inProgress: false,));
    } catch (e) {
      log.severe(e);
      emit(state.copyWith(status: CreateNewReceiptStatus.error));
    }
  }

  void _onCustomerSelectEvent(
      OnCustomerSelect event, Emitter<CreateNewReceiptState> emit) async {
    emit(state.copyWith(
        customer: event.contact,
        customerAddress: CustomerAddress(
            billingAddress: event.contact.billingAddress,
            shippingAddress: event.contact.shippingAddress),
        inProgress: true));
  }

  void _onCustomerRemoveEvent(
      OnCustomerRemove event, Emitter<CreateNewReceiptState> emit) async {
    emit(state.copyWith(
        customer: null,
        customerAction: CustomerAction.remove,
        inProgress: true));
  }

  void _onQuantityUpdate(
      OnQuantityUpdate event, Emitter<CreateNewReceiptState> emit) async {
    emit(state.copyWith(status: CreateNewReceiptStatus.quantityUpdate));
    List<TransactionLineItemEntity> newList = [];
    for (var line in state.lineItem) {
      if (line == event.saleLine) {
        TransactionLineItemEntity newLine = line;

        newLine.extendedAmount = event.quantity * newLine.unitPrice!;
        newLine.quantity = event.quantity;
        // Find if any existing modifier is there.
        discountHelper.updateUnitPriceOnDiscountQuantityChange(
            newLine, event.quantity);

        double discountAmount = discountHelper.calculateDiscountAmount(line);
        newLine.discountAmount = discountAmount;
        newLine.netAmount = newLine.extendedAmount! - discountAmount;

        for (var line in newLine.taxModifiers) {
          line.taxableAmount = newLine.netAmount;
          line.originalTaxableAmount = newLine.netAmount;
        }
        await taxModifierCalculator.handleLineItemEvent([newLine]);
        double taxAmount = taxHelper.calculateTaxAmount(newLine);
        newLine.taxAmount = taxAmount;
        newLine.grossAmount = newLine.netAmount! + taxAmount;
        newList.add(newLine);
      } else {
        newList.add(line);
      }
    }
    emit(state.copyWith(
        lineItem: newList,
        status: CreateNewReceiptStatus.inProgress,
        inProgress: true));
  }

  void _onPriceUpdate(
      OnUnitPriceUpdate event, Emitter<CreateNewReceiptState> emit) async {
    emit(state.copyWith(status: CreateNewReceiptStatus.quantityUpdate));
    List<TransactionLineItemEntity> newList = [];
    for (var line in state.lineItem) {
      if (line == event.saleLine) {
        TransactionLineItemEntity newLine = line;
        newLine.priceOverride = true;
        newLine.unitPrice = event.unitPrice;
        newLine.priceOverrideReason = event.reason;
        newLine.extendedAmount = event.unitPrice * newLine.quantity!;
        newLine.netAmount = newLine.extendedAmount;

        for (var line in newLine.taxModifiers) {
          line.taxableAmount = newLine.netAmount;
        }

        // newLine.lineModifiers.removeAll(modifier);
        newLine.discountAmount = 0.0;

        // Recalculating the tax ans net amount
        await taxModifierCalculator.handleLineItemEvent([newLine]);
        double taxAmount = taxHelper.calculateTaxAmount(newLine);
        newLine.taxAmount = taxAmount;
        newLine.grossAmount = newLine.netAmount! + taxAmount;
        newList.add(newLine);
      } else {
        newList.add(line);
      }
    }
    emit(state.copyWith(
        lineItem: newList,
        status: CreateNewReceiptStatus.inProgress,
        inProgress: true));
  }

  void _onLineItemDiscountAmount(OnApplyLineItemDiscountAmount event,
      Emitter<CreateNewReceiptState> emit) async {
    emit(state.copyWith(status: CreateNewReceiptStatus.discountUpdate));
    List<TransactionLineItemEntity> newList = [];
    for (var line in state.lineItem) {
      if (line == event.saleLine) {
        TransactionLineItemEntity newLine = line;
        DiscountEntity discount = DiscountEntity(
            discountId: 'DUMMY_DISCOUNT_ID',
            amount: event.discountAmount,
            discountType: DiscountCalculationMethod.amount.name,
            description: '\$ ${event.discountAmount} OFF',
            discountCode: 'MANUAL_DISCOUNT_CODE');
        TransactionLineItemModifierEntity? discountLine =
            discountHelper.createNewDiscountOverrideLineModifier(
                line, discount, event.reason);

        // Calculate discount amount
        if (discountLine != null) {
          newLine.lineModifiers.add(discountLine);
          double discountAmount = discountHelper.calculateDiscountAmount(line);
          newLine.discountAmount = discountAmount;
          newLine.netAmount = newLine.extendedAmount! - discountAmount;

          for (var line in newLine.taxModifiers) {
            line.taxableAmount = newLine.netAmount;
          }
          await taxModifierCalculator.handleLineItemEvent([newLine]);
          double taxAmount = taxHelper.calculateTaxAmount(newLine);
          newLine.taxAmount = taxAmount;
          newLine.grossAmount = newLine.netAmount! + taxAmount;

          newList.add(newLine);
        } else {
          newList.add(line);
        }
      } else {
        newList.add(line);
      }
    }
    emit(state.copyWith(
        lineItem: newList,
        status: CreateNewReceiptStatus.inProgress,
        inProgress: true));
  }

  void _onLineItemDiscountPercent(OnApplyLineItemDiscountPercent event,
      Emitter<CreateNewReceiptState> emit) async {
    emit(state.copyWith(status: CreateNewReceiptStatus.quantityUpdate));
    List<TransactionLineItemEntity> newList = [];
    for (var line in state.lineItem) {
      if (line == event.saleLine) {
        TransactionLineItemEntity newLine = line;
        DiscountEntity discount = DiscountEntity(
            discountId: 'DUMMY_DISCOUNT_ID',
            percent: event.discountPercent,
            discountType: DiscountCalculationMethod.percentage.name,
            description: '${event.discountPercent} % Discount OFF',
            discountCode: 'MANUAL_DISCOUNT_CODE');

        TransactionLineItemModifierEntity? discountLine =
            discountHelper.createNewDiscountOverrideLineModifier(
                line, discount, event.reason);
        if (discountLine != null) {
          newLine.lineModifiers = [...newLine.lineModifiers, discountLine];
          double discountAmount = discountHelper.calculateDiscountAmount(line);
          newLine.discountAmount = discountAmount;
          newLine.netAmount = newLine.extendedAmount! - discountAmount;

          for (var line in newLine.taxModifiers) {
            line.taxableAmount = newLine.netAmount;
          }

          await taxModifierCalculator.handleLineItemEvent([newLine]);
          double taxAmount = taxHelper.calculateTaxAmount(newLine);
          newLine.taxAmount = taxAmount;
          newLine.grossAmount = newLine.netAmount! + taxAmount;

          newList.add(newLine);
        } else {
          newList.add(line);
        }
      } else {
        newList.add(line);
      }
    }
    emit(state.copyWith(
        lineItem: newList,
        status: CreateNewReceiptStatus.inProgress,
        inProgress: true));
  }

  void _onChangeLineItemTaxAmount(OnChangeLineItemTaxAmount event,
      Emitter<CreateNewReceiptState> emit) async {
    List<TransactionLineItemEntity> newList = [];
    for (var line in state.lineItem) {
      if (line == event.saleLine) {
        TransactionLineItemEntity newLineEntity =
            TransactionHelper.changeLineItemTax(
                line, event.taxAmount, event.reason,
                taxApplicationMethod: TaxApplicationMethod.all,
                taxCalculationMethod: TaxCalculationMethod.amount);
        newList.add(newLineEntity);
      } else {
        newList.add(line);
      }
    }
    emit(state.copyWith(lineItem: newList, inProgress: true));
  }

  void _onChangeLineItemTaxPercent(OnChangeLineItemTaxPercent event,
      Emitter<CreateNewReceiptState> emit) async {
    List<TransactionLineItemEntity> newList = [];
    for (var line in state.lineItem) {
      if (line == event.saleLine) {
        TransactionLineItemEntity newLineEntity =
            TransactionHelper.changeLineItemTax(
                line, event.taxPercent, event.reason,
                taxApplicationMethod: TaxApplicationMethod.all,
                taxCalculationMethod: TaxCalculationMethod.percentage);
        newList.add(newLineEntity);
      } else {
        newList.add(line);
      }
    }
    emit(state.copyWith(lineItem: newList, inProgress: true));
  }

  void _onAddNewTenderLineItem(
      OnAddNewTenderLine event, Emitter<CreateNewReceiptState> emit) async {
    int seq = state.tenderLine.length;

    RetailLocationEntity? store = authenticationBloc.state.store;
    if (store == null) throw Exception("Store Not Found");

    TransactionPaymentLineItemEntity newLine = TransactionPaymentLineItemEntity(
        transId: state.transSeq,
        amount: event.amount,
        beginDate: DateTime.now(),
        currencyId: store.currencyId,
        paymentSeq: seq + 1,
        tenderId: event.tenderType,
        tenderStatusCode: "CNF",
        endDate: DateTime.now());

    List<TransactionPaymentLineItemEntity> newList = [
      ...state.tenderLine,
      newLine
    ];

    emit(state.copyWith(tenderLine: newList, inProgress: true));
    add(_VerifyOrderAndEmitState());
  }

  void _onChangeSaleStep(
      OnChangeSaleStep event, Emitter<CreateNewReceiptState> emit) async {
    // @TODO Add logic to handle the change of sale step
    if (state.amountDue == 0) {
      add(OnCreateNewTransaction());
    } else {
      emit(state.copyWith(step: event.step, inProgress: true));
    }
  }

  void _onVerifyOrderAndEmitStep(_VerifyOrderAndEmitState event,
      Emitter<CreateNewReceiptState> emit) async {
    if (state.step == SaleStep.confirmed) {
      return;
    }

    if (state.amountDue > 0 && state.step == SaleStep.complete) {
      emit(state.copyWith(step: SaleStep.payment));
    } else if (state.amountDue <= 0 && state.step != SaleStep.complete) {
      emit(state.copyWith(step: SaleStep.complete, inProgress: true));
    } else if (state.amountDue == 0) {
      add(OnCreateNewTransaction());
    }
  }

  void _onReturnLineItem(
      OnReturnLineItemEvent event, Emitter<CreateNewReceiptState> emit) async {
    // @TODO Check if the header is created otherwise create new transaction header
    if (state.transactionHeader == null) {
      var header = await _createNewTransactionHeader();
      emit(state.copyWith(transactionHeader: header, transSeq: header.transId));
    }

    // Get the customer from original transaction if customer not present.
    if (state.customer == null) {

    }

    // Create a new Return Line Item
    int seq = state.lineItem.length;

    List<TransactionLineItemEntity> newList = [...state.lineItem];
    Map<String, ItemEntity> pm = Map.from(state.productMap);

    for (var line in event.returnMap.keys) {
      var returnData = event.returnMap[line];

      var returnLine = TransactionLineItemEntity(
        storeId: authenticationBloc.state.store!.rtlLocId, // Current store ID
        transSeq: state.transSeq,
        businessDate: DateTime.now(),
        posId: line.posId, // Current Pos ID
        itemDescription: line.itemDescription,
        itemId: line.itemId,
        itemIdEntryMethod: EntryMethod.keyboard,
        priceEntryMethod: EntryMethod.keyboard,
        lineItemSeq: ++seq,
        nonExchangeableFlag: line.nonExchangeableFlag,
        nonReturnableFlag: line.nonReturnableFlag,
        originalBusinessDate: line.businessDate,
        originalLineItemSeq: line.lineItemSeq,
        originalPosId: line.posId,
        originalTransSeq: line.transSeq,
        serialNumber: line.serialNumber,
        vendorId: line.vendorId,
        uom: line.uom,
        shippingWeight: line.shippingWeight,
        category: line.category,
        currency: line.currency,
        hsn: line.hsn,
        // @TODO Add Returned Comment
        returnFlag: true,
        returnReasonCode: returnData!.reasonCode,
        returnTypeCode: line.returnTypeCode,
        returnedQuantity: line.quantity,
        returnComment: returnData.comment,

        // Price Override data
        priceOverrideReason: line.priceOverrideReason,
        priceOverride: line.priceOverride,

        // Quantitative Data
        quantity: returnData.quantity,
        unitPrice: -line.unitPrice!,
        extendedAmount: returnData.quantity * (-line.unitPrice!),
        baseUnitPrice: -line.baseUnitPrice!,
        netAmount: 0.0,

        taxAmount: 0.0,
        unitCost: 0.0,
        grossAmount: 0.0,
      );
      // Calculate Line Modifier
      List<TransactionLineItemModifierEntity> newLineModifier = discountHelper
          .createLineItemModifierFromOriginalTransaction(line, returnLine);
      returnLine.lineModifiers = newLineModifier;

      returnLine.discountAmount =
          discountHelper.calculateDiscountAmount(returnLine);
      returnLine.netAmount =
          returnLine.extendedAmount! - returnLine.discountAmount!;

      // Calculate Tax Amount
      List<TransactionLineItemTaxModifier> newTaxLine =
          taxHelper.createTaxModifierFromOriginalTransaction(line, returnLine);
      returnLine.taxModifiers = newTaxLine;

      double taxAmount = taxHelper.calculateTaxAmount(returnLine);
      returnLine.taxAmount = taxAmount;
      returnLine.grossAmount = returnLine.netAmount! + taxAmount;
      returnLine.unitCost = returnLine.grossAmount! / returnLine.quantity!;

      newList.add(returnLine);

      ItemEntity? pe = await productRepository.getProductById(line.itemId!);
      if (pe != null) {
        pm.putIfAbsent(line.itemId!, () => pe);
      }
    }

    emit(state.copyWith(
        lineItem: newList,
        step: SaleStep.item,
        productMap: pm,
        inProgress: true));
    // add(_VerifyOrderAndEmitState());
  }

  void _onChangeCustomerBillingAddress(OnChangeCustomerBillingAddress event,
      Emitter<CreateNewReceiptState> emit) async {
    var custAddress = state.customerAddress ?? const CustomerAddress();
    emit(state.copyWith(
        customerAddress: custAddress.copyWith(
          billingAddress: event.address,
        ),
        inProgress: true));
  }

  void _onChangeCustomerShippingAddress(OnChangeCustomerShippingAddress event,
      Emitter<CreateNewReceiptState> emit) async {
    var custAddress = state.customerAddress ?? const CustomerAddress();
    emit(state.copyWith(
        customerAddress: custAddress.copyWith(shippingAddress: event.address),
        inProgress: true));
  }

  void _onLineItemVoid(
      OnLineItemVoid event, Emitter<CreateNewReceiptState> emit) async {
    emit(state.copyWith(status: CreateNewReceiptStatus.loading));
    List<TransactionLineItemEntity> newList = [];
    for (var line in state.lineItem) {
      if (line == event.saleLine) {
        line.isVoid = true;
      }
      newList.add(line);
    }
    emit(state.copyWith(
        lineItem: newList,
        status: CreateNewReceiptStatus.success,
        inProgress: true));
  }

  void _onTenderLineVoid(
      OnTenderLineVoid event, Emitter<CreateNewReceiptState> emit) async {
    emit(state.copyWith(status: CreateNewReceiptStatus.loading));
    List<TransactionPaymentLineItemEntity> newList = [];
    for (var line in state.tenderLine) {
      if (line == event.tenderLine) {
        line.isVoid = true;
      }
      newList.add(line);
    }
    emit(state.copyWith(
        tenderLine: newList,
        status: CreateNewReceiptStatus.success,
        inProgress: true));
  }

  void _onAdditionalLineModifierChange(
      OnAdditionalLineModifierChange event,
      Emitter<CreateNewReceiptState> emit) async {
    emit(state.copyWith(status: CreateNewReceiptStatus.modifierUpdate));
    // Find the transaction line and update the modifier
    List<TransactionLineItemEntity> newList = [];
    for (var line in state.lineItem) {
      if (line == event.saleLine) {
        TransactionLineItemEntity newLine = line;
        // Filter modifier with 0 quantity;
        List<TransactionAdditionalLineItemModifier> modifierList =
            event.modifier.where((element) => element.quantity != 0).toList();

        newLine.additionalModifier = modifierList;
        newList.add(newLine);
      } else {
        newList.add(line);
      }
    }
    emit(state.copyWith(
        lineItem: newList,
        status: CreateNewReceiptStatus.inProgress,
        inProgress: true));
  }
}
