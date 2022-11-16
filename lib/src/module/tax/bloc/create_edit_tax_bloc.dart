import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logging/logging.dart';
import 'package:meta/meta.dart';

import '../../../entity/pos/tax_group_entity.dart';
import '../../../entity/pos/tax_rule_entity.dart';
import '../../../repositories/tax_repository.dart';
import '../../authentication/bloc/authentication_bloc.dart';

part 'create_edit_tax_event.dart';
part 'create_edit_tax_state.dart';

class CreateEditTaxBloc extends Bloc<CreateEditTaxEvent, CreateEditTaxState> {
  final log = Logger('CreateEditTaxBloc');
  final AuthenticationBloc authenticationBloc;
  final TaxRepository taxRepository;

  CreateEditTaxBloc({ required this.authenticationBloc, required this.taxRepository }) : super(const CreateEditTaxState()) {
    on<FetchAllTaxGroup>(_fetchAllTaxGroupEvent);
    on<FetchAllTaxGroupFromServer>(_fetchAllTaxGroupFromServerEvent);
    on<SelectTaxGroup>(_selectTaxGroupEvent);
    on<DeleteTaxRule>(_deleteTaxRuleEvent);
  }

  void _fetchAllTaxGroupEvent(FetchAllTaxGroup event, Emitter<CreateEditTaxState> emit) async {
    emit(state.copyWith(status: CreateEditTaxStatus.loadingNewTaxGroup));
    try {
      List<TaxGroupEntity> taxGroups = await taxRepository.getAllTaxGroups(loadRules: true);
      // Update Selected Group
      var selectedTaxGroup = state.selectedTaxGroup;
      if (selectedTaxGroup != null) {
        for(TaxGroupEntity taxGroup in taxGroups) {
          if(taxGroup.groupId ==  selectedTaxGroup!.groupId) {
            selectedTaxGroup = taxGroup;
            break;
          }
        }
        log.info('Selected Tax Group: ${selectedTaxGroup!.taxRules}');
      }
      emit(state.copyWith(status: CreateEditTaxStatus.success, taxGroups: taxGroups, selectedTaxGroup: selectedTaxGroup));
    } catch (e) {
      log.severe(e);
      emit(state.copyWith(status: CreateEditTaxStatus.error));
    }
  }

  void _fetchAllTaxGroupFromServerEvent(FetchAllTaxGroupFromServer event, Emitter<CreateEditTaxState> emit) async {
    emit(state.copyWith(status: CreateEditTaxStatus.fetchingTaxGroup));
    try {
      await taxRepository.fetchAllTaxGroupFromServer('${authenticationBloc.state.store!.rtlLocId}');
      add(FetchAllTaxGroup());
    } catch (e) {
      log.severe(e);
      emit(state.copyWith(status: CreateEditTaxStatus.fetchingTaxGroupFailed));
    }
  }

  void _deleteTaxRuleEvent(DeleteTaxRule event, Emitter<CreateEditTaxState> emit) async {
    emit(state.copyWith(status: CreateEditTaxStatus.taxRuleDeleteLoading));
    try {
      await taxRepository.deleteTaxRule(event.taxRule);
      emit(state.copyWith(status: CreateEditTaxStatus.success));
      add(FetchAllTaxGroup());
    } catch (e) {
      log.severe(e);
      emit(state.copyWith(status: CreateEditTaxStatus.error));
    }
  }

  void _selectTaxGroupEvent(SelectTaxGroup event, Emitter<CreateEditTaxState> emit) async {
    emit(state.copyWith(selectedTaxGroup: event.taxGroup));
  }
}
