import 'package:intl/intl.dart';
import '../../../entity/pos/entity.dart';
import 'package:pdf/widgets.dart';

enum TaxGroupType {
  groupId("GROUP_ID"),
  hsn("HSN"),
  taxRule("TAX_RULE");

  const TaxGroupType(this.value);
  final String value;
}

class InvoiceConfigConstants {
  static List<ReportFieldConfigEntity> columnConfig = [
    ReportFieldConfigEntity(
        key: 'sno', title: 'S.No', flex: 1, align: ColumnAlignment.center),
    ReportFieldConfigEntity(key: 'desc', title: 'Description', flex: 5),
    ReportFieldConfigEntity(
        key: 'hsn/sac',
        title: 'HSN/SAC',
        flex: 2,
        align: ColumnAlignment.right),
    ReportFieldConfigEntity(
        key: 'qtyuom',
        title: 'Qty/UOM',
        flex: 2,
        align: ColumnAlignment.center),
    ReportFieldConfigEntity(
        key: 'quantity',
        title: 'Quantity',
        flex: 2,
        align: ColumnAlignment.center),
    ReportFieldConfigEntity(
        key: 'rate',
        title: 'Unit Price',
        flex: 2,
        align: ColumnAlignment.right),
    ReportFieldConfigEntity(
        key: 'discountAmount',
        title: 'Discount',
        flex: 3,
        align: ColumnAlignment.right),
    ReportFieldConfigEntity(
        key: 'tax', title: 'Tax Amount', flex: 3, align: ColumnAlignment.right),
    ReportFieldConfigEntity(
        key: 'amount', title: 'Amount', flex: 3, align: ColumnAlignment.right),
    ReportFieldConfigEntity(
        key: 'productId',
        title: 'Product Id',
        flex: 4,
        align: ColumnAlignment.left),
    ReportFieldConfigEntity(
        key: 'custom',
        title: 'Custom Field',
        flex: 2,
        align: ColumnAlignment.right),
  ];

  static List<ReportFieldConfigEntity> paymentColumn = [
    ReportFieldConfigEntity(
      key: 'date',
      title: 'Date',
      flex: 2,
      align: ColumnAlignment.right,
    ),
    ReportFieldConfigEntity(
      key: 'amount',
      title: 'Amount',
      flex: 1,
      align: ColumnAlignment.right,
    ),
    ReportFieldConfigEntity(
      key: 'mode',
      title: 'Mode',
      flex: 1,
      align: ColumnAlignment.right,
    ),
    ReportFieldConfigEntity(
        key: 'remarks',
        title: 'Remarks',
        flex: 2,
        align: ColumnAlignment.right),
    ReportFieldConfigEntity(
        key: 'currencyId',
        title: 'Currency Id',
        flex: 2,
        align: ColumnAlignment.right),
    ReportFieldConfigEntity(
        key: 'authCode',
        title: 'Auth Code',
        flex: 2,
        align: ColumnAlignment.right),
    ReportFieldConfigEntity(
        key: 'token', title: 'Token', flex: 2, align: ColumnAlignment.right),
    ReportFieldConfigEntity(
        key: 'custom',
        title: 'Custom Field',
        flex: 2,
        align: ColumnAlignment.right),
  ];

  static List<ReportFieldConfigEntity> headerAdditionalFields = [
    ReportFieldConfigEntity(
        key: 'custom',
        title: 'Custom Field',
        flex: 2,
        align: ColumnAlignment.right),
  ];

  static List<ReportFieldConfigEntity> billingAddressFields = [
    ReportFieldConfigEntity(
        key: 'custom',
        title: 'Custom Field',
        flex: 2,
        align: ColumnAlignment.right),
  ];

  static List<ReportFieldConfigEntity> shippingAddressFields = [
    ReportFieldConfigEntity(
        key: 'custom',
        title: 'Custom Field',
        flex: 2,
        align: ColumnAlignment.right),
  ];

  static String getPaymentLineValue(ReportFieldConfigEntity config,
      TransactionHeaderEntity entity, TransactionPaymentLineItemEntity line) {
    switch (config.key) {
      case 'date':
        return '${DateFormat.yMEd().format(line.beginDate!)} ${DateFormat.Hms().format(line.beginDate!)}';
      case 'amount':
        return NumberFormat.simpleCurrency(
                locale: entity.storeLocale, name: line.currencyId)
            .format(line.amount);
      case 'mode':
        return '${line.tenderId}';
      case 'currencyId':
        return '${line.currencyId}';
      case 'authCode':
        return '${line.authCode}';
      case 'token':
        return '${line.token}';
      default:
        return config.defaultValue ?? '';
    }
  }

