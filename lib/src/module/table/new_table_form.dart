import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../config/theme_settings.dart';
import '../../entity/pos/table_entity.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_text_field.dart';
import '../table_layout/table_layout_view.dart';
import 'bloc/create_edit_table_bloc.dart';

class NewTableForm extends StatefulWidget {
  const NewTableForm({Key? key}) : super(key: key);

  @override
  State<NewTableForm> createState() => _NewTableFormState();
}

class _NewTableFormState extends State<NewTableForm> {
  late TextEditingController _tableIdController;
  late TextEditingController _numberOfSeatsController;

  @override
  void initState() {
    super.initState();
    _tableIdController = TextEditingController();
    _numberOfSeatsController = TextEditingController();
    _tableIdController.addListener(() {
      setState(() {});
    });
    _numberOfSeatsController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _tableIdController.dispose();
    _numberOfSeatsController.dispose();
    super.dispose();
  }

  bool get _isValid {
    return _tableIdController.text.isNotEmpty &&
        _numberOfSeatsController.text.isNotEmpty;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                CustomTextField(
                  label: '_tableId',
                  controller: _tableIdController,
                  onValueChange: (value) {},
                ),
                CustomTextField(
                  label: '_numberOfSeats',
                  controller: _numberOfSeatsController,
                  onValueChange: (value) {},
                  textInputType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                ),
                const SizedBox(height: 40),
                if (_isValid)
                Center(
                  child: TableIcon(
                    table: TableEntity(
                      tableId: _tableIdController.text,
                      tableCapacity: int.tryParse(_numberOfSeatsController.text) ?? 2
                  ),
                ))
              ],
            ),
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
              label: "_createNewFloorPlan",
              onPressed: _isValid
                  ? () {
                      Navigator.pop(context, [
                        _tableIdController.text,
                        _numberOfSeatsController.text
                      ]);
                    }
                  : null,
            ),
          ),
        ])
      ],
    );
  }
}

class TableCardMobile extends StatelessWidget {
  final TableEntity tableEntity;

  const TableCardMobile({Key? key, required this.tableEntity})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 14, left: 16, bottom: 8, right: 16),
      margin: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: AppColor.color8,
        borderRadius: BorderRadius.circular(10),
      ),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "_tableIdLabel",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ).tr(
                namedArgs: {
                  'tableId': tableEntity.tableId,
                },
              ),
            ],
          ),
          const SizedBox(height: 8),
          KeyValueTile(
              title: "_numberOfSeats",
              value: tableEntity.tableCapacity.toString()),
          const Divider(height: 0),
        ],
      ),
    );
  }
}

class KeyValueTile extends StatelessWidget {
  final String title;
  final String value;

  const KeyValueTile({
    Key? key,
    required this.title,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title),
            Text(value),
          ],
        ),
      ),
    );
  }
}
