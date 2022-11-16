part of 'error_notification_bloc.dart';

class ErrorNotificationState {
  final List<String> errors;

  const ErrorNotificationState({this.errors = const []});

  ErrorNotificationState copyWith({List<String>? errors}) {
    return ErrorNotificationState(
      errors: errors ?? this.errors,
    );
  }
}