  static String getLineItemValue(
      ReportFieldConfigEntity config, TransactionLineItemEntity entity,
      {String locale = 'en_US'}) {
    switch (config.key) {
      case 'quantity':
        return entity.quantity.toString();
      case 'rate':
        return NumberFormat.simpleCurrency(
                locale: locale, name: entity.currency)
            .format(entity.unitPrice);
      case 'mrp':
        return entity.grossAmount.toString();
      case 'desc':
        return '${entity.itemDescription}\nSKU: ${entity.itemId}';
      case 'discountAmount':
        return NumberFormat.simpleCurrency(
                locale: locale, name: entity.currency)
            .format(entity.discountAmount);
      case 'sno':
        return entity.lineItemSeq.toString();
      case 'hsn/sac':
        return '${entity.hsn}';
      case 'qty':
        return '${entity.quantity}';
      case 'qtyuom':
        return '${entity.quantity}\n${entity.uom}';
      case 'tax':
        return NumberFormat.simpleCurrency(
                locale: locale, name: entity.currency)
            .format(entity.taxAmount);
      case 'amount':
        return NumberFormat.simpleCurrency(
                locale: locale, name: entity.currency)
            .format(entity.grossAmount);
      case 'productId':
        return '${entity.itemId}';
      default:
        return config.defaultValue ?? '';
    }
  }

  static String buildLineItemSummaryValue(
      ReportFieldConfigEntity config, TransactionHeaderEntity entity) {
    switch (config.key) {
      case 'qtyuom':
      case 'quantity':
        return entity.lineItems
            .fold<double>(
                0.00,
                (previousValue, element) =>
                    previousValue + (!element.isVoid ? element.quantity! : 0))
            .toString();
      case 'tax':
        return NumberFormat.simpleCurrency(
                locale: entity.storeLocale, name: entity.storeCurrency)
            .format(entity.taxTotal);
      case 'amount':
        return NumberFormat.simpleCurrency(
                locale: entity.storeLocale, name: entity.storeCurrency)
            .format(entity.total);
      default:
        return '';
    }
  }

  static Map<int, Alignment> cellAlignments(
      List<InvoiceColumnConfig> columnConfig) {
    Map<int, Alignment> alignments = {};
    for (int i = 0; i < columnConfig.length; i++) {
      switch (columnConfig[i].align) {
        case 'right':
          alignments[i] = Alignment.centerRight;
          break;
        case 'center':
          alignments[i] = Alignment.center;
          break;
        default:
          alignments[i] = Alignment.centerLeft;
      }
    }
    return alignments;
  }

  static Map<int, TableColumnWidth> columnWidths(
      List<InvoiceColumnConfig> columnConfig) {
    Map<int, TableColumnWidth> widths = {};
    for (int i = 0; i < columnConfig.length; i++) {
      widths[i] = FlexColumnWidth(columnConfig[i].flex.toDouble());
    }
    return widths;
  }

  static Map<String, TaxSummary> buildGstTaxSummary(
      List<TransactionLineItemEntity> entity) {
    Map<String, TaxSummary> gstTaxSummary = {};
    for (var item in entity) {
      if (item.taxAmount == 0 || item.hsn == null || item.isVoid) {
        continue;
      }

      if (!gstTaxSummary.containsKey(item.hsn!)) {
        gstTaxSummary[item.hsn!] = TaxSummary(hsnCode: item.hsn!, tax: {});
      }

      gstTaxSummary[item.hsn!]!.taxableAmount += item.netAmount!;
      gstTaxSummary[item.hsn!]!.totalAmount += item.grossAmount!;

      for (var taxModifier in item.taxModifiers) {
        if (taxModifier.taxRuleId != null) {
          if (!gstTaxSummary[item.hsn!]!
              .tax
              .containsKey(taxModifier.taxRuleId)) {
            gstTaxSummary[item.hsn!]!.tax[taxModifier.taxRuleId!] = 0.0;
          }

          gstTaxSummary[item.hsn!]!.tax[taxModifier.taxRuleId!] =
              gstTaxSummary[item.hsn!]!.tax[taxModifier.taxRuleId!]! +
                  taxModifier.taxAmount!;
        }
      }
    }
    return gstTaxSummary;
  }

