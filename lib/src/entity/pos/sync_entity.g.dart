// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sync_entity.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters

extension GetSyncEntityCollection on Isar {
  IsarCollection<SyncEntity> get syncEntitys => this.collection();
}

const SyncEntitySchema = CollectionSchema(
  name: r'SyncEntity',
  id: -7629794802682014300,
  properties: {
    r'lastSyncAt': PropertySchema(
      id: 0,
      name: r'lastSyncAt',
      type: IsarType.dateTime,
    ),
    r'status': PropertySchema(
      id: 1,
      name: r'status',
      type: IsarType.long,
    ),
    r'syncEndTime': PropertySchema(
      id: 2,
      name: r'syncEndTime',
      type: IsarType.dateTime,
    ),
    r'syncStartTime': PropertySchema(
      id: 3,
      name: r'syncStartTime',
      type: IsarType.dateTime,
    ),
    r'type': PropertySchema(
      id: 4,
      name: r'type',
      type: IsarType.string,
    )
  },
  estimateSize: _syncEntityEstimateSize,
  serialize: _syncEntitySerialize,
  deserialize: _syncEntityDeserialize,
  deserializeProp: _syncEntityDeserializeProp,
  idName: r'id',
  indexes: {
    r'type': IndexSchema(
      id: 5117122708147080838,
      name: r'type',
      unique: true,
      replace: true,
      properties: [
        IndexPropertySchema(
          name: r'type',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _syncEntityGetId,
  getLinks: _syncEntityGetLinks,
  attach: _syncEntityAttach,
  version: '3.0.5',
);

int _syncEntityEstimateSize(
  SyncEntity object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.type.length * 3;
  return bytesCount;
}

void _syncEntitySerialize(
  SyncEntity object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDateTime(offsets[0], object.lastSyncAt);
  writer.writeLong(offsets[1], object.status);
  writer.writeDateTime(offsets[2], object.syncEndTime);
  writer.writeDateTime(offsets[3], object.syncStartTime);
  writer.writeString(offsets[4], object.type);
}

SyncEntity _syncEntityDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = SyncEntity(
    id: id,
    lastSyncAt: reader.readDateTimeOrNull(offsets[0]),
    status: reader.readLong(offsets[1]),
    syncEndTime: reader.readDateTimeOrNull(offsets[2]),
    syncStartTime: reader.readDateTimeOrNull(offsets[3]),
    type: reader.readString(offsets[4]),
  );
  return object;
}

P _syncEntityDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 1:
      return (reader.readLong(offset)) as P;
    case 2:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 3:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 4:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _syncEntityGetId(SyncEntity object) {
  return object.id ?? Isar.autoIncrement;
}

List<IsarLinkBase<dynamic>> _syncEntityGetLinks(SyncEntity object) {
  return [];
}

void _syncEntityAttach(IsarCollection<dynamic> col, Id id, SyncEntity object) {}

extension SyncEntityByIndex on IsarCollection<SyncEntity> {
  Future<SyncEntity?> getByType(String type) {
    return getByIndex(r'type', [type]);
  }

  SyncEntity? getByTypeSync(String type) {
    return getByIndexSync(r'type', [type]);
  }

  Future<bool> deleteByType(String type) {
    return deleteByIndex(r'type', [type]);
  }

  bool deleteByTypeSync(String type) {
    return deleteByIndexSync(r'type', [type]);
  }

  Future<List<SyncEntity?>> getAllByType(List<String> typeValues) {
    final values = typeValues.map((e) => [e]).toList();
    return getAllByIndex(r'type', values);
  }

  List<SyncEntity?> getAllByTypeSync(List<String> typeValues) {
    final values = typeValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'type', values);
  }

  Future<int> deleteAllByType(List<String> typeValues) {
    final values = typeValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'type', values);
  }

  int deleteAllByTypeSync(List<String> typeValues) {
    final values = typeValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'type', values);
  }

  Future<Id> putByType(SyncEntity object) {
    return putByIndex(r'type', object);
  }

  Id putByTypeSync(SyncEntity object, {bool saveLinks = true}) {
    return putByIndexSync(r'type', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByType(List<SyncEntity> objects) {
    return putAllByIndex(r'type', objects);
  }

  List<Id> putAllByTypeSync(List<SyncEntity> objects, {bool saveLinks = true}) {
    return putAllByIndexSync(r'type', objects, saveLinks: saveLinks);
  }
}

extension SyncEntityQueryWhereSort
    on QueryBuilder<SyncEntity, SyncEntity, QWhere> {
  QueryBuilder<SyncEntity, SyncEntity, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension SyncEntityQueryWhere
    on QueryBuilder<SyncEntity, SyncEntity, QWhereClause> {
  QueryBuilder<SyncEntity, SyncEntity, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<SyncEntity, SyncEntity, QAfterWhereClause> idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<SyncEntity, SyncEntity, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<SyncEntity, SyncEntity, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<SyncEntity, SyncEntity, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<SyncEntity, SyncEntity, QAfterWhereClause> typeEqualTo(
      String type) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'type',
        value: [type],
      ));
    });
  }

  QueryBuilder<SyncEntity, SyncEntity, QAfterWhereClause> typeNotEqualTo(
      String type) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'type',
              lower: [],
              upper: [type],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'type',
              lower: [type],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'type',
              lower: [type],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'type',
              lower: [],
              upper: [type],
              includeUpper: false,
            ));
      }
    });
  }
}

