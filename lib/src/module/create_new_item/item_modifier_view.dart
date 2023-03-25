import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../config/theme_settings.dart';
import '../../entity/pos/entity.dart';
import '../../util/text_input_formatter/custom_formatter.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_text_field.dart';
import '../../widgets/desktop_pop_up.dart';
import 'bloc/add_new_item_bloc.dart';

class ItemModifierView extends StatelessWidget {
  const ItemModifierView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddNewItemBloc, AddNewItemState>(
      builder: (context, state) {
        return Scaffold(
          body: ListView(
            children: state.modifiers.map((e) => ItemModifierCard(modifier: e,)).toList(),
          ),
          floatingActionButton: FloatingActionButton(
            isExtended: true,
            backgroundColor: AppColor.primary,
            onPressed: () {
              showTransitiveAppPopUp(
                context: context,
                title: 'New Item Modifier',
                child: const ItemModifierForm(),
              ).then((value) =>
              {
                if (value != null && value is ItemModifier)
                  {
                    BlocProvider.of<AddNewItemBloc>(context)
                        .add(AddNewItemModifier(value))
                  }
              });
            },
            child: const Icon(Icons.add, size: 30, color: Colors.white,),
          )
        );
      },
    );
  }
}

class ItemModifierCard extends StatelessWidget {
  final ItemModifier modifier;
  const ItemModifierCard({Key? key, required this.modifier}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {

      },
      child: Container(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(modifier.name ?? ''),
                  Text(modifier.price.toString()),
                ],
              ),
            ),
            IconButton(
              onPressed: () {
                // BlocProvider.of<AddNewItemBloc>(context)
                //     .add(RemoveNewItemModifier(modifier));
              },
              icon: const Icon(Icons.delete),
            )
          ],
        ),
      ),
    );
  }
}



class ItemModifierForm extends StatefulWidget {
  const ItemModifierForm({Key? key}) : super(key: key);

  @override
  State<ItemModifierForm> createState() => _ItemModifierFormState();
}

class _ItemModifierFormState extends State<ItemModifierForm> {

  late TextEditingController _nameController;
  late TextEditingController _priceController;


  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _priceController = TextEditingController();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _priceController.dispose();
    super.dispose();
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
                  label: "_modifierName",
                  controller: _nameController,
                  onValueChange: (value) {

                  },
                ),
                CustomTextField(
                  label: "_modifierPrice",
                  controller: _priceController,
                  onValueChange: (value) {

                  },
                  inputFormatters: [
                    CustomInputTextFormatter.positiveNumber
                  ],
                ),
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
              label: "_createNewModifier",
              onPressed: () {
                // Generate Tax Group
                final modifier = ItemModifier(
                  name: _nameController.text,
                  price: double.tryParse(_priceController.text) ?? 0,
                );
                Navigator.pop(context, modifier);
              },
            ),
          ),
        ])
      ],
    );
  }
}
