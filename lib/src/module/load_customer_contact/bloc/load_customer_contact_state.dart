part of 'load_customer_contact_bloc.dart';

enum LoadCustomerContactStatus { initial, loading, success, failure, permissionDenied }

class LoadCustomerContactState {
  final LoadCustomerContactStatus status;

  LoadCustomerContactState({this.status = LoadCustomerContactStatus.initial});

  LoadCustomerContactState copyWith({LoadCustomerContactStatus? status}) {
    return LoadCustomerContactState(status: status ?? this.status);
  }
}
