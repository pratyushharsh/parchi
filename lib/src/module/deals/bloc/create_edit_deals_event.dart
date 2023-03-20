part of 'create_edit_deals_bloc.dart';

class CreateEditDealsEvent {}

class FetchAllDeals extends CreateEditDealsEvent {}

class SelectDealEntityEvent extends CreateEditDealsEvent {
  final DealsEntity dealEntity;

  SelectDealEntityEvent(this.dealEntity);
}

class CreateNewDealEntityEvent extends CreateEditDealsEvent {}