// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'report_config_entity.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters

extension GetReportConfigEntityCollection on Isar {
  IsarCollection<ReportConfigEntity> get reportConfigEntitys =>
      this.collection();
}

const ReportConfigEntitySchema = CollectionSchema(
  name: r'ReportConfigEntity',
  id: -5710774184769298362,
  properties: {
    r'columns': PropertySchema(
      id: 0,
      name: r'columns',
      type: IsarType.objectList,
      target: r'ReportColumn',
    ),
    r'lastChangedAt': PropertySchema(
      id: 1,
      name: r'lastChangedAt',
      type: IsarType.dateTime,
    ),
    r'lastSyncAt': PropertySchema(
      id: 2,
      name: r'lastSyncAt',
      type: IsarType.dateTime,
    ),
    r'properties': PropertySchema(
      id: 3,
      name: r'properties',
      type: IsarType.objectList,
      target: r'ReportProperty',
    ),
    r'subtype': PropertySchema(
      id: 4,
      name: r'subtype',
      type: IsarType.string,
    ),
    r'syncState': PropertySchema(
      id: 5,
      name: r'syncState',
      type: IsarType.long,
    ),
    r'type': PropertySchema(
      id: 6,
      name: r'type',
      type: IsarType.string,
    )
  },
  estimateSize: _reportConfigEntityEstimateSize,
  serialize: _reportConfigEntitySerialize,
  deserialize: _reportConfigEntityDeserialize,
  deserializeProp: _reportConfigEntityDeserializeProp,
  idName: r'id',
  indexes: {
    r'type_subtype': IndexSchema(
      id: -1505971138412328854,
      name: r'type_subtype',
      unique: true,
      replace: true,
      properties: [
        IndexPropertySchema(
          name: r'type',
          type: IndexType.hash,
          caseSensitive: true,
        ),
        IndexPropertySchema(
          name: r'subtype',
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
  embeddedSchemas: {
    r'ReportColumn': ReportColumnSchema,
    r'ReportFieldConfigEntity': ReportFieldConfigEntitySchema,
    r'ReportProperty': ReportPropertySchema
  },
  getId: _reportConfigEntityGetId,
  getLinks: _reportConfigEntityGetLinks,
  attach: _reportConfigEntityAttach,
  version: '3.0.4',
);

int _reportConfigEntityEstimateSize(
  ReportConfigEntity object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.columns.length * 3;
  {
    final offsets = allOffsets[ReportColumn]!;
    for (var i = 0; i < object.columns.length; i++) {
      final value = object.columns[i];
      bytesCount += ReportColumnSchema.estimateSize(value, offsets, allOffsets);
    }
  }
  bytesCount += 3 + object.properties.length * 3;
  {
    final offsets = allOffsets[ReportProperty]!;
    for (var i = 0; i < object.properties.length; i++) {
      final value = object.properties[i];
      bytesCount +=
          ReportPropertySchema.estimateSize(value, offsets, allOffsets);
    }
  }
  bytesCount += 3 + object.subtype.length * 3;
  bytesCount += 3 + object.type.length * 3;
  return bytesCount;
}

void _reportConfigEntitySerialize(
  ReportConfigEntity object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeObjectList<ReportColumn>(
    offsets[0],
    allOffsets,
    ReportColumnSchema.serialize,
    object.columns,
  );
  writer.writeDateTime(offsets[1], object.lastChangedAt);
  writer.writeDateTime(offsets[2], object.lastSyncAt);
  writer.writeObjectList<ReportProperty>(
    offsets[3],
    allOffsets,
    ReportPropertySchema.serialize,
    object.properties,
  );
  writer.writeString(offsets[4], object.subtype);
  writer.writeLong(offsets[5], object.syncState);
  writer.writeString(offsets[6], object.type);
}

ReportConfigEntity _reportConfigEntityDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = ReportConfigEntity(
    columns: reader.readObjectList<ReportColumn>(
          offsets[0],
          ReportColumnSchema.deserialize,
          allOffsets,
          ReportColumn(),
        ) ??
        [],
    lastChangedAt: reader.readDateTimeOrNull(offsets[1]),
    lastSyncAt: reader.readDateTimeOrNull(offsets[2]),
    properties: reader.readObjectList<ReportProperty>(
          offsets[3],
          ReportPropertySchema.deserialize,
          allOffsets,
          ReportProperty(),
        ) ??
        [],
    subtype: reader.readString(offsets[4]),
    syncState: reader.readLongOrNull(offsets[5]),
    type: reader.readString(offsets[6]),
  );
  object.id = id;
  return object;
}

P _reportConfigEntityDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readObjectList<ReportColumn>(
            offset,
            ReportColumnSchema.deserialize,
            allOffsets,
            ReportColumn(),
          ) ??
          []) as P;
    case 1:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 2:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 3:
      return (reader.readObjectList<ReportProperty>(
            offset,
            ReportPropertySchema.deserialize,
            allOffsets,
            ReportProperty(),
          ) ??
          []) as P;
    case 4:
      return (reader.readString(offset)) as P;
    case 5:
      return (reader.readLongOrNull(offset)) as P;
    case 6:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _reportConfigEntityGetId(ReportConfigEntity object) {
  return object.id ?? Isar.autoIncrement;
}

List<IsarLinkBase<dynamic>> _reportConfigEntityGetLinks(
    ReportConfigEntity object) {
  return [];
}

void _reportConfigEntityAttach(
    IsarCollection<dynamic> col, Id id, ReportConfigEntity object) {
  object.id = id;
}

extension ReportConfigEntityByIndex on IsarCollection<ReportConfigEntity> {
  Future<ReportConfigEntity?> getByTypeSubtype(String type, String subtype) {
    return getByIndex(r'type_subtype', [type, subtype]);
  }

  ReportConfigEntity? getByTypeSubtypeSync(String type, String subtype) {
    return getByIndexSync(r'type_subtype', [type, subtype]);
  }

  Future<bool> deleteByTypeSubtype(String type, String subtype) {
    return deleteByIndex(r'type_subtype', [type, subtype]);
  }

  bool deleteByTypeSubtypeSync(String type, String subtype) {
    return deleteByIndexSync(r'type_subtype', [type, subtype]);
  }

  Future<List<ReportConfigEntity?>> getAllByTypeSubtype(
      List<String> typeValues, List<String> subtypeValues) {
    final len = typeValues.length;
    assert(subtypeValues.length == len,
        'All index values must have the same length');
    final values = <List<dynamic>>[];
    for (var i = 0; i < len; i++) {
      values.add([typeValues[i], subtypeValues[i]]);
    }

    return getAllByIndex(r'type_subtype', values);
  }

  List<ReportConfigEntity?> getAllByTypeSubtypeSync(
      List<String> typeValues, List<String> subtypeValues) {
    final len = typeValues.length;
    assert(subtypeValues.length == len,
        'All index values must have the same length');
    final values = <List<dynamic>>[];
    for (var i = 0; i < len; i++) {
      values.add([typeValues[i], subtypeValues[i]]);
    }

    return getAllByIndexSync(r'type_subtype', values);
  }

  Future<int> deleteAllByTypeSubtype(
      List<String> typeValues, List<String> subtypeValues) {
    final len = typeValues.length;
    assert(subtypeValues.length == len,
        'All index values must have the same length');
    final values = <List<dynamic>>[];
    for (var i = 0; i < len; i++) {
      values.add([typeValues[i], subtypeValues[i]]);
    }

    return deleteAllByIndex(r'type_subtype', values);
  }

  int deleteAllByTypeSubtypeSync(
      List<String> typeValues, List<String> subtypeValues) {
    final len = typeValues.length;
    assert(subtypeValues.length == len,
        'All index values must have the same length');
    final values = <List<dynamic>>[];
    for (var i = 0; i < len; i++) {
      values.add([typeValues[i], subtypeValues[i]]);
    }

    return deleteAllByIndexSync(r'type_subtype', values);
  }

  Future<Id> putByTypeSubtype(ReportConfigEntity object) {
    return putByIndex(r'type_subtype', object);
  }

  Id putByTypeSubtypeSync(ReportConfigEntity object, {bool saveLinks = true}) {
    return putByIndexSync(r'type_subtype', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByTypeSubtype(List<ReportConfigEntity> objects) {
    return putAllByIndex(r'type_subtype', objects);
  }

  List<Id> putAllByTypeSubtypeSync(List<ReportConfigEntity> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'type_subtype', objects, saveLinks: saveLinks);
  }
}

extension ReportConfigEntityQueryWhereSort
    on QueryBuilder<ReportConfigEntity, ReportConfigEntity, QWhere> {
  QueryBuilder<ReportConfigEntity, ReportConfigEntity, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<ReportConfigEntity, ReportConfigEntity, QAfterWhere>
      anyLastChangedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'lastChangedAt'),
      );
    });
  }

  QueryBuilder<ReportConfigEntity, ReportConfigEntity, QAfterWhere>
      anyLastSyncAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'lastSyncAt'),
      );
    });
  }

  QueryBuilder<ReportConfigEntity, ReportConfigEntity, QAfterWhere>
      anySyncState() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'syncState'),
      );
    });
  }
}

