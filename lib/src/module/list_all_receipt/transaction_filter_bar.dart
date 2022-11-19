import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../config/formatter.dart';
import '../../config/theme_settings.dart';
import '../../entity/pos/entity.dart';
import 'bloc/list_all_receipt_bloc.dart';

Color getColorForStatus(TransactionStatus status) {
  switch (status) {
    case TransactionStatus.suspended:
      return Colors.orange;
    case TransactionStatus.cancelled:
      return Colors.red;
    case TransactionStatus.completed:
      return Colors.green;
    case TransactionStatus.partialPayment:
      return Colors.purple;
    default:
      return Colors.grey;
  }
}

class TransactionFilterBar extends StatelessWidget {
  const TransactionFilterBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 28,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          Container(
            margin: const EdgeInsets.only(right: 10),
            child: const TransactionStatusFilterChip(),
          ),
          Container(
            margin: const EdgeInsets.only(right: 10),
            child: const TransactionDateTimeRangePicker(),
          ),
          Container(
            margin: const EdgeInsets.only(right: 8),
            child: const Chip(
              label: Text("Type"),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(4),
                ),
              ),
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
          ),
        ],
      ),
    );
  }
}

class TransactionStatusFilterChip extends StatelessWidget {
  const TransactionStatusFilterChip({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ListAllReceiptBloc, ListAllReceiptState>(
      builder: (context, state) {
        return PopupMenuButton<TransactionStatus>(
          position: PopupMenuPosition.under,
          offset: const Offset(0, 10),
          onSelected: (TransactionStatus status) {
            context.read<ListAllReceiptBloc>().add(UpdateFilterStatus(status));
          },
          itemBuilder: (context) => TransactionStatus.values
              .map(
                (e) => PopupMenuItem<TransactionStatus>(
                  height: 30,
                  value: e,
                  child: Row(
                    children: [
                      Container(
                        width: 10,
                        height: 10,
                        decoration: BoxDecoration(
                          color: getColorForStatus(e),
                          shape: BoxShape.circle,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        e.value,
                        style: const TextStyle(
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
              )
              .toList(),
          child: FilterTransactionStatusChip(
            selected: state.filter.status,
          ),
        );
      },
    );
  }
}

class FilterTransactionStatusChip extends StatelessWidget {
  final TransactionStatus? selected;
  const FilterTransactionStatusChip({Key? key, this.selected})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color color = selected != null ? getColorForStatus(selected!) : Colors.grey;

    return Container(
      height: 10,
      padding: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        color: selected != null ? color.withOpacity(0.1) : Colors.transparent,
        borderRadius: BorderRadius.circular(4),
        border: Border.all(
          color: color,
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 10,
            height: 10,
            decoration: BoxDecoration(
              color: color,
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Text(
            selected?.value ?? "All",
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(
            width: 6,
          ),
          if (selected != null)
            InkWell(
              onTap: () {
                context
                    .read<ListAllReceiptBloc>()
                    .add(UpdateFilterStatus(null));
              },
              child: const Icon(
                Icons.close,
                size: 14,
              ),
            )
        ],
      ),
    );
  }
}

class TransactionDateTimeRangePicker extends StatelessWidget {
  const TransactionDateTimeRangePicker({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ListAllReceiptBloc, ListAllReceiptState>(
      builder: (context, state) {
        return InputChip(
          label: state.filter.dateRange != null
              ? Text(
                  "${AppFormatter.dateFormatter.format(state.filter.dateRange!.start)} - ${AppFormatter.dateFormatter.format(state.filter.dateRange!.end)}", style: const TextStyle(color: AppColor.primary,),)
              : const Text("Select Date Range", style: TextStyle(color: AppColor.primary,),),
          avatar: const Icon(
            Icons.calendar_today,
            size: 14,
            color: AppColor.primary,
          ),
          backgroundColor: Colors.transparent,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(4),
            ),
            side: BorderSide(
              color: AppColor.primary,
            ),
          ),
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          onSelected: (bool selected) async {
            if (selected) {
              showDateRangePicker(
                saveText: "OK",
                helpText: "Select Transaction Date Range",
                context: context,
                initialDateRange: state.filter.dateRange ?? DateTimeRange(
                  start: DateTime.now().subtract(const Duration(days: 30)),
                  end: DateTime.now(),
                ),
                firstDate: DateTime(1900),
                lastDate: DateTime.now(),
                useRootNavigator: false,
                builder: (Platform.isMacOS || Platform.isWindows)
                    ? (context, child) {
                        return Dialog(
                          child: SizedBox(
                            height: MediaQuery.of(context).size.height * 0.8,
                            width: MediaQuery.of(context).size.width * 0.5,
                            child: child,
                          ),
                        );
                      }
                    : null,
              ).then((value) {
                if (value != null) {
                  context.read<ListAllReceiptBloc>().add(
                        UpdateFilterDateRange(
                          value,
                        ),
                      );
                }
              });
            }
          },
        );
      },
    );
  }
}
