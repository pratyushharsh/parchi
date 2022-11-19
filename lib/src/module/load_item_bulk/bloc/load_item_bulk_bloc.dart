import 'dart:convert';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:csv/csv.dart';
import 'package:isar/isar.dart';
import 'package:logging/logging.dart';
import 'package:meta/meta.dart';

import '../../../database/db_provider.dart';
import '../../../entity/pos/entity.dart';
import '../../../repositories/repository.dart';
import '../../authentication/bloc/authentication_bloc.dart';


part 'load_item_bulk_event.dart';
part 'load_item_bulk_state.dart';

class LoadItemBulkBloc extends Bloc<LoadItemBulkEvent, LoadItemBulkState> with DatabaseProvider {
  final log = Logger('LoadItemBulkBloc');
  final AuthenticationBloc auth;
  final SequenceRepository sequenceRepository;
  LoadItemBulkBloc(
      {required this.sequenceRepository, required this.auth})
      : super(LoadItemBulkState()) {
    on<ProcessFile>(_onLoadFile);
  }

  void _onLoadFile(ProcessFile event, Emitter<LoadItemBulkState> emit) async {
    try {
      if (auth.state.store == null) return;
      emit(state.copyWith(status: LoadItemBulkStatus.loading));
      final input = File(event.path).openRead();
      final fields = await input
          .transform(utf8.decoder)
          .transform(
              const CsvToListConverter(shouldParseNumbers: false, eol: '\n'))
          .toList();

      log.info("Total Records to process: ${fields.length}");

      var resp = await db.writeTxn(() async {
        for (var i = 1; i < fields.length; i++) {
          var e = fields[i];

          var productId = e[0].toString();

          var entity = ProductEntity(
            productId: productId,
            category: [e[1].toString(), ...e[2].toString().split(",").map((e) => e).toList()],
            displayName: e[3].toString(),
            description: e[4].toString(),
            listPrice: e[5].toString().isNotEmpty
                ? double.parse(e[5].toString())
                : 9999999.00,
            salePrice: e[6].toString().isNotEmpty
                ? double.parse(e[6].toString())
                : 9999999.00,
            uom: e[7].toString(),
            brand: e[8],
            skuCode: e[9].toString(),
            hsn: e[11],
            taxGroupId: e[11],
            imageUrl: e[12].toString().isNotEmpty
                ? e[12]
                    .toString()
                    .split(",")
                    .where((element) => element.isNotEmpty)
                    .map((e) {
                    if (e.startsWith("http") || e.startsWith("https")) {
                      return e;
                    } else {
                      return 'file:/$e';
                    }
                  }).toList()
                : [],
            enable: true,
            createTime: DateTime.now(),
          );
          await db.productEntitys.put(entity);
        }
      });
      log.info(resp);

      emit(state.copyWith(status: LoadItemBulkStatus.success));
    } catch (e) {
      log.severe(e);
      emit(state.copyWith(status: LoadItemBulkStatus.failure));
    }
  }
}