extension ReportConfigEntityQueryWhere
    on QueryBuilder<ReportConfigEntity, ReportConfigEntity, QWhereClause> {
  QueryBuilder<ReportConfigEntity, ReportConfigEntity, QAfterWhereClause>
      idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<ReportConfigEntity, ReportConfigEntity, QAfterWhereClause>
      idNotEqualTo(Id id) {
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

  QueryBuilder<ReportConfigEntity, ReportConfigEntity, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<ReportConfigEntity, ReportConfigEntity, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<ReportConfigEntity, ReportConfigEntity, QAfterWhereClause>
      idBetween(
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

  QueryBuilder<ReportConfigEntity, ReportConfigEntity, QAfterWhereClause>
      typeEqualToAnySubtype(String type) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'type_subtype',
        value: [type],
      ));
    });
  }

  QueryBuilder<ReportConfigEntity, ReportConfigEntity, QAfterWhereClause>
      typeNotEqualToAnySubtype(String type) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'type_subtype',
              lower: [],
              upper: [type],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'type_subtype',
              lower: [type],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'type_subtype',
              lower: [type],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'type_subtype',
              lower: [],
              upper: [type],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<ReportConfigEntity, ReportConfigEntity, QAfterWhereClause>
      typeSubtypeEqualTo(String type, String subtype) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'type_subtype',
        value: [type, subtype],
      ));
    });
  }

  QueryBuilder<ReportConfigEntity, ReportConfigEntity, QAfterWhereClause>
      typeEqualToSubtypeNotEqualTo(String type, String subtype) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'type_subtype',
              lower: [type],
              upper: [type, subtype],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'type_subtype',
              lower: [type, subtype],
              includeLower: false,
              upper: [type],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'type_subtype',
              lower: [type, subtype],
              includeLower: false,
              upper: [type],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'type_subtype',
              lower: [type],
              upper: [type, subtype],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<ReportConfigEntity, ReportConfigEntity, QAfterWhereClause>
      lastChangedAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'lastChangedAt',
        value: [null],
      ));
    });
  }

  QueryBuilder<ReportConfigEntity, ReportConfigEntity, QAfterWhereClause>
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

  QueryBuilder<ReportConfigEntity, ReportConfigEntity, QAfterWhereClause>
      lastChangedAtEqualTo(DateTime? lastChangedAt) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'lastChangedAt',
        value: [lastChangedAt],
      ));
    });
  }

  QueryBuilder<ReportConfigEntity, ReportConfigEntity, QAfterWhereClause>
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

  QueryBuilder<ReportConfigEntity, ReportConfigEntity, QAfterWhereClause>
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

  QueryBuilder<ReportConfigEntity, ReportConfigEntity, QAfterWhereClause>
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

  QueryBuilder<ReportConfigEntity, ReportConfigEntity, QAfterWhereClause>
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

  QueryBuilder<ReportConfigEntity, ReportConfigEntity, QAfterWhereClause>
      lastSyncAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'lastSyncAt',
        value: [null],
      ));
    });
  }

  QueryBuilder<ReportConfigEntity, ReportConfigEntity, QAfterWhereClause>
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

  QueryBuilder<ReportConfigEntity, ReportConfigEntity, QAfterWhereClause>
      lastSyncAtEqualTo(DateTime? lastSyncAt) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'lastSyncAt',
        value: [lastSyncAt],
      ));
    });
  }

  QueryBuilder<ReportConfigEntity, ReportConfigEntity, QAfterWhereClause>
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

  QueryBuilder<ReportConfigEntity, ReportConfigEntity, QAfterWhereClause>
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

  QueryBuilder<ReportConfigEntity, ReportConfigEntity, QAfterWhereClause>
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

  QueryBuilder<ReportConfigEntity, ReportConfigEntity, QAfterWhereClause>
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

  QueryBuilder<ReportConfigEntity, ReportConfigEntity, QAfterWhereClause>
      syncStateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'syncState',
        value: [null],
      ));
    });
  }

  QueryBuilder<ReportConfigEntity, ReportConfigEntity, QAfterWhereClause>
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

  QueryBuilder<ReportConfigEntity, ReportConfigEntity, QAfterWhereClause>
      syncStateEqualTo(int? syncState) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'syncState',
        value: [syncState],
      ));
    });
  }

  QueryBuilder<ReportConfigEntity, ReportConfigEntity, QAfterWhereClause>
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

  QueryBuilder<ReportConfigEntity, ReportConfigEntity, QAfterWhereClause>
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

  QueryBuilder<ReportConfigEntity, ReportConfigEntity, QAfterWhereClause>
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

  QueryBuilder<ReportConfigEntity, ReportConfigEntity, QAfterWhereClause>
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

