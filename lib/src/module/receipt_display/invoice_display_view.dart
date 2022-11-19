import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:number_to_words/number_to_words.dart';
import 'package:pdf/pdf.dart';
import 'package:printing/printing.dart';
import 'package:pdf/widgets.dart' as pw;

import '../../config/theme_settings.dart';
import '../../entity/pos/entity.dart';
import '../../util/extension/string_extension.dart';
import '../../widgets/appbar_leading.dart';
import 'bloc/receipt_display_bloc.dart';
import 'custom_expanded.dart';
import 'invoice_builder.dart';

const double fontSize = 7;

class InvoiceDisplayView extends StatefulWidget {
  final String transactionId;
  const InvoiceDisplayView({Key? key, required this.transactionId})
      : super(key: key);

  static final List<InvoiceTableCellModel> headers = [
    InvoiceTableCellModel(label: "Sl.No", flex: 2),
    InvoiceTableCellModel(label: "Description", flex: 11),
    InvoiceTableCellModel(label: "HSN/SAC", flex: 5),
    InvoiceTableCellModel(label: "Alt/Qty", flex: 4),
    InvoiceTableCellModel(label: "Qty", flex: 4),
    InvoiceTableCellModel(label: "Sale Price", flex: 5),
    InvoiceTableCellModel(label: "Rate", flex: 5),
    InvoiceTableCellModel(label: "UOM", flex: 3),
    InvoiceTableCellModel(label: "Disc", flex: 3),
    InvoiceTableCellModel(label: "Amount", flex: 6, textAlign: TextAlign.right)
  ];

  @override
  State<InvoiceDisplayView> createState() => _InvoiceDisplayViewState();
}

class _InvoiceDisplayViewState extends State<InvoiceDisplayView> {

  List<GlobalKey<State<StatefulWidget>>> keys = List.generate(200, (index) => GlobalKey());
  int count = 0;

  // void _printReceipt(List<GlobalKey> key) {
  //   Printing.layoutPdf(
  //       format: PdfPageFormat.a4,
  //       onLayout: (PdfPageFormat format) async {
  //         final doc = pw.Document();
  //
  //         for (GlobalKey k in key) {
  //           final image = await WidgetWraper.fromKey(
  //             key: k,
  //             pixelRatio: 5.0,
  //           );
  //           doc.addPage(pw.Page(
  //               pageFormat: format,
  //               build: (pw.Context context) {
  //                 return pw.Center(
  //                   child: pw.Image(image),
  //                 );
  //               }));
  //         }
  //
  //         return doc.save();
  //       });
  // }

  void _shareReceipt(List<GlobalKey> key) async {
    final doc = pw.Document();

    for (GlobalKey k in key) {
      final image = await WidgetWraper.fromKey(
        key: k,
        pixelRatio: 5.0,
      );
      doc.addPage(pw.Page(
          pageFormat: PdfPageFormat.a4,
          margin: pw.EdgeInsets.zero,
          build: (pw.Context context) {
            return pw.Image(image);
          }));
    }

    var raw = await doc.save();

    Printing.sharePdf(
      filename: '${widget.transactionId}.pdf',
      bytes: raw,
    );
  }

