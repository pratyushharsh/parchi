part of 'invoice_setting_bloc.dart';

@immutable
abstract class InvoiceSettingEvent {}

class OnInitialInvoiceSettingEvent extends InvoiceSettingEvent {}

// class AddNewConfigColumn extends InvoiceSettingEvent {
//   final ReportFieldConfigEntity column;
//
//   AddNewConfigColumn(this.column);
// }
//
// class RemoveConfigColumn extends InvoiceSettingEvent {
//   final ReportFieldConfigEntity column;
//
//   RemoveConfigColumn(this.column);
// }
//
// class AddNewPaymentColumn extends InvoiceSettingEvent {
//   final ReportFieldConfigEntity column;
//
//   AddNewPaymentColumn(this.column);
// }
//
// class RemovePaymentColumn extends InvoiceSettingEvent {
//   final ReportFieldConfigEntity column;
//
//   RemovePaymentColumn(this.column);
// }

class ShowTaxSummary extends InvoiceSettingEvent {
  final bool show;

  ShowTaxSummary(this.show);
}

class ShowPaymentDetails extends InvoiceSettingEvent {
  final bool show;

  ShowPaymentDetails(this.show);
}

class UploadLogoFromPlatform extends InvoiceSettingEvent {
  final PlatformFile logo;

  UploadLogoFromPlatform(this.logo);
}

class OnSaveInvoiceSettingEvent extends InvoiceSettingEvent {}

class ShowTermsAnsCondition extends InvoiceSettingEvent {
  final bool show;

  ShowTermsAnsCondition(this.show);
}

class UpdateTermsAnsCondition extends InvoiceSettingEvent {
  final String? terms;

  UpdateTermsAnsCondition(this.terms);
}

class ShowDeclaration extends InvoiceSettingEvent {
  final bool show;

  ShowDeclaration(this.show);
}

class UpdateDeclaration extends InvoiceSettingEvent {
  final String? declaration;

  UpdateDeclaration(this.declaration);
}

// class OnReportColumnConfigUpdate extends InvoiceSettingEvent {
//   final ReportFieldConfigEntity column;
//
//   OnReportColumnConfigUpdate(this.column);
// }

// class OnReportPaymentColumnConfigUpdate extends InvoiceSettingEvent {
//   final ReportFieldConfigEntity column;
//
//   OnReportPaymentColumnConfigUpdate(this.column);
// }

class AddNewConfigField extends InvoiceSettingEvent {
  final ReportFieldConfigEntity field;
  final FieldType type;

  AddNewConfigField({required this.field, required this.type});
}

class RemoveConfigField extends InvoiceSettingEvent {
  final ReportFieldConfigEntity field;
  final FieldType type;

  RemoveConfigField({required this.field, required this.type});
}

class OnReportFieldConfigUpdate extends InvoiceSettingEvent {
  final ReportFieldConfigEntity field;
  final FieldType type;

  OnReportFieldConfigUpdate({required this.field, required this.type});
}

class ChangeTaxGroupType extends InvoiceSettingEvent {
  final TaxGroupType type;

  ChangeTaxGroupType(this.type);
}