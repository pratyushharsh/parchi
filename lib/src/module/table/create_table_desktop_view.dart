import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../config/theme_settings.dart';
import '../../entity/pos/floor_entity.dart';
import '../../widgets/cloud_sync_widget.dart';
import '../../widgets/code_value_dropdown.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_text_field.dart';
import '../../widgets/desktop_pop_up.dart';
import '../table_layout/layout_designer.dart';
import 'bloc/create_edit_table_bloc.dart';

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
          child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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
                    child: const Card(
                      elevation: 0,
                      child: TableLayoutDesigner(),
                    ),
                  ),
                )
              ]),
        ),
      ],
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
    return _floorIdController.text.isNotEmpty && _floorDescriptionController.text.isNotEmpty && _canvasSize != null;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(child: SingleChildScrollView(
          child: Column(
            children: [
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
            ])
        )),
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
              onPressed: _isValid ? () {

                var hw = _canvasSize!.split("_");

                Navigator.pop(context, CreateNewFloorLayout(
                  floorId: _floorIdController.text,
                  floorName: _floorDescriptionController.text,
                  floorHeight: double.parse(hw[1]),
                  floorWidth: double.parse(hw[0]),
                ));
              } : null,
            ),
          ),
        ])
      ],
    );
  }
}

class NewFloorTile extends StatelessWidget {
  final EdgeInsetsGeometry? padding;
  const NewFloorTile(
      {Key? key,
        this.padding = const EdgeInsets.all(16)})
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
          if (value != null && value is CreateNewFloorLayout) {
            BlocProvider.of<CreateEditTableBloc>(context).add(value)
          }
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