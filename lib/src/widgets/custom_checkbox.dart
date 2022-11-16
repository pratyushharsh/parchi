import 'package:flutter/material.dart';

import '../config/theme_settings.dart';

class CustomCheckbox extends StatelessWidget {
  final bool value;
  final ValueChanged<bool>? onChanged;
  const CustomCheckbox({Key? key, this.value = false, this.onChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onChanged!(!value);
      },
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: AppColor.formInputBorder, width: 1.5),
              borderRadius: BorderRadius.circular(3)
          // color: AppColor.primary,
        ),
        child: value
            ? const Icon(
                Icons.check,
                size: 18.0,
                color: AppColor.primary,
              )
            : const SizedBox(height: 18, width: 18,),
      ),
    );
  }
}
