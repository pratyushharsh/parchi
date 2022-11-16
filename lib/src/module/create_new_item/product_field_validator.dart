import 'package:validators/validators.dart';

import '../../entity/pos/tax_group_entity.dart';


class NewProductFieldValidator {
  static String? validateProductName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Product name is required';
    }
    return null;
  }

  static String? validateUOM(String? value) {
    if (value == null || value.isEmpty) {
      return '*Required';
    }
    return null;
  }

  static String? validatePrice(String? value) {
    if (value != null && value.isNotEmpty) {
      if (!isFloat(value)) {
        return 'Not a valid number';
      }
    }
    return null;
  }

  static String? validateListPrice(String? value) {
    if (value != null && value.isNotEmpty) {
      if (!isFloat(value)) {
        return 'Not a valid number';
      }
    }
    return null;
  }

  static String? validateSalePrice(String? value) {
    if (value != null && value.isNotEmpty) {
      if (!isFloat(value)) {
        return 'Not a valid number';
      }
    }
    return null;
  }

  static String? validateTaxGroup(TaxGroupEntity? value) {
    if (value == null || value.groupId.isEmpty) {
      return 'Tax group is required';
    }
    return null;
  }

  static String? validateSkuData(String? value) {
    if (value != null && value.isNotEmpty) {
      if (!isAlphanumeric(value)) {
        return 'Not a valid number';
      }
    }
    return null;
  }
}
