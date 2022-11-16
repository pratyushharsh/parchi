import 'dart:io';

import 'package:flutter/material.dart';

import '../config/theme_settings.dart';
import 'appbar_leading.dart';

Future<T?> showTransitiveAppPopUp<T>(
    {required BuildContext context, required Widget child, String? title}) {
  if (Platform.isIOS || Platform.isAndroid) {
    return Navigator.of(context).push(MaterialPageRoute(
      builder: (_) => MobileDialogView(
        title: title,
        child: child,
      ),
    ));
  }
  return showDialog<T>(
    context: context,
    builder: (ctx) {
      return Dialog(
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.8,
          width: MediaQuery.of(context).size.width * 0.5,
          child: DesktopDialogView(child: child, title: title ?? ''),
        ),
      );
    },
  );
}

class DesktopDialogView extends StatelessWidget {
  final String title;
  final Widget child;
  const DesktopDialogView({Key? key, required this.child, this.title = ''})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          const Divider(),
          Expanded(child: child)
        ],
      ),
    );
  }
}

class MobileDialogView extends StatelessWidget {
  final Widget child;
  final String? title;
  const MobileDialogView({Key? key, required this.child, this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColor.background,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: AppColor.background,
          body: Stack(
            fit: StackFit.expand,
            children: [
              Positioned(
                left: 0,
                right: 0,
                top: 0,
                bottom: 0,
                child: Container(
                  padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16.0),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 70,
                      ),
                      Expanded(child: child),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 20,
                left: 16,
                child: AppBarLeading(
                  heading: title,
                  icon: Icons.arrow_back,
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
