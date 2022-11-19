import 'dart:ui';
import 'dart:math' as math;

import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:pdf/pdf.dart';

import '../../config/currency.dart';
import '../../config/theme_settings.dart';
import '../../config/transaction_config.dart';
import '../../entity/pos/entity.dart';
import '../../widgets/appbar_leading.dart';
import 'bloc/receipt_display_bloc.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

const String top = "TOP";
const String bottom = "BOTTOM";

class ReceiptDisplayView extends StatelessWidget {
  final String transactionId;
  ReceiptDisplayView({Key? key, required this.transactionId}) : super(key: key);

  final GlobalKey<State<StatefulWidget>> _printKey = GlobalKey();

  void _shareReceipt() async {
    final doc = pw.Document();

    final image = await WidgetWraper.fromKey(
      key: _printKey,
      pixelRatio: 3.0,
    );
    doc.addPage(pw.Page(
        pageFormat: PdfPageFormat.roll80,
        build: (pw.Context context) {
          return pw.Image(image);
        }));

    var raw = await doc.save();

    Printing.sharePdf(
      filename: '$transactionId.pdf',
      bytes: raw,
    );
  }

  void _printReceipt() {
    Printing.layoutPdf(
      format: PdfPageFormat.roll80,
      onLayout: (PdfPageFormat format) async {
        final doc = pw.Document();

        final image = await WidgetWraper.fromKey(
          key: _printKey,
          pixelRatio: 3.0,
        );

        doc.addPage(pw.Page(
            pageFormat: format,
            build: (pw.Context context) {
              return pw.Center(
                child: pw.Image(image),
              );
            }));

        return doc.save();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      lazy: false,
      create: (context) => ReceiptDisplayBloc(
          transId: transactionId,
          authBloc: RepositoryProvider.of(context),
          transactionRepo: RepositoryProvider.of(context),
          settingsRepo: RepositoryProvider.of(context))
        ..add(FetchReceiptDataEvent()),
      child: Container(
        color: AppColor.background,
        child: Material(
          textStyle: GoogleFonts.robotoMono(),
          child: SafeArea(
            child: Scaffold(
              backgroundColor: AppColor.background,
              body: BlocBuilder<ReceiptDisplayBloc, ReceiptDisplayState>(
                builder: (context, state) {
                  return Stack(
                    fit: StackFit.expand,
                    children: [
                      if (state.status == ReceiptDisplayStatus.success)
                        InteractiveViewer(
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                const SizedBox(
                                  height: 80,
                                ),
                                ReceiptBlock(
                                  printKey: _printKey,
                                ),
                              ],
                            ),
                          ),
                        ),
                      if (state.status == ReceiptDisplayStatus.success)
                        Positioned(
                          top: 20,
                          left: 16,
                          child: AppBarLeading(
                            heading: "Receipt #${state.header!.transId}",
                            icon: Icons.arrow_back,
                            onTap: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ),
                      Positioned(
                        bottom: 40,
                        left: 10,
                        right: 10,
                        child: MyBottomAppBar(
                          onShare: _shareReceipt,
                          onPrint: _printReceipt,
                        ),
                      )
                    ],
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// theme: ThemeData(
// primarySwatch: Colors.blue,
// textTheme:
// GoogleFonts.robotoMonoTextTheme(Theme.of(context).textTheme),
// ),

class MyBottomAppBar extends StatelessWidget {
  final VoidCallback? onShare;
  final VoidCallback? onPrint;
  const MyBottomAppBar({Key? key, this.onShare, this.onPrint})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
        child: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.grey.shade200.withOpacity(0.2),
            borderRadius: BorderRadius.circular(8),
          ),
          child: BlocBuilder<ReceiptDisplayBloc, ReceiptDisplayState>(
            builder: (context, state) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    icon: const Icon(
                      Icons.share,
                      size: 30,
                    ),
                    onPressed: onShare,
                  ),
                  IconButton(
                    icon: const Icon(
                      Icons.print,
                      size: 30,
                    ),
                    onPressed: onPrint,
                  ),
                  if (state.header?.status == TransactionStatus.created)
                    ElevatedButton(
                        onPressed: () {
                          BlocProvider.of<ReceiptDisplayBloc>(context).add(
                              UpdateReceiptStatusEvent(TransactionStatus.cancelled));
                        },
                        child: const Text("Cancel")),
                  if (state.header?.status == TransactionStatus.created)
                    ElevatedButton(
                        onPressed: () {
                          BlocProvider.of<ReceiptDisplayBloc>(context).add(
                              UpdateReceiptStatusEvent(TransactionStatus.completed));
                        },
                        child: const Text("Paid"))
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

class ReceiptBlock extends StatelessWidget {
  final GlobalKey<State<StatefulWidget>> printKey;
  const ReceiptBlock({Key? key, required this.printKey}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      key: printKey,
      child: Stack(
        children: [
          Container(
            margin: const EdgeInsets.all(10),
            width: math.min(MediaQuery.of(context).size.width, 380),
            decoration: const BoxDecoration(
                color: Colors.white,
                border: Border.symmetric(
                    vertical: BorderSide(color: Colors.black))),
            child: Column(
              children: [
                CustomPaint(
                  painter: DrawCircularArcLine(),
                  size: Size(MediaQuery.of(context).size.width, 20),
                ),
                Container(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    children: [
                      const ReceiptLogo(),
                      const ReceiptNumber(),
                      const ReceiptDate(),
                      const SizedBox(
                        height: 10,
                      ),
                      const ReceiptBusinessDetail(),
                      const SizedBox(
                        height: 10,
                      ),
                      const ReceiptCustomerDetail(),
                      CustomPaint(
                        painter: DrawDottedHorizontalLine(),
                        size: Size(MediaQuery.of(context).size.width, 0),
                      ),
                      const ReceiptLineItem(),
                      CustomPaint(
                        painter: DrawDottedHorizontalLine(),
                        size: Size(MediaQuery.of(context).size.width, 0),
                      ),
                      const ReceiptSummary(),
                      CustomPaint(
                        painter: DrawDottedHorizontalLine(),
                        size: Size(MediaQuery.of(context).size.width, 0),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      const ReceiptBarcode(),
                      const ReceiptFooter()
                    ],
                  ),
                ),
                CustomPaint(
                  painter: DrawCircularArcLine(direction: bottom),
                  size: Size(MediaQuery.of(context).size.width, 20),
                ),
              ],
            ),
          ),
          if (TransactionStatus.cancelled ==
              BlocProvider.of<ReceiptDisplayBloc>(context).state.header?.status)
            Positioned.fill(
                child: Align(
                    alignment: Alignment.center,
                    child: Transform.rotate(
                      angle: -math.pi / 4,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: const [
                          Divider(
                            thickness: 2,
                            color: Colors.red,
                          ),
                          Text(
                            "CANCELLED",
                            style: TextStyle(
                                fontSize: 60,
                                fontWeight: FontWeight.w200,
                                color: Colors.red),
                          ),
                          Divider(
                            thickness: 2,
                            color: Colors.red,
                          ),
                        ],
                      ),
                    )))
        ],
      ),
    );
  }
}

class ReceiptLogo extends StatelessWidget {
  const ReceiptLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text(
      "CASH RECEIPT",
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 28,
      ),
    );
  }
}

class ReceiptNumber extends StatelessWidget {
  const ReceiptNumber({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReceiptDisplayBloc, ReceiptDisplayState>(
      builder: (context, state) {
        return Text(
          "#${state.header?.transId.toString()}",
          style: const TextStyle(height: 0.8),
        );
      },
    );
  }
}

class ReceiptDate extends StatelessWidget {
  const ReceiptDate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final DateFormat formatter = DateFormat('dd-MMM-yyyy    hh:mm:ss a');
    return BlocBuilder<ReceiptDisplayBloc, ReceiptDisplayState>(
      builder: (context, state) {
        return Text(
          formatter.format(state.header!.businessDate),
        );
      },
    );
  }
}

class ReceiptBusinessDetail extends StatelessWidget {
  const ReceiptBusinessDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReceiptDisplayBloc, ReceiptDisplayState>(
      builder: (context, state) {
        return Column(
          children: [
            Text(
              "${state.receiptSettings?.tagLine}",
              style: const TextStyle(fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              height: 10,
            ),
            ...?state.receiptSettings?.storeAddress
                ?.split("\n")
                .map(
                  (e) => Text(e),
                )
                .toList(),
            Text("Ph: ${state.receiptSettings?.storeNumber}")
          ],
        );
      },
    );
  }
}

class ReceiptCustomerDetail extends StatelessWidget {
  const ReceiptCustomerDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReceiptDisplayBloc, ReceiptDisplayState>(
      builder: (context, state) {
        return Column(
          children: [
            if (state.header!.customerName != null)
              Text("Customer Name: ${state.header!.customerName}"),
            if (state.header!.shippingAddress != null)
              Text("Address: ${state.header!.shippingAddress}"),
            if (state.header!.customerPhone != null)
              Text("Phone: ${state.header!.customerPhone}"),
            if (state.header!.customerName != null ||
                state.header!.shippingAddress != null ||
                state.header!.customerPhone != null)
              const SizedBox(
                height: 10,
              )
          ],
        );
      },
    );
  }
}

class ReceiptLineItem extends StatelessWidget {
  const ReceiptLineItem({Key? key}) : super(key: key);

  static const TextStyle headerStyle = TextStyle(fontWeight: FontWeight.bold);

  Widget buildHeader() {
    return Row(
      children: const [
        Expanded(
            flex: 2,
            child: Text(
              "Item",
              style: headerStyle,
            )),
        Expanded(
            flex: 5,
            child: Text(
              "Description",
              style: headerStyle,
            )),
        Expanded(
            flex: 1,
            child: Text(
              "Qty",
              textAlign: TextAlign.right,
              style: headerStyle,
            )),
        Expanded(
            flex: 2,
            child: Text(
              "Price",
              textAlign: TextAlign.right,
              style: headerStyle,
            )),
      ],
    );
  }

  Widget buildLineDetail(TransactionLineItemEntity lineItem) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
            flex: 2,
            child: Text(
              lineItem.itemId!,
            )),
        Expanded(
            flex: 5,
            child: Text(
              lineItem.itemDescription!,
            )),
        Expanded(
            flex: 1,
            child: Text(
              "${lineItem.quantity}",
              textAlign: TextAlign.right,
            )),
        Expanded(
            flex: 2,
            child: Text(
              "${Currency.inr}${lineItem.grossAmount!.toStringAsFixed(2)}",
              textAlign: TextAlign.right,
            )),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReceiptDisplayBloc, ReceiptDisplayState>(
      builder: (context, state) {
        return Column(
          children: [
            buildHeader(),
            CustomPaint(
              painter: DrawDottedHorizontalLine(),
              size: Size(MediaQuery.of(context).size.width, 0),
            ),
            ...state.lineItems!.where((element) => !element.isVoid).map((e) => buildLineDetail(e)).toList()
          ],
        );
      },
    );
  }
}

class ReceiptSummary extends StatelessWidget {
  const ReceiptSummary({Key? key}) : super(key: key);

  static const style = TextStyle(fontWeight: FontWeight.w600);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReceiptDisplayBloc, ReceiptDisplayState>(
      builder: (context, state) {
        return Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Subtotal",
                  style: style,
                ),
                Text(
                    "${Currency.inr}${state.header!.subtotal.toStringAsFixed(2)}")
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  "Discount",
                  style: style,
                ),
                Text("${Currency.inr}0.00")
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Tax", style: style),
                Text(
                    "${Currency.inr}${state.header!.taxTotal.toStringAsFixed(2)}")
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Total", style: style),
                Text("${Currency.inr}${state.header!.total.toStringAsFixed(2)}")
              ],
            ),
          ],
        );
      },
    );
  }
}