  void updateKeys(int k) {
    // _keys = k;
    // print('total page $k');
    count = k;
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      lazy: false,
      create: (context) => ReceiptDisplayBloc(
          transId: widget.transactionId,
          transactionRepo: RepositoryProvider.of(context),
          authBloc: RepositoryProvider.of(context),
          settingsRepo: RepositoryProvider.of(context))
        ..add(FetchReceiptDataEvent()),
      child: Container(
        color: AppColor.background,
        child: SafeArea(
            child: Scaffold(
          backgroundColor: AppColor.background,
          body: BlocBuilder<ReceiptDisplayBloc, ReceiptDisplayState>(
              builder: (context, state) {
            return Stack(
              fit: StackFit.expand,
              children: [
                if (state.status == ReceiptDisplayStatus.success)
                  SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(5),
                      child: InteractiveViewer(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            const SizedBox(
                              height: 80,
                            ),
                            Invoice(
                              state: state,
                              keys: keys,
                              updateKeys: updateKeys,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                if (state.status == ReceiptDisplayStatus.success)
                  Positioned(
                    top: 20,
                    left: 16,
                    child: AppBarLeading(
                      heading: "Invoice #${state.header!.transId}",
                      icon: Icons.arrow_back,
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ),
                if (state.status == ReceiptDisplayStatus.success)
                  Positioned(
                    top: 20,
                    right: 16,
                    child: IconButton(
                      icon: const Icon(Icons.print),
                      onPressed: () {
                        _shareReceipt(keys.sublist(0, count));
                        // _printReceipt(keys.sublist(0, count));
                      },
                    ),
                  ),
              ],
            );
          }),
        )),
      ),
    );
  }
}

class Invoice extends StatefulWidget {
  final ReceiptDisplayState state;
  final Function updateKeys;
  final List<GlobalKey<State<StatefulWidget>>> keys;
  const Invoice(
      {Key? key,
      required this.state,
      required this.updateKeys,
      required this.keys})
      : super(key: key);

  @override
  State<Invoice> createState() => _InvoiceState();
}

class _InvoiceState extends State<Invoice> {
  List<List<TransactionLineItemEntity>> line = [];
  bool initialPass = true;

  @override
  void initState() {
    super.initState();
    line = [widget.state.lineItems!];
    initialPass = true;
  }

  void updateLineItems(List<double> heights, double maxHeight) {
    if (!initialPass) return;
    // Build Lines based upon the weight
    var totalHeight = heights.fold<double>(
        0.0, (previousValue, element) => previousValue + element);
    var headerHeight = 0.0;
    var footerHeight = 0.0;
    if (heights.length >= 5) {
      headerHeight += (heights[0] + heights[1]);
      footerHeight += (heights[heights.length - 1] +
          heights[heights.length - 2] +
          heights[heights.length - 3]);
    }

    List<List<TransactionLineItemEntity>> res = [];
    // Based upon the lineItems Length calculate the size
    List<TransactionLineItemEntity> tmp = [];
    double th = headerHeight;
    bool pageOverFlow = false;
    for (int i = 0; i < widget.state.lineItems!.length; i++) {
      if (th + heights[i + 2] + footerHeight < maxHeight) {
        tmp.add(widget.state.lineItems![i]);
        th += heights[i + 2];
        pageOverFlow = false;
      } else if (th + heights[i + 2] < maxHeight) {
        tmp.add(widget.state.lineItems![i]);
        th += heights[i + 2];
        pageOverFlow = true;
      } else {
        res.add(tmp);
        tmp = [];
        tmp.add(widget.state.lineItems![i]);
        th = headerHeight + heights[i + 2];
        pageOverFlow = false;
      }
    }

    if (tmp.isNotEmpty) {
      res.add(tmp);
    }

    if (pageOverFlow) {
      res.add([]);
    }

    // Set the value of initial paas to false before computing.
    initialPass = false;
    widget.updateKeys(res.length);
    if (totalHeight > maxHeight) {
      setState(() {
        line = res;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: line
          .asMap()
          .entries
          .map(
            (e) => InvoiceBlock(
              printKey: widget.keys[e.key],
              headers: InvoiceDisplayView.headers,
              lineItems: e.value,
              displayInvoiceFooter: e.key == line.length - 1,
              onLineItemOverFlow: updateLineItems,
            ),
          )
          .toList(),
    );
  }
}

class InvoiceBlock extends StatelessWidget {
  final GlobalKey<State<StatefulWidget>> printKey;
  final List<InvoiceTableCellModel> headers;
  final bool displayInvoiceFooter;
  final List<TransactionLineItemEntity> lineItems;
  final OnLineItemOverFlow onLineItemOverFlow;
  const InvoiceBlock(
      {Key? key,
      required this.printKey,
      required this.headers,
      required this.onLineItemOverFlow,
      this.displayInvoiceFooter = true,
      required this.lineItems})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      key: printKey,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
        child: Container(
          height: math.min(MediaQuery.of(context).size.width, 600) * 1.414,
          width: math.min(MediaQuery.of(context).size.width, 600),
          margin: const EdgeInsets.all(8),
          decoration: BoxDecoration(border: Border.all(width: 0.4)),
          padding: const EdgeInsets.all(2),
          child: CustomInvoiceColumn(
            onLineItemOverflow: onLineItemOverFlow,
            children: [
              const InvoiceHeader(),
              InvoiceTableCells(
                bottomBorder: true,
                data: headers,
              ),
              ...lineItems
                  .map((e) => const InvoiceTableCells(
                        data: [
                          // InvoiceTableCellModel(
                          //     label: e.transSeq.toString(), flex: 2),
                          // InvoiceTableCellModel(
                          //     label: e.productDescription,
                          //     flex: 11,
                          //     fontWeight: FontWeight.bold),
                          // InvoiceTableCellModel(label: "${e.hsn}", flex: 5),
                          // InvoiceTableCellModel(label: "", flex: 4),
                          // InvoiceTableCellModel(
                          //     label: e.quantity.toString(),
                          //     flex: 4,
                          //     fontWeight: FontWeight.bold,
                          //     textAlign: TextAlign.right),
                          // InvoiceTableCellModel(
                          //     label: e.listPrice.toStringAsFixed(2),
                          //     flex: 5,
                          //     textAlign: TextAlign.right),
                          // InvoiceTableCellModel(
                          //     label: e.salePrice.toStringAsFixed(2),
                          //     flex: 5,
                          //     textAlign: TextAlign.right),
                          // InvoiceTableCellModel(label: e.uom, flex: 3),
                          // InvoiceTableCellModel(
                          //     label: (e.itemDiscount + e.orderDiscount)
                          //         .toStringAsFixed(2),
                          //     flex: 3),
                          // InvoiceTableCellModel(
                          //     label: e.amount.toStringAsFixed(2),
                          //     flex: 6,
                          //     fontWeight: FontWeight.bold,
                          //     textAlign: TextAlign.right),
                        ],
                      ))
                  .toList(),
              if (displayInvoiceFooter) const TaxSummaryAmount(),
              CustomExpanded(
                child: InvoiceSpacer(
                  data: headers,
                ),
              ),
              // Expanded(child: InvoiceSpacer(data: headers)),
              if (displayInvoiceFooter) const InvoiceTableOrderSummary(),
              if (displayInvoiceFooter) const InvoiceFooter()
            ],
          ),
        ),
      ),
    );
  }
}

class TaxSummaryAmount extends StatelessWidget {
  const TaxSummaryAmount({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReceiptDisplayBloc, ReceiptDisplayState>(
      builder: (context, state) {
        return Column(
          children: [
            InvoiceTableCells(
              padding: const EdgeInsets.symmetric(vertical: 1, horizontal: 1),
              data: [
                InvoiceTableCellModel(label: "", flex: 2),
                InvoiceTableCellModel(
                    label: "Output CGST @9%",
                    flex: 11,
                    fontWeight: FontWeight.bold,
                    textAlign: TextAlign.right),
                InvoiceTableCellModel(label: "", flex: 5),
                InvoiceTableCellModel(label: "", flex: 4),
                InvoiceTableCellModel(
                    label: "",
                    flex: 4,
                    fontWeight: FontWeight.bold,
                    textAlign: TextAlign.right),
                InvoiceTableCellModel(
                    label: "", flex: 5, textAlign: TextAlign.right),
                InvoiceTableCellModel(
                    label: "", flex: 5, textAlign: TextAlign.right),
                InvoiceTableCellModel(label: "", flex: 3),
                InvoiceTableCellModel(label: "", flex: 3),
                InvoiceTableCellModel(
                    label: "Rs. 4324.43",
                    flex: 6,
                    fontWeight: FontWeight.bold,
                    textAlign: TextAlign.right),
              ],
            ),
            InvoiceTableCells(
              padding: const EdgeInsets.symmetric(vertical: 1, horizontal: 1),
              data: [
                InvoiceTableCellModel(label: "", flex: 2),
                InvoiceTableCellModel(
                    label: "Output SGST @9%",
                    flex: 11,
                    fontWeight: FontWeight.bold,
                    textAlign: TextAlign.right),
                InvoiceTableCellModel(label: "", flex: 5),
                InvoiceTableCellModel(label: "", flex: 4),
                InvoiceTableCellModel(
                    label: "",
                    flex: 4,
                    fontWeight: FontWeight.bold,
                    textAlign: TextAlign.right),
                InvoiceTableCellModel(
                    label: "", flex: 5, textAlign: TextAlign.right),
                InvoiceTableCellModel(
                    label: "", flex: 5, textAlign: TextAlign.right),
                InvoiceTableCellModel(label: "", flex: 3),
                InvoiceTableCellModel(label: "", flex: 3),
                InvoiceTableCellModel(
                    label: "Rs.4324.43",
                    flex: 6,
                    fontWeight: FontWeight.bold,
                    textAlign: TextAlign.right),
              ],
            ),
          ],
        );
      },
    );
  }
}

class InvoiceHeader extends StatelessWidget {
  const InvoiceHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          border: Border(
        bottom: BorderSide(width: 0.4),
      )),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
              child: Column(
            children: const [InvoiceBusinessDetail(), InvoiceBuyerDetail()],
          )),
          const Expanded(child: InvoiceSummary())
        ],
      ),
    );
  }
}

