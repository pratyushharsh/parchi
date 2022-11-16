import 'package:isar/isar.dart';
import 'package:logging/logging.dart';

import '../database/db_provider.dart';
import '../entity/pos/entity.dart';
import '../util/helper/rest_api.dart';

class SequenceRepository with DatabaseProvider {
  final log = Logger('BusinessRepository');

  final RestApiClient restClient;

  SequenceRepository({required this.restClient});

  Future<SequenceEntity> getNextSequence(SequenceType type) async {
    await db.writeTxn(() async {
      var seq = await db.sequenceEntitys.get(type.index);
      if (seq != null) {
        seq.nextSeq++;
        await db.sequenceEntitys.put(seq);
      } else {
        await db.sequenceEntitys.put(SequenceEntity(name: type, nextSeq: 1, pattern: '', createAt: DateTime.now()));
      }
    });
    // Use the pattern to generate the sequence
    var seq = await db.sequenceEntitys.get(type.index);
    return seq!;
  }

  Future<void> saveSequence(SequenceEntity sequenceEntity) async {
    await db.writeTxn(() async {
      sequenceEntity.lastChangedAt = DateTime.now();
      sequenceEntity.syncState = 200;
      await db.sequenceEntitys.put(sequenceEntity);
    });
  }

  Future<List<SequenceEntity>> getAllSequences() async {
    return await db.sequenceEntitys.where().findAll();
  }
}