extension ReportConfigEntityQueryFilter
    on QueryBuilder<ReportConfigEntity, ReportConfigEntity, QFilterCondition> {
  QueryBuilder<ReportConfigEntity, ReportConfigEntity, QAfterFilterCondition>
      columnsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'columns',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<ReportConfigEntity, ReportConfigEntity, QAfterFilterCondition>
      columnsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'columns',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<ReportConfigEntity, ReportConfigEntity, QAfterFilterCondition>
      columnsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'columns',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<ReportConfigEntity, ReportConfigEntity, QAfterFilterCondition>
      columnsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'columns',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<ReportConfigEntity, ReportConfigEntity, QAfterFilterCondition>
      columnsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'columns',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<ReportConfigEntity, ReportConfigEntity, QAfterFilterCondition>
      columnsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'columns',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<ReportConfigEntity, ReportConfigEntity, QAfterFilterCondition>
      idIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<ReportConfigEntity, ReportConfigEntity, QAfterFilterCondition>
      idIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<ReportConfigEntity, ReportConfigEntity, QAfterFilterCondition>
      idEqualTo(Id? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<ReportConfigEntity, ReportConfigEntity, QAfterFilterCondition>
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

  QueryBuilder<ReportConfigEntity, ReportConfigEntity, QAfterFilterCondition>
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

  QueryBuilder<ReportConfigEntity, ReportConfigEntity, QAfterFilterCondition>
      idBetween(
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

  QueryBuilder<ReportConfigEntity, ReportConfigEntity, QAfterFilterCondition>
      lastChangedAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'lastChangedAt',
      ));
    });
  }

  QueryBuilder<ReportConfigEntity, ReportConfigEntity, QAfterFilterCondition>
      lastChangedAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'lastChangedAt',
      ));
    });
  }

  QueryBuilder<ReportConfigEntity, ReportConfigEntity, QAfterFilterCondition>
      lastChangedAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lastChangedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<ReportConfigEntity, ReportConfigEntity, QAfterFilterCondition>
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

  QueryBuilder<ReportConfigEntity, ReportConfigEntity, QAfterFilterCondition>
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

  QueryBuilder<ReportConfigEntity, ReportConfigEntity, QAfterFilterCondition>
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

  QueryBuilder<ReportConfigEntity, ReportConfigEntity, QAfterFilterCondition>
      lastSyncAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'lastSyncAt',
      ));
    });
  }

  QueryBuilder<ReportConfigEntity, ReportConfigEntity, QAfterFilterCondition>
      lastSyncAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'lastSyncAt',
      ));
    });
  }

  QueryBuilder<ReportConfigEntity, ReportConfigEntity, QAfterFilterCondition>
      lastSyncAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lastSyncAt',
        value: value,
      ));
    });
  }

  QueryBuilder<ReportConfigEntity, ReportConfigEntity, QAfterFilterCondition>
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

  QueryBuilder<ReportConfigEntity, ReportConfigEntity, QAfterFilterCondition>
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

  QueryBuilder<ReportConfigEntity, ReportConfigEntity, QAfterFilterCondition>
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

  QueryBuilder<ReportConfigEntity, ReportConfigEntity, QAfterFilterCondition>
      propertiesLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'properties',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<ReportConfigEntity, ReportConfigEntity, QAfterFilterCondition>
      propertiesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'properties',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<ReportConfigEntity, ReportConfigEntity, QAfterFilterCondition>
      propertiesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'properties',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<ReportConfigEntity, ReportConfigEntity, QAfterFilterCondition>
      propertiesLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'properties',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<ReportConfigEntity, ReportConfigEntity, QAfterFilterCondition>
      propertiesLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'properties',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<ReportConfigEntity, ReportConfigEntity, QAfterFilterCondition>
      propertiesLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'properties',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<ReportConfigEntity, ReportConfigEntity, QAfterFilterCondition>
      subtypeEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'subtype',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReportConfigEntity, ReportConfigEntity, QAfterFilterCondition>
      subtypeGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'subtype',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReportConfigEntity, ReportConfigEntity, QAfterFilterCondition>
      subtypeLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'subtype',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReportConfigEntity, ReportConfigEntity, QAfterFilterCondition>
      subtypeBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'subtype',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReportConfigEntity, ReportConfigEntity, QAfterFilterCondition>
      subtypeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'subtype',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReportConfigEntity, ReportConfigEntity, QAfterFilterCondition>
      subtypeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'subtype',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReportConfigEntity, ReportConfigEntity, QAfterFilterCondition>
      subtypeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'subtype',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReportConfigEntity, ReportConfigEntity, QAfterFilterCondition>
      subtypeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'subtype',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReportConfigEntity, ReportConfigEntity, QAfterFilterCondition>
      subtypeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'subtype',
        value: '',
      ));
    });
  }

  QueryBuilder<ReportConfigEntity, ReportConfigEntity, QAfterFilterCondition>
      subtypeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'subtype',
        value: '',
      ));
    });
  }

  QueryBuilder<ReportConfigEntity, ReportConfigEntity, QAfterFilterCondition>
      syncStateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'syncState',
      ));
    });
  }

  QueryBuilder<ReportConfigEntity, ReportConfigEntity, QAfterFilterCondition>
      syncStateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'syncState',
      ));
    });
  }

  QueryBuilder<ReportConfigEntity, ReportConfigEntity, QAfterFilterCondition>
      syncStateEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'syncState',
        value: value,
      ));
    });
  }

  QueryBuilder<ReportConfigEntity, ReportConfigEntity, QAfterFilterCondition>
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

  QueryBuilder<ReportConfigEntity, ReportConfigEntity, QAfterFilterCondition>
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

  QueryBuilder<ReportConfigEntity, ReportConfigEntity, QAfterFilterCondition>
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

  QueryBuilder<ReportConfigEntity, ReportConfigEntity, QAfterFilterCondition>
      typeEqualTo(
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

  QueryBuilder<ReportConfigEntity, ReportConfigEntity, QAfterFilterCondition>
      typeGreaterThan(
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

  QueryBuilder<ReportConfigEntity, ReportConfigEntity, QAfterFilterCondition>
      typeLessThan(
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

  QueryBuilder<ReportConfigEntity, ReportConfigEntity, QAfterFilterCondition>
      typeBetween(
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

  QueryBuilder<ReportConfigEntity, ReportConfigEntity, QAfterFilterCondition>
      typeStartsWith(
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

  QueryBuilder<ReportConfigEntity, ReportConfigEntity, QAfterFilterCondition>
      typeEndsWith(
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

  QueryBuilder<ReportConfigEntity, ReportConfigEntity, QAfterFilterCondition>
      typeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'type',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReportConfigEntity, ReportConfigEntity, QAfterFilterCondition>
      typeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'type',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReportConfigEntity, ReportConfigEntity, QAfterFilterCondition>
      typeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'type',
        value: '',
      ));
    });
  }

  QueryBuilder<ReportConfigEntity, ReportConfigEntity, QAfterFilterCondition>
      typeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'type',
        value: '',
      ));
    });
  }
}