class InvoiceBusinessDetail extends StatelessWidget {
  const InvoiceBusinessDetail({Key? key}) : super(key: key);
  final double fontSize = 8;

  @override
  Widget build(BuildContext context) {
    var store = BlocProvider.of<ReceiptDisplayBloc>(context).authBloc.state.store!;
    return Container(
      decoration: const BoxDecoration(
          border: Border(
        right: BorderSide(width: 0.4),
        bottom: BorderSide(width: 0.4),
      )),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (store.storeName != null)
          Text(
            store.storeName!,
            style:
                TextStyle(fontWeight: FontWeight.bold, fontSize: fontSize + 1),
          ),
          if (store.address?.address1 != null)
          Text(
            store.address!.address1!,
            style: TextStyle(fontSize: fontSize),
          ),
          if (store.address?.address2 != null)
          Text(
            store.address!.address2!,
            style: TextStyle(fontSize: fontSize),
          ),
          if (store.storeContact != null)
          Text(
            "Ph: `${store.storeContact}`",
            style: TextStyle(fontSize: fontSize),
          ),
          if (store.gst != null)
          Text(
            "GST: ${store.gst}",
            style: TextStyle(fontSize: fontSize),
          ),
          Text(
            "${store.address?.state} - ${store.address?.zipcode} - ${store.address?.country}",
            style: TextStyle(fontSize: fontSize),
          ),
          if (store.storeEmail != null)
          Text(
            "Email: ${store.storeEmail}",
            style: TextStyle(fontSize: fontSize),
          ),
        ],
      ),
    );
  }
}

