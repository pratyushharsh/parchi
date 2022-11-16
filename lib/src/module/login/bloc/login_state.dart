part of 'login_bloc.dart';

enum LoginStatus {
  initial,
  loadingLogin,
  initiateOtpVerification,
  verifyOtp,
  verifyOtpLoading,
  verifyOtpFailure,
  verifyDevice,
  verifyDeviceLoading,
  chooseBusiness,
  chooseBusinessLoading,
  success,
  failure
}

class LoginState {
  final LoginStatus status;
  final CognitoUser? user;
  final int retryCount;
  final String error;
  final List<dynamic> deviceList;
  final String? deviceKey;
  // final List<dynamic> businessList;

  LoginState(
      {this.status = LoginStatus.initial,
      this.user,
      this.retryCount = 0,
      this.deviceList = const [],
      this.error = '', this.deviceKey});

  LoginState copyWith(
      {LoginStatus? status,
      CognitoUser? user,
      int? retryCount,
      List<dynamic>? deviceList,
      String? error,
      String? deviceKey}) {
    return LoginState(
        status: status ?? this.status,
        user: user ?? this.user,
        deviceList: deviceList ?? this.deviceList,
        retryCount: retryCount ?? this.retryCount,
        error: error ?? this.error,
        deviceKey: deviceKey ?? this.deviceKey);
  }

  @override
  String toString() {
    return 'LoginState{status: $status, user: $user, retryCount: $retryCount, error: $error, deviceList: $deviceList, deviceKey: $deviceKey}';
  }
}
