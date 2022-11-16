import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:math' as math;

class MoneyEditingController extends TextEditingController {
  final NumberFormat formatter;
  MoneyEditingController({double moneyValue = 0.00, required this.formatter})
      : super.fromValue(MoneyTextEditingValue(
            text: formatter.format(moneyValue),
            selection:
                TextSelection.collapsed(offset: formatter.format(moneyValue).length),
            moneyValue: moneyValue));

  @override
  set value(TextEditingValue newValue) {
    assert(
      !newValue.composing.isValid || newValue.isComposingRangeValid,
      'New TextEditingValue $newValue has an invalid non-empty composing range '
      '${newValue.composing}. It is recommended to use a valid composing range, '
      'even for readonly text fields',
    );

    var parsedValue = newValue.text.replaceAll(RegExp(r'\D'), '');
    double doubleValue = (double.tryParse(parsedValue) ?? 0.00 ) / math.pow(10, formatter.decimalDigits ?? 0);
    var doubleValueFormatted = formatter.format(doubleValue);
    super.value = MoneyTextEditingValue(
      text: doubleValueFormatted,
      selection:  TextSelection.collapsed(offset: doubleValueFormatted.length),
      moneyValue: doubleValue,
    );
  }
}

class MoneyTextEditingValue extends TextEditingValue {
  final double moneyValue;
  const MoneyTextEditingValue(
      {required this.moneyValue,
      required String text,
      required TextSelection selection})
      : super(text: text, selection: selection);
}