class InvoiceBuyerDetail extends StatelessWidget {
  const InvoiceBuyerDetail({Key? key}) : super(key: key);
  final double fontSize = 8;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          border: Border(
        right: BorderSide(width: 0.4),
      )),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Buyer:",
            style: TextStyle(fontSize: fontSize),
          ),
          Text(
            "Samrat Agency",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: fontSize),
          ),
          Text(
            "Gola Road, Samastipur",
            style: TextStyle(fontSize: fontSize),
          ),
          Text(
            "Bihar - 848101, India",
            style: TextStyle(fontSize: fontSize),
          ),
          Text(
            "GSTIN/UIN: 10AKKKFREG4345KK",
            style: TextStyle(fontSize: fontSize),
          ),
          Text(
            "PAN/IT NO: ASYPK7166E",
            style: TextStyle(fontSize: fontSize),
          ),
          Text(
            "State Name: Bihar, Code : 10",
            style: TextStyle(fontSize: fontSize),
          ),
          Text(
            "Contact person: Pratyush Harsh",
            style: TextStyle(fontSize: fontSize),
          ),
          Text(
            "Contact : 9931032480",
            style: TextStyle(fontSize: fontSize),
          ),
        ],
      ),
    );
  }
}

class InvoiceSummaryBlock extends StatelessWidget {
  final String label;
  final String value;
  final bool? top;
  final bool? right;
  final bool? bottom;
  final bool? left;
  const InvoiceSummaryBlock(
      {Key? key,
      required this.label,
      required this.value,
      this.top,
      this.right,
      this.bottom,
      this.left})
      : super(key: key);
  final double fontSize = 7;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(1),
      decoration: BoxDecoration(
          border: Border(
        top: top != null ? const BorderSide(width: 0.4) : BorderSide.none,
        right: right != null ? const BorderSide(width: 0.4) : BorderSide.none,
        bottom: bottom != null ? const BorderSide(width: 0.4) : BorderSide.none,
        left: left != null ? const BorderSide(width: 0.4) : BorderSide.none,
      )),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: TextStyle(fontSize: fontSize)),
          FittedBox(
            fit: BoxFit.fill,
            child: Text(
              value.isNotEmpty ? value : " ",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: fontSize),
            ),
          ),
        ],
      ),
    );
  }
}

