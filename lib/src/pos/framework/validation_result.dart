abstract class AValidationResult {
  static AValidationResult success = SimpleValidationResult();

  String getMessage();
  bool isSecured();
  bool isValid();
}

class SimpleValidationResult extends AValidationResult {
  final bool valid;
  final String message;

  SimpleValidationResult({this.valid = true, this.message = ""});

  @override
  String getMessage() {
    return message;
  }

  @override
  bool isSecured() {
    return false;
  }

  @override
  bool isValid() {
    return valid;
  }
}
