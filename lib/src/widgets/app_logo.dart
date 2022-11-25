import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../config/theme_settings.dart';


class AppLogo extends StatelessWidget {
  const AppLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          height: 50,
          width: 50,
          child: SvgPicture.asset(
            "assets/logo/logo_revert.svg",
            alignment: Alignment.center,
          ),
        ),
        const Text(
          "PARCHI",
          style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              letterSpacing: 3,
              color: AppColor.primaryText),
        ),
      ],
    );
  }
}
