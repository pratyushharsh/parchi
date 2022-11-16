// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tax_group_entity.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters

extension GetTaxGroupEntityCollection on Isar {
  IsarCollection<TaxGroupEntity> get taxGroupEntitys => this.collection();
}

const TaxGroupEntitySchema = CollectionSchema(
  name: r'TaxGroupEntity',
  id: 5537736958724919907,
  properties: {
    r'createTime': PropertySchema(
      id: 0,
      name: r'createTime',
      type: IsarType.dateTime,
    ),
    r'description': PropertySchema(
      id: 1,
      name: r'description',
      type: IsarType.string,
    ),
    r'groupId': PropertySchema(
      id: 2,
      name: r'groupId',
      type: IsarType.string,
    ),
    r'lastChangedAt': PropertySchema(
      id: 3,
      name: r'lastChangedAt',
      type: IsarType.dateTime,
    ),
    r'lastSyncAt': PropertySchema(
      id: 4,
      name: r'lastSyncAt',
      type: IsarType.dateTime,
    ),
    r'name': PropertySchema(
      id: 5,
      name: r'name',
      type: IsarType.string,
    ),
    r'syncState': PropertySchema(
      id: 6,
      name: r'syncState',
      type: IsarType.long,
    ),
    r'taxRules': PropertySchema(
      id: 7,
      name: r'taxRules',
      type: IsarType.objectList,
      target: r'TaxRuleEntity',
    )
  },
  estimateSize: _taxGroupEntityEstimateSize,
  serialize: _taxGroupEntitySerialize,
  deserialize: _taxGroupEntityDeserialize,
  deserializeProp: _taxGroupEntityDeserializeProp,
  idName: r'id',
  indexes: {
    r'groupId': IndexSchema(
      id: -8523216633229774932,
      name: r'groupId',
      unique: true,
      replace: true,
      properties: [
        IndexPropertySchema(
          name: r'groupId',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    ),
    r'lastChangedAt': IndexSchema(
      id: -4409887940193105571,
      name: r'lastChangedAt',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'lastChangedAt',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    ),
    r'lastSyncAt': IndexSchema(
      id: -8300919554834343292,
      name: r'lastSyncAt',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'lastSyncAt',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    ),
    r'syncState': IndexSchema(
      id: -413052077849439895,
      name: r'syncState',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'syncState',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {r'TaxRuleEntity': TaxRuleEntitySchema},
  getId: _taxGroupEntityGetId,
  getLinks: _taxGroupEntityGetLinks,
  attach: _taxGroupEntityAttach,
  version: '3.0.4',
);

int _taxGroupEntityEstimateSize(
  TaxGroupEntity object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.description.length * 3;
  bytesCount += 3 + object.groupId.length * 3;
  bytesCount += 3 + object.name.length * 3;
  bytesCount += 3 + object.taxRules.length * 3;
  {
    final offsets = allOffsets[TaxRuleEntity]!;
    for (var i = 0; i < object.taxRules.length; i++) {
      final value = object.taxRules[i];
      bytesCount +=
          TaxRuleEntitySchema.estimateSize(value, offsets, allOffsets);
    }
  }
  return bytesCount;
}

void _taxGroupEntitySerialize(
  TaxGroupEntity object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDateTime(offsets[0], object.createTime);
  writer.writeString(offsets[1], object.description);
  writer.writeString(offsets[2], object.groupId);
  writer.writeDateTime(offsets[3], object.lastChangedAt);
  writer.writeDateTime(offsets[4], object.lastSyncAt);
  writer.writeString(offsets[5], object.name);
  writer.writeLong(offsets[6], object.syncState);
  writer.writeObjectList<TaxRuleEntity>(
    offsets[7],
    allOffsets,
    TaxRuleEntitySchema.serialize,
    object.taxRules,
  );
}

TaxGroupEntity _taxGroupEntityDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = TaxGroupEntity(
    createTime: reader.readDateTime(offsets[0]),
    description: reader.readString(offsets[1]),
    groupId: reader.readString(offsets[2]),
    id: id,
    lastSyncAt: reader.readDateTimeOrNull(offsets[4]),
    name: reader.readString(offsets[5]),
    syncState: reader.readLongOrNull(offsets[6]),
    taxRules: reader.readObjectList<TaxRuleEntity>(
          offsets[7],
          TaxRuleEntitySchema.deserialize,
          allOffsets,
          TaxRuleEntity(),
        ) ??
        const [],
  );
  object.lastChangedAt = reader.readDateTimeOrNull(offsets[3]);
  return object;
}

P _taxGroupEntityDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDateTime(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 4:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 5:
      return (reader.readString(offset)) as P;
    case 6:
      return (reader.readLongOrNull(offset)) as P;
    case 7:
      return (reader.readObjectList<TaxRuleEntity>(
            offset,
            TaxRuleEntitySchema.deserialize,
            allOffsets,
            TaxRuleEntity(),
          ) ??
          const []) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _taxGroupEntityGetId(TaxGroupEntity object) {
  return object.id ?? Isar.autoIncrement;
}

List<IsarLinkBase<dynamic>> _taxGroupEntityGetLinks(TaxGroupEntity object) {
  return [];
}

void _taxGroupEntityAttach(
    IsarCollection<dynamic> col, Id id, TaxGroupEntity object) {}

extension TaxGroupEntityByIndex on IsarCollection<TaxGroupEntity> {
  Future<TaxGroupEntity?> getByGroupId(String groupId) {
    return getByIndex(r'groupId', [groupId]);
  }

  TaxGroupEntity? getByGroupIdSync(String groupId) {
    return getByIndexSync(r'groupId', [groupId]);
  }

  Future<bool> deleteByGroupId(String groupId) {
    return deleteByIndex(r'groupId', [groupId]);
  }

  bool deleteByGroupIdSync(String groupId) {
    return deleteByIndexSync(r'groupId', [groupId]);
  }

  Future<List<TaxGroupEntity?>> getAllByGroupId(List<String> groupIdValues) {
    final values = groupIdValues.map((e) => [e]).toList();
    return getAllByIndex(r'groupId', values);
  }

  List<TaxGroupEntity?> getAllByGroupIdSync(List<String> groupIdValues) {
    final values = groupIdValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'groupId', values);
  }

  Future<int> deleteAllByGroupId(List<String> groupIdValues) {
    final values = groupIdValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'groupId', values);
  }

  int deleteAllByGroupIdSync(List<String> groupIdValues) {
    final values = groupIdValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'groupId', values);
  }

  Future<Id> putByGroupId(TaxGroupEntity object) {
    return putByIndex(r'groupId', object);
  }

  Id putByGroupIdSync(TaxGroupEntity object, {bool saveLinks = true}) {
    return putByIndexSync(r'groupId', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByGroupId(List<TaxGroupEntity> objects) {
    return putAllByIndex(r'groupId', objects);
  }

  List<Id> putAllByGroupIdSync(List<TaxGroupEntity> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'groupId', objects, saveLinks: saveLinks);
  }
}

extension TaxGroupEntityQueryWhereSort
    on QueryBuilder<TaxGroupEntity, TaxGroupEntity, QWhere> {
  QueryBuilder<TaxGroupEntity, TaxGroupEntity, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<TaxGroupEntity, TaxGroupEntity, QAfterWhere> anyLastChangedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'lastChangedAt'),
      );
    });
  }

  QueryBuilder<TaxGroupEntity, TaxGroupEntity, QAfterWhere> anyLastSyncAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'lastSyncAt'),
      );
    });
  }

  QueryBuilder<TaxGroupEntity, TaxGroupEntity, QAfterWhere> anySyncState() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'syncState'),
      );
    });
  }
}