extension ReportConfigEntityQueryObject
    on QueryBuilder<ReportConfigEntity, ReportConfigEntity, QFilterCondition> {
  QueryBuilder<ReportConfigEntity, ReportConfigEntity, QAfterFilterCondition>
      columnsElement(FilterQuery<ReportColumn> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'columns');
    });
  }

  QueryBuilder<ReportConfigEntity, ReportConfigEntity, QAfterFilterCondition>
      propertiesElement(FilterQuery<ReportProperty> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'properties');
    });
  }
}

extension ReportConfigEntityQueryLinks
    on QueryBuilder<ReportConfigEntity, ReportConfigEntity, QFilterCondition> {}

extension ReportConfigEntityQuerySortBy
    on QueryBuilder<ReportConfigEntity, ReportConfigEntity, QSortBy> {
  QueryBuilder<ReportConfigEntity, ReportConfigEntity, QAfterSortBy>
      sortByLastChangedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastChangedAt', Sort.asc);
    });
  }

  QueryBuilder<ReportConfigEntity, ReportConfigEntity, QAfterSortBy>
      sortByLastChangedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastChangedAt', Sort.desc);
    });
  }

  QueryBuilder<ReportConfigEntity, ReportConfigEntity, QAfterSortBy>
      sortByLastSyncAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastSyncAt', Sort.asc);
    });
  }

  QueryBuilder<ReportConfigEntity, ReportConfigEntity, QAfterSortBy>
      sortByLastSyncAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastSyncAt', Sort.desc);
    });
  }

  QueryBuilder<ReportConfigEntity, ReportConfigEntity, QAfterSortBy>
      sortBySubtype() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'subtype', Sort.asc);
    });
  }

  QueryBuilder<ReportConfigEntity, ReportConfigEntity, QAfterSortBy>
      sortBySubtypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'subtype', Sort.desc);
    });
  }

  QueryBuilder<ReportConfigEntity, ReportConfigEntity, QAfterSortBy>
      sortBySyncState() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncState', Sort.asc);
    });
  }

  QueryBuilder<ReportConfigEntity, ReportConfigEntity, QAfterSortBy>
      sortBySyncStateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncState', Sort.desc);
    });
  }

  QueryBuilder<ReportConfigEntity, ReportConfigEntity, QAfterSortBy>
      sortByType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.asc);
    });
  }

  QueryBuilder<ReportConfigEntity, ReportConfigEntity, QAfterSortBy>
      sortByTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.desc);
    });
  }
}

extension ReportConfigEntityQuerySortThenBy
    on QueryBuilder<ReportConfigEntity, ReportConfigEntity, QSortThenBy> {
  QueryBuilder<ReportConfigEntity, ReportConfigEntity, QAfterSortBy>
      thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<ReportConfigEntity, ReportConfigEntity, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<ReportConfigEntity, ReportConfigEntity, QAfterSortBy>
      thenByLastChangedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastChangedAt', Sort.asc);
    });
  }

  QueryBuilder<ReportConfigEntity, ReportConfigEntity, QAfterSortBy>
      thenByLastChangedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastChangedAt', Sort.desc);
    });
  }

  QueryBuilder<ReportConfigEntity, ReportConfigEntity, QAfterSortBy>
      thenByLastSyncAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastSyncAt', Sort.asc);
    });
  }

  QueryBuilder<ReportConfigEntity, ReportConfigEntity, QAfterSortBy>
      thenByLastSyncAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastSyncAt', Sort.desc);
    });
  }

  QueryBuilder<ReportConfigEntity, ReportConfigEntity, QAfterSortBy>
      thenBySubtype() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'subtype', Sort.asc);
    });
  }

  QueryBuilder<ReportConfigEntity, ReportConfigEntity, QAfterSortBy>
      thenBySubtypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'subtype', Sort.desc);
    });
  }

  QueryBuilder<ReportConfigEntity, ReportConfigEntity, QAfterSortBy>
      thenBySyncState() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncState', Sort.asc);
    });
  }

  QueryBuilder<ReportConfigEntity, ReportConfigEntity, QAfterSortBy>
      thenBySyncStateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncState', Sort.desc);
    });
  }

  QueryBuilder<ReportConfigEntity, ReportConfigEntity, QAfterSortBy>
      thenByType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.asc);
    });
  }

  QueryBuilder<ReportConfigEntity, ReportConfigEntity, QAfterSortBy>
      thenByTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.desc);
    });
  }
}

