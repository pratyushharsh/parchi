import '../../entity/pos/reason_code_entity.dart';

class ReturnFormValidator {
  static String? validateReasonCode(ReasonCodeEntity? value) {
    if (value == null) {
      return 'Reason Code is required';
    }
    return null;
  }
}