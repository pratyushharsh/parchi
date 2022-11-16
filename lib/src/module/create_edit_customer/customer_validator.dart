import 'package:validators/validators.dart';

class NewPartyFieldValidator {
  static String? validatePartyName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Customer name is required';
    } else {
      if (value.length < 3) {
        return 'Should be min 3';
      }
    }
    return null;
  }

  static String? validatePartyEmail(String? value) {
    if (value != null && value.isNotEmpty) {
      if (!isEmail(value)) {
        return 'Not a valid email';
      }
    }
    return null;
  }
}