extension ReportConfigEntityQueryWhereDistinct
    on QueryBuilder<ReportConfigEntity, ReportConfigEntity, QDistinct> {
  QueryBuilder<ReportConfigEntity, ReportConfigEntity, QDistinct>
      distinctByLastChangedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lastChangedAt');
    });
  }

  QueryBuilder<ReportConfigEntity, ReportConfigEntity, QDistinct>
      distinctByLastSyncAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lastSyncAt');
    });
  }

  QueryBuilder<ReportConfigEntity, ReportConfigEntity, QDistinct>
      distinctBySubtype({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'subtype', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ReportConfigEntity, ReportConfigEntity, QDistinct>
      distinctBySyncState() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'syncState');
    });
  }

  QueryBuilder<ReportConfigEntity, ReportConfigEntity, QDistinct>
      distinctByType({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'type', caseSensitive: caseSensitive);
    });
  }
}

extension ReportConfigEntityQueryProperty
    on QueryBuilder<ReportConfigEntity, ReportConfigEntity, QQueryProperty> {
  QueryBuilder<ReportConfigEntity, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<ReportConfigEntity, List<ReportColumn>, QQueryOperations>
      columnsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'columns');
    });
  }

  QueryBuilder<ReportConfigEntity, DateTime?, QQueryOperations>
      lastChangedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lastChangedAt');
    });
  }

  QueryBuilder<ReportConfigEntity, DateTime?, QQueryOperations>
      lastSyncAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lastSyncAt');
    });
  }

  QueryBuilder<ReportConfigEntity, List<ReportProperty>, QQueryOperations>
      propertiesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'properties');
    });
  }

  QueryBuilder<ReportConfigEntity, String, QQueryOperations> subtypeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'subtype');
    });
  }

  QueryBuilder<ReportConfigEntity, int?, QQueryOperations> syncStateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'syncState');
    });
  }

  QueryBuilder<ReportConfigEntity, String, QQueryOperations> typeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'type');
    });
  }
}

// **************************************************************************
// IsarEmbeddedGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters

const ReportPropertySchema = Schema(
  name: r'ReportProperty',
  id: -5304099415648811376,
  properties: {
    r'boolValue': PropertySchema(
      id: 0,
      name: r'boolValue',
      type: IsarType.bool,
    ),
    r'doubleValue': PropertySchema(
      id: 1,
      name: r'doubleValue',
      type: IsarType.double,
    ),
    r'intValue': PropertySchema(
      id: 2,
      name: r'intValue',
      type: IsarType.long,
    ),
    r'key': PropertySchema(
      id: 3,
      name: r'key',
      type: IsarType.string,
    ),
    r'stringValue': PropertySchema(
      id: 4,
      name: r'stringValue',
      type: IsarType.string,
    )
  },
  estimateSize: _reportPropertyEstimateSize,
  serialize: _reportPropertySerialize,
  deserialize: _reportPropertyDeserialize,
  deserializeProp: _reportPropertyDeserializeProp,
);

int _reportPropertyEstimateSize(
  ReportProperty object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.key;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.stringValue;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _reportPropertySerialize(
  ReportProperty object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeBool(offsets[0], object.boolValue);
  writer.writeDouble(offsets[1], object.doubleValue);
  writer.writeLong(offsets[2], object.intValue);
  writer.writeString(offsets[3], object.key);
  writer.writeString(offsets[4], object.stringValue);
}

ReportProperty _reportPropertyDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = ReportProperty(
    boolValue: reader.readBoolOrNull(offsets[0]),
    doubleValue: reader.readDoubleOrNull(offsets[1]),
    intValue: reader.readLongOrNull(offsets[2]),
    key: reader.readStringOrNull(offsets[3]),
    stringValue: reader.readStringOrNull(offsets[4]),
  );
  return object;
}

