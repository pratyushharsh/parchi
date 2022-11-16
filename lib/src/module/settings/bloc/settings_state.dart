part of 'settings_bloc.dart';

enum SettingsStatus {
  initial,
  loadingBusiness,
  loadingBusinessFailure,
  loadingBusinessSuccess,
  success,
  failure
}

class SettingsState {
  final List<UserBusiness> business;
  final SettingsStatus status;
  final String? error;

  const SettingsState({
    this.business = const [],
    this.status = SettingsStatus.initial,
    this.error
  });

  SettingsState copyWith({
    List<UserBusiness>? business,
    SettingsStatus? status,
    String? error
  }) {
    return SettingsState(
      business: business ?? this.business,
      status: status ?? this.status,
      error: error ?? this.error
    );
  }
}
