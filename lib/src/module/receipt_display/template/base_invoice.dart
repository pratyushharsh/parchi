import 'dart:io';
import 'dart:typed_data';

import 'package:easy_localization/easy_localization.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';
import 'package:printing/printing.dart';

import '../../../entity/pos/entity.dart';
import 'invoice.dart';
import 'invoice_config.dart';

class BaseInvoice extends IInvoice with InvoiceUtil {
  final TransactionHeaderEntity order;
  final RetailLocationEntity store;
  final InvoiceConfig config;

  BaseInvoice({required this.order, required this.store, required this.config});

  @override
  Widget buildFooter(Context context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Made on Parchi."),
            Text("Page ${context.pageNumber} of ${context.pagesCount}"),
          ],
        )
      ],
    );
  }

  @override
  Future<PageTheme> buildPageTheme(PdfPageFormat pageFormat) async {
    return PageTheme(
      pageFormat: pageFormat,
      margin: const EdgeInsets.all(20),
      theme: ThemeData.withFont(
        base: await PdfGoogleFonts.openSansRegular(),
        bold: await PdfGoogleFonts.openSansBold(),
        italic: await PdfGoogleFonts.openSansItalic(),
        boldItalic: await PdfGoogleFonts.openSansBoldItalic(),
        fontFallback: [
          await PdfGoogleFonts.robotoRegular(),
          await PdfGoogleFonts.robotoBold(),
          await PdfGoogleFonts.robotoBoldItalic()
        ],
      ),
    );
  }

  @override
  Widget buildHeader(Context context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            getStoreLogo(context) != null
                ? Image(getStoreLogo(context)!, height: 100, width: 200)
                : SizedBox(),
            buildStoreDetail(context)
          ]),
          Divider(height: 6, thickness: 0.8),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: buildBillingAddress(context),
              ),
              Expanded(
                child: buildShippingAddress(context),
              )
            ],
          ),
          Divider(height: 0, thickness: 0.8),
        ],
      ),
    );
  }

  @override
  Future<Uint8List> buildPdf(PdfPageFormat pageFormat) async {
    final doc = Document();
    doc.addPage(
      MultiPage(
        pageTheme: await buildPageTheme(pageFormat),
        header: buildHeader,
        footer: buildFooter,
        build: (context) => [
          buildItemBody(context),
          if (config.showPaymentDetails)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20),
                Text(
                  'Payment Details',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 6),
              ],
            ),
          if (config.showPaymentDetails) buildPaymentDetails(context),
          if (config.showTaxSummary)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20),
                Text(
                  'Tax Summary',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 6),
              ],
            ),
          if (config.showTaxSummary) buildTaxSummary(context),
          InvoiceFooterWidget(config: config)
        ],
      ),
    );
    return doc.save();
  }

  @override
  Widget buildItemBody(Context context) {
    return buildTable(
      columnConfig: config.columnConfig,
      data: order.lineItems,
      displayHeader: true,
      builder: (column, item) {
        if (item is TransactionLineItemEntity) {
          return InvoiceConfigConstants.getLineItemValue(
            column,
            item,
            locale: order.storeLocale,
          );
        }
        return '';
      },
      displaySummary: true,
      summaryBuilder: (column) {
        return InvoiceConfigConstants.buildLineItemSummaryValue(column, order);
      },
    );
  }

  @override
  Widget buildPaymentDetails(Context context) {
    return buildTable(
      columnConfig: config.paymentColumnConfig,
      data: order.paymentLineItems,
      builder: (column, item) {
        if (item is TransactionPaymentLineItemEntity) {
          return InvoiceConfigConstants.getPaymentLineValue(
              column, order, item);
        }
        return '';
      },
    );
  }

  @override
  Widget buildTaxSummary(Context context) {
    var taxSummary = InvoiceConfigConstants.buildGstTaxSummary(order.lineItems);

    final rows = <TableRow>[];

    final headerRow = <Widget>[];

    // Build Header Row
    headerRow.add(
      Container(
        padding: const EdgeInsets.symmetric(vertical: 3),
        child: Text(
          'HSN Code',
          textAlign: TextAlign.left,
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );

    headerRow.add(
      Container(
        padding: const EdgeInsets.symmetric(vertical: 3),
        child: Text(
          'Taxable Amount',
          textAlign: TextAlign.left,
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );

    // Get all the unique tax values from the tax summary
    Set<String> taxNames = {};
    for (var taxRule in taxSummary.values) {
      taxNames.addAll(taxRule.tax.keys);
    }

    List<String> taxColumns = taxNames.toList();

    for (var i = 0; i < taxColumns.length; i++) {
      final taxName = taxColumns[i];
      headerRow.add(
        Container(
          padding: const EdgeInsets.symmetric(vertical: 3),
          child: Text(
            taxName,
            textAlign: TextAlign.left,
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      );
    }

    headerRow.add(
      Container(
        padding: const EdgeInsets.symmetric(vertical: 3),
        child: Text(
          'Taxable Amount',
          textAlign: TextAlign.left,
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );

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

    // Build the rows
    for (var i = 0; i < taxSummary.length; i++) {
      final row = <Widget>[];
      final taxRule = taxSummary.values.elementAt(i);
      final hsnCode = taxSummary.keys.elementAt(i);
      row.add(
        Container(
          padding: const EdgeInsets.symmetric(vertical: 2),
          child: Text(
            hsnCode,
            textAlign: TextAlign.left,
          ),
        ),
      );

      row.add(
        Container(
          padding: const EdgeInsets.symmetric(vertical: 2),
          child: Text(
            taxRule.taxableAmount.toStringAsFixed(2),
            textAlign: TextAlign.left,
          ),
        ),
      );

      for (var j = 0; j < taxColumns.length; j++) {
        final taxName = taxColumns[j];
        row.add(
          Container(
            padding: const EdgeInsets.symmetric(vertical: 2),
            child: Text(
              NumberFormat.simpleCurrency(
                      locale: order.storeLocale, name: order.storeCurrency)
                  .format(taxRule.tax[taxName] ?? 0.00),
              textAlign: TextAlign.left,
            ),
          ),
        );
      }

      row.add(
        Container(
          padding: const EdgeInsets.symmetric(vertical: 2),
          child: Text(
            NumberFormat.simpleCurrency(
                    locale: order.storeLocale, name: order.storeCurrency)
                .format(taxRule.totalAmount),
            textAlign: TextAlign.left,
          ),
        ),
      );

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

    return Table(
      children: rows,
      // columnWidths: columnWidths,
    );
  }

  @override
  ImageProvider? getStoreLogo(Context context) {
    if (config.logo != null && config.logo != null) {
      if (config.logo!.startsWith("file://") &&
          config.logo!.substring(6).isNotEmpty) {
        File file = File(config.logo!.replaceAll("file://", ""));
        return MemoryImage(file.readAsBytesSync());
      }
    }
    return null;
  }

  @override
  Widget buildStoreDetail(Context context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          '${store.storeName}',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          '${store.address?.address1 ?? ''} ${store.address?.address2 ?? ''}',
        ),
        Text(
          '${store.address?.city} ${store.address?.state}-${store.address?.zipcode}',
        ),
        Text(
          'Phone: ${store.storeContact ?? ''}',
        ),
        Text('Email:  ${store.storeEmail ?? ''}'),
        Text(
          'GST: ${store.gst ?? ''}',
        ),
        ...config.headerFieldConfig
            .map((e) => Text(
                  '${e.title}: ${e.defaultValue}',
                ))
            .toList(),
      ],
    );
  }

  @override
  Widget buildBillingAddress(Context context) {
    return Container(
      padding: const EdgeInsets.only(right: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Billing Detail',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            order.customerName ?? '',
          ),
          Text(
            '${order.billingAddress?.address1} ${order.billingAddress?.address2}',
          ),
          Text(
            '${order.billingAddress?.city} ${order.billingAddress?.state}-${order.billingAddress?.zipcode}',
          ),
          Text(
            'Ph: ${order.customerPhone ?? ''}',
          ),
          ...config.billingAddFieldConfig
              .map((e) => Text(
                    '${e.title}: ${e.defaultValue}',
                  ))
              .toList(),
        ],
      ),
    );
  }

  @override
  Widget buildShippingAddress(Context context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          'Shipping Detail',
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          order.customerName ?? '',
        ),
        Text(
          '${order.shippingAddress?.address1} ${order.shippingAddress?.address2}',
        ),
        Text(
          '${order.shippingAddress?.city} ${order.shippingAddress?.state}-${order.shippingAddress?.zipcode}',
        ),
        Text(
          'Ph: ${order.customerPhone ?? ''}',
        ),
        ...config.shippingAddFieldConfig
            .map((e) => Text(
                  '${e.title}: ${e.defaultValue}',
                ))
            .toList(),
      ],
    );
  }

  @override
  Widget buildTermsAndConditions(Context context) {
    if (!config.showTermsAndCondition) {
      return Container();
    }
    return TermsAndConditionWidget(
        termsAndCondition: config.termsAndCondition ?? '');
  }

  @override
  Widget buildThankYou(Context context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Thank you for your business!',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget buildDeclarationSignature(Context context) {
    return DeclarationAndSignatureWidget(
        declaration: config.declaration ?? "",
        showDeclaration: config.showDeclaration);
  }
}

