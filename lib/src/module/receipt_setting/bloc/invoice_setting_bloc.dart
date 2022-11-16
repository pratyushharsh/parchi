import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:file_picker/file_picker.dart';
import 'package:logging/logging.dart';
import 'package:meta/meta.dart';
import 'package:path_provider/path_provider.dart';
import 'package:rxdart/rxdart.dart';

import '../../../entity/pos/report_config_entity.dart';
import '../../../repositories/invoice_repository.dart';
import '../../authentication/bloc/authentication_bloc.dart';
import '../../receipt_display/template/invoice_config.dart';

part 'invoice_setting_event.dart';
part 'invoice_setting_state.dart';

const _duration = Duration(milliseconds: 300);

EventTransformer<Event> debounce<Event>(Duration duration) {
  return (events, mapper) => events.debounceTime(duration).switchMap(mapper);
}

class InvoiceSettingBloc
    extends Bloc<InvoiceSettingEvent, InvoiceSettingState> {
  final log = Logger('InvoiceSettingBloc');

  final InvoiceRepository invoiceRepo;
  final AuthenticationBloc authBloc;

  InvoiceSettingBloc({required this.invoiceRepo, required this.authBloc})
      : super(const InvoiceSettingState()) {
    on<OnInitialInvoiceSettingEvent>(_onInitialInvoiceSettingEvent);
    on<ShowTaxSummary>(_onShowTaxSummary);
    on<ShowPaymentDetails>(_onShowPaymentDetails);
    on<UploadLogoFromPlatform>(_onUploadLogo);
    on<OnSaveInvoiceSettingEvent>(_onSaveInvoiceSettingEvent);
    on<ShowTermsAnsCondition>(_onShowTermsAnsCondition);
    on<UpdateTermsAnsCondition>(_onUpdateTermsAnsCondition,
        transformer: debounce(_duration));
    on<ShowDeclaration>(_onShowDeclaration);
    on<UpdateDeclaration>(_onUpdateDeclaration,
        transformer: debounce(_duration));
    on<AddNewConfigField>(_onAddNewConfigField);
    on<RemoveConfigField>(_onRemoveConfigField);
    on<OnReportFieldConfigUpdate>(_onReportFieldConfigUpdate);
  }

  void _onInitialInvoiceSettingEvent(OnInitialInvoiceSettingEvent event,
      Emitter<InvoiceSettingState> emit) async {
    final config = await invoiceRepo.getInvoiceSettingByName('INVOICE');
    emit(state.copyWith(
      columns: config.columnConfig,
      paymentColumns: config.paymentColumnConfig,
      billingAddressFields: config.billingAddFieldConfig,
      headerFields: config.headerFieldConfig,
      shippingAddressFields: config.shippingAddFieldConfig,
      showTaxSummary: config.showTaxSummary,
      showPaymentDetails: config.showPaymentDetails,
      logo: config.logo,
      showTermsAndCondition: config.showTermsAndCondition,
      termsAndCondition: config.termsAndCondition,
      showDeclaration: config.showDeclaration,
      declaration: config.declaration,
      status: InvoiceSettingStatus.preLoad,
    ));
  }

  // void _onAddNewConfigColumn(
  //     AddNewConfigColumn event, Emitter<InvoiceSettingState> emit) {
  //   final newColumns = List<ReportFieldConfigEntity>.from(state.columns);
  //   newColumns.add(ReportFieldConfigEntity(
  //     key: event.column.key,
  //     title: event.column.title,
  //     flex: event.column.flex,
  //     align: event.column.align,
  //     defaultValue: event.column.defaultValue,
  //   ));
  //   emit(state.copyWith(
  //       columns: newColumns, status: InvoiceSettingStatus.modified));
  // }
  //
  // void _onRemoveConfigColumn(
  //     RemoveConfigColumn event, Emitter<InvoiceSettingState> emit) {
  //   final newColumns = List<ReportFieldConfigEntity>.from(state.columns);
  //   newColumns.remove(event.column);
  //   emit(state.copyWith(
  //       columns: newColumns, status: InvoiceSettingStatus.modified));
  // }

  // void _onAddNewPaymentColumn(
  //     AddNewPaymentColumn event, Emitter<InvoiceSettingState> emit) {
  //   final newColumns = List<ReportFieldConfigEntity>.from(state.paymentColumns);
  //   newColumns.add(ReportFieldConfigEntity(
  //     key: event.column.key,
  //     title: event.column.title,
  //     flex: event.column.flex,
  //     align: event.column.align,
  //     defaultValue: event.column.defaultValue,
  //   ));
  //   emit(state.copyWith(
  //       paymentColumns: newColumns, status: InvoiceSettingStatus.modified));
  // }
  //
  // void _onRemovePaymentColumn(
  //     RemovePaymentColumn event, Emitter<InvoiceSettingState> emit) {
  //   final newColumns = List<ReportFieldConfigEntity>.from(state.paymentColumns);
  //   newColumns.remove(event.column);
  //   emit(state.copyWith(
  //       paymentColumns: newColumns, status: InvoiceSettingStatus.modified));
  // }

  void _onShowTaxSummary(
      ShowTaxSummary event, Emitter<InvoiceSettingState> emit) {
    emit(state.copyWith(
        showTaxSummary: event.show, status: InvoiceSettingStatus.modified));
  }

  void _onShowPaymentDetails(
      ShowPaymentDetails event, Emitter<InvoiceSettingState> emit) {
    emit(state.copyWith(
        showPaymentDetails: event.show, status: InvoiceSettingStatus.modified));
  }

  void _onUploadLogo(
      UploadLogoFromPlatform event, Emitter<InvoiceSettingState> emit) {
    emit(state.copyWith(
        rawLogo: event.logo,
        logo: 'file://${event.logo.path}',
        status: InvoiceSettingStatus.modified));
  }

  void _onSaveInvoiceSettingEvent(OnSaveInvoiceSettingEvent event,
      Emitter<InvoiceSettingState> emit) async {
    try {
      String? logoPath;

      if (state.rawLogo != null && state.rawLogo!.path != null) {
        final dir = await getApplicationDocumentsDirectory();
        File tmp = File(state.rawLogo!.path!);
        logoPath = '${dir.path}/invoice/${state.rawLogo!.name}';
        logoPath =
            await invoiceRepo.uploadLogo(logoPath, await tmp.readAsBytes());
        log.info('Logo uploaded to $logoPath');
      }

      await invoiceRepo.saveInvoiceSetting(InvoiceConfig(
          code: 'INVOICE',
          columnConfig: state.columns,
          paymentColumnConfig: state.paymentColumns,
          logo: state.rawLogo != null ? 'file://$logoPath' : state.logo,
          showTaxSummary: state.showTaxSummary,
          showPaymentDetails: state.showPaymentDetails,
          showTermsAndCondition: state.showTermsAndCondition,
          termsAndCondition: state.termsAndCondition,
          showDeclaration: state.showDeclaration,
          declaration: state.declaration,
          headerFieldConfig: state.headerFields,
          shippingAddFieldConfig: state.shippingAddressFields,
          billingAddFieldConfig: state.billingAddressFields));
    } catch (e) {
      log.severe(e);
    }
  }

  void _onShowTermsAnsCondition(
      ShowTermsAnsCondition event, Emitter<InvoiceSettingState> emit) {
    emit(state.copyWith(
        showTermsAndCondition: event.show,
        status: InvoiceSettingStatus.modified));
  }

  void _onUpdateTermsAnsCondition(
      UpdateTermsAnsCondition event, Emitter<InvoiceSettingState> emit) {
    emit(state.copyWith(
        termsAndCondition: event.terms, status: InvoiceSettingStatus.modified));
  }

  void _onShowDeclaration(
      ShowDeclaration event, Emitter<InvoiceSettingState> emit) {
    emit(state.copyWith(
        showDeclaration: event.show, status: InvoiceSettingStatus.modified));
  }

  void _onUpdateDeclaration(
      UpdateDeclaration event, Emitter<InvoiceSettingState> emit) {
    emit(state.copyWith(
        declaration: event.declaration, status: InvoiceSettingStatus.modified));
  }

  void _onReportFieldConfigUpdate(
      OnReportFieldConfigUpdate event, Emitter<InvoiceSettingState> emit) {
    // Find the column from current state and update
    var newColumns = List<ReportFieldConfigEntity>.empty();

    switch (event.type) {
      case FieldType.header:
        newColumns = List<ReportFieldConfigEntity>.from(state.headerFields);
        break;
      case FieldType.billingAddress:
        newColumns =
            List<ReportFieldConfigEntity>.from(state.billingAddressFields);
        break;
      case FieldType.shippingAddress:
        newColumns =
            List<ReportFieldConfigEntity>.from(state.shippingAddressFields);
        break;
      case FieldType.payment:
        newColumns = List<ReportFieldConfigEntity>.from(state.paymentColumns);
        break;
      case FieldType.item:
        newColumns = List<ReportFieldConfigEntity>.from(state.columns);
        break;
    }

    for (var i = 0; i < newColumns.length; i++) {
      if (newColumns[i].key == event.field.key &&
          newColumns[i].title == event.field.title) {
        newColumns[i] = ReportFieldConfigEntity(
          key: event.field.key,
          title: event.field.title,
          align: event.field.align,
          flex: event.field.flex,
          defaultValue: event.field.defaultValue,
        );
        break;
      }
    }

    switch (event.type) {
      case FieldType.header:
        emit(state.copyWith(
            headerFields: newColumns, status: InvoiceSettingStatus.modified));
        break;
      case FieldType.billingAddress:
        emit(state.copyWith(
            billingAddressFields: newColumns,
            status: InvoiceSettingStatus.modified));
        break;
      case FieldType.shippingAddress:
        emit(state.copyWith(
            shippingAddressFields: newColumns,
            status: InvoiceSettingStatus.modified));
        break;
      case FieldType.payment:
        emit(state.copyWith(
            paymentColumns: newColumns, status: InvoiceSettingStatus.modified));
        break;
      case FieldType.item:
        emit(state.copyWith(
            columns: newColumns, status: InvoiceSettingStatus.modified));
        break;
    }
  }

  void _onAddNewConfigField(
      AddNewConfigField event, Emitter<InvoiceSettingState> emit) {
    // Find the column from current state and update
    var newColumns = List<ReportFieldConfigEntity>.empty();
    switch (event.type) {
      case FieldType.header:
        newColumns = List<ReportFieldConfigEntity>.from(state.headerFields);
        break;
      case FieldType.billingAddress:
        newColumns =
            List<ReportFieldConfigEntity>.from(state.billingAddressFields);
        break;
      case FieldType.shippingAddress:
        newColumns =
            List<ReportFieldConfigEntity>.from(state.shippingAddressFields);
        break;
      case FieldType.payment:
        newColumns = List<ReportFieldConfigEntity>.from(state.paymentColumns);
        break;
      case FieldType.item:
        newColumns = List<ReportFieldConfigEntity>.from(state.columns);
        break;
    }

    newColumns.add(ReportFieldConfigEntity(
      key: event.field.key,
      title: event.field.title,
      flex: event.field.flex,
      align: event.field.align,
      defaultValue: event.field.defaultValue,
    ));

    switch (event.type) {
      case FieldType.header:
        emit(state.copyWith(
            headerFields: newColumns, status: InvoiceSettingStatus.modified));
        break;
      case FieldType.billingAddress:
        emit(state.copyWith(
            billingAddressFields: newColumns,
            status: InvoiceSettingStatus.modified));
        break;
      case FieldType.shippingAddress:
        emit(state.copyWith(
            shippingAddressFields: newColumns,
            status: InvoiceSettingStatus.modified));
        break;
      case FieldType.payment:
        emit(state.copyWith(
            paymentColumns: newColumns, status: InvoiceSettingStatus.modified));
        break;
      case FieldType.item:
        emit(state.copyWith(
            columns: newColumns, status: InvoiceSettingStatus.modified));
        break;
    }
  }

  void _onRemoveConfigField(
      RemoveConfigField event, Emitter<InvoiceSettingState> emit) {
    // Find the column from current state and update
    var newColumns = List<ReportFieldConfigEntity>.empty();
    switch (event.type) {
      case FieldType.header:
        newColumns = List<ReportFieldConfigEntity>.from(state.headerFields);
        break;
      case FieldType.billingAddress:
        newColumns =
            List<ReportFieldConfigEntity>.from(state.billingAddressFields);
        break;
      case FieldType.shippingAddress:
        newColumns =
            List<ReportFieldConfigEntity>.from(state.shippingAddressFields);
        break;
      case FieldType.payment:
        newColumns = List<ReportFieldConfigEntity>.from(state.paymentColumns);
        break;
      case FieldType.item:
        newColumns = List<ReportFieldConfigEntity>.from(state.columns);
        break;
    }

    newColumns.remove(event.field);

    switch (event.type) {
      case FieldType.header:
        emit(state.copyWith(
            headerFields: newColumns, status: InvoiceSettingStatus.modified));
        break;
      case FieldType.billingAddress:
        emit(state.copyWith(
            billingAddressFields: newColumns,
            status: InvoiceSettingStatus.modified));
        break;
      case FieldType.shippingAddress:
        emit(state.copyWith(
            shippingAddressFields: newColumns,
            status: InvoiceSettingStatus.modified));
        break;
      case FieldType.payment:
        emit(state.copyWith(
            paymentColumns: newColumns, status: InvoiceSettingStatus.modified));
        break;
      case FieldType.item:
        emit(state.copyWith(
            columns: newColumns, status: InvoiceSettingStatus.modified));
        break;
    }
  }
}