extension TaxGroupEntityQueryWhere
    on QueryBuilder<TaxGroupEntity, TaxGroupEntity, QWhereClause> {
  QueryBuilder<TaxGroupEntity, TaxGroupEntity, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<TaxGroupEntity, TaxGroupEntity, QAfterWhereClause> idNotEqualTo(
      Id id) {
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

  QueryBuilder<TaxGroupEntity, TaxGroupEntity, QAfterWhereClause> idGreaterThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<TaxGroupEntity, TaxGroupEntity, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<TaxGroupEntity, TaxGroupEntity, QAfterWhereClause> idBetween(
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

  QueryBuilder<TaxGroupEntity, TaxGroupEntity, QAfterWhereClause>
      groupIdEqualTo(String groupId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'groupId',
        value: [groupId],
      ));
    });
  }

  QueryBuilder<TaxGroupEntity, TaxGroupEntity, QAfterWhereClause>
      groupIdNotEqualTo(String groupId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'groupId',
              lower: [],
              upper: [groupId],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'groupId',
              lower: [groupId],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'groupId',
              lower: [groupId],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'groupId',
              lower: [],
              upper: [groupId],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<TaxGroupEntity, TaxGroupEntity, QAfterWhereClause>
      lastChangedAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'lastChangedAt',
        value: [null],
      ));
    });
  }

  QueryBuilder<TaxGroupEntity, TaxGroupEntity, QAfterWhereClause>
      lastChangedAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'lastChangedAt',
        lower: [null],
        includeLower: false,
        upper: [],
      ));
    });
  }

  QueryBuilder<TaxGroupEntity, TaxGroupEntity, QAfterWhereClause>
      lastChangedAtEqualTo(DateTime? lastChangedAt) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'lastChangedAt',
        value: [lastChangedAt],
      ));
    });
  }

  QueryBuilder<TaxGroupEntity, TaxGroupEntity, QAfterWhereClause>
      lastChangedAtNotEqualTo(DateTime? lastChangedAt) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'lastChangedAt',
              lower: [],
              upper: [lastChangedAt],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'lastChangedAt',
              lower: [lastChangedAt],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'lastChangedAt',
              lower: [lastChangedAt],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'lastChangedAt',
              lower: [],
              upper: [lastChangedAt],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<TaxGroupEntity, TaxGroupEntity, QAfterWhereClause>
      lastChangedAtGreaterThan(
    DateTime? lastChangedAt, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'lastChangedAt',
        lower: [lastChangedAt],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<TaxGroupEntity, TaxGroupEntity, QAfterWhereClause>
      lastChangedAtLessThan(
    DateTime? lastChangedAt, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'lastChangedAt',
        lower: [],
        upper: [lastChangedAt],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<TaxGroupEntity, TaxGroupEntity, QAfterWhereClause>
      lastChangedAtBetween(
    DateTime? lowerLastChangedAt,
    DateTime? upperLastChangedAt, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'lastChangedAt',
        lower: [lowerLastChangedAt],
        includeLower: includeLower,
        upper: [upperLastChangedAt],
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<TaxGroupEntity, TaxGroupEntity, QAfterWhereClause>
      lastSyncAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'lastSyncAt',
        value: [null],
      ));
    });
  }

  QueryBuilder<TaxGroupEntity, TaxGroupEntity, QAfterWhereClause>
      lastSyncAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'lastSyncAt',
        lower: [null],
        includeLower: false,
        upper: [],
      ));
    });
  }

  QueryBuilder<TaxGroupEntity, TaxGroupEntity, QAfterWhereClause>
      lastSyncAtEqualTo(DateTime? lastSyncAt) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'lastSyncAt',
        value: [lastSyncAt],
      ));
    });
  }

  QueryBuilder<TaxGroupEntity, TaxGroupEntity, QAfterWhereClause>
      lastSyncAtNotEqualTo(DateTime? lastSyncAt) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'lastSyncAt',
              lower: [],
              upper: [lastSyncAt],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'lastSyncAt',
              lower: [lastSyncAt],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'lastSyncAt',
              lower: [lastSyncAt],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'lastSyncAt',
              lower: [],
              upper: [lastSyncAt],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<TaxGroupEntity, TaxGroupEntity, QAfterWhereClause>
      lastSyncAtGreaterThan(
    DateTime? lastSyncAt, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'lastSyncAt',
        lower: [lastSyncAt],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<TaxGroupEntity, TaxGroupEntity, QAfterWhereClause>
      lastSyncAtLessThan(
    DateTime? lastSyncAt, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'lastSyncAt',
        lower: [],
        upper: [lastSyncAt],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<TaxGroupEntity, TaxGroupEntity, QAfterWhereClause>
      lastSyncAtBetween(
    DateTime? lowerLastSyncAt,
    DateTime? upperLastSyncAt, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'lastSyncAt',
        lower: [lowerLastSyncAt],
        includeLower: includeLower,
        upper: [upperLastSyncAt],
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<TaxGroupEntity, TaxGroupEntity, QAfterWhereClause>
      syncStateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'syncState',
        value: [null],
      ));
    });
  }

  QueryBuilder<TaxGroupEntity, TaxGroupEntity, QAfterWhereClause>
      syncStateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'syncState',
        lower: [null],
        includeLower: false,
        upper: [],
      ));
    });
  }

  QueryBuilder<TaxGroupEntity, TaxGroupEntity, QAfterWhereClause>
      syncStateEqualTo(int? syncState) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'syncState',
        value: [syncState],
      ));
    });
  }

  QueryBuilder<TaxGroupEntity, TaxGroupEntity, QAfterWhereClause>
      syncStateNotEqualTo(int? syncState) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'syncState',
              lower: [],
              upper: [syncState],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'syncState',
              lower: [syncState],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'syncState',
              lower: [syncState],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'syncState',
              lower: [],
              upper: [syncState],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<TaxGroupEntity, TaxGroupEntity, QAfterWhereClause>
      syncStateGreaterThan(
    int? syncState, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'syncState',
        lower: [syncState],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<TaxGroupEntity, TaxGroupEntity, QAfterWhereClause>
      syncStateLessThan(
    int? syncState, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'syncState',
        lower: [],
        upper: [syncState],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<TaxGroupEntity, TaxGroupEntity, QAfterWhereClause>
      syncStateBetween(
    int? lowerSyncState,
    int? upperSyncState, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'syncState',
        lower: [lowerSyncState],
        includeLower: includeLower,
        upper: [upperSyncState],
        includeUpper: includeUpper,
      ));
    });
  }
}