extension SyncEntityQueryFilter
    on QueryBuilder<SyncEntity, SyncEntity, QFilterCondition> {
  QueryBuilder<SyncEntity, SyncEntity, QAfterFilterCondition> idIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<SyncEntity, SyncEntity, QAfterFilterCondition> idIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<SyncEntity, SyncEntity, QAfterFilterCondition> idEqualTo(
      Id? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<SyncEntity, SyncEntity, QAfterFilterCondition> idGreaterThan(
    Id? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<SyncEntity, SyncEntity, QAfterFilterCondition> idLessThan(
    Id? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<SyncEntity, SyncEntity, QAfterFilterCondition> idBetween(
    Id? lower,
    Id? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<SyncEntity, SyncEntity, QAfterFilterCondition>
      lastSyncAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'lastSyncAt',
      ));
    });
  }

  QueryBuilder<SyncEntity, SyncEntity, QAfterFilterCondition>
      lastSyncAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'lastSyncAt',
      ));
    });
  }

  QueryBuilder<SyncEntity, SyncEntity, QAfterFilterCondition> lastSyncAtEqualTo(
      DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lastSyncAt',
        value: value,
      ));
    });
  }

  QueryBuilder<SyncEntity, SyncEntity, QAfterFilterCondition>
      lastSyncAtGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'lastSyncAt',
        value: value,
      ));
    });
  }

  QueryBuilder<SyncEntity, SyncEntity, QAfterFilterCondition>
      lastSyncAtLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'lastSyncAt',
        value: value,
      ));
    });
  }

  QueryBuilder<SyncEntity, SyncEntity, QAfterFilterCondition> lastSyncAtBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'lastSyncAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<SyncEntity, SyncEntity, QAfterFilterCondition> statusEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'status',
        value: value,
      ));
    });
  }

  QueryBuilder<SyncEntity, SyncEntity, QAfterFilterCondition> statusGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'status',
        value: value,
      ));
    });
  }

  QueryBuilder<SyncEntity, SyncEntity, QAfterFilterCondition> statusLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'status',
        value: value,
      ));
    });
  }

  QueryBuilder<SyncEntity, SyncEntity, QAfterFilterCondition> statusBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'status',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<SyncEntity, SyncEntity, QAfterFilterCondition>
      syncEndTimeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'syncEndTime',
      ));
    });
  }

  QueryBuilder<SyncEntity, SyncEntity, QAfterFilterCondition>
      syncEndTimeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'syncEndTime',
      ));
    });
  }

  QueryBuilder<SyncEntity, SyncEntity, QAfterFilterCondition>
      syncEndTimeEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'syncEndTime',
        value: value,
      ));
    });
  }

  QueryBuilder<SyncEntity, SyncEntity, QAfterFilterCondition>
      syncEndTimeGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'syncEndTime',
        value: value,
      ));
    });
  }

  QueryBuilder<SyncEntity, SyncEntity, QAfterFilterCondition>
      syncEndTimeLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'syncEndTime',
        value: value,
      ));
    });
  }

  QueryBuilder<SyncEntity, SyncEntity, QAfterFilterCondition>
      syncEndTimeBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'syncEndTime',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<SyncEntity, SyncEntity, QAfterFilterCondition>
      syncStartTimeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'syncStartTime',
      ));
    });
  }

  QueryBuilder<SyncEntity, SyncEntity, QAfterFilterCondition>
      syncStartTimeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'syncStartTime',
      ));
    });
  }

  QueryBuilder<SyncEntity, SyncEntity, QAfterFilterCondition>
      syncStartTimeEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'syncStartTime',
        value: value,
      ));
    });
  }

  QueryBuilder<SyncEntity, SyncEntity, QAfterFilterCondition>
      syncStartTimeGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'syncStartTime',
        value: value,
      ));
    });
  }

  QueryBuilder<SyncEntity, SyncEntity, QAfterFilterCondition>
      syncStartTimeLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'syncStartTime',
        value: value,
      ));
    });
  }

  QueryBuilder<SyncEntity, SyncEntity, QAfterFilterCondition>
      syncStartTimeBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'syncStartTime',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<SyncEntity, SyncEntity, QAfterFilterCondition> typeEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'type',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SyncEntity, SyncEntity, QAfterFilterCondition> typeGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'type',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SyncEntity, SyncEntity, QAfterFilterCondition> typeLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'type',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SyncEntity, SyncEntity, QAfterFilterCondition> typeBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'type',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SyncEntity, SyncEntity, QAfterFilterCondition> typeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'type',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SyncEntity, SyncEntity, QAfterFilterCondition> typeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'type',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SyncEntity, SyncEntity, QAfterFilterCondition> typeContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'type',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SyncEntity, SyncEntity, QAfterFilterCondition> typeMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'type',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SyncEntity, SyncEntity, QAfterFilterCondition> typeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'type',
        value: '',
      ));
    });
  }

  QueryBuilder<SyncEntity, SyncEntity, QAfterFilterCondition> typeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'type',
        value: '',
      ));
    });
  }
}

