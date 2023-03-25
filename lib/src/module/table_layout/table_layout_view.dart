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
                    return LayoutBuilder(builder: (context, constraints) {
                      int crossAxisCount = 1;

                      if (constraints.maxWidth > 1800) {
                        crossAxisCount = 6;
                      } else if (constraints.maxWidth > 1000) {
                        crossAxisCount = 4;
                      } else if (constraints.maxWidth > 700) {
                        crossAxisCount = 3;
                      } else if (constraints.maxWidth > 500) {
                        crossAxisCount = 1;
                      }

                      return RefreshIndicator(
                        onRefresh: () async {
                          BlocProvider.of<TableLayoutBloc>(context)
                              .add(FetchAllTables());
                        },
                        child: GridView.builder(
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: crossAxisCount,
                              mainAxisSpacing: 10.0,
                              crossAxisSpacing: 10.0,
                            ),
                            itemCount: state.tables.length,
                            itemBuilder: (context, index) {
                              return TableCard(
                                table: state.tables[index],
                              );
                            }),
                      );
                    });
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