extension TaxGroupEntityQueryFilter
    on QueryBuilder<TaxGroupEntity, TaxGroupEntity, QFilterCondition> {
  QueryBuilder<TaxGroupEntity, TaxGroupEntity, QAfterFilterCondition>
      createTimeEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createTime',
        value: value,
      ));
    });
  }

  QueryBuilder<TaxGroupEntity, TaxGroupEntity, QAfterFilterCondition>
      createTimeGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'createTime',
        value: value,
      ));
    });
  }

  QueryBuilder<TaxGroupEntity, TaxGroupEntity, QAfterFilterCondition>
      createTimeLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'createTime',
        value: value,
      ));
    });
  }

  QueryBuilder<TaxGroupEntity, TaxGroupEntity, QAfterFilterCondition>
      createTimeBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'createTime',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<TaxGroupEntity, TaxGroupEntity, QAfterFilterCondition>
      descriptionEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaxGroupEntity, TaxGroupEntity, QAfterFilterCondition>
      descriptionGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaxGroupEntity, TaxGroupEntity, QAfterFilterCondition>
      descriptionLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaxGroupEntity, TaxGroupEntity, QAfterFilterCondition>
      descriptionBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'description',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaxGroupEntity, TaxGroupEntity, QAfterFilterCondition>
      descriptionStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaxGroupEntity, TaxGroupEntity, QAfterFilterCondition>
      descriptionEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaxGroupEntity, TaxGroupEntity, QAfterFilterCondition>
      descriptionContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaxGroupEntity, TaxGroupEntity, QAfterFilterCondition>
      descriptionMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'description',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaxGroupEntity, TaxGroupEntity, QAfterFilterCondition>
      descriptionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'description',
        value: '',
      ));
    });
  }

  QueryBuilder<TaxGroupEntity, TaxGroupEntity, QAfterFilterCondition>
      descriptionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'description',
        value: '',
      ));
    });
  }

  QueryBuilder<TaxGroupEntity, TaxGroupEntity, QAfterFilterCondition>
      groupIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'groupId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaxGroupEntity, TaxGroupEntity, QAfterFilterCondition>
      groupIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'groupId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaxGroupEntity, TaxGroupEntity, QAfterFilterCondition>
      groupIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'groupId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaxGroupEntity, TaxGroupEntity, QAfterFilterCondition>
      groupIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'groupId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaxGroupEntity, TaxGroupEntity, QAfterFilterCondition>
      groupIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'groupId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaxGroupEntity, TaxGroupEntity, QAfterFilterCondition>
      groupIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'groupId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaxGroupEntity, TaxGroupEntity, QAfterFilterCondition>
      groupIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'groupId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaxGroupEntity, TaxGroupEntity, QAfterFilterCondition>
      groupIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'groupId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaxGroupEntity, TaxGroupEntity, QAfterFilterCondition>
      groupIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'groupId',
        value: '',
      ));
    });
  }

  QueryBuilder<TaxGroupEntity, TaxGroupEntity, QAfterFilterCondition>
      groupIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'groupId',
        value: '',
      ));
    });
  }

  QueryBuilder<TaxGroupEntity, TaxGroupEntity, QAfterFilterCondition>
      idIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<TaxGroupEntity, TaxGroupEntity, QAfterFilterCondition>
      idIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<TaxGroupEntity, TaxGroupEntity, QAfterFilterCondition> idEqualTo(
      Id? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<TaxGroupEntity, TaxGroupEntity, QAfterFilterCondition>
      idGreaterThan(
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

  QueryBuilder<TaxGroupEntity, TaxGroupEntity, QAfterFilterCondition>
      idLessThan(
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

  QueryBuilder<TaxGroupEntity, TaxGroupEntity, QAfterFilterCondition> idBetween(
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

  QueryBuilder<TaxGroupEntity, TaxGroupEntity, QAfterFilterCondition>
      lastChangedAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'lastChangedAt',
      ));
    });
  }

  QueryBuilder<TaxGroupEntity, TaxGroupEntity, QAfterFilterCondition>
      lastChangedAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'lastChangedAt',
      ));
    });
  }

  QueryBuilder<TaxGroupEntity, TaxGroupEntity, QAfterFilterCondition>
      lastChangedAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lastChangedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<TaxGroupEntity, TaxGroupEntity, QAfterFilterCondition>
      lastChangedAtGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'lastChangedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<TaxGroupEntity, TaxGroupEntity, QAfterFilterCondition>
      lastChangedAtLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'lastChangedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<TaxGroupEntity, TaxGroupEntity, QAfterFilterCondition>
      lastChangedAtBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'lastChangedAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<TaxGroupEntity, TaxGroupEntity, QAfterFilterCondition>
      lastSyncAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'lastSyncAt',
      ));
    });
  }

  QueryBuilder<TaxGroupEntity, TaxGroupEntity, QAfterFilterCondition>
      lastSyncAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'lastSyncAt',
      ));
    });
  }

  QueryBuilder<TaxGroupEntity, TaxGroupEntity, QAfterFilterCondition>
      lastSyncAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lastSyncAt',
        value: value,
      ));
    });
  }

  QueryBuilder<TaxGroupEntity, TaxGroupEntity, QAfterFilterCondition>
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

  QueryBuilder<TaxGroupEntity, TaxGroupEntity, QAfterFilterCondition>
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

  QueryBuilder<TaxGroupEntity, TaxGroupEntity, QAfterFilterCondition>
      lastSyncAtBetween(
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

  QueryBuilder<TaxGroupEntity, TaxGroupEntity, QAfterFilterCondition>
      nameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaxGroupEntity, TaxGroupEntity, QAfterFilterCondition>
      nameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaxGroupEntity, TaxGroupEntity, QAfterFilterCondition>
      nameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaxGroupEntity, TaxGroupEntity, QAfterFilterCondition>
      nameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'name',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaxGroupEntity, TaxGroupEntity, QAfterFilterCondition>
      nameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaxGroupEntity, TaxGroupEntity, QAfterFilterCondition>
      nameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaxGroupEntity, TaxGroupEntity, QAfterFilterCondition>
      nameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaxGroupEntity, TaxGroupEntity, QAfterFilterCondition>
      nameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'name',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaxGroupEntity, TaxGroupEntity, QAfterFilterCondition>
      nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<TaxGroupEntity, TaxGroupEntity, QAfterFilterCondition>
      nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<TaxGroupEntity, TaxGroupEntity, QAfterFilterCondition>
      syncStateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'syncState',
      ));
    });
  }

  QueryBuilder<TaxGroupEntity, TaxGroupEntity, QAfterFilterCondition>
      syncStateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'syncState',
      ));
    });
  }

  QueryBuilder<TaxGroupEntity, TaxGroupEntity, QAfterFilterCondition>
      syncStateEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'syncState',
        value: value,
      ));
    });
  }

  QueryBuilder<TaxGroupEntity, TaxGroupEntity, QAfterFilterCondition>
      syncStateGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'syncState',
        value: value,
      ));
    });
  }

  QueryBuilder<TaxGroupEntity, TaxGroupEntity, QAfterFilterCondition>
      syncStateLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'syncState',
        value: value,
      ));
    });
  }

  QueryBuilder<TaxGroupEntity, TaxGroupEntity, QAfterFilterCondition>
      syncStateBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'syncState',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<TaxGroupEntity, TaxGroupEntity, QAfterFilterCondition>
      taxRulesLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'taxRules',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<TaxGroupEntity, TaxGroupEntity, QAfterFilterCondition>
      taxRulesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'taxRules',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<TaxGroupEntity, TaxGroupEntity, QAfterFilterCondition>
      taxRulesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'taxRules',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<TaxGroupEntity, TaxGroupEntity, QAfterFilterCondition>
      taxRulesLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'taxRules',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<TaxGroupEntity, TaxGroupEntity, QAfterFilterCondition>
      taxRulesLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'taxRules',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<TaxGroupEntity, TaxGroupEntity, QAfterFilterCondition>
      taxRulesLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'taxRules',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }
}

