
enum ErrorLevel {
  success,
  info,
  warning,
  error,
}

class ErrorModel {
  final String message;
  final ErrorLevel level;

  ErrorModel({required this.message, required this.level });
}