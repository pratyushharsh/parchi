part of 'authentication_bloc.dart';

enum AuthenticationStatus {
  authenticated,
  unauthenticated,
  verifyUser,
  verifyUserDevice,
  chooseBusiness,
  chooseBusinessLoading,
  chooseBusinessSuccess,
  unknown,
  newUser
}

class AuthenticationState extends Equatable {
  final AuthenticationStatus status;
  final CognitoUser? user;
  final EmployeeEntity? employee;
  final RetailLocationEntity? store;
  final List<UserBusiness> userBusinesses;
  final int? rtlLocId;

  const AuthenticationState._(
      {required this.status, this.user, this.employee, this.store, this.userBusinesses = const [], this.rtlLocId})
      : assert(status == AuthenticationStatus.authenticated
            ? (store != null)
            : true);

  const AuthenticationState.unauthenticated()
      : this._(
          status: AuthenticationStatus.unauthenticated,
        );

  const AuthenticationState.unknown()
      : this._(
    status: AuthenticationStatus.unknown,
  );

  const AuthenticationState.newUser(CognitoUser user, {EmployeeEntity? employee})
      : this._(status: AuthenticationStatus.newUser, user: user, employee: employee);

  const AuthenticationState.authenticated(
      CognitoUser user, RetailLocationEntity store, EmployeeEntity employee)
      : this._(
            status: AuthenticationStatus.authenticated,
            store: store,
            employee: employee,
            user: user);

  const AuthenticationState.verifyUser()
      : this._(
          status: AuthenticationStatus.verifyUser,
        );

  const AuthenticationState.chooseBusiness(List<UserBusiness> business)
      : this._(
    status: AuthenticationStatus.chooseBusiness,
    userBusinesses: business,
  );

  const AuthenticationState.verifyUserDevice()
      : this._(
    status: AuthenticationStatus.verifyUserDevice,
  );

  AuthenticationState copyWith(
      {AuthenticationStatus? status,
      CognitoUser? user,
      EmployeeEntity? employee,
      RetailLocationEntity? store,
      List<UserBusiness>? userBusinesses,
      int? rtlLocId}) {
    return AuthenticationState._(
        status: status ?? this.status,
        user: user ?? this.user,
        employee: employee ?? this.employee,
        store: store ?? this.store,
        userBusinesses: userBusinesses ?? this.userBusinesses,
        rtlLocId: rtlLocId ?? this.rtlLocId);
  }

  @override
  List<Object?> get props => [status, user, store, userBusinesses];
}
