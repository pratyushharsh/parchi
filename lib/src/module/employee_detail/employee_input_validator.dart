import 'package:validators/validators.dart';

import '../../config/regex.dart';


class NewEmployeeFieldValidator {

  static String? validateEmployeeEmail(String? value) {
    if (value != null && value.isNotEmpty) {
      if (!isEmail(value)) {
        return 'Not a valid email';
      }
    }
    return null;
  }

  static String? validatePhone(String? value) {
    if (value != null && value.isNotEmpty) {
      if (!phoneRegExp.hasMatch(value)) {
        return 'Not a valid phone number';
      }
    } else {
      return 'Phone number is required';
    }
    return null;
  }
}