part of 'create_edit_sequence_bloc.dart';

@immutable
abstract class CreateEditSequenceEvent {}

class FetchAllSequence extends CreateEditSequenceEvent {}

class SelectSequenceEntityEvent extends CreateEditSequenceEvent {
  final SequenceEntity sequenceEntity;

  SelectSequenceEntityEvent(this.sequenceEntity);
}

class OnPatternChangeEvent extends CreateEditSequenceEvent {
  final String pattern;

  OnPatternChangeEvent(this.pattern);
}

class SaveSequenceConfigEvent extends CreateEditSequenceEvent {
  final SequenceEntity sequenceEntity;

  SaveSequenceConfigEvent(this.sequenceEntity);
}