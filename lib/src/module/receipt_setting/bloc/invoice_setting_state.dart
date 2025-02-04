part of 'invoice_setting_bloc.dart';

enum InvoiceSettingStatus { initial, preLoad, modified, saving, saved }

enum FieldType { header, billingAddress, shippingAddress, item, payment, tax }

class InvoiceSettingState {
  final List<ReportFieldConfigEntity> columns;
  final List<ReportFieldConfigEntity> paymentColumns;
  final List<ReportFieldConfigEntity> headerFields;
  final List<ReportFieldConfigEntity> billingAddressFields;
  final List<ReportFieldConfigEntity> shippingAddressFields;
  final List<ReportFieldConfigEntity> taxFields;
  final InvoiceSettingStatus status;
  final bool showTaxSummary;
  final TaxGroupType taxGroupType;
  final bool showPaymentDetails;
  final PlatformFile? rawLogo;
  final String? logo;
  final bool showDeclaration;
  final String? declaration;
  final bool showTermsAndCondition;
  final String? termsAndCondition;

  const InvoiceSettingState({
    this.columns = const [],
    this.paymentColumns = const [],
    this.headerFields = const [],
    this.billingAddressFields = const [],
    this.shippingAddressFields = const [],
    this.taxFields = const [],
    this.status = InvoiceSettingStatus.initial,
    this.showTaxSummary = true,
    this.taxGroupType = TaxGroupType.hsn,
    this.showPaymentDetails = true,
    this.showDeclaration = true,
    this.declaration,
    this.rawLogo,
    this.logo,
    this.showTermsAndCondition = true,
    this.termsAndCondition,
  });

  InvoiceSettingState copyWith({
    List<ReportFieldConfigEntity>? columns,
    List<ReportFieldConfigEntity>? paymentColumns,
    List<ReportFieldConfigEntity>? headerFields,
    List<ReportFieldConfigEntity>? billingAddressFields,
    List<ReportFieldConfigEntity>? shippingAddressFields,
    List<ReportFieldConfigEntity>? taxFields,
    InvoiceSettingStatus? status,
    bool? showTaxSummary,
    TaxGroupType? taxGroupType,
    bool? showPaymentDetails,
    bool? showDeclaration,
    String? declaration,
    PlatformFile? rawLogo,
    String? logo,
    bool? showTermsAndCondition,
    String? termsAndCondition,
  }) {
    return InvoiceSettingState(
      columns: columns ?? this.columns,
      paymentColumns: paymentColumns ?? this.paymentColumns,
      headerFields: headerFields ?? this.headerFields,
      billingAddressFields: billingAddressFields ?? this.billingAddressFields,
      shippingAddressFields:
          shippingAddressFields ?? this.shippingAddressFields,
      taxFields: taxFields ?? this.taxFields,
      status: status ?? this.status,
      showTaxSummary: showTaxSummary ?? this.showTaxSummary,
      taxGroupType: taxGroupType ?? this.taxGroupType,
      showPaymentDetails: showPaymentDetails ?? this.showPaymentDetails,
      showDeclaration: showDeclaration ?? this.showDeclaration,
      declaration: declaration ?? this.declaration,
      rawLogo: rawLogo ?? this.rawLogo,
      logo: logo ?? this.logo,
      showTermsAndCondition:
          showTermsAndCondition ?? this.showTermsAndCondition,
      termsAndCondition: termsAndCondition ?? this.termsAndCondition,
    );
  }
}
