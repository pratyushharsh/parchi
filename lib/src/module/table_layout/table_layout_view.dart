import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../config/theme_settings.dart';
import '../../entity/pos/table_entity.dart';
import '../../repositories/table_repository.dart';
import '../../widgets/appbar_leading.dart';
import '../../widgets/store_user_widget.dart';
import 'bloc/table_layout_bloc.dart';

class DineInView extends StatelessWidget {
  const DineInView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) =>
            TableLayoutBloc(tableRepository: TableRepository())..add(FetchAllTables()),
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
                child: SingleChildScrollView(
                  child: BlocBuilder<TableLayoutBloc, TableLayoutState>(
                    builder: (context, state) {
                      return Column(children: [
                        const SizedBox(
                          height: 100,
                        ),
                        ...state.tables.map((e) => TableCard(table: e,)).toList(),
                      ]);
                    },
                  ),
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
    return Card(
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
            Row(
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
            const Divider(
              height: 1,
              color: Colors.grey,
            ),
            const SizedBox(height: 8.0),
            Text("Customer Name: ${table.customerName ?? "N/A"}"),
            Text("Waiter Name: ${table.associateName ?? "N/A"}"),
            const SizedBox(height: 8.0),
          ],
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
        return const Chip(
          label: Text(
            "_available",
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.green,
        );
      case TableStatus.occupied:
        return const Chip(
          label: Text(
            "_occupied",
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.red,
        );
      case TableStatus.reserved:
        return const Chip(
          label: Text(
            "_reserved",
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.blue,
        );
      case TableStatus.dirty:
        return const Chip(
          label: Text(
            "_dirty",
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.orange,
        );
    }
  }
}
