part of 'customer_detail_bloc.dart';

@immutable
abstract class CustomerDetailEvent {}

class LoadCustomerPurchaseList extends CustomerDetailEvent {}