part of 'new_tax_group_bloc.dart';

@immutable
abstract class NewTaxGroupEvent {}

class CreateNewTaxGroup extends NewTaxGroupEvent {}

class OnGroupIdChange extends NewTaxGroupEvent {
  final String groupId;

  OnGroupIdChange(this.groupId);
}

class OnGroupDescriptionChange extends NewTaxGroupEvent {
  final String description;

  OnGroupDescriptionChange(this.description);
}

class OnGroupNameChange extends NewTaxGroupEvent {
  final String name;

  OnGroupNameChange(this.name);
}