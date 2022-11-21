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
      var seq = await db.sequenceEntitys.getByName(type);
      if (seq != null) {
        seq.nextSeq++;
        seq.lastSeqCreatedAt = DateTime.now();
        await db.sequenceEntitys.put(seq);
      } else {
        await db.sequenceEntitys.put(SequenceEntity(name: type, nextSeq: 1, pattern: '{counter}', createAt: DateTime.now())..lastSeqCreatedAt = DateTime.now());
      }
    });
    // Use the pattern to generate the sequence
    var seq = await db.sequenceEntitys.getByName(type);
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
    List<SequenceType> types = SequenceType.values;
    List<SequenceEntity> sequences = [];
    await db.writeTxn(() async {
      var allSeq = await db.sequenceEntitys.where().findAll();
      for (var type in types) {
        bool exist = false;
        for (var seq in allSeq) {
          if (seq.name.value == type.value) {
            sequences.add(seq);
            exist = true;
            break;
          }
        }
        if (!exist) {
          var tmp = SequenceEntity(name: type, nextSeq: 1, pattern: '{counter}', createAt: DateTime.now());
          await db.sequenceEntitys.putByName(tmp);
          sequences.add(tmp);
        }
      }
    });

    return sequences;
  }
}