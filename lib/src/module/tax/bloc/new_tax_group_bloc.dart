import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../../entity/pos/tax_group_entity.dart';
import '../../../repositories/tax_repository.dart';

part 'new_tax_group_event.dart';
part 'new_tax_group_state.dart';

class NewTaxGroupBloc extends Bloc<NewTaxGroupEvent, NewTaxGroupState> {

  final TaxRepository taxRepository;

  NewTaxGroupBloc({ required this.taxRepository }) : super(const NewTaxGroupState()) {
    on<CreateNewTaxGroup>(_createNewTaxGroupEvent);
    on<OnGroupDescriptionChange>(_onGroupDescriptionChangeEvent);
    on<OnGroupIdChange>(_onGroupIdChangeEvent);
    on<OnGroupNameChange>(_onGroupNameChangeEvent);
  }

  void _createNewTaxGroupEvent(CreateNewTaxGroup event, Emitter<NewTaxGroupState> emit) async {
    emit(state.copyWith(status: NewTaxGroupStatus.loading));
    try {
      TaxGroupEntity taxGroup = TaxGroupEntity(
        groupId: state.groupId,
        name: state.name,
        description: state.description,
        createTime: DateTime.now(),
      );
      await taxRepository.createNewTaxGroup(taxGroup);
      emit(state.copyWith(status: NewTaxGroupStatus.success,));
    } catch (e) {
      emit(state.copyWith(status: NewTaxGroupStatus.error));
    }
  }

  void _onGroupDescriptionChangeEvent(OnGroupDescriptionChange event, Emitter<NewTaxGroupState> emit) async {
    emit(state.copyWith(description: event.description));
  }

  void _onGroupIdChangeEvent(OnGroupIdChange event, Emitter<NewTaxGroupState> emit) async {
    emit(state.copyWith(groupId: event.groupId));
  }

  void _onGroupNameChangeEvent(OnGroupNameChange event, Emitter<NewTaxGroupState> emit) async {
    emit(state.copyWith(name: event.name));
  }
}
