part of 'bulk_import_bloc.dart';

abstract class BulkImportEvent {}

class BulkTaxImportEventImport extends BulkImportEvent {
  final String filePath;

  BulkTaxImportEventImport({
    required this.filePath,
  });
}