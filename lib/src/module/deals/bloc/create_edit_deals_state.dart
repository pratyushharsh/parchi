part of 'create_edit_deals_bloc.dart';

enum CreateEditDealsStatus {
  initial,
  loadingDeals,
  dealsLoadingFailed,
  success,
  loadingNewDeals,
  error,
  fetchingDeals,
  fetchingDealsFailed,
  fetchingDealsSuccess,
}

class CreateEditDealsState {
  final DealsEntity? selectedDeal;
  final List<DealsEntity> deals;
  final CreateEditDealsStatus status;
  final bool newDeal;

  const CreateEditDealsState({
    this.deals = const [],
    this.status = CreateEditDealsStatus.initial,
    this.selectedDeal,
    this.newDeal = false,
  });

  CreateEditDealsState copyWith({
    List<DealsEntity>? deals,
    CreateEditDealsStatus? status,
    DealsEntity? selectedDeal,
    bool? newDeal,
  }) {
    return CreateEditDealsState(
      deals: deals ?? this.deals,
      status: status ?? this.status,
      selectedDeal: selectedDeal ?? this.selectedDeal,
      newDeal: newDeal ?? this.newDeal,
    );
  }
}