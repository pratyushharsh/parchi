import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../entity/pos/deals_entity.dart';
import '../../../repositories/deal_repository.dart';

part 'create_edit_deals_event.dart';
part 'create_edit_deals_state.dart';

class CreateEditDealsBloc extends Bloc<CreateEditDealsEvent, CreateEditDealsState> {

  final DealsRepository dealsRepository;

  CreateEditDealsBloc({
    required this.dealsRepository
}) : super(const CreateEditDealsState()) {
    on<FetchAllDeals>(_fetchAllDealsEvent);
    on<SelectDealEntityEvent>(_selectDealEntityEvent);
    on<CreateNewDealEntityEvent>(_createNewDealEntityEvent);
  }

  void _fetchAllDealsEvent(FetchAllDeals event, Emitter<CreateEditDealsState> emit) async {
    emit(state.copyWith(status: CreateEditDealsStatus.loadingNewDeals));
    try {
      List<DealsEntity> deals = await dealsRepository.getAllDeals();
      emit(state.copyWith(status: CreateEditDealsStatus.success, deals: deals));
    } catch (e) {
      emit(state.copyWith(status: CreateEditDealsStatus.error));
    }
  }

  void _selectDealEntityEvent(SelectDealEntityEvent event, Emitter<CreateEditDealsState> emit) async {
    emit(state.copyWith(status: CreateEditDealsStatus.success, selectedDeal: event.dealEntity, newDeal: false));
  }

  void _createNewDealEntityEvent(CreateNewDealEntityEvent event, Emitter<CreateEditDealsState> emit) async {
    emit(state.copyWith(status: CreateEditDealsStatus.success, newDeal: true));
  }
}
