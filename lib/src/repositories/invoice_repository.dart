import 'dart:io';
import 'dart:typed_data';

import 'package:isar/isar.dart';
import 'package:logging/logging.dart';

import '../database/db_provider.dart';
import '../entity/pos/entity.dart';
import '../model/api/image_upload_response.dart';
import '../module/receipt_display/template/invoice_config.dart';
import '../util/helper/rest_api.dart';

enum InvoiceField {
  item("ITEM"),
  payment("PAYMENT"),
  logo("LOGO"),
  showTaxSummary("SHOW_TAX_SUMMARY"),
  showPaymentDetails("SHOW_PAYMENT_DETAILS"),
  declaration("DECLARATION"),
  showDeclaration("SHOW_DECLARATION"),
  termsAndCondition("TERMS_AND_CONDITION"),
  showTermsAndCondition("SHOW_TERMS_AND_CONDITION"),
  headerFields("HEADER_FIELDS"),
  shippingAddressFields("SHIPPING_ADDRESS_FIELDS"),
  billingAddressFields("BILLING_ADDRESS_FIELDS"),
  taxFields("TAX_FIELDS"),
  lastUpdateAt("LAST_UPDATE_AT"),
  taxGroupType("TAX_GROUP_TYPE");

  const InvoiceField(this.value);

  final String value;
}

class InvoiceRepository with DatabaseProvider {
  final log = Logger('InvoiceRepository');

  final RestApiClient restClient;

  InvoiceRepository({required this.restClient});

  Future<void> saveInvoiceSetting(InvoiceConfig setting) async {
    List<ReportColumn> columns = [];

    if (setting.headerFieldConfig.isNotEmpty) {
      columns.add(
        ReportColumn(
          id: InvoiceField.headerFields.value,
          fields: setting.headerFieldConfig,
        ),
      );
    }

    if (setting.billingAddFieldConfig.isNotEmpty) {
      columns.add(
        ReportColumn(
          id: InvoiceField.billingAddressFields.value,
          fields: setting.billingAddFieldConfig,
        ),
      );
    }

    if (setting.shippingAddFieldConfig.isNotEmpty) {
      columns.add(
        ReportColumn(
          id: InvoiceField.shippingAddressFields.value,
          fields: setting.shippingAddFieldConfig,
        ),
      );
    }

    if (setting.columnConfig.isNotEmpty) {
      columns.add(
        ReportColumn(
          id: InvoiceField.item.value,
          fields: setting.columnConfig,
        ),
      );
    }

    if (setting.paymentColumnConfig.isNotEmpty) {
      columns.add(
        ReportColumn(
          id: InvoiceField.payment.value,
          fields: setting.paymentColumnConfig,
        ),
      );
    }

    if (setting.taxFieldConfig.isNotEmpty) {
      columns.add(
        ReportColumn(
          id: InvoiceField.taxFields.value,
          fields: setting.taxFieldConfig,
        ),
      );
    }

    await db.writeTxn(() async {
      db.reportConfigEntitys.putByTypeSubtype(ReportConfigEntity(
        type: 'INV',
        subtype: 'INVOICE',
        columns: columns,
        properties: [
          ReportProperty(
            key: InvoiceField.logo.value,
            stringValue: setting.logo,
          ),
          ReportProperty(
            key: InvoiceField.showTaxSummary.value,
            boolValue: setting.showTaxSummary,
          ),
          ReportProperty(
            key: InvoiceField.showPaymentDetails.value,
            boolValue: setting.showPaymentDetails,
          ),
          ReportProperty(
            key: InvoiceField.declaration.value,
            stringValue: setting.declaration,
          ),
          ReportProperty(
            key: InvoiceField.showDeclaration.value,
            boolValue: setting.showDeclaration,
          ),
          ReportProperty(
            key: InvoiceField.termsAndCondition.value,
            stringValue: setting.termsAndCondition,
          ),
          ReportProperty(
            key: InvoiceField.showTermsAndCondition.value,
            boolValue: setting.showTermsAndCondition,
          ),
          ReportProperty(
            key: InvoiceField.lastUpdateAt.value,
            intValue: DateTime.now().millisecondsSinceEpoch,
          ),
          ReportProperty(
            key: InvoiceField.taxGroupType.value,
            stringValue: setting.taxGroupType.value,
          ),
        ],
      ));
    });
  }

