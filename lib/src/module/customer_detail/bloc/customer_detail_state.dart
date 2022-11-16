part of 'customer_detail_bloc.dart';

enum CustomerPurchaseHistoryStatus {
  initial,
  loading,
  success,
  failure,
  next,
  end
}

class CustomerDetailState extends Equatable {
  final List<TransactionHeaderEntity> purchaseHistory;
  final CustomerPurchaseHistoryStatus purchaseHistoryStatus;
  final ContactEntity? customer;

  const CustomerDetailState(
      {this.purchaseHistory = const [],
      this.customer,
      this.purchaseHistoryStatus = CustomerPurchaseHistoryStatus.initial});

  @override
  List<Object?> get props => [purchaseHistory, purchaseHistoryStatus, customer];

  CustomerDetailState copyWith({
    List<TransactionHeaderEntity>? purchaseHistory,
    CustomerPurchaseHistoryStatus? purchaseHistoryStatus,
  }) {
    return CustomerDetailState(
      purchaseHistory: purchaseHistory ?? this.purchaseHistory,
      purchaseHistoryStatus:
          purchaseHistoryStatus ?? this.purchaseHistoryStatus,
    );
  }
}
