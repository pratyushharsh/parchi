import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../config/theme_settings.dart';

class AcceptButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;
  final BorderRadiusGeometry? borderRadius;
  const AcceptButton(
      {Key? key,
      required this.label,
      required this.onPressed,
      this.borderRadius})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    late EdgeInsetsGeometry padding;

    if (Platform.isIOS || Platform.isAndroid) {
      padding = const EdgeInsets.symmetric(vertical: 16);
    } else {
      padding = const EdgeInsets.symmetric(vertical: 20);
    }

    return ElevatedButton(
      // onPressed: null,
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        elevation: 0, backgroundColor: AppColor.primary,
        padding: padding,
        shape: RoundedRectangleBorder(
            borderRadius: borderRadius ?? BorderRadius.circular(5.0)),
      ),
      child: Text(
        label,
        style: const TextStyle(color: AppColor.textColorSecondary),
      ).tr(),
    );
  }
}

class RejectButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;
  const RejectButton({Key? key, required this.label, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {

    late EdgeInsetsGeometry padding;

    if (Platform.isIOS || Platform.isAndroid) {
      padding = const EdgeInsets.symmetric(vertical: 16);
    } else {
      padding = const EdgeInsets.symmetric(vertical: 20);
    }

    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        elevation: 0, backgroundColor: AppColor.color8,
        padding: padding,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
      ),
      child: Text(
        label,
        style: const TextStyle(color: AppColor.primary),
      ).tr(),
    );
  }
}