extension SyncEntityQueryObject
    on QueryBuilder<SyncEntity, SyncEntity, QFilterCondition> {}

extension SyncEntityQueryLinks
    on QueryBuilder<SyncEntity, SyncEntity, QFilterCondition> {}

extension SyncEntityQuerySortBy
    on QueryBuilder<SyncEntity, SyncEntity, QSortBy> {
  QueryBuilder<SyncEntity, SyncEntity, QAfterSortBy> sortByLastSyncAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastSyncAt', Sort.asc);
    });
  }

  QueryBuilder<SyncEntity, SyncEntity, QAfterSortBy> sortByLastSyncAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastSyncAt', Sort.desc);
    });
  }

  QueryBuilder<SyncEntity, SyncEntity, QAfterSortBy> sortByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<SyncEntity, SyncEntity, QAfterSortBy> sortByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<SyncEntity, SyncEntity, QAfterSortBy> sortBySyncEndTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncEndTime', Sort.asc);
    });
  }

  QueryBuilder<SyncEntity, SyncEntity, QAfterSortBy> sortBySyncEndTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncEndTime', Sort.desc);
    });
  }

  QueryBuilder<SyncEntity, SyncEntity, QAfterSortBy> sortBySyncStartTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncStartTime', Sort.asc);
    });
  }

  QueryBuilder<SyncEntity, SyncEntity, QAfterSortBy> sortBySyncStartTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncStartTime', Sort.desc);
    });
  }

  QueryBuilder<SyncEntity, SyncEntity, QAfterSortBy> sortByType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.asc);
    });
  }

  QueryBuilder<SyncEntity, SyncEntity, QAfterSortBy> sortByTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.desc);
    });
  }
}

extension SyncEntityQuerySortThenBy
    on QueryBuilder<SyncEntity, SyncEntity, QSortThenBy> {
  QueryBuilder<SyncEntity, SyncEntity, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<SyncEntity, SyncEntity, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<SyncEntity, SyncEntity, QAfterSortBy> thenByLastSyncAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastSyncAt', Sort.asc);
    });
  }

  QueryBuilder<SyncEntity, SyncEntity, QAfterSortBy> thenByLastSyncAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastSyncAt', Sort.desc);
    });
  }

  QueryBuilder<SyncEntity, SyncEntity, QAfterSortBy> thenByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<SyncEntity, SyncEntity, QAfterSortBy> thenByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<SyncEntity, SyncEntity, QAfterSortBy> thenBySyncEndTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncEndTime', Sort.asc);
    });
  }

  QueryBuilder<SyncEntity, SyncEntity, QAfterSortBy> thenBySyncEndTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncEndTime', Sort.desc);
    });
  }

  QueryBuilder<SyncEntity, SyncEntity, QAfterSortBy> thenBySyncStartTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncStartTime', Sort.asc);
    });
  }

  QueryBuilder<SyncEntity, SyncEntity, QAfterSortBy> thenBySyncStartTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncStartTime', Sort.desc);
    });
  }

  QueryBuilder<SyncEntity, SyncEntity, QAfterSortBy> thenByType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.asc);
    });
  }

  QueryBuilder<SyncEntity, SyncEntity, QAfterSortBy> thenByTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.desc);
    });
  }
}

extension SyncEntityQueryWhereDistinct
    on QueryBuilder<SyncEntity, SyncEntity, QDistinct> {
  QueryBuilder<SyncEntity, SyncEntity, QDistinct> distinctByLastSyncAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lastSyncAt');
    });
  }

  QueryBuilder<SyncEntity, SyncEntity, QDistinct> distinctByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'status');
    });
  }

  QueryBuilder<SyncEntity, SyncEntity, QDistinct> distinctBySyncEndTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'syncEndTime');
    });
  }

  QueryBuilder<SyncEntity, SyncEntity, QDistinct> distinctBySyncStartTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'syncStartTime');
    });
  }

  QueryBuilder<SyncEntity, SyncEntity, QDistinct> distinctByType(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'type', caseSensitive: caseSensitive);
    });
  }
}

extension SyncEntityQueryProperty
    on QueryBuilder<SyncEntity, SyncEntity, QQueryProperty> {
  QueryBuilder<SyncEntity, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<SyncEntity, DateTime?, QQueryOperations> lastSyncAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lastSyncAt');
    });
  }

  QueryBuilder<SyncEntity, int, QQueryOperations> statusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'status');
    });
  }

  QueryBuilder<SyncEntity, DateTime?, QQueryOperations> syncEndTimeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'syncEndTime');
    });
  }

  QueryBuilder<SyncEntity, DateTime?, QQueryOperations>
      syncStartTimeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'syncStartTime');
    });
  }

  QueryBuilder<SyncEntity, String, QQueryOperations> typeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'type');
    });
  }
}