  static InvoiceTaxData buildTaxSummary(String locale, TaxGroupType type, List<TransactionLineItemEntity> entity) {
    Map<String, List<TransactionLineItemTaxModifier>> taxSummary = {};
    switch(type) {
      case TaxGroupType.hsn:
        return buildDataForGroupByHsn(locale, entity);
      case TaxGroupType.taxRule:
        return buildDataForTaxGroupByRuleId(locale, entity);
      case TaxGroupType.groupId:
        return buildDataForTaxGroup(locale, entity);
    }
    return InvoiceTaxData(header: [], body: []);
  }

  static InvoiceTaxData buildDataForGroupByHsn(String locale, List<TransactionLineItemEntity> entity) {
    Map<String, List<TransactionLineItemTaxModifier>> taxSummary = {};
    Set<String> taxRuleIds = {};
    for (var item in entity) {
      if (item.isVoid) {
        continue;
      }

      if (taxSummary[item.hsn] == null) {
        if (item.hsn == null) {
          continue;
        }
        taxSummary[item.hsn!] = [];
      }

      for (var taxModifier in item.taxModifiers) {
        taxRuleIds.add(taxModifier.taxRuleId!);
        taxSummary[item.hsn!]!.add(taxModifier);
      }
    }

    List<String> taxRuleIdList = taxRuleIds.toList().map((e) => ['$e-rate', e]).expand((x) => x).toList();

    // Build Header List First.
    List<String> header = ["hsn", "taxableAmount", ...taxRuleIdList, "taxAmount", "totalAmount"];

    // For each taxSummary build the row.
    List<Map<String, dynamic> > body = [];
    for(var summary in taxSummary.keys) {
      List<TransactionLineItemTaxModifier> taxLines = taxSummary[summary]!;
      Map<String, dynamic> row = {};
      row["hsn"] = summary;
      row["taxableAmount"] = taxLines.fold<double>(0.00, (previousValue, element) => previousValue + (element.taxableAmount ?? 0.0));
      row["taxAmount"] = taxLines.fold<double>(0.00, (previousValue, element) => previousValue + (element.taxAmount ?? 0.0));
      row["totalAmount"] = taxLines.fold<double>(0.00, (previousValue, element) => previousValue + (element.taxAmount ?? 0.0) + (element.taxableAmount ?? 0.0));
      for(var taxLine in taxLines) {
        row["${taxLine.taxRuleId}-rate"] = NumberFormat.percentPattern(locale).format((taxLine.taxPercent ?? 0.0) / 100);
        row["${taxLine.taxRuleId}"] = taxLine.taxAmount;
      }
      body.add(row);
    }
    return InvoiceTaxData(header: header, body: body);
  }

  static InvoiceTaxData buildDataForTaxGroup(String locale, List<TransactionLineItemEntity> entity) {
    Map<String, List<TransactionLineItemTaxModifier>> taxSummary = {};

    for (var item in entity) {
      if (item.isVoid) {
        continue;
      }

      for (var taxModifier in item.taxModifiers) {
        if (!taxSummary.containsKey(taxModifier.taxGroupId)) {
          taxSummary[taxModifier.taxGroupId ?? "Default"] = [];
        }
        taxSummary[taxModifier.taxGroupId]!.add(taxModifier);
      }
    }

    // Build Header List First.
    List<String> header = ["taxGroup", "taxableAmount", "taxAmount", "totalAmount"];

    // For each taxSummary build the row.
    List<Map<String, dynamic> > body = [];
    for(var summary in taxSummary.keys) {
      List<TransactionLineItemTaxModifier> taxLines = taxSummary[summary]!;
      Map<String, dynamic> row = {};
      row["taxGroup"] = summary;
      row["taxableAmount"] = taxLines.fold<double>(0.00, (previousValue, element) => previousValue + (element.taxableAmount ?? 0.0));
      row["taxAmount"] = taxLines.fold<double>(0.00, (previousValue, element) => previousValue + (element.taxAmount ?? 0.0));
      row["totalAmount"] = taxLines.fold<double>(0.00, (previousValue, element) => previousValue + (element.taxAmount ?? 0.0) + (element.taxableAmount ?? 0.0));
      body.add(row);
    }

    return InvoiceTaxData(header: header, body: body);
  }

