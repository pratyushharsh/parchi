import 'validation_result.dart';

abstract class AValidationRule {

  AValidationResult validate();
}

abstract class ObjectValidationRule<T> extends AValidationRule {

  @override
  AValidationResult validate() {
    return AValidationResult.success;
  }

  void validateObject(T var1);
}