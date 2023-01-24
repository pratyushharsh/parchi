import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../config/formatter.dart';
import '../../config/route_config.dart';
import '../../config/theme_settings.dart';
import '../../entity/pos/entity.dart';
import '../../widgets/appbar_leading.dart';
import '../../widgets/custom_image.dart';
import '../../widgets/my_loader.dart';
import '../create_new_receipt/new_receipt_view.dart';
import 'bloc/order_summary_bloc.dart';

class OrderSummaryView extends StatelessWidget {
  final String orderId;
  const OrderSummaryView({Key? key, required this.orderId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      lazy: false,
      create: (context) => OrderSummaryBloc(orderId: orderId),
      child: Container(
        color: AppColor.headerBackground,
        // Gradient For the Color
        child: SafeArea(
          bottom: false,
          child: Scaffold(
            body: Stack(
              children: [
                // CustomerAddress(),
                // OrderLine(),
                // PaymentLineDisplay()
                Container(
                  color: AppColor.background,
                  child: BlocBuilder<OrderSummaryBloc, OrderSummaryState>(
                    builder: (context, state) {
                      if (state.status == OrderSummaryStatus.loading) {
                        return const MyLoader();
                      }
                      if (state.status == OrderSummaryStatus.success) {
                        return SingleChildScrollView(
                          child: Column(
                            children: [
                              Container(
                                height: 100,
                                color: AppColor.headerBackground,
                              ),
                              CustomerAddress(
                                order: state.order!,
                              ),
                              OrderLine(
                                order: state.order!,
                                productMap: state.productMap,
                              ),
                              // Paym entLineDisplay(state.order),
                              OrderDetailSummary(order: state.order!),
                            ],
                          ),
                        );
                      }
                      return Container();
                    },
                  ),
                ),
                Positioned(
                  top: 20,
                  left: 16,
                  child: AppBarLeading(
                    heading: "Order Detail  #$orderId",
                    icon: Icons.arrow_back,
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CustomerAddress extends StatelessWidget {
  final TransactionHeaderEntity order;
  const CustomerAddress({Key? key, required this.order}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColor.headerBackground,
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(AppFormatter.longDateFormatter
                          .format(order.businessDate)),
                      Text('Invoice #' + order.transId.toString()),
                      Text('Sales Associate : ${order.associateName}'),
                      const Text('Notes : Yet to add this'),
                    ]),
              ),
              if (order.customerId != null)
                Padding(
                  padding: const EdgeInsets.only(right: 16),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          order.customerName!,
                          style: const TextStyle(
                              fontWeight: FontWeight.w300, fontSize: 24),
                        ),
                        const SizedBox(height: 16),
                        // Text('${order.customerAddress}'),
                        Text('${order.customerPhone}'),
                      ]),
                )
            ],
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: Wrap(
                  spacing: 10,
                  children: [
                    OrderSummaryButton(
                      text: 'Print Receipt',
                      onTap: () {
                        Navigator.of(context).pushNamed(
                          RouteConfig.receiptDisplayScreen,
                          arguments: order.transId,
                        );
                      },
                    ),
                    OrderSummaryButton(
                      text: 'Print Invoice',
                      onTap: () {
                        Navigator.of(context).pushNamed(
                          RouteConfig.invoiceDisplayScreen,
                          arguments: order.transId,
                        );
                      },
                    ),
                    OrderSummaryButton(
                      text: 'Email Invoice',
                      onTap: () {},
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 16.0),
                child: Wrap(
                  children: [
                    OrderSummaryButton(
                      text: 'Return Items',
                      onTap: () {},
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}

class OrderSummaryButton extends StatelessWidget {
  final GestureTapCallback? onTap;
  final String text;
  const OrderSummaryButton({Key? key, required this.text, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(12.00),
        decoration: BoxDecoration(
          border: Border.all(color: AppColor.primary, width: 1),
          borderRadius: BorderRadius.circular(4),
          color: Colors.white,
        ),
        child: Text(text),
      ),
    );
  }
}

class Address extends StatelessWidget {
  final String address;
  const Address({Key? key, required this.address}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        constraints: const BoxConstraints(minHeight: 100),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                "Shipping Address",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Divider(),
            ]),
      ),
    );
  }
}

class OrderLine extends StatelessWidget {
  final TransactionHeaderEntity order;
  final Map<String, ProductEntity> productMap;
  const OrderLine({Key? key, required this.order, required this.productMap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraint) {
      if (constraint.maxWidth < 800) {
        return Column(
          children: [
            const SizedBox(
              height: 8,
            ),
            const Padding(
              padding: EdgeInsets.only(right: 8.0),
              child: LineItemHeader(),
            ),
            const Divider(),
            ...order.lineItems
                .map((e) => InkWell(
                      onTap: () {},
                      child: !e.isVoid
                          ? Container(
                              color: AppColor.headerBackground.withOpacity(0.5),
                              child: Column(
                                children: [
                                  NewLineItem(
                                    saleLine: e,
                                    productModel: productMap[e.itemId],
                                  ),
                                  const Divider()
                                ],
                              ),
                            )
                          : Container(),
                    ))
                .toList()
          ],
        );
      } else {
        return ListView.builder(
          shrinkWrap: true,
          itemCount: order.lineItems.length,
          itemBuilder: ((context, index) {
            final e = order.lineItems[index];
            if (e.isVoid) {
              return Container();
            }
            return InkWell(
              onTap: () {},
              child: Container(
                color: index % 2 != 0 ? AppColor.headerBackground.withOpacity(0.3) : null,
                child: Column(
                  children: [
                    const Divider(height: 0),
                    OrderItemDetailDisplay(
                        entity: e,
                        product: productMap[e.itemId],
                        orderLocale: order.storeLocale),
                    const Divider(height: 0),
                  ],
                ),
              ),
            );
          }),
        );
      }
    });
  }
}

class OrderItemDetailDisplay extends StatelessWidget {
  final TransactionLineItemEntity entity;
  final ProductEntity? product;
  final String orderLocale;
  const OrderItemDetailDisplay(
      {Key? key, required this.entity, this.product, required this.orderLocale})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: (product != null && product!.imageUrl.isNotEmpty)
                      ? CustomImage(
                          url: product!.imageUrl[0],
                          height: 80,
                          width: 80,
                        )
                      : Image.network(
                          "https://cdn.iconscout.com/icon/premium/png-128-thumb/no-image-2840056-2359564.png",
                          fit: BoxFit.cover,
                          height: 70,
                          width: 70,
                          errorBuilder: (context, obj, trace) {
                            return const SizedBox(
                              height: 80,
                              width: 80,
                            );
                          },
                        ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        entity.itemDescription!,
                      ),
                      Text(entity.itemId!),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              children: entity.taxModifiers
                  .map((e) => Text(e.taxRuleName ?? "Tax Rule"))
                  .toList(),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                    "${NumberFormat.simpleCurrency(locale: orderLocale, name: entity.currency!).format(entity.unitPrice)} * ${entity.quantity}PCS"),
                ...entity.lineModifiers
                    .map((e) =>
                        Text(e.description ?? e.discountCode ?? "Discount"))
                    .toList(),
              ],
            ),
          ),
          Expanded(
            child: Align(
              alignment: Alignment.centerRight,
              child: Column(
                children: [
                  Text(NumberFormat.simpleCurrency(
                          locale: orderLocale, name: entity.currency!)
                      .format(entity.grossAmount)),
                  ...entity.lineModifiers
                      .map((e) => Text(NumberFormat.simpleCurrency(
                              locale: orderLocale, name: entity.currency!)
                          .format(e.amount)))
                      .toList(),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class PaymentLineDisplay extends StatelessWidget {
  const PaymentLineDisplay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrderSummaryBloc, OrderSummaryState>(
      builder: (context, state) {
        if (state.status == OrderSummaryStatus.loading) {
          return const MyLoader();
        }
        return Card(
          child: Container(
            margin: const EdgeInsets.all(10.0),
            width: double.infinity,
            child: DataTable(
              columns: [
                DataColumn(label: const Text("Seq No"), onSort: (idx, sel) {}),
                DataColumn(
                    label: const Text("Payment Method"), onSort: (idx, sel) {}),
                DataColumn(label: const Text("Time"), onSort: (idx, sel) {}),
                DataColumn(
                  label: const Text("Payment Amount"),
                  numeric: true,
                  onSort: (idx, sel) {},
                ),
              ],
              rows: state.order!.paymentLineItems
                  .map(
                    (e) => DataRow(cells: [
                      DataCell(Text(e.paymentSeq.toString())),
                      DataCell(Text(e.tenderId!)),
                      DataCell(Text(e.beginDate!.toIso8601String())),
                      DataCell(Text(e.amount!.toStringAsFixed(2))),
                    ]),
                  )
                  .toList(),
            ),
          ),
        );
      },
    );
  }
}

class OrderDetailSummary extends StatelessWidget {
  final TransactionHeaderEntity order;
  const OrderDetailSummary({Key? key, required this.order}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          constraints: BoxConstraints(
              maxWidth: min(400, MediaQuery.of(context).size.width)),
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("Sub Total"),
                      Text(NumberFormat.simpleCurrency(
                              locale: order.storeLocale,
                              name: order.storeCurrency)
                          .format(order.subtotal)),
                    ]),
              ),
              const Divider(),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("Tax Total"),
                      Text(NumberFormat.simpleCurrency(
                              locale: order.storeLocale,
                              name: order.storeCurrency)
                          .format(order.taxTotal)),
                    ]),
              ),
              const Divider(),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("Discount Total"),
                      Text(NumberFormat.simpleCurrency(
                              locale: order.storeLocale,
                              name: order.storeCurrency)
                          .format(order.discountTotal)),
                    ]),
              ),
              const Divider(),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("Grand Total"),
                      Text(NumberFormat.simpleCurrency(
                              locale: order.storeLocale,
                              name: order.storeCurrency)
                          .format(order.total)),
                    ]),
              ),
              const Divider(),
            ],
          ),
        ),
      ],
    );
  }
}