  static InvoiceTaxData buildDataForTaxGroupByRuleId(String locale, List<TransactionLineItemEntity> entity) {
    Map<String, List<TransactionLineItemTaxModifier>> taxSummary = {};

    for (var item in entity) {
      if (item.isVoid) {
        continue;
      }

      for (var taxModifier in item.taxModifiers) {
        if (!taxSummary.containsKey(taxModifier.taxRuleId)) {
          taxSummary[taxModifier.taxRuleId ?? "Default"] = [];
        }
        taxSummary[taxModifier.taxRuleId]!.add(taxModifier);
      }
    }

    // Build Header List First.
    List<String> header = ["taxRuleId", "taxableAmount", "taxAmount", "totalAmount"];

    // For each taxSummary build the row.
    List<Map<String, dynamic> > body = [];
    for(var summary in taxSummary.keys) {
      List<TransactionLineItemTaxModifier> taxLines = taxSummary[summary]!;
      Map<String, dynamic> row = {};
      row["taxRuleId"] = summary;
      row["taxableAmount"] = taxLines.fold<double>(0.00, (previousValue, element) => previousValue + (element.taxableAmount ?? 0.0));
      row["taxAmount"] = taxLines.fold<double>(0.00, (previousValue, element) => previousValue + (element.taxAmount ?? 0.0));
      row["totalAmount"] = taxLines.fold<double>(0.00, (previousValue, element) => previousValue + (element.taxAmount ?? 0.0) + (element.taxableAmount ?? 0.0));
      body.add(row);
    }

    return InvoiceTaxData(header: header, body: body);
  }
}

class InvoiceTaxData {
  final List<String> header;
  final List<Map<String, dynamic>> body;

  InvoiceTaxData({required this.header, required this.body});
}

class InvoiceColumnConfig {
  final String key;
  final String title;
  final int flex;
  final String align;

  InvoiceColumnConfig(
      {required this.key,
      required this.title,
      required this.flex,
      this.align = "left"});

  @override
  String toString() {
    return title;
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is InvoiceColumnConfig &&
          runtimeType == other.runtimeType &&
          key == other.key &&
          title == other.title &&
          flex == other.flex &&
          align == other.align;

  @override
  int get hashCode =>
      key.hashCode ^ title.hashCode ^ flex.hashCode ^ align.hashCode;

  Map<String, dynamic> toMap() {
    return {
      'key': key,
      'title': title,
      'flex': flex,
      'align': align,
    };
  }
}

class InvoiceConfig {
  final String code;
  final List<ReportFieldConfigEntity> columnConfig;
  final List<ReportFieldConfigEntity> paymentColumnConfig;
  final List<ReportFieldConfigEntity> headerFieldConfig;
  final List<ReportFieldConfigEntity> billingAddFieldConfig;
  final List<ReportFieldConfigEntity> shippingAddFieldConfig;
  final List<ReportFieldConfigEntity> taxFieldConfig;
  final bool showTaxSummary;
  final TaxGroupType taxGroupType;
  final bool showPaymentDetails;
  final String? logo;
  final bool showTermsAndCondition;
  final String? termsAndCondition;
  final bool showDeclaration;
  final String? declaration;
  final DateTime? lastUpdateAt;

  InvoiceConfig(
      {this.code = "DEFAULT",
      required this.columnConfig,
      this.showTaxSummary = true,
      required this.paymentColumnConfig,
      required this.headerFieldConfig,
      required this.billingAddFieldConfig,
      required this.shippingAddFieldConfig,
      required this.taxFieldConfig,
        this.taxGroupType = TaxGroupType.hsn,
      this.showPaymentDetails = true,
      this.logo,
      this.showTermsAndCondition = false,
      this.termsAndCondition,
      this.showDeclaration = false,
      this.declaration,
      this.lastUpdateAt});

  static InvoiceConfig defaultValue = InvoiceConfig(
      columnConfig: [
        ReportFieldConfigEntity(
            key: 'sno', title: 'S.No', flex: 1, align: ColumnAlignment.center),
        ReportFieldConfigEntity(key: 'desc', title: 'Description', flex: 5),
        ReportFieldConfigEntity(
            key: 'hsn/sac',
            title: 'HSN/SAC',
            flex: 2,
            align: ColumnAlignment.right),
        ReportFieldConfigEntity(
            key: 'qtyuom',
            title: 'Qty/UOM',
            flex: 2,
            align: ColumnAlignment.center),
        ReportFieldConfigEntity(
            key: 'rate',
            title: 'Unit Price',
            flex: 2,
            align: ColumnAlignment.right),
        ReportFieldConfigEntity(
            key: 'discountAmount',
            title: 'Discount',
            flex: 3,
            align: ColumnAlignment.right),
        ReportFieldConfigEntity(
            key: 'tax',
            title: 'Tax Amount',
            flex: 3,
            align: ColumnAlignment.right),
        ReportFieldConfigEntity(
            key: 'amount',
            title: 'Amount',
            flex: 3,
            align: ColumnAlignment.right),
      ],
      paymentColumnConfig: [
        ReportFieldConfigEntity(
          key: 'date',
          title: 'Date',
          flex: 2,
          align: ColumnAlignment.right,
        ),
        ReportFieldConfigEntity(
          key: 'amount',
          title: 'Amount',
          flex: 1,
          align: ColumnAlignment.right,
        ),
        ReportFieldConfigEntity(
          key: 'mode',
          title: 'Mode',
          flex: 1,
          align: ColumnAlignment.right,
        ),
        ReportFieldConfigEntity(
          key: 'remarks',
          title: 'Remarks',
          flex: 2,
          align: ColumnAlignment.right,
        ),
      ],
      taxFieldConfig: [],
      billingAddFieldConfig: [],
      headerFieldConfig: [],
      shippingAddFieldConfig: [],);

