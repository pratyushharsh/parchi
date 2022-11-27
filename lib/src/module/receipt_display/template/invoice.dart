import 'dart:typed_data';

import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';

import '../../../config/image_util.dart';
import '../../../entity/pos/entity.dart';
import 'base_invoice.dart';
import 'invoice_config.dart';

Future<Uint8List> generateInvoice(
    PdfPageFormat pageFormat,
    TransactionHeaderEntity order,
    RetailLocationEntity store,
    InvoiceConfig config) async {
  // Invoice2 invoice = Invoice2(order);
  // Invoice1 invoice = Invoice1(order, store, config);
  IInvoice invoice = BaseInvoice(order: order, store: store, config: config);

  return await invoice.buildPdf(pageFormat);
}

mixin InvoiceUtil {
  TextAlign getColumnAlign(ColumnAlignment? align) {
    switch (align) {
      case ColumnAlignment.right:
        return TextAlign.right;
      case ColumnAlignment.center:
        return TextAlign.center;
      case ColumnAlignment.justify:
        return TextAlign.justify;
      default:
        return TextAlign.left;
    }
  }

  // Table Header
  Table buildTable(
      {required List<ReportFieldConfigEntity> columnConfig,
        required List<dynamic> data,
        required ColumnBuilder builder,
        bool displayHeader = true,
        bool displaySummary = false,
        ColumnSummaryBuilder? summaryBuilder}) {

    if (displaySummary && summaryBuilder == null) {
      throw Exception('Summary builder is required');
    }

    final rows = <TableRow>[];

    if (displayHeader) {
      final headerRow = <Widget>[];
      for (var i = 0; i < columnConfig.length; i++) {
        final column = columnConfig[i];
        headerRow.add(
          Container(
            padding: const EdgeInsets.symmetric(vertical: 3),
            child: Text(
              column.title ?? '',
              textAlign: getColumnAlign(column.align),
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        );
      }
      rows.add(
        TableRow(
          children: headerRow,
          repeat: true,
          decoration: const BoxDecoration(
            color: PdfColors.grey200,
            border: Border.symmetric(
              horizontal: BorderSide(
                color: PdfColors.black,
                width: 0.8,
              ),
            ),
          ),
        ),
      );
    }

    // Table Item
    for (var i = 0; i < data.length; i++) {
      final lineItem = data[i];
      final row = <Widget>[];
      for (var j = 0; j < columnConfig.length; j++) {
        final column = columnConfig[j];
        row.add(
          Expanded(
            flex: column.flex!,
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 2),
              child: Text(
                builder(column, lineItem),
                textAlign: getColumnAlign(column.align),
              ),
            ),
          ),
        );
      }
      rows.add(
        TableRow(
          children: row,
          decoration: const BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: PdfColors.grey,
                width: 0.5,
              ),
            ),
          ),
        ),
      );
    }

    // Table Summary
    if (displaySummary) {
      // Build Table Summary
      final summaryRow = <Widget>[];
      for (var i = 0; i < columnConfig.length; i++) {
        final column = columnConfig[i];
        summaryRow.add(Expanded(
            flex: column.flex!,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 2),
              child: Text(summaryBuilder!(column),
                textAlign: getColumnAlign(column.align),
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            )));
      }
      rows.add(
        TableRow(
          children: summaryRow,
          decoration: const BoxDecoration(
            border: Border(
              top: BorderSide(
                color: PdfColors.black,
                width: 0.8,
              ),
              bottom: BorderSide(
                color: PdfColors.black,
                width: 0.8,
              ),
            ),
          ),
        ),
      );
    }

    return Table(
      children: rows,
      defaultVerticalAlignment: TableCellVerticalAlignment.full,
    );
  }
}

typedef ColumnBuilder<T> = String Function(
    ReportFieldConfigEntity config, T data);

typedef ColumnSummaryBuilder = String Function(
    ReportFieldConfigEntity config);

abstract class IInvoice with InvoiceUtil, ImageMixinConfig {
  Future<Uint8List> buildPdf(PdfPageFormat pageFormat);
  ImageProvider? getStoreLogo(Context context);
  Widget buildStoreDetail(Context context);
  Widget buildShippingAddress(Context context);
  Widget buildBillingAddress(Context context);
  Widget buildHeader(Context context);
  Widget buildItemBody(Context context);
  Widget buildPaymentDetails(Context context);
  Widget buildTaxSummary(Context context);
  Widget buildFooter(Context context);
  Widget buildDeclarationSignature(Context context);
  Widget buildThankYou(Context context);
  Widget buildTermsAndConditions(Context context);
  Future<PageTheme> buildPageTheme(PdfPageFormat pageFormat);
}