P _reportPropertyDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readBoolOrNull(offset)) as P;
    case 1:
      return (reader.readDoubleOrNull(offset)) as P;
    case 2:
      return (reader.readLongOrNull(offset)) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    case 4:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension ReportPropertyQueryFilter
    on QueryBuilder<ReportProperty, ReportProperty, QFilterCondition> {
  QueryBuilder<ReportProperty, ReportProperty, QAfterFilterCondition>
      boolValueIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'boolValue',
      ));
    });
  }

  QueryBuilder<ReportProperty, ReportProperty, QAfterFilterCondition>
      boolValueIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'boolValue',
      ));
    });
  }

  QueryBuilder<ReportProperty, ReportProperty, QAfterFilterCondition>
      boolValueEqualTo(bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'boolValue',
        value: value,
      ));
    });
  }

  QueryBuilder<ReportProperty, ReportProperty, QAfterFilterCondition>
      doubleValueIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'doubleValue',
      ));
    });
  }

  QueryBuilder<ReportProperty, ReportProperty, QAfterFilterCondition>
      doubleValueIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'doubleValue',
      ));
    });
  }

  QueryBuilder<ReportProperty, ReportProperty, QAfterFilterCondition>
      doubleValueEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'doubleValue',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ReportProperty, ReportProperty, QAfterFilterCondition>
      doubleValueGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'doubleValue',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ReportProperty, ReportProperty, QAfterFilterCondition>
      doubleValueLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'doubleValue',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ReportProperty, ReportProperty, QAfterFilterCondition>
      doubleValueBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'doubleValue',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ReportProperty, ReportProperty, QAfterFilterCondition>
      intValueIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'intValue',
      ));
    });
  }

  QueryBuilder<ReportProperty, ReportProperty, QAfterFilterCondition>
      intValueIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'intValue',
      ));
    });
  }

  QueryBuilder<ReportProperty, ReportProperty, QAfterFilterCondition>
      intValueEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'intValue',
        value: value,
      ));
    });
  }

  QueryBuilder<ReportProperty, ReportProperty, QAfterFilterCondition>
      intValueGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'intValue',
        value: value,
      ));
    });
  }

  QueryBuilder<ReportProperty, ReportProperty, QAfterFilterCondition>
      intValueLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'intValue',
        value: value,
      ));
    });
  }

  QueryBuilder<ReportProperty, ReportProperty, QAfterFilterCondition>
      intValueBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'intValue',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ReportProperty, ReportProperty, QAfterFilterCondition>
      keyIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'key',
      ));
    });
  }

  QueryBuilder<ReportProperty, ReportProperty, QAfterFilterCondition>
      keyIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'key',
      ));
    });
  }

  QueryBuilder<ReportProperty, ReportProperty, QAfterFilterCondition>
      keyEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'key',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReportProperty, ReportProperty, QAfterFilterCondition>
      keyGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'key',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReportProperty, ReportProperty, QAfterFilterCondition>
      keyLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'key',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReportProperty, ReportProperty, QAfterFilterCondition>
      keyBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'key',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReportProperty, ReportProperty, QAfterFilterCondition>
      keyStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'key',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReportProperty, ReportProperty, QAfterFilterCondition>
      keyEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'key',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReportProperty, ReportProperty, QAfterFilterCondition>
      keyContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'key',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReportProperty, ReportProperty, QAfterFilterCondition>
      keyMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'key',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReportProperty, ReportProperty, QAfterFilterCondition>
      keyIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'key',
        value: '',
      ));
    });
  }

  QueryBuilder<ReportProperty, ReportProperty, QAfterFilterCondition>
      keyIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'key',
        value: '',
      ));
    });
  }

  QueryBuilder<ReportProperty, ReportProperty, QAfterFilterCondition>
      stringValueIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'stringValue',
      ));
    });
  }

  QueryBuilder<ReportProperty, ReportProperty, QAfterFilterCondition>
      stringValueIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'stringValue',
      ));
    });
  }

  QueryBuilder<ReportProperty, ReportProperty, QAfterFilterCondition>
      stringValueEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'stringValue',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReportProperty, ReportProperty, QAfterFilterCondition>
      stringValueGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'stringValue',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReportProperty, ReportProperty, QAfterFilterCondition>
      stringValueLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'stringValue',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReportProperty, ReportProperty, QAfterFilterCondition>
      stringValueBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'stringValue',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReportProperty, ReportProperty, QAfterFilterCondition>
      stringValueStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'stringValue',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReportProperty, ReportProperty, QAfterFilterCondition>
      stringValueEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'stringValue',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReportProperty, ReportProperty, QAfterFilterCondition>
      stringValueContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'stringValue',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReportProperty, ReportProperty, QAfterFilterCondition>
      stringValueMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'stringValue',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReportProperty, ReportProperty, QAfterFilterCondition>
      stringValueIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'stringValue',
        value: '',
      ));
    });
  }

  QueryBuilder<ReportProperty, ReportProperty, QAfterFilterCondition>
      stringValueIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'stringValue',
        value: '',
      ));
    });
  }
}

extension ReportPropertyQueryObject
    on QueryBuilder<ReportProperty, ReportProperty, QFilterCondition> {}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters

const ReportColumnSchema = Schema(
  name: r'ReportColumn',
  id: 7747909741115368701,
  properties: {
    r'fields': PropertySchema(
      id: 0,
      name: r'fields',
      type: IsarType.objectList,
      target: r'ReportFieldConfigEntity',
    ),
    r'id': PropertySchema(
      id: 1,
      name: r'id',
      type: IsarType.string,
    )
  },
  estimateSize: _reportColumnEstimateSize,
  serialize: _reportColumnSerialize,
  deserialize: _reportColumnDeserialize,
  deserializeProp: _reportColumnDeserializeProp,
);

int _reportColumnEstimateSize(
  ReportColumn object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final list = object.fields;
    if (list != null) {
      bytesCount += 3 + list.length * 3;
      {
        final offsets = allOffsets[ReportFieldConfigEntity]!;
        for (var i = 0; i < list.length; i++) {
          final value = list[i];
          bytesCount += ReportFieldConfigEntitySchema.estimateSize(
              value, offsets, allOffsets);
        }
      }
    }
  }
  {
    final value = object.id;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _reportColumnSerialize(
  ReportColumn object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeObjectList<ReportFieldConfigEntity>(
    offsets[0],
    allOffsets,
    ReportFieldConfigEntitySchema.serialize,
    object.fields,
  );
  writer.writeString(offsets[1], object.id);
}

ReportColumn _reportColumnDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = ReportColumn(
    fields: reader.readObjectList<ReportFieldConfigEntity>(
      offsets[0],
      ReportFieldConfigEntitySchema.deserialize,
      allOffsets,
      ReportFieldConfigEntity(),
    ),
    id: reader.readStringOrNull(offsets[1]),
  );
  return object;
}