extension TaxGroupEntityQueryObject
    on QueryBuilder<TaxGroupEntity, TaxGroupEntity, QFilterCondition> {
  QueryBuilder<TaxGroupEntity, TaxGroupEntity, QAfterFilterCondition>
      taxRulesElement(FilterQuery<TaxRuleEntity> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'taxRules');
    });
  }
}

extension TaxGroupEntityQueryLinks
    on QueryBuilder<TaxGroupEntity, TaxGroupEntity, QFilterCondition> {}

extension TaxGroupEntityQuerySortBy
    on QueryBuilder<TaxGroupEntity, TaxGroupEntity, QSortBy> {
  QueryBuilder<TaxGroupEntity, TaxGroupEntity, QAfterSortBy>
      sortByCreateTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createTime', Sort.asc);
    });
  }

  QueryBuilder<TaxGroupEntity, TaxGroupEntity, QAfterSortBy>
      sortByCreateTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createTime', Sort.desc);
    });
  }

  QueryBuilder<TaxGroupEntity, TaxGroupEntity, QAfterSortBy>
      sortByDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.asc);
    });
  }

  QueryBuilder<TaxGroupEntity, TaxGroupEntity, QAfterSortBy>
      sortByDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.desc);
    });
  }

  QueryBuilder<TaxGroupEntity, TaxGroupEntity, QAfterSortBy> sortByGroupId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'groupId', Sort.asc);
    });
  }

  QueryBuilder<TaxGroupEntity, TaxGroupEntity, QAfterSortBy>
      sortByGroupIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'groupId', Sort.desc);
    });
  }

  QueryBuilder<TaxGroupEntity, TaxGroupEntity, QAfterSortBy>
      sortByLastChangedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastChangedAt', Sort.asc);
    });
  }

  QueryBuilder<TaxGroupEntity, TaxGroupEntity, QAfterSortBy>
      sortByLastChangedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastChangedAt', Sort.desc);
    });
  }

  QueryBuilder<TaxGroupEntity, TaxGroupEntity, QAfterSortBy>
      sortByLastSyncAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastSyncAt', Sort.asc);
    });
  }

  QueryBuilder<TaxGroupEntity, TaxGroupEntity, QAfterSortBy>
      sortByLastSyncAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastSyncAt', Sort.desc);
    });
  }

  QueryBuilder<TaxGroupEntity, TaxGroupEntity, QAfterSortBy> sortByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<TaxGroupEntity, TaxGroupEntity, QAfterSortBy> sortByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<TaxGroupEntity, TaxGroupEntity, QAfterSortBy> sortBySyncState() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncState', Sort.asc);
    });
  }

  QueryBuilder<TaxGroupEntity, TaxGroupEntity, QAfterSortBy>
      sortBySyncStateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncState', Sort.desc);
    });
  }
}