class ReceiptBarcode extends StatelessWidget {
  const ReceiptBarcode({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final DateFormat formatter = DateFormat('ddMMyyyy');
    return BlocBuilder<ReceiptDisplayBloc, ReceiptDisplayState>(
      builder: (context, state) {
        return BarcodeWidget(
          barcode: Barcode.code128(), // Barcode type and settings
          data:
              '${formatter.format(state.header!.businessDate)}${state.header!.transId}', // Content
          width: 200,
          height: 80,
        );
      },
    );
  }
}

class ReceiptFooter extends StatelessWidget {
  const ReceiptFooter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReceiptDisplayBloc, ReceiptDisplayState>(
      builder: (context, state) {
        return Column(
          children: [
            if (state.receiptSettings?.footerTitle != null)
              Text(
                "${state.receiptSettings!.footerTitle}",
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            const SizedBox(height: 20),
            if (state.receiptSettings?.footerSubtitle != null)
              Text("${state.receiptSettings!.footerSubtitle}")
          ],
        );
      },
    );
  }
}

class DrawDottedHorizontalLine extends CustomPainter {
  late Paint _paint;
  DrawDottedHorizontalLine() {
    _paint = Paint();
    _paint.color = Colors.black; //dots color
    _paint.strokeWidth = 0.8; //dots thickness
    _paint.strokeCap = StrokeCap.round; //dots corner edges
  }