class InvoiceSummary extends StatelessWidget {
  const InvoiceSummary({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(2),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(width: 0.4),
              ),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Expanded(
                  child: InvoiceSummaryBlock(
                    right: true,
                    label: "Invoice No.",
                    value: "SRS/22-23/0498",
                  ),
                ),
                Expanded(
                  child: InvoiceSummaryBlock(
                    label: "Dated",
                    value: "2-May-22",
                  ),
                ),
              ],
            ),
          ),
          Container(
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(width: 0.4),
              ),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Expanded(
                  child: InvoiceSummaryBlock(
                    right: true,
                    label: "Delivery Note",
                    value: "",
                  ),
                ),
                Expanded(
                  child: InvoiceSummaryBlock(
                    label: "Mode/Terms of Payment",
                    value: "",
                  ),
                ),
              ],
            ),
          ),
          Container(
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(width: 0.4),
              ),
            ),
            child: Row(
              children: const [
                Expanded(
                  child: InvoiceSummaryBlock(
                    right: true,
                    label: "Reference No & Date",
                    value: "SRS/22-23/0498 dt 2-May-22",
                  ),
                ),
                Expanded(
                  child: InvoiceSummaryBlock(
                    label: "Other Reference",
                    value: "",
                  ),
                ),
              ],
            ),
          ),
          Container(
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(width: 0.4),
              ),
            ),
            child: Row(
              children: const [
                Expanded(
                  child: InvoiceSummaryBlock(
                    right: true,
                    label: "Buyer's Order No",
                    value: "",
                  ),
                ),
                Expanded(
                  child: InvoiceSummaryBlock(
                    label: "Dated",
                    value: "",
                  ),
                ),
              ],
            ),
          ),
          Container(
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(width: 0.4),
              ),
            ),
            child: Row(
              children: const [
                Expanded(
                  child: InvoiceSummaryBlock(
                    right: true,
                    label: "Dispatch Doc No",
                    value: "",
                  ),
                ),
                Expanded(
                  child: InvoiceSummaryBlock(
                    label: "Delivery Note Date",
                    value: "",
                  ),
                ),
              ],
            ),
          ),
          Container(
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(width: 0.4),
              ),
            ),
            child: Row(
              children: const [
                Expanded(
                  child: InvoiceSummaryBlock(
                    right: true,
                    label: "Dispatched Through",
                    value: "",
                  ),
                ),
                Expanded(
                  child: InvoiceSummaryBlock(
                    label: "Destination",
                    value: "",
                  ),
                ),
              ],
            ),
          ),
          const InvoiceSummaryBlock(label: "Terms of delivery", value: "")
        ],
      ),
    );
  }
}

class InvoiceTable extends StatelessWidget {
  final List<InvoiceTableCellModel> headers;
  const InvoiceTable({Key? key, required this.headers}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InvoiceTableCells(
          bottomBorder: true,
          data: headers,
        ),
        const InvoiceTableLineItems(),
        Expanded(child: InvoiceSpacer(data: headers)),
        const InvoiceTableOrderSummary(),
        const Text(
          "Amount Chargeable (in words)",
          style: TextStyle(fontSize: fontSize),
        ),
        BlocBuilder<ReceiptDisplayBloc, ReceiptDisplayState>(
          builder: (context, state) {
            var x = state.header!.total.toInt();
            var y = (state.header!.total * 100 % 100).toInt();

            String amountToWord =
                "INR ${NumberToWord().convert('en-in', x).toTitleCase()}";
            if (y > 0) {
              amountToWord += " and ";
              amountToWord +=
                  NumberToWord().convert('en-in', y).toTitleCase();
              amountToWord += "paise Only";
            }

            return Text(
              amountToWord,
              style: const TextStyle(
                  fontSize: fontSize + 1, fontWeight: FontWeight.bold),
            );
          },
        )
      ],
    );
  }
}

