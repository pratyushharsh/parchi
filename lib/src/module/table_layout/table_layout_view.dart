import 'dart:math';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../config/route_config.dart';
import '../../config/theme_settings.dart';
import '../../entity/pos/table_entity.dart';
import '../../repositories/table_repository.dart';
import '../../widgets/appbar_leading.dart';
import '../../widgets/store_user_widget.dart';
import 'bloc/table_layout_bloc.dart';
import 'layout_designer.dart';

class DineInView extends StatelessWidget {
  const DineInView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => TableLayoutBloc(tableRepository: TableRepository())
          ..add(FetchAllTables()),
        child: const DineInViewMobile());
  }
}

class DineInViewMobile extends StatelessWidget {
  const DineInViewMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColor.primary,
      child: SafeArea(
        bottom: false,
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Stack(
            fit: StackFit.expand,
            children: [
              Positioned(
                top: 100,
                left: 16,
                right: 16,
                bottom: 16,
                child: BlocBuilder<TableLayoutBloc, TableLayoutState>(
                  builder: (context, state) {

                    // return const TableLayoutDesigner();

                    return RefreshIndicator(
                        onRefresh: () async {
                          BlocProvider.of<TableLayoutBloc>(context)
                              .add(FetchAllTables());
                        },
                        child: Wrap(
                          spacing: 16,
                          runSpacing: 16,
                          children: state.tables
                              .map((e) => TableIcon(table: e))
                              .toList(),
                        ));
                  },
                ),
              ),
              Positioned(
                top: 40,
                left: 16,
                child: AppBarLeading(
                  heading: "_tables",
                  icon: Icons.arrow_back,
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                ),
              ),
              const Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: StoreUserWidget(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TableCard extends StatelessWidget {
  final TableEntity table;
  const TableCard({Key? key, required this.table}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context)
            .pushNamed(RouteConfig.createRestaurantOrder, arguments: table);
      },
      child: Card(
        child: Container(
          // color: Colors.redAccent,
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8.0),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 1,
                blurRadius: 1,
                offset: const Offset(0, 1), // changes position of shadow
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Table No: ${table.tableId}",
                      style: const TextStyle(
                        // color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TableStatusChip(status: table.status),
                  ],
                ),
              ),
              const Divider(
                height: 1,
                color: Colors.grey,
              ),
              const SizedBox(height: 8.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Order No: ",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  Text(
                    table.orderId ?? '',
                    style: const TextStyle(
                      // color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 8.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Customer Name: ",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  Text(
                    table.customerName ?? '',
                    style: const TextStyle(
                      // color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 8.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Associate Name: ",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  Text(
                    table.associateName ?? '',
                    style: const TextStyle(
                      // color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8.0),
            ],
          ),
        ),
      ),
    );
  }
}

class TableStatusChip extends StatelessWidget {
  final TableStatus status;

  const TableStatusChip({Key? key, required this.status}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    switch (status) {
      case TableStatus.available:
        return Chip(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
          label: const Text(
            "_available",
            style: TextStyle(color: Colors.white),
          ).tr(),
          backgroundColor: Colors.green,
        );
      case TableStatus.occupied:
        return Chip(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
          label: const Text(
            "_occupied",
            style: TextStyle(color: Colors.white),
          ).tr(),
          backgroundColor: Colors.red,
        );
      case TableStatus.reserved:
        return Chip(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
          label: const Text(
            "_reserved",
            style: TextStyle(color: Colors.white),
          ).tr(),
          backgroundColor: Colors.blue,
        );
      case TableStatus.dirty:
        return Chip(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
          label: const Text(
            "_dirty",
            style: TextStyle(color: Colors.white),
          ).tr(),
          backgroundColor: Colors.orange,
        );
    }
  }
}

class TableIcon extends StatelessWidget {
  final TableEntity table;
  const TableIcon({Key? key, required this.table}) : super(key: key);

  List<Widget> _buildSeats(int capacity) {
    List<Widget> seats = [];
    int cap = capacity ~/ 2;
    for (int i = 0; i < cap; i++) {
      seats.add(Container(
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        height: 180,
        width: 80,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25.0),
          color: Colors.grey,
        ),
      ));
    }
    return seats;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: _buildSeats(table.tableCapacity),
        ),
        Container(
          height: 130,
          constraints: BoxConstraints(
              minWidth: 160,
              maxWidth: max(160, table.tableCapacity ~/ 2 * 100.0)),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30.0),
            color: Colors.grey,
            border: Border.all(
              color: Colors.white,
              width: 4.0,
            ),
          ),
        ),
      ],
    );
  }
}