  @override
  void paint(Canvas canvas, Size size) {
    double width = 4;
    double gap = 2;
    for (double t = 0; t <= size.width; t += (width + gap)) {
      canvas.drawLine(Offset(t, 0.0), Offset(t + width, 0.0), _paint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

class DrawCircularArcLine extends CustomPainter {
  late Paint _paint;
  late Paint _dotPaint;
  final String direction;
  DrawCircularArcLine({this.direction = "TOP"}) {
    _paint = Paint();
    _paint.color = Colors.black; //dots color
    _paint.strokeWidth = 0.8; //dots thickness
    _paint.style = PaintingStyle.stroke;
    _paint.strokeCap = StrokeCap.round; //dots corner edges

    _dotPaint = Paint();
    _dotPaint.color = AppColor.background;
    _dotPaint.style = PaintingStyle.fill;
    _dotPaint.strokeCap = StrokeCap.round;
  }

  @override
  void paint(Canvas canvas, Size size) {
    double gap = 10;

    int mulFactor = 1;
    if (direction == bottom) {
      mulFactor = -1;
    }

    double y = 0.0;
    if (direction == bottom) {
      y = size.height;
    }

    for (double i = 0; i <= size.width; i += (size.height)) {
      canvas.drawLine(
          Offset(i, y), Offset(math.min(i + gap, size.width), y), _paint);
      i += gap;
      if (i + size.height <= size.width) {
        canvas.drawArc(
            Rect.fromLTWH(
                i, mulFactor * -size.height / 2, size.height, size.height),
            0,
            mulFactor * 3.14,
            false,
            _dotPaint);
        canvas.drawArc(
            Rect.fromLTWH(
                i, mulFactor * -size.height / 2, size.height, size.height),
            0,
            mulFactor * 3.14,
            false,
            _paint);
      } else {
        canvas.drawLine(
            Offset(i, y), Offset(math.min(i + gap, size.width), y), _paint);
      }
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