class InvoiceTableOrderSummary extends StatelessWidget {
  const InvoiceTableOrderSummary({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReceiptDisplayBloc, ReceiptDisplayState>(
      builder: (context, state) {
        var x = state.header!.total.toInt();
        var y = (state.header!.total * 100 % 100).toInt();

        String amountToWord =
            "INR " + NumberToWord().convert('en-in', x).toTitleCase();
        if (y > 0) {
          amountToWord += " and ";
          amountToWord += NumberToWord().convert('en-in', y).toTitleCase();
          amountToWord += "paise Only";
        }

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InvoiceTableCells(
              topBorder: true,
              bottomBorder: true,
              data: [
                InvoiceTableCellModel(label: "", flex: 2),
                InvoiceTableCellModel(
                    label: "Total",
                    flex: 11,
                    textAlign: TextAlign.right,
                    fontWeight: FontWeight.bold),
                InvoiceTableCellModel(label: "", flex: 5),
                InvoiceTableCellModel(label: "", flex: 4),
                InvoiceTableCellModel(
                    label:
                        "${state.lineItems!.fold<double>(0, (pv, e) => pv + e.quantity!)}",
                    flex: 4,
                    fontWeight: FontWeight.bold,
                    textAlign: TextAlign.right),
                InvoiceTableCellModel(
                    label: "", flex: 5, textAlign: TextAlign.right),
                InvoiceTableCellModel(
                    label: "", flex: 5, textAlign: TextAlign.right),
                InvoiceTableCellModel(label: "", flex: 3),
                InvoiceTableCellModel(label: "", flex: 3),
                InvoiceTableCellModel(
                    label: "${state.header?.total.toStringAsFixed(2)}",
                    flex: 6,
                    fontWeight: FontWeight.bold,
                    textAlign: TextAlign.right),
              ],
            ),
            const SizedBox(
              height: 1,
            ),
            const Text(
              "Amount Chargeable (in words)",
              style: TextStyle(fontSize: fontSize),
            ),
            Text(
              amountToWord,
              style: const TextStyle(
                  fontSize: fontSize + 1, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 1,
            )
          ],
        );
      },
    );
  }
}

class InvoiceTableLineItems extends StatelessWidget {
  const InvoiceTableLineItems({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReceiptDisplayBloc, ReceiptDisplayState>(
      builder: (context, state) {
        if (state.lineItems == null) return Container();
        return Column(
          children: state.lineItems!
              .map((e) => const InvoiceTableCells(
                    data: [
                      // InvoiceTableCellModel(
                      //     label: e.transSeq.toString(), flex: 2),
                      // InvoiceTableCellModel(
                      //     label: e.productDescription,
                      //     flex: 11,
                      //     fontWeight: FontWeight.bold),
                      // InvoiceTableCellModel(label: "${e.hsn}", flex: 5),
                      // InvoiceTableCellModel(label: "", flex: 4),
                      // InvoiceTableCellModel(
                      //     label: e.qty.toString(),
                      //     flex: 4,
                      //     fontWeight: FontWeight.bold,
                      //     textAlign: TextAlign.right),
                      // InvoiceTableCellModel(
                      //     label: e.listPrice.toStringAsFixed(2),
                      //     flex: 5,
                      //     textAlign: TextAlign.right),
                      // InvoiceTableCellModel(
                      //     label: e.salePrice.toStringAsFixed(2),
                      //     flex: 5,
                      //     textAlign: TextAlign.right),
                      // InvoiceTableCellModel(label: e.uom, flex: 3),
                      // InvoiceTableCellModel(
                      //     label: (e.itemDiscount + e.orderDiscount)
                      //         .toStringAsFixed(2),
                      //     flex: 3),
                      // InvoiceTableCellModel(
                      //     label: e.amount.toStringAsFixed(2),
                      //     flex: 6,
                      //     fontWeight: FontWeight.bold,
                      //     textAlign: TextAlign.right),
                    ],
                  ))
              .toList(),
        );
      },
    );
  }
}

class InvoiceTableCellModel {
  final String label;
  final int? flex;
  final double? width;
  final FontWeight fontWeight;
  final TextAlign textAlign;

  InvoiceTableCellModel(
      {required this.label,
      this.flex,
      this.width,
      this.fontWeight = FontWeight.normal,
      this.textAlign = TextAlign.left});
}

class InvoiceTableCells extends StatelessWidget {
  final List<InvoiceTableCellModel> data;
  final FontWeight? fontWeight;
  final EdgeInsetsGeometry padding;
  const InvoiceTableCells(
      {Key? key,
      required this.data,
      this.fontWeight,
      this.bottomBorder = false,
      this.padding = const EdgeInsets.symmetric(vertical: 5, horizontal: 1),
      this.topBorder = false})
      : super(key: key);
  final double fontSize = 7;
  final bool bottomBorder;
  final bool topBorder;

