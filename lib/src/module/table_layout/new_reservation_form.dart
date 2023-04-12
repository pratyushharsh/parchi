import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../config/theme_settings.dart';
import '../../entity/pos/contact_entity.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_text_field.dart';
import '../../widgets/desktop_pop_up.dart';
import '../customer_search/customer_search_widget.dart';
import 'bloc/table_reservation_bloc.dart';

class TableReservation extends StatelessWidget {
  const TableReservation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TableReservationBloc(
        tableRepository: context.read(),
      )..add(FetchAllTables()),
      child: const NewReservationForm(),
    );
  }
}

class NewReservationForm extends StatefulWidget {
  const NewReservationForm({Key? key}) : super(key: key);

  @override
  State<NewReservationForm> createState() => _NewReservationFormState();
}

class _NewReservationFormState extends State<NewReservationForm> {
  late TextEditingController _searchController;
  late TextEditingController _numberOfGuestController;
  late TextEditingController _reservationDateController;
  late TextEditingController _reservationTimeController;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
    _numberOfGuestController = TextEditingController();
    _reservationDateController = TextEditingController();
    _reservationTimeController = TextEditingController();
  }

  @override
  void dispose() {
    _searchController.dispose();
    _numberOfGuestController.dispose();
    _reservationDateController.dispose();
    _reservationTimeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TableReservationBloc, TableReservationState>(
      builder: (context, state) {
        return Column(
          children: [
            GestureDetector(
              onTap: () {
                showTransitiveAppPopUp(
                  title: "Search For Customer",
                  context: context, child: const CustomerSearch(),
                ).then((value) {
                  if (value != null && value is ContactEntity) {
                    _searchController.text = value.firstName;
                    context.read<TableReservationBloc>().add(
                      ChangeCustomer(value),
                    );
                  }
                });
              },
              child: CustomTextField(
                enabled: false,
                label: "Search For Customer",
                hint: "Search Guest Name or Mobile",
                controller: _searchController,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Reservation Details",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      // Date Picker
                      Row(
                        children: [
                          Expanded(
                            child: CustomTextField(
                              label: "Date",
                              hint: "Select Date",
                              controller: _reservationDateController,
                              suffixIcon: IconButton(
                                icon: const Icon(Icons.calendar_today),
                                onPressed: () async {
                                  final DateTime? picked = await showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime.now(),
                                    lastDate: DateTime(2101),
                                  ).then((value) {
                                    if (value != null) {
                                      _reservationDateController.text =
                                          DateFormat(DateFormat.YEAR_ABBR_MONTH_DAY).format(value);
                                      context.read<TableReservationBloc>().add(
                                            ChangeReservationDate(value),
                                          );
                                    }
                                  });
                                },
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: CustomTextField(
                              label: "Time",
                              hint: "Select Time",
                              controller: _reservationTimeController,
                              suffixIcon: IconButton(
                                icon: const Icon(Icons.access_time),
                                onPressed: () {
                                  showTimePicker(
                                    context: context,
                                    initialTime: TimeOfDay.now(),
                                  ).then((value) {
                                    if (value != null) {
                                      _reservationTimeController.text =
                                          value.format(context);
                                      context.read<TableReservationBloc>().add(
                                            ChangeReservationTime(value),
                                          );
                                    }
                                  });
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                      CustomTextField(
                          label: "Number Of Guest",
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                          ],
                          onValueChange: (value) {
                            context.read<TableReservationBloc>().add(
                                  ChangeNumberOfGuest(int.parse(value)),
                                );
                          }),
                      const CustomTextField(
                        label: "Notes",
                        minLines: 4,
                        maxLines: 5,
                      ),
                      // Time Picker
                      // Number of Guests
                      // Reservation Status
                      // Reservation Type
                    ],
                  )),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Table Details",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Expanded(
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              for (var table in state.tables)
                                InkWell(
                                  focusColor: AppColor.color8,
                                  highlightColor: AppColor.color8,
                                  hoverColor: AppColor.color8,
                                  onTap: () {
                                    context.read<TableReservationBloc>().add(
                                          ChangeSelectedTable(table),
                                        );
                                  },
                                  child: Container(
                                    color: state.selectedTable == table ? AppColor.color8 : Colors.transparent,
                                    padding: const EdgeInsets.all(20),
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
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
                                                  table.tableId,
                                                  style: const TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.green,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 20,),
                                            Text(
                                              table.floorId ?? '',
                                              style: const TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            const Icon(Icons.people_alt_outlined, color: AppColor.primary,),
                                            SizedBox(
                                              width: 30,
                                              child: Text(
                                                table.tableCapacity.toString(),
                                                textAlign: TextAlign.right,
                                                style: const TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                  color: AppColor.primary,
                                                ),
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ),
                      )
                    ],
                  )),
                ],
              ),
            ),
            Row(children: [
              Expanded(
                child: RejectButton(
                  label: "_cancel",
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: AcceptButton(
                  label: "_createNewTableReservation",
                  onPressed: () {},
                ),
              ),
            ])
          ],
        );
      },
    );
  }
}
