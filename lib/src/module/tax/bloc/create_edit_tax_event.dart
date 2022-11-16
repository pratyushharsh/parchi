part of 'create_edit_tax_bloc.dart';

@immutable
abstract class CreateEditTaxEvent {}

class CreateNewTaxGroup extends CreateEditTaxEvent {
  final TaxGroupEntity taxGroup;

  CreateNewTaxGroup(this.taxGroup);
}

class FetchAllTaxGroup extends CreateEditTaxEvent {}

class FetchAllTaxGroupFromServer extends CreateEditTaxEvent {}

class SelectTaxGroup extends CreateEditTaxEvent {
  final TaxGroupEntity taxGroup;

  SelectTaxGroup(this.taxGroup);
}

class DeleteTaxRule extends CreateEditTaxEvent {
  final TaxRuleEntity taxRule;

  DeleteTaxRule({required this.taxRule});
}