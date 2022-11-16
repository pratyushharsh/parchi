part of 'authentication_bloc.dart';

abstract class AuthenticationEvent {}

class InitialAuthEvent extends AuthenticationEvent {}

class AuthenticationUserChanged extends AuthenticationEvent {
  final CognitoUser user;
  final CognitoUserAttribute? stores;
  final List<CognitoUserAttribute> attributes;

  AuthenticationUserChanged(this.user, this.stores, this.attributes);
}

class VerifyUserOtpStep extends AuthenticationEvent{
  final Map<String, dynamic> parameterMap;

  VerifyUserOtpStep(this.parameterMap);
}

class VerifyUserDeviceStep extends AuthenticationEvent {
  final Map<String, dynamic> parameterMap;

  VerifyUserDeviceStep(this.parameterMap);
}

class LogOutUserEvent extends AuthenticationEvent{}

// class ChooseBusinessEvent extends AuthenticationEvent {
//   final UserBusiness business;
//   ChooseBusinessEvent(this.business);
// }

class RefreshBusinessEvent extends AuthenticationEvent {}

class ChangeBusinessAccount extends AuthenticationEvent {
  final String rtlLocId;
  ChangeBusinessAccount(this.rtlLocId);
}