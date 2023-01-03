import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../config/formatter.dart';
import '../../config/route_config.dart';
import '../../config/theme_settings.dart';
import '../../config/transaction_config.dart';
import '../../entity/pos/entity.dart';
import '../../widgets/cloud_sync_widget.dart';
import '../../widgets/my_loader.dart';
import 'bloc/list_all_receipt_bloc.dart';

class WidgetNoReceipt extends StatelessWidget {
  const WidgetNoReceipt({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: const [
            // Icon(Icons.person_pin_outlined, size: 100, color: Colors.grey),
            Icon(Icons.receipt_long_outlined,
                size: 100, color: AppColor.iconColor),
            Text("Create a Sale/Return to view receipts.",
                style: TextStyle(
                    color: AppColor.iconColor, fontStyle: FontStyle.italic)),
            SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}

class ListAllReceiptView extends StatelessWidget {
  const ListAllReceiptView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ListAllReceiptBloc, ListAllReceiptState>(
      builder: (context, state) {
        if (state.status == ListAllReceiptStatus.loading) {
          return const MyLoader(
            color: AppColor.color6,
          );
        }
        return RefreshIndicator(
          onRefresh: () async {
            BlocProvider.of<ListAllReceiptBloc>(context)
                .add(LoadAllReceipt());
          },
          child: state.receipts.isEmpty
              ? const WidgetNoReceipt()
              : ListView.builder(
                  itemCount: state.receipts.length + 1,
                  itemBuilder: (ctx, idx) {
                    if (idx == state.receipts.length) {
                      return const SizedBox(height: 150);
                    }

                    return ReceiptHeaderCard(receipt: state.receipts[idx]);
                  }),
        );
      },
    );
  }
}

class ReceiptHeaderCard extends StatelessWidget {
  final TransactionHeaderEntity receipt;
  const ReceiptHeaderCard({Key? key, required this.receipt}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () {
          if (receipt.status == TransactionStatus.suspended ||
              receipt.status == TransactionStatus.partialPayment) {
            // Navigator.of(context).pushNamed(RouteConfig.receiptDetail, arguments: receipt);
            Navigator.of(context).pushNamed(RouteConfig.createReceiptScreen,
                arguments: receipt.transId);
          } else {
            Navigator.of(context).pushNamed(RouteConfig.orderSummaryScreen,
                arguments: receipt.transId);
          }
        },
        child: Container(
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                        receipt.customerName ?? 'Sale Receipt',
                        style: const TextStyle(fontWeight: FontWeight.w600),
                      ),
                      HeaderStatusChip(
                        status: receipt.status,
                        syncState: receipt.syncState ?? 0,
                      )
                    ],
                  ),
                  Text(
                    NumberFormat.simpleCurrency(
                            locale: receipt.storeLocale,
                            name: receipt.storeCurrency)
                        .format(receipt.total),
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 20),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    receipt.transId,
                    style: const TextStyle(fontWeight: FontWeight.w500),
                  ),
                  if (receipt.locked)
                  const Icon(Icons.lock_outline, size: 12, color: Colors.grey,)
                ],
              ),
              Row(
                children: [
                  if (receipt.customerPhone != null)
                    Text('${receipt.customerPhone}'),
                  if (receipt.customerPhone != null &&
                      receipt.shippingAddress != null)
                    const Text(' | '),
                  if (receipt.shippingAddress != null)
                    Expanded(
                        child: Text(
                      '${receipt.shippingAddress}',
                      overflow: TextOverflow.ellipsis,
                    ))
                ],
              ),
              Row(
                children: [
                  Text(AppFormatter.dateFormatter.format(receipt.businessDate))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class HeaderStatusChip extends StatelessWidget {
  final TransactionStatus status;
  final int syncState;
  const HeaderStatusChip({Key? key, required this.status, this.syncState = 0})
      : super(key: key);

  String getStatus() {
    if (status == TransactionStatus.suspended) {
      return "Suspended";
    } else if (status == TransactionStatus.cancelled) {
      return "Cancelled";
    } else if (status == TransactionStatus.completed) {
      return "Paid";
    } else if (TransactionStatus.partialPayment == status) {
      return "Partial Payment";
    }
    return '';
  }

  Color getStatusColor() {
    if (status == TransactionStatus.suspended) {
      return Colors.orange;
    } else if (status == TransactionStatus.cancelled) {
      return Colors.red;
    } else if (status == TransactionStatus.completed) {
      return Colors.green;
    } else if (status == TransactionStatus.partialPayment) {
      return Colors.purple;
    }
    return Colors.grey;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          decoration: BoxDecoration(
              border: Border.all(color: getStatusColor()),
              borderRadius: BorderRadius.circular(5)),
          margin: const EdgeInsets.only(left: 5, bottom: 3, top: 3),
          padding: const EdgeInsets.symmetric(vertical: 1, horizontal: 5),
          child: Row(
            children: [
              Text(
                '${getStatus()} ',
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: getStatusColor()),
              ),
              Icon(
                Icons.circle,
                size: 8,
                color: getStatusColor(),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4),
          child: CloudSyncIcon(syncState: syncState),
        ),
      ],
    );
  }
}
