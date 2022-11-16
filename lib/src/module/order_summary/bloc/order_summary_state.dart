part of 'order_summary_bloc.dart';

enum OrderSummaryStatus { initial, loading, success, failure }

class OrderSummaryState {
  final TransactionHeaderEntity? order;
  final OrderSummaryStatus status;
  final Map<String, ProductEntity> productMap;

  const OrderSummaryState(
      {this.order,
      this.status = OrderSummaryStatus.loading,
      this.productMap = const {}});

  OrderSummaryState copyWith({
    TransactionHeaderEntity? order,
    OrderSummaryStatus? status,
    Map<String, ProductEntity>? productMap,
  }) {
    return OrderSummaryState(
      order: order ?? this.order,
      status: status ?? this.status,
      productMap: productMap ?? this.productMap,
    );
  }
}