P _reportColumnDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readObjectList<ReportFieldConfigEntity>(
        offset,
        ReportFieldConfigEntitySchema.deserialize,
        allOffsets,
        ReportFieldConfigEntity(),
      )) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension ReportColumnQueryFilter
    on QueryBuilder<ReportColumn, ReportColumn, QFilterCondition> {
  QueryBuilder<ReportColumn, ReportColumn, QAfterFilterCondition>
      fieldsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'fields',
      ));
    });
  }

  QueryBuilder<ReportColumn, ReportColumn, QAfterFilterCondition>
      fieldsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'fields',
      ));
    });
  }

  QueryBuilder<ReportColumn, ReportColumn, QAfterFilterCondition>
      fieldsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'fields',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<ReportColumn, ReportColumn, QAfterFilterCondition>
      fieldsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'fields',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<ReportColumn, ReportColumn, QAfterFilterCondition>
      fieldsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'fields',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<ReportColumn, ReportColumn, QAfterFilterCondition>
      fieldsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'fields',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<ReportColumn, ReportColumn, QAfterFilterCondition>
      fieldsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'fields',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<ReportColumn, ReportColumn, QAfterFilterCondition>
      fieldsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'fields',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<ReportColumn, ReportColumn, QAfterFilterCondition> idIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<ReportColumn, ReportColumn, QAfterFilterCondition>
      idIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<ReportColumn, ReportColumn, QAfterFilterCondition> idEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReportColumn, ReportColumn, QAfterFilterCondition> idGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReportColumn, ReportColumn, QAfterFilterCondition> idLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReportColumn, ReportColumn, QAfterFilterCondition> idBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReportColumn, ReportColumn, QAfterFilterCondition> idStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReportColumn, ReportColumn, QAfterFilterCondition> idEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReportColumn, ReportColumn, QAfterFilterCondition> idContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReportColumn, ReportColumn, QAfterFilterCondition> idMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'id',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReportColumn, ReportColumn, QAfterFilterCondition> idIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: '',
      ));
    });
  }

  QueryBuilder<ReportColumn, ReportColumn, QAfterFilterCondition>
      idIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'id',
        value: '',
      ));
    });
  }
}

extension ReportColumnQueryObject
    on QueryBuilder<ReportColumn, ReportColumn, QFilterCondition> {
  QueryBuilder<ReportColumn, ReportColumn, QAfterFilterCondition> fieldsElement(
      FilterQuery<ReportFieldConfigEntity> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'fields');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters

const ReportFieldConfigEntitySchema = Schema(
  name: r'ReportFieldConfigEntity',
  id: -7741328123365593586,
  properties: {
    r'align': PropertySchema(
      id: 0,
      name: r'align',
      type: IsarType.string,
      enumMap: _ReportFieldConfigEntityalignEnumValueMap,
    ),
    r'defaultValue': PropertySchema(
      id: 1,
      name: r'defaultValue',
      type: IsarType.string,
    ),
    r'flex': PropertySchema(
      id: 2,
      name: r'flex',
      type: IsarType.long,
    ),
    r'key': PropertySchema(
      id: 3,
      name: r'key',
      type: IsarType.string,
    ),
    r'title': PropertySchema(
      id: 4,
      name: r'title',
      type: IsarType.string,
    )
  },
  estimateSize: _reportFieldConfigEntityEstimateSize,
  serialize: _reportFieldConfigEntitySerialize,
  deserialize: _reportFieldConfigEntityDeserialize,
  deserializeProp: _reportFieldConfigEntityDeserializeProp,
);

int _reportFieldConfigEntityEstimateSize(
  ReportFieldConfigEntity object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.align;
    if (value != null) {
      bytesCount += 3 + value.name.length * 3;
    }
  }
  {
    final value = object.defaultValue;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.key;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.title;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _reportFieldConfigEntitySerialize(
  ReportFieldConfigEntity object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.align?.name);
  writer.writeString(offsets[1], object.defaultValue);
  writer.writeLong(offsets[2], object.flex);
  writer.writeString(offsets[3], object.key);
  writer.writeString(offsets[4], object.title);
}

ReportFieldConfigEntity _reportFieldConfigEntityDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = ReportFieldConfigEntity(
    align: _ReportFieldConfigEntityalignValueEnumMap[
        reader.readStringOrNull(offsets[0])],
    defaultValue: reader.readStringOrNull(offsets[1]),
    flex: reader.readLongOrNull(offsets[2]),
    key: reader.readStringOrNull(offsets[3]),
    title: reader.readStringOrNull(offsets[4]),
  );
  return object;
}

P _reportFieldConfigEntityDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (_ReportFieldConfigEntityalignValueEnumMap[
          reader.readStringOrNull(offset)]) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    case 2:
      return (reader.readLongOrNull(offset)) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    case 4:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _ReportFieldConfigEntityalignEnumValueMap = {
  r'left': r'left',
  r'right': r'right',
  r'center': r'center',
  r'justify': r'justify',
};
const _ReportFieldConfigEntityalignValueEnumMap = {
  r'left': ColumnAlignment.left,
  r'right': ColumnAlignment.right,
  r'center': ColumnAlignment.center,
  r'justify': ColumnAlignment.justify,
};

