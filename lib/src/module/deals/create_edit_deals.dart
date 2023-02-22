import 'dart:io';

import 'package:flutter/material.dart';

import '../../config/theme_settings.dart';
import '../../widgets/appbar_leading.dart';
import 'bloc/deals_config_desktop.dart';

class CreateEditDealsView extends StatelessWidget {
  const CreateEditDealsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
            backgroundColor: AppColor.background,
            body: Stack(
              fit: StackFit.expand,
              children: [
                const Positioned(
                  top: 75,
                  left: 16,
                  right: 16,
                  bottom: 16,
                  child: DealConfigView(),
                ),
                Positioned(
                  top: 20,
                  left: 16,
                  child: AppBarLeading(
                    heading: "_dealsConfiguration",
                    icon: Icons.arrow_back,
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ),
              ],
            )),
      ),
    );
  }
}

class DealConfigView extends StatelessWidget {
  const DealConfigView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return const DealsConfigDesktopView();

      // if (Platform.isIOS || Platform.isAndroid) {
      //   return const TaxConfigMobileView();
      // } else {
      //   return const TaxConfigDesktopView();
      // }
    });
  }
}