import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../config/theme_settings.dart';
import '../../entity/pos/floor_entity.dart';
import '../../widgets/cloud_sync_widget.dart';
import '../../widgets/code_value_dropdown.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_text_field.dart';
import '../../widgets/desktop_pop_up.dart';
import '../../widgets/my_loader.dart';
import '../table_layout/layout_designer.dart';
import 'bloc/create_edit_table_bloc.dart';
import 'new_table_form.dart';

class TableConfigDesktopView extends StatelessWidget {
  const TableConfigDesktopView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(children: const [
          Expanded(
            flex: 1,
            child: Padding(
              padding: EdgeInsets.only(left: 8.0),
              child: Text(
                "Area",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Padding(
              padding: EdgeInsets.only(left: 8.0),
              child: Text(
                "Table Layout",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          )
        ]),
        Expanded(
          child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Expanded(
              flex: 1,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(18),
                child: const Card(
                  elevation: 0,
                  child: DineInArea(),
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: BlocBuilder<CreateEditTableBloc, CreateEditTableState>(
                  builder: (context, state) {
                    return Stack(
                      children: [
                        if (state.status == CreateEditTableStatus.loading)
                          const Center(
                            child: MyLoader(),
                          ),
                        if (state.selectedFloor == null)
                          Center(
                            child: Text("Please select a floor",
                                style:
                                    Theme.of(context).textTheme.headlineMedium),
                          ),
                        if (state.selectedFloor != null)
                          Card(
                            elevation: 0,
                            child: state.status == CreateEditTableStatus.loading
                                ? const Center(child: MyLoader(color: AppColor.primary,))
                                : TableLayoutDesigner(
                                    floor: state.selectedFloor!,
                                    tables: state.tables,
                                    onSave: (tables) {
                                      BlocProvider.of<CreateEditTableBloc>(
                                              context)
                                          .add(SaveTableLayout(tables: tables));
                                    },
                                  ),
                          ),
                        if (state.selectedFloor != null &&
                            state.status != CreateEditTableStatus.loading)
                          Positioned(
                            bottom: 20,
                            right: 20,
                            child: Row(
                              children: [
                                FloorActionButton(
                                  onTap: () {
                                    showTransitiveAppPopUp(
                                      context: context,
                                      child: const NewTableForm(),
                                      title: '_createNewTable',
                                    ).then((value) => {
                                          if (value != null &&
                                              value is List &&
                                              value.length >= 2)
                                            {
                                              BlocProvider.of<
                                                          CreateEditTableBloc>(
                                                      context)
                                                  .add(SaveTableEvent(
                                                floorId: state
                                                    .selectedFloor!.floorId,
                                                tableId: value[0],
                                                tableName: value[0],
                                                tableCapacity: int.tryParse(
                                                        value[1].toString()) ??
                                                    2,
                                              ))
                                            }
                                        });
                                  },
                                  icon: const Icon(
                                    Icons.table_bar,
                                    color: AppColor.primary,
                                  ),
                                  label: "Add Table",
                                ),
                              ],
                            ),
                          ),
                      ],
                    );
                  },
                ),
              ),
            )
          ]),
        ),
      ],
    );
  }
}

class FloorActionButton extends StatelessWidget {
  final Icon icon;
  final String label;
  final GestureTapCallback? onTap;
  const FloorActionButton(
      {Key? key, required this.icon, required this.label, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 5),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: AppColor.color8,
            border: Border.all(color: AppColor.primary, width: 2)),
        child: Row(
          children: [
            icon,
            const SizedBox(width: 10),
            Text(
              label,
              style: const TextStyle(
                  color: AppColor.primary,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}

class DineInArea extends StatelessWidget {
  const DineInArea({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateEditTableBloc, CreateEditTableState>(
      builder: (context, state) {
        return ListView(
          children: [
            ...state.floors.map((floor) => FloorPlanTile(floor: floor)),
            const NewFloorTile(),
          ],
        );
      },
    );
  }
}

class NewFloorForm extends StatefulWidget {
  const NewFloorForm({Key? key}) : super(key: key);

  @override
  State<NewFloorForm> createState() => _NewFloorFormState();
}

class _NewFloorFormState extends State<NewFloorForm> {
  late TextEditingController _floorIdController;
  late TextEditingController _floorDescriptionController;
  String? _canvasSize;

  @override
  void initState() {
    super.initState();
    _floorIdController = TextEditingController();
    _floorDescriptionController = TextEditingController();
  }

  @override
  void dispose() {
    _floorIdController.dispose();
    _floorDescriptionController.dispose();
    super.dispose();
  }

  bool get _isValid {
    return _floorIdController.text.isNotEmpty &&
        _floorDescriptionController.text.isNotEmpty &&
        _canvasSize != null;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
            child: SingleChildScrollView(
                child: Column(children: [
          CustomTextField(
            label: '_floorId',
            controller: _floorIdController,
          ),
          CustomTextField(
            label: '_floorDescription',
            controller: _floorDescriptionController,
          ),
          CustomDropdownButton<String>(
            value: _canvasSize,
            label: '_canvasSize',
            items: const [
              DropdownMenuItem(
                value: "1000_1000",
                child: Text("1000 * 1000"),
              ),
              DropdownMenuItem(
                value: "2000_2000",
                child: Text("2000 * 2000"),
              ),
            ],
            onChanged: (value) {
              setState(() {
                _canvasSize = value;
              });
            },
          ),
        ]))),
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
              label: "_createNewFloorPlan",
              onPressed: _isValid
                  ? () {
                      var hw = _canvasSize!.split("_");

                      Navigator.pop(
                          context,
                          CreateNewFloorLayout(
                            floorId: _floorIdController.text,
                            floorName: _floorDescriptionController.text,
                            floorHeight: double.parse(hw[1]),
                            floorWidth: double.parse(hw[0]),
                          ));
                    }
                  : null,
            ),
          ),
        ])
      ],
    );
  }
}

class NewFloorTile extends StatelessWidget {
  final EdgeInsetsGeometry? padding;

  const NewFloorTile({Key? key, this.padding = const EdgeInsets.all(16)})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showTransitiveAppPopUp(
          context: context,
          child: const NewFloorForm(),
          title: '_createNewFloorPlan',
        ).then((value) => {
              if (value != null && value is CreateNewFloorLayout)
                {BlocProvider.of<CreateEditTableBloc>(context).add(value)}
            });
      },
      child: Container(
        padding: padding,
        child: Row(
          children: const [
            Icon(Icons.add),
            SizedBox(width: 16),
            Text("Create New Floor Plan"),
          ],
        ),
      ),
    );
  }
}

class FloorPlanTile extends StatelessWidget {
  final FloorEntity floor;
  final bool selected;

  const FloorPlanTile({Key? key, required this.floor, this.selected = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        BlocProvider.of<CreateEditTableBloc>(context)
            .add(SelectFloorLayout(floor));
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(0),
          color:
              selected ? AppColor.primary.withOpacity(0.2) : Colors.transparent,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(floor.description),
              ],
            ),
            const CloudSyncIcon(
              syncState: 0,
            )
          ],
        ),
      ),
    );
  }
}
