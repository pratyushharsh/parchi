import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../config/sequence_config.dart';
import '../../../entity/pos/entity.dart';
import '../../../repositories/repository.dart';

part 'create_edit_sequence_event.dart';
part 'create_edit_sequence_state.dart';

class CreateEditSequenceBloc
    extends Bloc<CreateEditSequenceEvent, CreateEditSequenceState>
    with SequenceConfig {
  final SequenceRepository sequenceRepository;

  CreateEditSequenceBloc({required this.sequenceRepository})
      : super(CreateEditSequenceState()) {
    on<FetchAllSequence>(_onFetchAllSequenceEvent);
    on<SelectSequenceEntityEvent>(_onSelectSequenceEntityEvent);
    on<OnPatternChangeEvent>(_onPatternChangeEvent);
    on<SaveSequenceConfigEvent>(_onSaveSequenceConfigEvent);
  }

  void _onFetchAllSequenceEvent(
      FetchAllSequence event, Emitter<CreateEditSequenceState> emit) async {
    var data = await sequenceRepository.getAllSequences();
    emit(state.copyWith(sequences: data));
  }

  void _onSelectSequenceEntityEvent(SelectSequenceEntityEvent event,
      Emitter<CreateEditSequenceState> emit) async {

    String sampleSequence = generateSequence(event.sequenceEntity);

    emit(state.copyWith(selectedSequence: event.sequenceEntity, sampleSequence: sampleSequence, status: CreateEditSequenceStatus.init));
  }

  void _onPatternChangeEvent(OnPatternChangeEvent event,
      Emitter<CreateEditSequenceState> emit) async {

    state.selectedSequence!.pattern = event.pattern;

    String sampleSequence = generateSequence(state.selectedSequence!);

    emit(state.copyWith(selectedSequence: state.selectedSequence, sampleSequence: sampleSequence, status: CreateEditSequenceStatus.modified));
  }

  void _onSaveSequenceConfigEvent(SaveSequenceConfigEvent event,
      Emitter<CreateEditSequenceState> emit) async {
    emit(state.copyWith(status: CreateEditSequenceStatus.saving));
    await sequenceRepository.saveSequence(event.sequenceEntity);
    emit(state.copyWith(selectedSequence: event.sequenceEntity, status: CreateEditSequenceStatus.saved));
  }
}
