part of 'new_tax_group_bloc.dart';

enum NewTaxGroupStatus {
  initial,
  inProgress,
  loading,
  success,
  error,
}

class NewTaxGroupState extends Equatable {
  final String groupId;
  final String name;
  final String description;
  final String? error;
  final NewTaxGroupStatus status;

  const NewTaxGroupState({
    this.groupId = '',
    this.name = '',
    this.description = '',
    this.error,
    this.status = NewTaxGroupStatus.initial,
  });

  bool get isValid {
    return groupId.isNotEmpty && name.isNotEmpty && description.isNotEmpty;
  }

  NewTaxGroupState copyWith({
    String? groupId,
    String? name,
    String? description,
    String? error,
    NewTaxGroupStatus? status,
  }) {
    return NewTaxGroupState(
      groupId: groupId ?? this.groupId,
      name: name ?? this.name,
      description: description ?? this.description,
      error: error ?? this.error,
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props => [
        groupId,
        name,
        description,
        error,
        status,
      ];
}
