import 'dart:io';

import 'package:flutter/material.dart';

import '../../config/theme_settings.dart';

mixin LoginThemeConfig {
  Color get backgroundColor {
    if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
      return AppColor.background;
    } else {
      return Colors.white;
    }
  }

  double get elevation {
    if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
      return 10;
    } else {
      return 0;
    }
  }
}