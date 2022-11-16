part of 'load_item_bulk_bloc.dart';

@immutable
abstract class LoadItemBulkEvent {}

class ProcessFile extends LoadItemBulkEvent {
   final String path;

  ProcessFile(this.path);
}