extension TaxGroupEntityQuerySortThenBy
    on QueryBuilder<TaxGroupEntity, TaxGroupEntity, QSortThenBy> {
  QueryBuilder<TaxGroupEntity, TaxGroupEntity, QAfterSortBy>
      thenByCreateTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createTime', Sort.asc);
    });
  }

  QueryBuilder<TaxGroupEntity, TaxGroupEntity, QAfterSortBy>
      thenByCreateTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createTime', Sort.desc);
    });
  }

  QueryBuilder<TaxGroupEntity, TaxGroupEntity, QAfterSortBy>
      thenByDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.asc);
    });
  }

  QueryBuilder<TaxGroupEntity, TaxGroupEntity, QAfterSortBy>
      thenByDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.desc);
    });
  }

  QueryBuilder<TaxGroupEntity, TaxGroupEntity, QAfterSortBy> thenByGroupId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'groupId', Sort.asc);
    });
  }

  QueryBuilder<TaxGroupEntity, TaxGroupEntity, QAfterSortBy>
      thenByGroupIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'groupId', Sort.desc);
    });
  }

  QueryBuilder<TaxGroupEntity, TaxGroupEntity, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<TaxGroupEntity, TaxGroupEntity, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<TaxGroupEntity, TaxGroupEntity, QAfterSortBy>
      thenByLastChangedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastChangedAt', Sort.asc);
    });
  }

  QueryBuilder<TaxGroupEntity, TaxGroupEntity, QAfterSortBy>
      thenByLastChangedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastChangedAt', Sort.desc);
    });
  }

  QueryBuilder<TaxGroupEntity, TaxGroupEntity, QAfterSortBy>
      thenByLastSyncAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastSyncAt', Sort.asc);
    });
  }

  QueryBuilder<TaxGroupEntity, TaxGroupEntity, QAfterSortBy>
      thenByLastSyncAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastSyncAt', Sort.desc);
    });
  }

  QueryBuilder<TaxGroupEntity, TaxGroupEntity, QAfterSortBy> thenByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<TaxGroupEntity, TaxGroupEntity, QAfterSortBy> thenByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<TaxGroupEntity, TaxGroupEntity, QAfterSortBy> thenBySyncState() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncState', Sort.asc);
    });
  }

  QueryBuilder<TaxGroupEntity, TaxGroupEntity, QAfterSortBy>
      thenBySyncStateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncState', Sort.desc);
    });
  }
}