  Map<String, dynamic> toMap() {
    return {
      'code': code,
      'columnConfig': columnConfig.map((e) => e.toMap()).toList(),
      'paymentColumnConfig': paymentColumnConfig.map((e) => e.toMap()).toList(),
      'headerFieldConfig': headerFieldConfig.map((e) => e.toMap()).toList(),
      'billingAddFieldConfig':
          billingAddFieldConfig.map((e) => e.toMap()).toList(),
      'shippingAddFieldConfig':
          shippingAddFieldConfig.map((e) => e.toMap()).toList(),
      'taxFieldConfig': taxFieldConfig.map((e) => e.toMap()).toList(),
      'showTaxSummary': showTaxSummary,
      'taxGroupType': taxGroupType.value,
      'showPaymentDetails': showPaymentDetails,
      'logo': logo,
      'showTermsAndCondition': showTermsAndCondition,
      'termsAndCondition': termsAndCondition,
      'showDeclaration': showDeclaration,
      'declaration': declaration,
      'lastUpdateAt': lastUpdateAt?.millisecondsSinceEpoch,
    };
  }

  static InvoiceConfig fromMap(Map<String, dynamic> input) {
    return InvoiceConfig(
      code: input['code'],
      columnConfig: input['columnConfig'] != null
          ? (input['columnConfig'] as List)
              .map((e) => ReportFieldConfigEntity.fromMap(e))
              .toList()
          : [],
      paymentColumnConfig: input['paymentColumnConfig'] != null
          ? (input['paymentColumnConfig'] as List)
              .map((e) => ReportFieldConfigEntity.fromMap(e))
              .toList()
          : [],
      headerFieldConfig: input['headerFieldConfig'] != null
          ? (input['headerFieldConfig'] as List)
              .map((e) => ReportFieldConfigEntity.fromMap(e))
              .toList()
          : [],
      billingAddFieldConfig: input['billingAddFieldConfig'] != null
          ? (input['billingAddFieldConfig'] as List)
              .map((e) => ReportFieldConfigEntity.fromMap(e))
              .toList()
          : [],
      shippingAddFieldConfig: input['shippingAddFieldConfig'] != null
          ? (input['shippingAddFieldConfig'] as List)
              .map((e) => ReportFieldConfigEntity.fromMap(e))
              .toList()
          : [],
      taxFieldConfig: input['taxFieldConfig'] != null
          ? (input['taxFieldConfig'] as List)
              .map((e) => ReportFieldConfigEntity.fromMap(e))
              .toList()
          : [],
      taxGroupType: TaxGroupType.values.firstWhere(
          (element) => element.value == input['taxGroupType'],
          orElse: () => TaxGroupType.hsn),
      showTaxSummary: input['showTaxSummary'],
      showPaymentDetails: input['showPaymentDetails'],
      logo: input['logo'],
      showTermsAndCondition: input['showTermsAndCondition'],
      termsAndCondition: input['termsAndCondition'],
      showDeclaration: input['showDeclaration'],
      declaration: input['declaration'],
      lastUpdateAt: input['lastUpdateAt'] != null
          ? DateTime.fromMicrosecondsSinceEpoch(input['lastUpdateAt'])
          : null,
    );
  }
}

class TaxSummary {
  String hsnCode;
  double taxableAmount;
  Map<String, double> tax;
  double totalAmount;

  TaxSummary({
    required this.hsnCode,
    this.taxableAmount = 0.00,
    required this.tax,
    this.totalAmount = 0.00,
  });
}


// class TaxSummary {
//   List<String> header;
//   List<Map<String, dynamic>> rows;
//
//   TaxSummary({required this.header, required this.rows});
// }


/// Group By Tax Rule, Tax Rate
/// Group By Tax Group
/// Group By Tax Rule
///
/// Group By HSN Create Different Widget