  Future<InvoiceConfig> getInvoiceSettingByName(String name) async {
    final config = await db.reportConfigEntitys
        .where()
        .typeSubtypeEqualTo('INV', name)
        .findFirst();
    if (config == null) {
      return InvoiceConfig.defaultValue;
    }

    return InvoiceConfig(
      logo: config.properties
          .firstWhere((element) => element.key == InvoiceField.logo.value,
              orElse: () => ReportProperty(key: InvoiceField.logo.value))
          .stringValue,
      showTaxSummary: config.properties
              .firstWhere(
                  (element) => element.key == InvoiceField.showTaxSummary.value,
                  orElse: () =>
                      ReportProperty(key: InvoiceField.showTaxSummary.value))
              .boolValue ??
          false,
      showPaymentDetails: config.properties
              .firstWhere(
                  (element) =>
                      element.key == InvoiceField.showPaymentDetails.value,
                  orElse: () => ReportProperty(
                      key: InvoiceField.showPaymentDetails.value))
              .boolValue ??
          false,
      declaration: config.properties
          .firstWhere(
              (element) => element.key == InvoiceField.declaration.value,
              orElse: () => ReportProperty(key: InvoiceField.declaration.value))
          .stringValue,
      showDeclaration: config.properties
              .firstWhere(
                  (element) =>
                      element.key == InvoiceField.showDeclaration.value,
                  orElse: () =>
                      ReportProperty(key: InvoiceField.showDeclaration.value))
              .boolValue ??
          false,
      termsAndCondition: config.properties
          .firstWhere(
              (element) => element.key == InvoiceField.termsAndCondition.value,
              orElse: () =>
                  ReportProperty(key: InvoiceField.termsAndCondition.value))
          .stringValue,
      showTermsAndCondition: config.properties
              .firstWhere(
                  (element) =>
                      element.key == InvoiceField.showTermsAndCondition.value,
                  orElse: () => ReportProperty(
                      key: InvoiceField.showTermsAndCondition.value))
              .boolValue ??
          false,
      columnConfig: config.columns
              .firstWhere((element) => element.id == InvoiceField.item.value,
                  orElse: () => ReportColumn(id: InvoiceField.item.value))
              .fields ??
          [],
      paymentColumnConfig: config.columns
              .firstWhere((element) => element.id == InvoiceField.payment.value,
                  orElse: () => ReportColumn(id: InvoiceField.payment.value))
              .fields ??
          [],
      headerFieldConfig: config.columns
              .firstWhere(
                  (element) => element.id == InvoiceField.headerFields.value,
                  orElse: () =>
                      ReportColumn(id: InvoiceField.headerFields.value))
              .fields ??
          [],
      billingAddFieldConfig: config.columns
              .firstWhere(
                  (element) =>
                      element.id == InvoiceField.billingAddressFields.value,
                  orElse: () =>
                      ReportColumn(id: InvoiceField.billingAddressFields.value))
              .fields ??
          [],
      shippingAddFieldConfig: config.columns
              .firstWhere(
                  (element) =>
                      element.id == InvoiceField.shippingAddressFields.value,
                  orElse: () => ReportColumn(
                      id: InvoiceField.shippingAddressFields.value))
              .fields ??
          [],
      taxFieldConfig: config.columns
              .firstWhere(
                  (element) => element.id == InvoiceField.taxFields.value,
                  orElse: () => ReportColumn(id: InvoiceField.taxFields.value))
              .fields ??
          [],
      taxGroupType: TaxGroupType.values.firstWhere(
        (element) =>
            element.value ==
            config.properties
                .firstWhere(
                    (element) => element.key == InvoiceField.taxGroupType.value,
                    orElse: () =>
                        ReportProperty(key: InvoiceField.taxGroupType.value))
                .stringValue,
        orElse: () => TaxGroupType.hsn,
      ),
    );
  }

  Future<ImageUploadResponse> uploadLogo(String path, fileName, storeId, type) async {
    return restClient.uploadImage(path, fileName, storeId, type);
  }
}