  Widget buildHeader(InvoiceTableCellModel m, {bool end = false}) {
    if (m.flex != null) {
      return Expanded(
        child: Container(
          padding: padding,
          decoration: BoxDecoration(
            border: Border(
              right: end ? BorderSide.none : const BorderSide(width: 0.4),
            ),
          ),
          child: Text(
            m.label,
            textAlign: m.textAlign,
            style: TextStyle(fontSize: fontSize, fontWeight: m.fontWeight),
          ),
        ),
        flex: m.flex!,
      );
    }

    return Expanded(
      child: FittedBox(
        fit: BoxFit.cover,
        child: Text(
          m.label,
          textAlign: m.textAlign,
          style: TextStyle(fontSize: fontSize, fontWeight: m.fontWeight),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          top: topBorder ? const BorderSide(width: 0.4) : BorderSide.none,
          bottom: bottomBorder ? const BorderSide(width: 0.4) : BorderSide.none,
        ),
      ),
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: data
              .asMap()
              .entries
              .map((e) => buildHeader(e.value, end: e.key == data.length - 1))
              .toList(),
        ),
      ),
    );
  }
}

class TaxTableHeader extends StatelessWidget {
  const TaxTableHeader({Key? key}) : super(key: key);
  final double fontSize = 7;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(width: 0.4),
        ),
      ),
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 1),
                decoration: const BoxDecoration(
                  border: Border(
                    right: BorderSide(width: 0.4),
                  ),
                ),
                child: Text(
                  "HSN/SAC",
                  style: TextStyle(fontSize: fontSize),
                ),
              ),
              flex: 10,
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 1),
                decoration: const BoxDecoration(
                  border: Border(
                    right: BorderSide(width: 0.4),
                  ),
                ),
                child: Text(
                  "HSN/SAC",
                  style: TextStyle(fontSize: fontSize),
                ),
              ),
              flex: 5,
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 1),
                decoration: const BoxDecoration(
                  border: Border(
                    right: BorderSide(width: 0.4),
                  ),
                ),
                child: Column(
                  children: [
                    Text(
                      "Central Tax",
                      style: TextStyle(fontSize: fontSize),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            decoration: const BoxDecoration(
                              border: Border(
                                top: BorderSide(width: 0.4),
                                right: BorderSide(width: 0.4),
                              ),
                            ),
                            child: Text(
                              "Rate",
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: fontSize),
                            ),
                          ),
                          flex: 2,
                        ),
                        Expanded(
                          child: Container(
                            decoration: const BoxDecoration(
                              border: Border(
                                top: BorderSide(width: 0.4),
                              ),
                            ),
                            child: Text(
                              "Amount",
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: fontSize),
                            ),
                          ),
                          flex: 5,
                        ),
                      ],
                    )
                  ],
                ),
              ),
              flex: 7,
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 1),
                decoration: const BoxDecoration(
                  border: Border(
                    right: BorderSide(width: 0.4),
                  ),
                ),
                child: Column(
                  children: [
                    Text(
                      "State Tax",
                      style: TextStyle(fontSize: fontSize),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            decoration: const BoxDecoration(
                              border: Border(
                                top: BorderSide(width: 0.4),
                                right: BorderSide(width: 0.4),
                              ),
                            ),
                            child: Text(
                              "Rate",
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: fontSize),
                            ),
                          ),
                          flex: 2,
                        ),
                        Expanded(
                          child: Container(
                            decoration: const BoxDecoration(
                              border: Border(
                                top: BorderSide(width: 0.4),
                              ),
                            ),
                            child: Text(
                              "Amount",
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: fontSize),
                            ),
                          ),
                          flex: 5,
                        ),
                      ],
                    )
                  ],
                ),
              ),
              flex: 7,
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 1),
                decoration: const BoxDecoration(
                  border: Border(),
                ),
                child: Text(
                  "Total",
                  style: TextStyle(fontSize: fontSize),
                ),
              ),
              flex: 5,
            )
          ],
        ),
      ),
    );
  }
}

