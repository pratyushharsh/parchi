import 'package:validators/validators.dart';

import '../../config/regex.dart';
import '../../entity/config/code_value_entity.dart';
import '../../entity/pos/address.dart';

class BusinessValidator {
  static String? businessName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Business name is required';
    } else {
      if (value.length < 3) {
        return 'Should be min 3 characters.';
      }
    }
    return null;
  }

  static String? legalBusinessName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Legal Business name is required';
    } else {
      if (value.length < 3) {
        return 'Should be min 3 characters.';
      }
    }
    return null;
  }

  static String? businessCurrency(CodeValueEntity? value) {
    if (value == null) {
      return 'Business Currency is required';
    }
    return null;
  }

  static String? businessLocale(CodeValueEntity? value) {
    if (value == null) {
      return 'Business Locale is required';
    }
    return null;
  }

  static String? businessContact(String? value) {
    if (value != null && value.isNotEmpty) {
      if (!phoneRegExp.hasMatch(value)) {
        return 'Not a valid phone number';
      }
    } else {
      return 'Phone number is required';
    }
    return null;
  }

  static String? businessEmail(String? value) {
    if (value != null && value.isNotEmpty) {
      if (!isEmail(value)) {
        return 'Not a valid email';
      }
    }
    return null;
  }

  static String? businessAddress(Address? value) {
    if (value == null) {
      return 'Address is required';
    }
    return null;
  }
}