class DeclarationAndSignatureWidget extends StatelessWidget {
  final String declaration;
  final bool showDeclaration;

  DeclarationAndSignatureWidget({
    required this.declaration,
    this.showDeclaration = true,
  });
  @override
  Widget build(Context context) {
    return Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Expanded(
        child: showDeclaration
            ? Container(
                margin: const EdgeInsets.only(right: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Declaration',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                    Text(
                      declaration,
                    ),
                  ],
                ),
              )
            : Container(),
      ),
      Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Signature',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
            Container(
              height: 50,
              width: 200,
              decoration: BoxDecoration(
                border: Border.all(
                  color: PdfColors.black,
                  width: 0.5,
                ),
              ),
            ),
          ],
        ),
      ),
    ]);
  }
}

class TermsAndConditionWidget extends StatelessWidget {
  final String termsAndCondition;

  TermsAndConditionWidget({required this.termsAndCondition});
  @override
  Widget build(Context context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Terms & Conditions',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              decoration: TextDecoration.underline,
            ),
          ),
          Text(
            termsAndCondition,
          ),
          SizedBox(height: 10),
        ],
      ),
    );
  }

  @override
  bool get canSpan {
    return false;
  }
}

class InvoiceFooterWidget extends StatelessWidget {
  final InvoiceConfig config;

  InvoiceFooterWidget({required this.config});
  @override
  Widget build(Context context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          TermsAndConditionWidget(
            termsAndCondition: config.termsAndCondition ?? "",
          ),
          DeclarationAndSignatureWidget(
              declaration: config.declaration ?? "",
              showDeclaration: config.showDeclaration),
        ],
      ),
    );
  }
}