class InvoiceTaxDetail extends StatelessWidget {
  const InvoiceTaxDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReceiptDisplayBloc, ReceiptDisplayState>(
      builder: (context, state) {
        var totAmount = state.taxSummary.fold<double>(
            0.0, (previousValue, element) => previousValue + element.amount);
        var totCgstAmount = state.taxSummary.fold<double>(0.0,
            (previousValue, element) => previousValue + element.cgstAmount);
        var totSgstAmount = state.taxSummary.fold<double>(
            0.0, (previousValue, element) => previousValue + element.sgstAmont);
        var totTaxAmount = state.taxSummary.fold<double>(
            0.0, (previousValue, element) => previousValue + element.taxTotal);

        return Column(
          children: [
            const TaxTableHeader(),
            ...state.taxSummary
                .map((e) => InvoiceTableCells(
                      padding: const EdgeInsets.symmetric(
                          vertical: 2, horizontal: 1),
                      topBorder: true,
                      data: [
                        InvoiceTableCellModel(label: e.hsn, flex: 10),
                        InvoiceTableCellModel(
                            label: e.amount.toStringAsFixed(2),
                            flex: 5,
                            textAlign: TextAlign.right),
                        InvoiceTableCellModel(
                            label:
                                "${(e.cgstRate * 100).toStringAsFixed(0)}%",
                            flex: 2,
                            textAlign: TextAlign.right),
                        InvoiceTableCellModel(
                            label: e.cgstAmount.toStringAsFixed(2),
                            flex: 5,
                            textAlign: TextAlign.right),
                        InvoiceTableCellModel(
                            label:
                                "${(e.sgstRate * 100).toStringAsFixed(0)}%",
                            flex: 2,
                            textAlign: TextAlign.right),
                        InvoiceTableCellModel(
                            label: e.sgstAmont.toStringAsFixed(2),
                            flex: 5,
                            textAlign: TextAlign.right),
                        InvoiceTableCellModel(
                            label: e.taxTotal.toStringAsFixed(2),
                            flex: 5,
                            textAlign: TextAlign.right),
                      ],
                    ))
                .toList(),
            InvoiceTableCells(
              topBorder: true,
              bottomBorder: true,
              padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 1),
              data: [
                InvoiceTableCellModel(
                    label: "Total",
                    flex: 10,
                    fontWeight: FontWeight.bold,
                    textAlign: TextAlign.right),
                InvoiceTableCellModel(
                    label: totAmount.toStringAsFixed(2),
                    flex: 5,
                    textAlign: TextAlign.right,
                    fontWeight: FontWeight.bold),
                InvoiceTableCellModel(
                    label: "9%",
                    flex: 2,
                    textAlign: TextAlign.right,
                    fontWeight: FontWeight.bold),
                InvoiceTableCellModel(
                    label: totCgstAmount.toStringAsFixed(2),
                    flex: 5,
                    textAlign: TextAlign.right,
                    fontWeight: FontWeight.bold),
                InvoiceTableCellModel(
                    label: "9%",
                    flex: 2,
                    textAlign: TextAlign.right,
                    fontWeight: FontWeight.bold),
                InvoiceTableCellModel(
                    label: totSgstAmount.toStringAsFixed(2),
                    flex: 5,
                    textAlign: TextAlign.right,
                    fontWeight: FontWeight.bold),
                InvoiceTableCellModel(
                    label: totTaxAmount.toStringAsFixed(2),
                    flex: 5,
                    textAlign: TextAlign.right,
                    fontWeight: FontWeight.bold),
              ],
            )
          ],
        );
      },
    );
  }
}

class InvoiceSpacer extends StatelessWidget {
  final List<InvoiceTableCellModel> data;
  const InvoiceSpacer({Key? key, required this.data}) : super(key: key);

  Widget buildSpacer(InvoiceTableCellModel m, {bool end = false}) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          border: Border(
            right: end ? BorderSide.none : const BorderSide(width: 0.4),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [Container()],
        ),
      ),
      flex: m.flex ?? 1,
    );
  }

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: data
            .asMap()
            .entries
            .map((e) => buildSpacer(e.value, end: e.key == data.length - 1))
            .toList(),
      ),
    );
  }
}

class InvoiceFooter extends StatelessWidget {
  const InvoiceFooter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const InvoiceTaxDetail(),
        const SizedBox(height: 15),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Expanded(child: Declaration()),
            Expanded(child: AuthoritySignature())
          ],
        )
      ],
    );
  }
}

class Declaration extends StatelessWidget {
  const Declaration({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text("Declaration",
            style: TextStyle(
                fontSize: fontSize, decoration: TextDecoration.underline)),
        Text(
          "We declare that this invoice shows the actual price of the goods described and that all particulars are true and correct.",
          style: TextStyle(fontSize: fontSize),
        ),
      ],
    );
  }
}

class AuthoritySignature extends StatelessWidget {
  const AuthoritySignature({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(width: 0.4),
          left: BorderSide(width: 0.4),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            "for Pratyush Ka Thela",
            style: TextStyle(fontSize: fontSize),
          ),
          Container(
            height: 20,
          ),
          const Text(
            "Authorised Signatory",
            style: TextStyle(fontSize: fontSize),
          ),
        ],
      ),
    );
  }
}
