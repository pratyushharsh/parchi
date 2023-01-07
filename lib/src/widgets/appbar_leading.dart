import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../config/theme_settings.dart';

class AppBarLeading extends StatelessWidget {
  final String? heading;
  final IconData? icon;
  final GestureTapCallback? onTap;
  const AppBarLeading({
    Key? key,
    this.heading,
    this.icon,
    this.onTap,
  })  : assert(heading != null || icon != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (icon != null)
          InkWell(
            onTap: onTap,
            child: Container(
              decoration: BoxDecoration(
                color: AppColor.primary,
                borderRadius: BorderRadius.circular(10),
              ),
              height: 40,
              width: 40,
              child: Icon(
                icon,
                color: AppColor.iconColor,
              ),
            ),
          ),
        if (icon != null)
          const SizedBox(
            width: 15,
          ),
        if (heading != null)
          Text(
            heading!,
            style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 26),
          ).tr(),
      ],
    );
  }
}
