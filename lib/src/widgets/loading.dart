import 'dart:math';

import 'package:flutter/material.dart';

import '../model/snackbar_model.dart';
import 'my_loader.dart';

void showLoadingDialog(BuildContext context) {
  showDialog(
      context: context,
      barrierDismissible: false,
      // builder: (context) => Lottie.asset("assets/lottie/loading.zip")
      builder: (context) => const MyLoader());
}

SnackBar buildSnackBar(ErrorModel model) {

  return SnackBar(
    content: SnackBarWidget(model: model),
    elevation: 0,
    backgroundColor: Colors.transparent,
    duration: const Duration(milliseconds: 1500),
  );
}

class SnackBarWidget extends StatelessWidget {
  final ErrorModel model;
  const SnackBarWidget({Key? key, required this.model}) : super(key: key);

  Color getBackgroundColor() {
    late Color backgroundColor;

    switch (model.level) {
      case ErrorLevel.success:
        backgroundColor = Colors.green;
        break;
      case ErrorLevel.info:
        backgroundColor = Colors.blue;
        break;
      case ErrorLevel.warning:
        backgroundColor = Colors.orange;
        break;
      case ErrorLevel.error:
        backgroundColor = Colors.red;
        break;
    }
    return backgroundColor;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: Align(
        alignment: Alignment.centerLeft,
        child: Container(
          height: 50,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          width: min(MediaQuery.of(context).size.width - 20, 600),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: getBackgroundColor(),
          ),
          constraints: const BoxConstraints(minWidth: 500),
          child: Row(
            children: [
              Expanded(child: Text(model.message, style: const TextStyle(fontWeight: FontWeight.w600),)),
            ],
          ),
        ),
      ),
    );
  }
}

