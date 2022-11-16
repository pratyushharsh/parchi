import 'package:isar/isar.dart';

part 'sync_entity.g.dart';

@Collection()
class SyncEntity {
  final Id? id;

  @Index(unique: true, replace: true, name: "type")
  final String type;

  DateTime? lastSyncAt;
  int status;
  DateTime? syncStartTime;
  DateTime? syncEndTime;

  SyncEntity(
      {this.id,
      required this.type,
      this.lastSyncAt,
      required this.status,
      this.syncStartTime,
      this.syncEndTime});
}
