
import 'dart:io';

import 'package:flutter/material.dart';

import '../../config/theme_settings.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/extension/retail_extension.dart';

typedef OnButtonCallback = void Function();

class SaleCompleteDialog extends StatelessWidget {
  const SaleCompleteDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(
            height: 8,
          ),
          const Icon(Icons.check_circle_outlined, color: Colors.green, size: 150,),
          const Text(
            "Sale Complete",
            style: TextStyle(fontWeight: FontWeight.w200, fontSize: 40,),

          ),
          const SizedBox(
            height: 15,
          ),
          Text(
            "Change Due : ${getCurrencyFormatter(context).format(0.00)}",
            style: const TextStyle(fontWeight: FontWeight.w100, fontSize: 20, color: AppColor.formInputText),
          ),
          Expanded(child: Container()),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8),
            child: TextFormField(
              decoration: InputDecoration(
                labelStyle: const TextStyle(fontWeight: FontWeight.w100, color: AppColor.formInputText),
                hintText: "Email Invoice",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              keyboardType: TextInputType.emailAddress,
              style: const TextStyle(fontWeight: FontWeight.w100, color: AppColor.formInputText),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12),
            child: Row(
              children: [
                Expanded(child: AcceptButton(onPressed: () {
                  Navigator.of(context).pop("EMAIL");
                }, label: 'Email Invoice'),),
                const SizedBox(width: 8,),
                Expanded(child: AcceptButton(onPressed: () {
                  Navigator.of(context).pop("PRINT");
                }, label: 'Print Invoice'),),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class DialogButton extends StatelessWidget {
  final String label;
  final OnButtonCallback onClick;
  final Icon? icon;
  final bool selected;
  const DialogButton(
      {Key? key,
      required this.label,
      required this.onClick,
      this.icon,
      this.selected = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {

    late double height, width;

    if (Platform.isIOS || Platform.isAndroid) {
      height = 60;
      width = 100;
    } else {
      height = 80;
      width = 120;
    }

    return Card(
      // shadowColor: Colors.green,
      elevation: 4,
      shape: RoundedRectangleBorder(
        side: BorderSide(color: selected ? AppColor.primary : Colors.transparent),
        // borderRadius: BorderRadius.circular(12.0),
      ),
      child: InkWell(
        onTap: onClick,
        child: Container(
          padding: const EdgeInsets.all(12),
          height: height,
          width: width,
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [if (icon != null) icon!, Text(label)],
            ),
          ),
        ),
      ),
    );
  }
}
