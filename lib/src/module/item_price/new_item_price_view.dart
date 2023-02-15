import 'package:flutter/material.dart';

import '../../widgets/appbar_leading.dart';
import '../../widgets/custom_text_field.dart';

class NewItemPrice extends StatelessWidget {
  const NewItemPrice({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 20,
            left: 16,
            child: AppBarLeading(
              heading: "_itemPrice",
              icon: Icons.arrow_back,
              onTap: () {

              },
            ),
          ),
        ])
    );
  }
}

class NewItemPriceForm extends StatefulWidget {
  const NewItemPriceForm({Key? key}) : super(key: key);

  @override
  State<NewItemPriceForm> createState() => _NewItemPriceFormState();
}

class _NewItemPriceFormState extends State<NewItemPriceForm> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextField(label: "_price",)

      ],
    );
  }
}
