import 'package:isar/isar.dart';

import '../../entity/pos/sequence_entity.dart';
import 'background_sync.dart';

class BackgroundSequenceSync extends BackgroundEntitySync {
  @override
  Future<List<Map<String, dynamic>>> exportData() async {
    var sequences = await db.sequenceEntitys.where().exportJson();
    for (var sequence in sequences) {
      if (sequence['syncState'] != null && sequence['syncState'] < 500) {
        return sequences;
      }
    }
    return List.empty();
  }

  @override
  Future<void> importData(List data, int lastSyncAt) async {
    List<Map<String, dynamic>> sequences = [];
    for (var sequence in data) {
      var tmp = Map<String, dynamic>.from(sequence);
      tmp['syncState'] = 1000;
      sequences.add(tmp);
    }

    await db.writeTxn(() async {
      if (sequences.isNotEmpty) {
        await db.sequenceEntitys.importJson(sequences);
      }
      await updateSyncEntityTimestamp(lastSyncAt);
    });
  }

  @override
  String get type => sequenceSync;
}