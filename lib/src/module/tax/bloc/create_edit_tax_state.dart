part of 'create_edit_tax_bloc.dart';

enum CreateEditTaxStatus {
  initial,
  loadingTaxGroup,
  taxRuleDeleteLoading,
  taxGroupLoadingFailed,
  success,
  loadingNewTaxGroup,
  error,
  fetchingTaxGroup,
  fetchingTaxGroupFailed,
  fetchingTaxGroupSuccess,
}

class CreateEditTaxState {
  final TaxGroupEntity? selectedTaxGroup;
  final List<TaxGroupEntity> taxGroups;
  final CreateEditTaxStatus status;

  const CreateEditTaxState({
    this.taxGroups = const [],
    this.status = CreateEditTaxStatus.initial,
    this.selectedTaxGroup
  });

  CreateEditTaxState copyWith({
    List<TaxGroupEntity>? taxGroups,
    CreateEditTaxStatus? status,
    TaxGroupEntity? selectedTaxGroup,
  }) {
    return CreateEditTaxState(
      taxGroups: taxGroups ?? this.taxGroups,
      status: status ?? this.status,
      selectedTaxGroup: selectedTaxGroup ?? this.selectedTaxGroup,
    );
  }

  @override
  String toString() {
    return 'CreateEditTaxState{selectedTaxGroup: $selectedTaxGroup, taxGroups: $taxGroups, status: $status}';
  }
}
