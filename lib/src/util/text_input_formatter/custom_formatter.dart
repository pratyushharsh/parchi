import 'package:flutter/services.dart';

class CustomInputTextFormatter {
  static final TextInputFormatter positiveNumber =
      FilteringTextInputFormatter.allow(RegExp(r'^(\d+(?:[.]\d*)?|\.\d+)$'));
}

class MinMaxDecimalFormatter extends TextInputFormatter {
  final double? min;
  final double? max;
  MinMaxDecimalFormatter({this.min, this.max});

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    if (newValue.selection.baseOffset == 0) {
      return newValue;
    }

    double value = double.tryParse(newValue.text) ?? 0.0;

    if (min != null && value < min!) {
      value = min!;
      return oldValue.copyWith(
          text: value.toString(),
          selection: TextSelection(
              baseOffset: value.toString().length, extentOffset: value.toString().length));
    }

    if (max != null && value > max!) {
      value = max!;
      return oldValue.copyWith(
          text: value.toString(),
          selection: TextSelection(
              baseOffset: value.toString().length, extentOffset: value.toString().length));
    }

    return newValue;
  }
}
