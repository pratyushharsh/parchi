part of 'login_bloc.dart';

@immutable
abstract class LoginEvent {}

class LoginUserWithPhone extends LoginEvent {
  final String phoneNumber;

  LoginUserWithPhone(this.phoneNumber);
}

class VerifyUserOtp extends LoginEvent {
  final String otp;

  VerifyUserOtp(this.otp);
}

class RemoveDevice extends LoginEvent {
  final List<String> devices;

  RemoveDevice(this.devices);
}

class LogOutUserEvent extends LoginEvent {}


