part of 'create_edit_sequence_bloc.dart';

enum CreateEditSequenceStatus {init, modified, loading, error, done, saving, saved}

class CreateEditSequenceState {
  final SequenceEntity? selectedSequence;
  final List<SequenceEntity> sequences;
  final String sampleSequence;
  final String? error;
  final CreateEditSequenceStatus status;

  CreateEditSequenceState({
    this.sequences = const [],
    this.selectedSequence,
    this.sampleSequence = '',
    this.error,
    this.status = CreateEditSequenceStatus.init,
  });

  CreateEditSequenceState copyWith({
    List<SequenceEntity>? sequences,
    SequenceEntity? selectedSequence,
    String? sampleSequence,
    String? error,
    CreateEditSequenceStatus? status,
  }) {
    return CreateEditSequenceState(
      sequences: sequences ?? this.sequences,
      selectedSequence: selectedSequence ?? this.selectedSequence,
      sampleSequence: sampleSequence ?? this.sampleSequence,
      error: error ?? this.error,
      status: status ?? this.status,
    );
  }
}