extension TaxGroupEntityQueryWhereDistinct
    on QueryBuilder<TaxGroupEntity, TaxGroupEntity, QDistinct> {
  QueryBuilder<TaxGroupEntity, TaxGroupEntity, QDistinct>
      distinctByCreateTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createTime');
    });
  }

  QueryBuilder<TaxGroupEntity, TaxGroupEntity, QDistinct> distinctByDescription(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'description', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<TaxGroupEntity, TaxGroupEntity, QDistinct> distinctByGroupId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'groupId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<TaxGroupEntity, TaxGroupEntity, QDistinct>
      distinctByLastChangedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lastChangedAt');
    });
  }

  QueryBuilder<TaxGroupEntity, TaxGroupEntity, QDistinct>
      distinctByLastSyncAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lastSyncAt');
    });
  }

  QueryBuilder<TaxGroupEntity, TaxGroupEntity, QDistinct> distinctByName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<TaxGroupEntity, TaxGroupEntity, QDistinct>
      distinctBySyncState() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'syncState');
    });
  }
}

extension TaxGroupEntityQueryProperty
    on QueryBuilder<TaxGroupEntity, TaxGroupEntity, QQueryProperty> {
  QueryBuilder<TaxGroupEntity, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<TaxGroupEntity, DateTime, QQueryOperations>
      createTimeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createTime');
    });
  }

  QueryBuilder<TaxGroupEntity, String, QQueryOperations> descriptionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'description');
    });
  }

  QueryBuilder<TaxGroupEntity, String, QQueryOperations> groupIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'groupId');
    });
  }

  QueryBuilder<TaxGroupEntity, DateTime?, QQueryOperations>
      lastChangedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lastChangedAt');
    });
  }

  QueryBuilder<TaxGroupEntity, DateTime?, QQueryOperations>
      lastSyncAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lastSyncAt');
    });
  }

  QueryBuilder<TaxGroupEntity, String, QQueryOperations> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name');
    });
  }

  QueryBuilder<TaxGroupEntity, int?, QQueryOperations> syncStateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'syncState');
    });
  }

  QueryBuilder<TaxGroupEntity, List<TaxRuleEntity>, QQueryOperations>
      taxRulesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'taxRules');
    });
  }
}