extension ReportFieldConfigEntityQueryFilter on QueryBuilder<
    ReportFieldConfigEntity, ReportFieldConfigEntity, QFilterCondition> {
  QueryBuilder<ReportFieldConfigEntity, ReportFieldConfigEntity,
      QAfterFilterCondition> alignIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'align',
      ));
    });
  }

  QueryBuilder<ReportFieldConfigEntity, ReportFieldConfigEntity,
      QAfterFilterCondition> alignIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'align',
      ));
    });
  }

  QueryBuilder<ReportFieldConfigEntity, ReportFieldConfigEntity,
      QAfterFilterCondition> alignEqualTo(
    ColumnAlignment? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'align',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReportFieldConfigEntity, ReportFieldConfigEntity,
      QAfterFilterCondition> alignGreaterThan(
    ColumnAlignment? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'align',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReportFieldConfigEntity, ReportFieldConfigEntity,
      QAfterFilterCondition> alignLessThan(
    ColumnAlignment? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'align',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReportFieldConfigEntity, ReportFieldConfigEntity,
      QAfterFilterCondition> alignBetween(
    ColumnAlignment? lower,
    ColumnAlignment? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'align',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReportFieldConfigEntity, ReportFieldConfigEntity,
      QAfterFilterCondition> alignStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'align',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReportFieldConfigEntity, ReportFieldConfigEntity,
      QAfterFilterCondition> alignEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'align',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReportFieldConfigEntity, ReportFieldConfigEntity,
          QAfterFilterCondition>
      alignContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'align',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReportFieldConfigEntity, ReportFieldConfigEntity,
          QAfterFilterCondition>
      alignMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'align',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReportFieldConfigEntity, ReportFieldConfigEntity,
      QAfterFilterCondition> alignIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'align',
        value: '',
      ));
    });
  }

  QueryBuilder<ReportFieldConfigEntity, ReportFieldConfigEntity,
      QAfterFilterCondition> alignIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'align',
        value: '',
      ));
    });
  }

  QueryBuilder<ReportFieldConfigEntity, ReportFieldConfigEntity,
      QAfterFilterCondition> defaultValueIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'defaultValue',
      ));
    });
  }

  QueryBuilder<ReportFieldConfigEntity, ReportFieldConfigEntity,
      QAfterFilterCondition> defaultValueIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'defaultValue',
      ));
    });
  }

  QueryBuilder<ReportFieldConfigEntity, ReportFieldConfigEntity,
      QAfterFilterCondition> defaultValueEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'defaultValue',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReportFieldConfigEntity, ReportFieldConfigEntity,
      QAfterFilterCondition> defaultValueGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'defaultValue',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReportFieldConfigEntity, ReportFieldConfigEntity,
      QAfterFilterCondition> defaultValueLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'defaultValue',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReportFieldConfigEntity, ReportFieldConfigEntity,
      QAfterFilterCondition> defaultValueBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'defaultValue',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReportFieldConfigEntity, ReportFieldConfigEntity,
      QAfterFilterCondition> defaultValueStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'defaultValue',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReportFieldConfigEntity, ReportFieldConfigEntity,
      QAfterFilterCondition> defaultValueEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'defaultValue',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReportFieldConfigEntity, ReportFieldConfigEntity,
          QAfterFilterCondition>
      defaultValueContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'defaultValue',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReportFieldConfigEntity, ReportFieldConfigEntity,
          QAfterFilterCondition>
      defaultValueMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'defaultValue',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReportFieldConfigEntity, ReportFieldConfigEntity,
      QAfterFilterCondition> defaultValueIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'defaultValue',
        value: '',
      ));
    });
  }

  QueryBuilder<ReportFieldConfigEntity, ReportFieldConfigEntity,
      QAfterFilterCondition> defaultValueIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'defaultValue',
        value: '',
      ));
    });
  }

  QueryBuilder<ReportFieldConfigEntity, ReportFieldConfigEntity,
      QAfterFilterCondition> flexIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'flex',
      ));
    });
  }

  QueryBuilder<ReportFieldConfigEntity, ReportFieldConfigEntity,
      QAfterFilterCondition> flexIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'flex',
      ));
    });
  }

  QueryBuilder<ReportFieldConfigEntity, ReportFieldConfigEntity,
      QAfterFilterCondition> flexEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'flex',
        value: value,
      ));
    });
  }

  QueryBuilder<ReportFieldConfigEntity, ReportFieldConfigEntity,
      QAfterFilterCondition> flexGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'flex',
        value: value,
      ));
    });
  }

  QueryBuilder<ReportFieldConfigEntity, ReportFieldConfigEntity,
      QAfterFilterCondition> flexLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'flex',
        value: value,
      ));
    });
  }

  QueryBuilder<ReportFieldConfigEntity, ReportFieldConfigEntity,
      QAfterFilterCondition> flexBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'flex',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ReportFieldConfigEntity, ReportFieldConfigEntity,
      QAfterFilterCondition> keyIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'key',
      ));
    });
  }

  QueryBuilder<ReportFieldConfigEntity, ReportFieldConfigEntity,
      QAfterFilterCondition> keyIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'key',
      ));
    });
  }

  QueryBuilder<ReportFieldConfigEntity, ReportFieldConfigEntity,
      QAfterFilterCondition> keyEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'key',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReportFieldConfigEntity, ReportFieldConfigEntity,
      QAfterFilterCondition> keyGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'key',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReportFieldConfigEntity, ReportFieldConfigEntity,
      QAfterFilterCondition> keyLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'key',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReportFieldConfigEntity, ReportFieldConfigEntity,
      QAfterFilterCondition> keyBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'key',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReportFieldConfigEntity, ReportFieldConfigEntity,
      QAfterFilterCondition> keyStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'key',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReportFieldConfigEntity, ReportFieldConfigEntity,
      QAfterFilterCondition> keyEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'key',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReportFieldConfigEntity, ReportFieldConfigEntity,
          QAfterFilterCondition>
      keyContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'key',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReportFieldConfigEntity, ReportFieldConfigEntity,
          QAfterFilterCondition>
      keyMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'key',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReportFieldConfigEntity, ReportFieldConfigEntity,
      QAfterFilterCondition> keyIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'key',
        value: '',
      ));
    });
  }

  QueryBuilder<ReportFieldConfigEntity, ReportFieldConfigEntity,
      QAfterFilterCondition> keyIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'key',
        value: '',
      ));
    });
  }

  QueryBuilder<ReportFieldConfigEntity, ReportFieldConfigEntity,
      QAfterFilterCondition> titleIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'title',
      ));
    });
  }

  QueryBuilder<ReportFieldConfigEntity, ReportFieldConfigEntity,
      QAfterFilterCondition> titleIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'title',
      ));
    });
  }

  QueryBuilder<ReportFieldConfigEntity, ReportFieldConfigEntity,
      QAfterFilterCondition> titleEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReportFieldConfigEntity, ReportFieldConfigEntity,
      QAfterFilterCondition> titleGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReportFieldConfigEntity, ReportFieldConfigEntity,
      QAfterFilterCondition> titleLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReportFieldConfigEntity, ReportFieldConfigEntity,
      QAfterFilterCondition> titleBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'title',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReportFieldConfigEntity, ReportFieldConfigEntity,
      QAfterFilterCondition> titleStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReportFieldConfigEntity, ReportFieldConfigEntity,
      QAfterFilterCondition> titleEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReportFieldConfigEntity, ReportFieldConfigEntity,
          QAfterFilterCondition>
      titleContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReportFieldConfigEntity, ReportFieldConfigEntity,
          QAfterFilterCondition>
      titleMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'title',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReportFieldConfigEntity, ReportFieldConfigEntity,
      QAfterFilterCondition> titleIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'title',
        value: '',
      ));
    });
  }

  QueryBuilder<ReportFieldConfigEntity, ReportFieldConfigEntity,
      QAfterFilterCondition> titleIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'title',
        value: '',
      ));
    });
  }
}

extension ReportFieldConfigEntityQueryObject on QueryBuilder<
    ReportFieldConfigEntity, ReportFieldConfigEntity, QFilterCondition> {}
