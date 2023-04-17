import 'dart:math';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../config/theme_settings.dart';
import '../../entity/pos/table_entity.dart';
import '../../entity/pos/table_reservation_entity.dart';
import '../../repositories/table_repository.dart';
import '../../widgets/appbar_leading.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_dialog.dart';
import '../../widgets/desktop_pop_up.dart';
import '../../widgets/my_loader.dart';
import '../../widgets/store_user_widget.dart';
import 'bloc/table_layout_bloc.dart';
import 'layout_designer.dart';
import 'new_reservation_form.dart';

DateFormat timeFormatter = DateFormat('hh:mm');
DateFormat amFormatter = DateFormat('a');

class DineInView extends StatelessWidget {
  const DineInView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => TableLayoutBloc(tableRepository: RepositoryProvider.of(context), authenticationBloc: BlocProvider.of(context))
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
              const Positioned(
                  top: 100,
                  left: 16,
                  right: 16,
                  bottom: 16,
                  child: TableReservationDashboard()),
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
              Positioned(
                top: 40,
                right: 16,
                child: SizedBox(
                  width: 150,
                  child: AcceptButton(
                    onPressed: () {
                      showTransitiveAppPopUp(
                        title: "New Reservation",
                        child: const TableReservation(),
                        context: context,
                      ).then((value) => {
                            if (value != null && value == true)
                              {
                                BlocProvider.of<TableLayoutBloc>(context)
                                    .add(RefreshReservation())
                              }
                          });
                    },
                    label: '+ New Reservation',
                  ),
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

class TableReservationDashboard extends StatelessWidget {
  const TableReservationDashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Expanded(
        flex: 1,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(18),
          child: Card(
            elevation: 0,
            child: Column(
              children: [
                Text(
                  "Table Reservation",
                  style: Theme.of(context).textTheme.headline6,
                ).tr(),
                const Expanded(child: TableReservationList())
              ],
            ),
          ),
        ),
      ),
      Expanded(
        flex: 3,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(18),
          child: Card(
            elevation: 0,
            child: BlocBuilder<TableLayoutBloc, TableLayoutState>(
              builder: (context, state) {
                if (state.status == TableLayoutStatus.loading) {
                  return const Center(
                    child: MyLoader(),
                  );
                }

                if (state.tables.isEmpty) {
                  return const Center(
                    child: Icon(Icons.hourglass_empty),
                  );
                }
                return Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      child: Wrap(
                        spacing: 8,
                        children: state.floors
                            .map((e) => ActionChip(
                                  label: Text(e.description),
                                  onPressed: () {
                                    context
                                        .read<TableLayoutBloc>()
                                        .add(FetchTablesByFloor(floor: e));
                                  },
                                ))
                            .toList(),
                      ),
                    ),
                    Expanded(
                      child: InteractiveViewer(
                        minScale: 0.4,
                        child: FittedBox(
                          child: TableLayoutDesigner(
                            tables: state.tables,
                            floor: state.floor!,
                            isEditable: false,
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    ]);
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

class TableIcon extends StatefulWidget {
  final TableEntity table;
  final bool canEdit;
  const TableIcon({Key? key, required this.table, this.canEdit = false})
      : super(key: key);

  @override
  State<TableIcon> createState() => _TableIconState();
}

class _TableIconState extends State<TableIcon> {
  void onScaleUp() {
    setState(() {
      widget.table.scale += 0.1;
      widget.table.scale = min(1.5, widget.table.scale);
    });
  }

  void onScaleDown() {
    setState(() {
      widget.table.scale -= 0.1;
      widget.table.scale = max(0.5, widget.table.scale);
    });
  }

  void onRotateLeft() {
    setState(() {
      widget.table.rotation -= pi / 6;
      widget.table.rotation %= 2 * pi;
    });
  }

  void onRotateRight() {
    setState(() {
      widget.table.rotation += pi / 6;
      widget.table.rotation %= 2 * pi;
    });
  }

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
          color: Colors.grey.shade400.withOpacity(0.7),
        ),
      ));
    }
    return seats;
  }

  Color _tableColorByStatus(TableStatus status) {
    switch (status) {
      case TableStatus.available:
        return Colors.greenAccent;
      case TableStatus.occupied:
        return Colors.lightBlueAccent.shade100;
      case TableStatus.reserved:
        return Colors.orangeAccent;
      case TableStatus.dirty:
        return Colors.brown;
    }
  }

  String _statusBasedOnStatusCode(TableStatus status) {
    switch (status) {
      case TableStatus.available:
        return "Vacant";
      case TableStatus.occupied:
        return "Occupied";
      case TableStatus.reserved:
        return "Reserved";
      case TableStatus.dirty:
        return "Not Available";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Transform.rotate(
          angle: widget.table.rotation,
          child: Transform.scale(
            scale: widget.table.scale,
            child: Material(
              color: Colors.transparent,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: _buildSeats(widget.table.tableCapacity),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.white,
                        width: 4,
                      ),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20.0),
                      child: Container(
                        height: 130,
                        constraints: BoxConstraints(
                            minWidth: 160,
                            maxWidth: max(
                                160, widget.table.tableCapacity ~/ 2 * 100.0)),
                        decoration: BoxDecoration(
                          color: Colors.blueGrey,
                          border: Border(
                            right: BorderSide(
                              color: _tableColorByStatus(widget.table.status),
                              width: 18,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 15,
                    top: 35,
                    right: 22,
                    child: Text(
                      '${widget.table.tableId} | ${widget.table.associateName ?? ''}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 60,
                    left: 15,
                    child: Text(
                      widget.table.customerName ?? '',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 35,
                    left: 15,
                    child: Text(
                      _statusBasedOnStatusCode(widget.table.status),
                      style: TextStyle(
                        color: _tableColorByStatus(widget.table.status),
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        if (widget.canEdit)
          Positioned(
            top: 30,
            left: 10,
            child: Material(
              color: Colors.transparent,
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {
                      onScaleUp();
                    },
                    icon: const Icon(Icons.zoom_in),
                  ),
                  IconButton(
                    onPressed: () {
                      onScaleDown();
                    },
                    icon: const Icon(Icons.zoom_out),
                  ),
                  IconButton(
                    onPressed: () {
                      onRotateLeft();
                    },
                    icon: const Icon(Icons.rotate_90_degrees_cw),
                  ),
                ],
              ),
            ),
          ),
      ],
    );
  }
}

class TableReservationList extends StatelessWidget {
  const TableReservationList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TableLayoutBloc, TableLayoutState>(
      builder: (context, state) {
        return SingleChildScrollView(
          child: Column(
            children: [
              TableCategoryHeader(
                count: state.numberOfGuest,
                label: "SEATED",
              ),
              ...state.currentReservation.map((e) => ReservedCustomerTableCard(
                    reservation: e,
                  )),
              const SizedBox(
                height: 10,
              ),
              const TableCategoryHeader(
                count: 10,
                label: "Upcoming",
              ),
              ...state.upcoming.map((e) => ReservedCustomerTableCard(
                    reservation: e,
                  )),
            ],
          ),
        );
      },
    );
  }
}

class TableCategoryHeader extends StatelessWidget {
  final String label;
  final int count;
  const TableCategoryHeader(
      {Key? key, required this.label, required this.count})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label.toUpperCase(),
          style: const TextStyle(
            letterSpacing: 2,
            fontWeight: FontWeight.bold,
          ),
        ),
        Row(
          children: [
            const Icon(Icons.person),
            const SizedBox(
              width: 10,
            ),
            Text(count.toString(),
                style: const TextStyle(
                    letterSpacing: 2, fontWeight: FontWeight.bold))
          ],
        )
      ],
    );
  }
}

class ReservedCustomerTableCard extends StatelessWidget {
  final TableReservationEntity reservation;
  const ReservedCustomerTableCard({Key? key, required this.reservation})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {

        if (reservation.status == TableReservationStatus.pending) {
          yesOrCancelDialog(context, "Confirmation",
              content: "Have customer arrived?",
              yesText: "Yes",
              cancelText: "No")
              .then((value) => {
            if (value != null && value)
              {
                context.read<TableLayoutBloc>().add(
                  ConfirmReservation(reservation: reservation),
                )
              }
          });
        } else if (reservation.status == TableReservationStatus.confirmed) {
          yesOrCancelDialog(context, "Confirmation",
              content: "Have customer left?",
              yesText: "Yes",
              cancelText: "No")
              .then((value) => {
            if (value != null && value)
              {
                context.read<TableLayoutBloc>().add(
                  CompleteReservation(reservation: reservation),
                )
              }
          });
        }
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8),
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: AppColor.formInputBorder,
                  ),
                  child: Column(
                    children: [
                      Text(
                        reservation.reservationTime != null
                            ? timeFormatter.format(reservation.reservationTime!)
                            : '',
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      Text(
                        reservation.reservationTime != null
                            ? amFormatter.format(reservation.reservationTime!)
                            : '',
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      reservation.customerName,
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Text(reservation.customerPhone),
                    const SizedBox(
                      height: 6,
                    ),
                    Text(
                        "${reservation.numberOfGuest} Guest / ${reservation.tableId}")
                  ],
                )
              ],
            ),
            if (reservation.tableId != null)
              Container(
                width: 70,
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(
                    color: Colors.green,
                  ),
                ),
                child: Center(
                  child: Text(
                    reservation.tableId!,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
