// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'deals_entity.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters

extension GetDealsEntityCollection on Isar {
  IsarCollection<DealsEntity> get dealsEntitys => this.collection();
}

const DealsEntitySchema = CollectionSchema(
  name: r'DealsEntity',
  id: 792286303535219734,
  properties: {
    r'amountCap': PropertySchema(
      id: 0,
      name: r'amountCap',
      type: IsarType.double,
    ),
    r'dealFields': PropertySchema(
      id: 1,
      name: r'dealFields',
      type: IsarType.objectList,
      target: r'DealFieldsTest',
    ),
    r'dealId': PropertySchema(
      id: 2,
      name: r'dealId',
      type: IsarType.string,
    ),
    r'dealRef': PropertySchema(
      id: 3,
      name: r'dealRef',
      type: IsarType.stringList,
    ),
    r'description': PropertySchema(
      id: 4,
      name: r'description',
      type: IsarType.string,
    ),
    r'endEndDate': PropertySchema(
      id: 5,
      name: r'endEndDate',
      type: IsarType.dateTime,
    ),
    r'items': PropertySchema(
      id: 6,
      name: r'items',
      type: IsarType.objectList,
      target: r'DealItem',
    ),
    r'startDate': PropertySchema(
      id: 7,
      name: r'startDate',
      type: IsarType.dateTime,
    ),
    r'subTotalMax': PropertySchema(
      id: 8,
      name: r'subTotalMax',
      type: IsarType.double,
    ),
    r'subTotalMin': PropertySchema(
      id: 9,
      name: r'subTotalMin',
      type: IsarType.double,
    )
  },
  estimateSize: _dealsEntityEstimateSize,
  serialize: _dealsEntitySerialize,
  deserialize: _dealsEntityDeserialize,
  deserializeProp: _dealsEntityDeserializeProp,
  idName: r'id',
  indexes: {
    r'dealId': IndexSchema(
      id: 3337777272859764116,
      name: r'dealId',
      unique: true,
      replace: true,
      properties: [
        IndexPropertySchema(
          name: r'dealId',
          type: IndexType.value,
          caseSensitive: true,
        )
      ],
    ),
    r'startDate': IndexSchema(
      id: 7723980484494730382,
      name: r'startDate',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'startDate',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    ),
    r'dealRef': IndexSchema(
      id: 2234742826148619510,
      name: r'dealRef',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'dealRef',
          type: IndexType.value,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {
    r'DealFieldsTest': DealFieldsTestSchema,
    r'DealItem': DealItemSchema
  },
  getId: _dealsEntityGetId,
  getLinks: _dealsEntityGetLinks,
  attach: _dealsEntityAttach,
  version: '3.0.5',
);

int _dealsEntityEstimateSize(
  DealsEntity object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.dealFields.length * 3;
  {
    final offsets = allOffsets[DealFieldsTest]!;
    for (var i = 0; i < object.dealFields.length; i++) {
      final value = object.dealFields[i];
      bytesCount +=
          DealFieldsTestSchema.estimateSize(value, offsets, allOffsets);
    }
  }
  bytesCount += 3 + object.dealId.length * 3;
  bytesCount += 3 + object.dealRef.length * 3;
  {
    for (var i = 0; i < object.dealRef.length; i++) {
      final value = object.dealRef[i];
      bytesCount += value.length * 3;
    }
  }
  {
    final value = object.description;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.items.length * 3;
  {
    final offsets = allOffsets[DealItem]!;
    for (var i = 0; i < object.items.length; i++) {
      final value = object.items[i];
      bytesCount += DealItemSchema.estimateSize(value, offsets, allOffsets);
    }
  }
  return bytesCount;
}

void _dealsEntitySerialize(
  DealsEntity object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDouble(offsets[0], object.amountCap);
  writer.writeObjectList<DealFieldsTest>(
    offsets[1],
    allOffsets,
    DealFieldsTestSchema.serialize,
    object.dealFields,
  );
  writer.writeString(offsets[2], object.dealId);
  writer.writeStringList(offsets[3], object.dealRef);
  writer.writeString(offsets[4], object.description);
  writer.writeDateTime(offsets[5], object.endEndDate);
  writer.writeObjectList<DealItem>(
    offsets[6],
    allOffsets,
    DealItemSchema.serialize,
    object.items,
  );
  writer.writeDateTime(offsets[7], object.startDate);
  writer.writeDouble(offsets[8], object.subTotalMax);
  writer.writeDouble(offsets[9], object.subTotalMin);
}

DealsEntity _dealsEntityDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = DealsEntity(
    amountCap: reader.readDoubleOrNull(offsets[0]),
    dealFields: reader.readObjectList<DealFieldsTest>(
          offsets[1],
          DealFieldsTestSchema.deserialize,
          allOffsets,
          DealFieldsTest(),
        ) ??
        const [],
    dealId: reader.readString(offsets[2]),
    dealRef: reader.readStringList(offsets[3]) ?? const [],
    description: reader.readStringOrNull(offsets[4]),
    endEndDate: reader.readDateTimeOrNull(offsets[5]),
    id: id,
    items: reader.readObjectList<DealItem>(
          offsets[6],
          DealItemSchema.deserialize,
          allOffsets,
          DealItem(),
        ) ??
        const [],
    startDate: reader.readDateTimeOrNull(offsets[7]),
    subTotalMax: reader.readDoubleOrNull(offsets[8]),
    subTotalMin: reader.readDoubleOrNull(offsets[9]),
  );
  return object;
}

P _dealsEntityDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDoubleOrNull(offset)) as P;
    case 1:
      return (reader.readObjectList<DealFieldsTest>(
            offset,
            DealFieldsTestSchema.deserialize,
            allOffsets,
            DealFieldsTest(),
          ) ??
          const []) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readStringList(offset) ?? const []) as P;
    case 4:
      return (reader.readStringOrNull(offset)) as P;
    case 5:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 6:
      return (reader.readObjectList<DealItem>(
            offset,
            DealItemSchema.deserialize,
            allOffsets,
            DealItem(),
          ) ??
          const []) as P;
    case 7:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 8:
      return (reader.readDoubleOrNull(offset)) as P;
    case 9:
      return (reader.readDoubleOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _dealsEntityGetId(DealsEntity object) {
  return object.id ?? Isar.autoIncrement;
}

List<IsarLinkBase<dynamic>> _dealsEntityGetLinks(DealsEntity object) {
  return [];
}

void _dealsEntityAttach(
    IsarCollection<dynamic> col, Id id, DealsEntity object) {}

extension DealsEntityByIndex on IsarCollection<DealsEntity> {
  Future<DealsEntity?> getByDealId(String dealId) {
    return getByIndex(r'dealId', [dealId]);
  }

  DealsEntity? getByDealIdSync(String dealId) {
    return getByIndexSync(r'dealId', [dealId]);
  }

  Future<bool> deleteByDealId(String dealId) {
    return deleteByIndex(r'dealId', [dealId]);
  }

  bool deleteByDealIdSync(String dealId) {
    return deleteByIndexSync(r'dealId', [dealId]);
  }

  Future<List<DealsEntity?>> getAllByDealId(List<String> dealIdValues) {
    final values = dealIdValues.map((e) => [e]).toList();
    return getAllByIndex(r'dealId', values);
  }

  List<DealsEntity?> getAllByDealIdSync(List<String> dealIdValues) {
    final values = dealIdValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'dealId', values);
  }

  Future<int> deleteAllByDealId(List<String> dealIdValues) {
    final values = dealIdValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'dealId', values);
  }

  int deleteAllByDealIdSync(List<String> dealIdValues) {
    final values = dealIdValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'dealId', values);
  }

  Future<Id> putByDealId(DealsEntity object) {
    return putByIndex(r'dealId', object);
  }

  Id putByDealIdSync(DealsEntity object, {bool saveLinks = true}) {
    return putByIndexSync(r'dealId', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByDealId(List<DealsEntity> objects) {
    return putAllByIndex(r'dealId', objects);
  }

  List<Id> putAllByDealIdSync(List<DealsEntity> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'dealId', objects, saveLinks: saveLinks);
  }
}

extension DealsEntityQueryWhereSort
    on QueryBuilder<DealsEntity, DealsEntity, QWhere> {
  QueryBuilder<DealsEntity, DealsEntity, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<DealsEntity, DealsEntity, QAfterWhere> anyDealId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'dealId'),
      );
    });
  }

  QueryBuilder<DealsEntity, DealsEntity, QAfterWhere> anyStartDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'startDate'),
      );
    });
  }

  QueryBuilder<DealsEntity, DealsEntity, QAfterWhere> anyDealRefElement() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'dealRef'),
      );
    });
  }
}

extension DealsEntityQueryWhere
    on QueryBuilder<DealsEntity, DealsEntity, QWhereClause> {
  QueryBuilder<DealsEntity, DealsEntity, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<DealsEntity, DealsEntity, QAfterWhereClause> idNotEqualTo(
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

  QueryBuilder<DealsEntity, DealsEntity, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<DealsEntity, DealsEntity, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<DealsEntity, DealsEntity, QAfterWhereClause> idBetween(
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

  QueryBuilder<DealsEntity, DealsEntity, QAfterWhereClause> dealIdEqualTo(
      String dealId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'dealId',
        value: [dealId],
      ));
    });
  }

  QueryBuilder<DealsEntity, DealsEntity, QAfterWhereClause> dealIdNotEqualTo(
      String dealId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'dealId',
              lower: [],
              upper: [dealId],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'dealId',
              lower: [dealId],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'dealId',
              lower: [dealId],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'dealId',
              lower: [],
              upper: [dealId],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<DealsEntity, DealsEntity, QAfterWhereClause> dealIdGreaterThan(
    String dealId, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'dealId',
        lower: [dealId],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<DealsEntity, DealsEntity, QAfterWhereClause> dealIdLessThan(
    String dealId, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'dealId',
        lower: [],
        upper: [dealId],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<DealsEntity, DealsEntity, QAfterWhereClause> dealIdBetween(
    String lowerDealId,
    String upperDealId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'dealId',
        lower: [lowerDealId],
        includeLower: includeLower,
        upper: [upperDealId],
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<DealsEntity, DealsEntity, QAfterWhereClause> dealIdStartsWith(
      String DealIdPrefix) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'dealId',
        lower: [DealIdPrefix],
        upper: ['$DealIdPrefix\u{FFFFF}'],
      ));
    });
  }

  QueryBuilder<DealsEntity, DealsEntity, QAfterWhereClause> dealIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'dealId',
        value: [''],
      ));
    });
  }

  QueryBuilder<DealsEntity, DealsEntity, QAfterWhereClause> dealIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.lessThan(
              indexName: r'dealId',
              upper: [''],
            ))
            .addWhereClause(IndexWhereClause.greaterThan(
              indexName: r'dealId',
              lower: [''],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.greaterThan(
              indexName: r'dealId',
              lower: [''],
            ))
            .addWhereClause(IndexWhereClause.lessThan(
              indexName: r'dealId',
              upper: [''],
            ));
      }
    });
  }

  QueryBuilder<DealsEntity, DealsEntity, QAfterWhereClause> startDateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'startDate',
        value: [null],
      ));
    });
  }

  QueryBuilder<DealsEntity, DealsEntity, QAfterWhereClause>
      startDateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'startDate',
        lower: [null],
        includeLower: false,
        upper: [],
      ));
    });
  }

  QueryBuilder<DealsEntity, DealsEntity, QAfterWhereClause> startDateEqualTo(
      DateTime? startDate) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'startDate',
        value: [startDate],
      ));
    });
  }

  QueryBuilder<DealsEntity, DealsEntity, QAfterWhereClause> startDateNotEqualTo(
      DateTime? startDate) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'startDate',
              lower: [],
              upper: [startDate],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'startDate',
              lower: [startDate],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'startDate',
              lower: [startDate],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'startDate',
              lower: [],
              upper: [startDate],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<DealsEntity, DealsEntity, QAfterWhereClause>
      startDateGreaterThan(
    DateTime? startDate, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'startDate',
        lower: [startDate],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<DealsEntity, DealsEntity, QAfterWhereClause> startDateLessThan(
    DateTime? startDate, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'startDate',
        lower: [],
        upper: [startDate],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<DealsEntity, DealsEntity, QAfterWhereClause> startDateBetween(
    DateTime? lowerStartDate,
    DateTime? upperStartDate, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'startDate',
        lower: [lowerStartDate],
        includeLower: includeLower,
        upper: [upperStartDate],
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<DealsEntity, DealsEntity, QAfterWhereClause>
      dealRefElementEqualTo(String dealRefElement) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'dealRef',
        value: [dealRefElement],
      ));
    });
  }

  QueryBuilder<DealsEntity, DealsEntity, QAfterWhereClause>
      dealRefElementNotEqualTo(String dealRefElement) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'dealRef',
              lower: [],
              upper: [dealRefElement],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'dealRef',
              lower: [dealRefElement],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'dealRef',
              lower: [dealRefElement],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'dealRef',
              lower: [],
              upper: [dealRefElement],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<DealsEntity, DealsEntity, QAfterWhereClause>
      dealRefElementGreaterThan(
    String dealRefElement, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'dealRef',
        lower: [dealRefElement],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<DealsEntity, DealsEntity, QAfterWhereClause>
      dealRefElementLessThan(
    String dealRefElement, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'dealRef',
        lower: [],
        upper: [dealRefElement],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<DealsEntity, DealsEntity, QAfterWhereClause>
      dealRefElementBetween(
    String lowerDealRefElement,
    String upperDealRefElement, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'dealRef',
        lower: [lowerDealRefElement],
        includeLower: includeLower,
        upper: [upperDealRefElement],
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<DealsEntity, DealsEntity, QAfterWhereClause>
      dealRefElementStartsWith(String DealRefElementPrefix) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'dealRef',
        lower: [DealRefElementPrefix],
        upper: ['$DealRefElementPrefix\u{FFFFF}'],
      ));
    });
  }

  QueryBuilder<DealsEntity, DealsEntity, QAfterWhereClause>
      dealRefElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'dealRef',
        value: [''],
      ));
    });
  }

  QueryBuilder<DealsEntity, DealsEntity, QAfterWhereClause>
      dealRefElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.lessThan(
              indexName: r'dealRef',
              upper: [''],
            ))
            .addWhereClause(IndexWhereClause.greaterThan(
              indexName: r'dealRef',
              lower: [''],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.greaterThan(
              indexName: r'dealRef',
              lower: [''],
            ))
            .addWhereClause(IndexWhereClause.lessThan(
              indexName: r'dealRef',
              upper: [''],
            ));
      }
    });
  }
}

extension DealsEntityQueryFilter
    on QueryBuilder<DealsEntity, DealsEntity, QFilterCondition> {
  QueryBuilder<DealsEntity, DealsEntity, QAfterFilterCondition>
      amountCapIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'amountCap',
      ));
    });
  }

  QueryBuilder<DealsEntity, DealsEntity, QAfterFilterCondition>
      amountCapIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'amountCap',
      ));
    });
  }

  QueryBuilder<DealsEntity, DealsEntity, QAfterFilterCondition>
      amountCapEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'amountCap',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DealsEntity, DealsEntity, QAfterFilterCondition>
      amountCapGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'amountCap',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DealsEntity, DealsEntity, QAfterFilterCondition>
      amountCapLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'amountCap',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DealsEntity, DealsEntity, QAfterFilterCondition>
      amountCapBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'amountCap',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DealsEntity, DealsEntity, QAfterFilterCondition>
      dealFieldsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'dealFields',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<DealsEntity, DealsEntity, QAfterFilterCondition>
      dealFieldsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'dealFields',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<DealsEntity, DealsEntity, QAfterFilterCondition>
      dealFieldsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'dealFields',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<DealsEntity, DealsEntity, QAfterFilterCondition>
      dealFieldsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'dealFields',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<DealsEntity, DealsEntity, QAfterFilterCondition>
      dealFieldsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'dealFields',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<DealsEntity, DealsEntity, QAfterFilterCondition>
      dealFieldsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'dealFields',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<DealsEntity, DealsEntity, QAfterFilterCondition> dealIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'dealId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DealsEntity, DealsEntity, QAfterFilterCondition>
      dealIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'dealId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DealsEntity, DealsEntity, QAfterFilterCondition> dealIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'dealId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DealsEntity, DealsEntity, QAfterFilterCondition> dealIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'dealId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DealsEntity, DealsEntity, QAfterFilterCondition>
      dealIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'dealId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DealsEntity, DealsEntity, QAfterFilterCondition> dealIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'dealId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DealsEntity, DealsEntity, QAfterFilterCondition> dealIdContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'dealId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DealsEntity, DealsEntity, QAfterFilterCondition> dealIdMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'dealId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DealsEntity, DealsEntity, QAfterFilterCondition>
      dealIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'dealId',
        value: '',
      ));
    });
  }

  QueryBuilder<DealsEntity, DealsEntity, QAfterFilterCondition>
      dealIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'dealId',
        value: '',
      ));
    });
  }

  QueryBuilder<DealsEntity, DealsEntity, QAfterFilterCondition>
      dealRefElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'dealRef',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DealsEntity, DealsEntity, QAfterFilterCondition>
      dealRefElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'dealRef',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DealsEntity, DealsEntity, QAfterFilterCondition>
      dealRefElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'dealRef',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DealsEntity, DealsEntity, QAfterFilterCondition>
      dealRefElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'dealRef',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DealsEntity, DealsEntity, QAfterFilterCondition>
      dealRefElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'dealRef',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DealsEntity, DealsEntity, QAfterFilterCondition>
      dealRefElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'dealRef',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DealsEntity, DealsEntity, QAfterFilterCondition>
      dealRefElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'dealRef',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DealsEntity, DealsEntity, QAfterFilterCondition>
      dealRefElementMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'dealRef',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DealsEntity, DealsEntity, QAfterFilterCondition>
      dealRefElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'dealRef',
        value: '',
      ));
    });
  }

  QueryBuilder<DealsEntity, DealsEntity, QAfterFilterCondition>
      dealRefElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'dealRef',
        value: '',
      ));
    });
  }

  QueryBuilder<DealsEntity, DealsEntity, QAfterFilterCondition>
      dealRefLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'dealRef',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<DealsEntity, DealsEntity, QAfterFilterCondition>
      dealRefIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'dealRef',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<DealsEntity, DealsEntity, QAfterFilterCondition>
      dealRefIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'dealRef',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<DealsEntity, DealsEntity, QAfterFilterCondition>
      dealRefLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'dealRef',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<DealsEntity, DealsEntity, QAfterFilterCondition>
      dealRefLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'dealRef',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<DealsEntity, DealsEntity, QAfterFilterCondition>
      dealRefLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'dealRef',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<DealsEntity, DealsEntity, QAfterFilterCondition>
      descriptionIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'description',
      ));
    });
  }

  QueryBuilder<DealsEntity, DealsEntity, QAfterFilterCondition>
      descriptionIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'description',
      ));
    });
  }

  QueryBuilder<DealsEntity, DealsEntity, QAfterFilterCondition>
      descriptionEqualTo(
    String? value, {
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

  QueryBuilder<DealsEntity, DealsEntity, QAfterFilterCondition>
      descriptionGreaterThan(
    String? value, {
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

  QueryBuilder<DealsEntity, DealsEntity, QAfterFilterCondition>
      descriptionLessThan(
    String? value, {
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

  QueryBuilder<DealsEntity, DealsEntity, QAfterFilterCondition>
      descriptionBetween(
    String? lower,
    String? upper, {
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

  QueryBuilder<DealsEntity, DealsEntity, QAfterFilterCondition>
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

  QueryBuilder<DealsEntity, DealsEntity, QAfterFilterCondition>
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

  QueryBuilder<DealsEntity, DealsEntity, QAfterFilterCondition>
      descriptionContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DealsEntity, DealsEntity, QAfterFilterCondition>
      descriptionMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'description',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DealsEntity, DealsEntity, QAfterFilterCondition>
      descriptionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'description',
        value: '',
      ));
    });
  }

  QueryBuilder<DealsEntity, DealsEntity, QAfterFilterCondition>
      descriptionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'description',
        value: '',
      ));
    });
  }

  QueryBuilder<DealsEntity, DealsEntity, QAfterFilterCondition>
      endEndDateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'endEndDate',
      ));
    });
  }

  QueryBuilder<DealsEntity, DealsEntity, QAfterFilterCondition>
      endEndDateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'endEndDate',
      ));
    });
  }

  QueryBuilder<DealsEntity, DealsEntity, QAfterFilterCondition>
      endEndDateEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'endEndDate',
        value: value,
      ));
    });
  }

  QueryBuilder<DealsEntity, DealsEntity, QAfterFilterCondition>
      endEndDateGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'endEndDate',
        value: value,
      ));
    });
  }

  QueryBuilder<DealsEntity, DealsEntity, QAfterFilterCondition>
      endEndDateLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'endEndDate',
        value: value,
      ));
    });
  }

  QueryBuilder<DealsEntity, DealsEntity, QAfterFilterCondition>
      endEndDateBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'endEndDate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<DealsEntity, DealsEntity, QAfterFilterCondition> idIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<DealsEntity, DealsEntity, QAfterFilterCondition> idIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<DealsEntity, DealsEntity, QAfterFilterCondition> idEqualTo(
      Id? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<DealsEntity, DealsEntity, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<DealsEntity, DealsEntity, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<DealsEntity, DealsEntity, QAfterFilterCondition> idBetween(
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

  QueryBuilder<DealsEntity, DealsEntity, QAfterFilterCondition>
      itemsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'items',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<DealsEntity, DealsEntity, QAfterFilterCondition> itemsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'items',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<DealsEntity, DealsEntity, QAfterFilterCondition>
      itemsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'items',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<DealsEntity, DealsEntity, QAfterFilterCondition>
      itemsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'items',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<DealsEntity, DealsEntity, QAfterFilterCondition>
      itemsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'items',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<DealsEntity, DealsEntity, QAfterFilterCondition>
      itemsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'items',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<DealsEntity, DealsEntity, QAfterFilterCondition>
      startDateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'startDate',
      ));
    });
  }

  QueryBuilder<DealsEntity, DealsEntity, QAfterFilterCondition>
      startDateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'startDate',
      ));
    });
  }

  QueryBuilder<DealsEntity, DealsEntity, QAfterFilterCondition>
      startDateEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'startDate',
        value: value,
      ));
    });
  }

  QueryBuilder<DealsEntity, DealsEntity, QAfterFilterCondition>
      startDateGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'startDate',
        value: value,
      ));
    });
  }

  QueryBuilder<DealsEntity, DealsEntity, QAfterFilterCondition>
      startDateLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'startDate',
        value: value,
      ));
    });
  }

  QueryBuilder<DealsEntity, DealsEntity, QAfterFilterCondition>
      startDateBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'startDate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<DealsEntity, DealsEntity, QAfterFilterCondition>
      subTotalMaxIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'subTotalMax',
      ));
    });
  }

  QueryBuilder<DealsEntity, DealsEntity, QAfterFilterCondition>
      subTotalMaxIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'subTotalMax',
      ));
    });
  }

  QueryBuilder<DealsEntity, DealsEntity, QAfterFilterCondition>
      subTotalMaxEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'subTotalMax',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DealsEntity, DealsEntity, QAfterFilterCondition>
      subTotalMaxGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'subTotalMax',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DealsEntity, DealsEntity, QAfterFilterCondition>
      subTotalMaxLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'subTotalMax',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DealsEntity, DealsEntity, QAfterFilterCondition>
      subTotalMaxBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'subTotalMax',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DealsEntity, DealsEntity, QAfterFilterCondition>
      subTotalMinIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'subTotalMin',
      ));
    });
  }

  QueryBuilder<DealsEntity, DealsEntity, QAfterFilterCondition>
      subTotalMinIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'subTotalMin',
      ));
    });
  }

  QueryBuilder<DealsEntity, DealsEntity, QAfterFilterCondition>
      subTotalMinEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'subTotalMin',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DealsEntity, DealsEntity, QAfterFilterCondition>
      subTotalMinGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'subTotalMin',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DealsEntity, DealsEntity, QAfterFilterCondition>
      subTotalMinLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'subTotalMin',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DealsEntity, DealsEntity, QAfterFilterCondition>
      subTotalMinBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'subTotalMin',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }
}

extension DealsEntityQueryObject
    on QueryBuilder<DealsEntity, DealsEntity, QFilterCondition> {
  QueryBuilder<DealsEntity, DealsEntity, QAfterFilterCondition>
      dealFieldsElement(FilterQuery<DealFieldsTest> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'dealFields');
    });
  }

  QueryBuilder<DealsEntity, DealsEntity, QAfterFilterCondition> itemsElement(
      FilterQuery<DealItem> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'items');
    });
  }
}

extension DealsEntityQueryLinks
    on QueryBuilder<DealsEntity, DealsEntity, QFilterCondition> {}

extension DealsEntityQuerySortBy
    on QueryBuilder<DealsEntity, DealsEntity, QSortBy> {
  QueryBuilder<DealsEntity, DealsEntity, QAfterSortBy> sortByAmountCap() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'amountCap', Sort.asc);
    });
  }

  QueryBuilder<DealsEntity, DealsEntity, QAfterSortBy> sortByAmountCapDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'amountCap', Sort.desc);
    });
  }

  QueryBuilder<DealsEntity, DealsEntity, QAfterSortBy> sortByDealId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dealId', Sort.asc);
    });
  }

  QueryBuilder<DealsEntity, DealsEntity, QAfterSortBy> sortByDealIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dealId', Sort.desc);
    });
  }

  QueryBuilder<DealsEntity, DealsEntity, QAfterSortBy> sortByDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.asc);
    });
  }

  QueryBuilder<DealsEntity, DealsEntity, QAfterSortBy> sortByDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.desc);
    });
  }

  QueryBuilder<DealsEntity, DealsEntity, QAfterSortBy> sortByEndEndDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'endEndDate', Sort.asc);
    });
  }

  QueryBuilder<DealsEntity, DealsEntity, QAfterSortBy> sortByEndEndDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'endEndDate', Sort.desc);
    });
  }

  QueryBuilder<DealsEntity, DealsEntity, QAfterSortBy> sortByStartDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startDate', Sort.asc);
    });
  }

  QueryBuilder<DealsEntity, DealsEntity, QAfterSortBy> sortByStartDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startDate', Sort.desc);
    });
  }

  QueryBuilder<DealsEntity, DealsEntity, QAfterSortBy> sortBySubTotalMax() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'subTotalMax', Sort.asc);
    });
  }

  QueryBuilder<DealsEntity, DealsEntity, QAfterSortBy> sortBySubTotalMaxDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'subTotalMax', Sort.desc);
    });
  }

  QueryBuilder<DealsEntity, DealsEntity, QAfterSortBy> sortBySubTotalMin() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'subTotalMin', Sort.asc);
    });
  }

  QueryBuilder<DealsEntity, DealsEntity, QAfterSortBy> sortBySubTotalMinDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'subTotalMin', Sort.desc);
    });
  }
}

extension DealsEntityQuerySortThenBy
    on QueryBuilder<DealsEntity, DealsEntity, QSortThenBy> {
  QueryBuilder<DealsEntity, DealsEntity, QAfterSortBy> thenByAmountCap() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'amountCap', Sort.asc);
    });
  }

  QueryBuilder<DealsEntity, DealsEntity, QAfterSortBy> thenByAmountCapDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'amountCap', Sort.desc);
    });
  }

  QueryBuilder<DealsEntity, DealsEntity, QAfterSortBy> thenByDealId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dealId', Sort.asc);
    });
  }

  QueryBuilder<DealsEntity, DealsEntity, QAfterSortBy> thenByDealIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dealId', Sort.desc);
    });
  }

  QueryBuilder<DealsEntity, DealsEntity, QAfterSortBy> thenByDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.asc);
    });
  }

  QueryBuilder<DealsEntity, DealsEntity, QAfterSortBy> thenByDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.desc);
    });
  }

  QueryBuilder<DealsEntity, DealsEntity, QAfterSortBy> thenByEndEndDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'endEndDate', Sort.asc);
    });
  }

  QueryBuilder<DealsEntity, DealsEntity, QAfterSortBy> thenByEndEndDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'endEndDate', Sort.desc);
    });
  }

  QueryBuilder<DealsEntity, DealsEntity, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<DealsEntity, DealsEntity, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<DealsEntity, DealsEntity, QAfterSortBy> thenByStartDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startDate', Sort.asc);
    });
  }

  QueryBuilder<DealsEntity, DealsEntity, QAfterSortBy> thenByStartDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startDate', Sort.desc);
    });
  }

  QueryBuilder<DealsEntity, DealsEntity, QAfterSortBy> thenBySubTotalMax() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'subTotalMax', Sort.asc);
    });
  }

  QueryBuilder<DealsEntity, DealsEntity, QAfterSortBy> thenBySubTotalMaxDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'subTotalMax', Sort.desc);
    });
  }

  QueryBuilder<DealsEntity, DealsEntity, QAfterSortBy> thenBySubTotalMin() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'subTotalMin', Sort.asc);
    });
  }

  QueryBuilder<DealsEntity, DealsEntity, QAfterSortBy> thenBySubTotalMinDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'subTotalMin', Sort.desc);
    });
  }
}

extension DealsEntityQueryWhereDistinct
    on QueryBuilder<DealsEntity, DealsEntity, QDistinct> {
  QueryBuilder<DealsEntity, DealsEntity, QDistinct> distinctByAmountCap() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'amountCap');
    });
  }

  QueryBuilder<DealsEntity, DealsEntity, QDistinct> distinctByDealId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'dealId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<DealsEntity, DealsEntity, QDistinct> distinctByDealRef() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'dealRef');
    });
  }

  QueryBuilder<DealsEntity, DealsEntity, QDistinct> distinctByDescription(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'description', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<DealsEntity, DealsEntity, QDistinct> distinctByEndEndDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'endEndDate');
    });
  }

  QueryBuilder<DealsEntity, DealsEntity, QDistinct> distinctByStartDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'startDate');
    });
  }

  QueryBuilder<DealsEntity, DealsEntity, QDistinct> distinctBySubTotalMax() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'subTotalMax');
    });
  }

  QueryBuilder<DealsEntity, DealsEntity, QDistinct> distinctBySubTotalMin() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'subTotalMin');
    });
  }
}

extension DealsEntityQueryProperty
    on QueryBuilder<DealsEntity, DealsEntity, QQueryProperty> {
  QueryBuilder<DealsEntity, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<DealsEntity, double?, QQueryOperations> amountCapProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'amountCap');
    });
  }

  QueryBuilder<DealsEntity, List<DealFieldsTest>, QQueryOperations>
      dealFieldsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'dealFields');
    });
  }

  QueryBuilder<DealsEntity, String, QQueryOperations> dealIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'dealId');
    });
  }

  QueryBuilder<DealsEntity, List<String>, QQueryOperations> dealRefProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'dealRef');
    });
  }

  QueryBuilder<DealsEntity, String?, QQueryOperations> descriptionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'description');
    });
  }

  QueryBuilder<DealsEntity, DateTime?, QQueryOperations> endEndDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'endEndDate');
    });
  }

  QueryBuilder<DealsEntity, List<DealItem>, QQueryOperations> itemsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'items');
    });
  }

  QueryBuilder<DealsEntity, DateTime?, QQueryOperations> startDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'startDate');
    });
  }

  QueryBuilder<DealsEntity, double?, QQueryOperations> subTotalMaxProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'subTotalMax');
    });
  }

  QueryBuilder<DealsEntity, double?, QQueryOperations> subTotalMinProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'subTotalMin');
    });
  }
}

// **************************************************************************
// IsarEmbeddedGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters

const DealFieldsTestSchema = Schema(
  name: r'DealFieldsTest',
  id: 5516956830337662011,
  properties: {
    r'matchingField': PropertySchema(
      id: 0,
      name: r'matchingField',
      type: IsarType.string,
      enumMap: _DealFieldsTestmatchingFieldEnumValueMap,
    ),
    r'matchingRule': PropertySchema(
      id: 1,
      name: r'matchingRule',
      type: IsarType.string,
    ),
    r'matchingRuleValue1': PropertySchema(
      id: 2,
      name: r'matchingRuleValue1',
      type: IsarType.string,
    ),
    r'matchingRuleValue2': PropertySchema(
      id: 3,
      name: r'matchingRuleValue2',
      type: IsarType.string,
    )
  },
  estimateSize: _dealFieldsTestEstimateSize,
  serialize: _dealFieldsTestSerialize,
  deserialize: _dealFieldsTestDeserialize,
  deserializeProp: _dealFieldsTestDeserializeProp,
);

int _dealFieldsTestEstimateSize(
  DealFieldsTest object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.matchingField;
    if (value != null) {
      bytesCount += 3 + value.name.length * 3;
    }
  }
  {
    final value = object.matchingRule;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.matchingRuleValue1;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.matchingRuleValue2;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _dealFieldsTestSerialize(
  DealFieldsTest object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.matchingField?.name);
  writer.writeString(offsets[1], object.matchingRule);
  writer.writeString(offsets[2], object.matchingRuleValue1);
  writer.writeString(offsets[3], object.matchingRuleValue2);
}

DealFieldsTest _dealFieldsTestDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = DealFieldsTest(
    matchingField: _DealFieldsTestmatchingFieldValueEnumMap[
        reader.readStringOrNull(offsets[0])],
    matchingRule: reader.readStringOrNull(offsets[1]),
    matchingRuleValue1: reader.readStringOrNull(offsets[2]),
    matchingRuleValue2: reader.readStringOrNull(offsets[3]),
  );
  return object;
}

P _dealFieldsTestDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (_DealFieldsTestmatchingFieldValueEnumMap[
          reader.readStringOrNull(offset)]) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _DealFieldsTestmatchingFieldEnumValueMap = {
  r'item': r'item',
  r'department': r'department',
};
const _DealFieldsTestmatchingFieldValueEnumMap = {
  r'item': MatchingField.item,
  r'department': MatchingField.department,
};

extension DealFieldsTestQueryFilter
    on QueryBuilder<DealFieldsTest, DealFieldsTest, QFilterCondition> {
  QueryBuilder<DealFieldsTest, DealFieldsTest, QAfterFilterCondition>
      matchingFieldIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'matchingField',
      ));
    });
  }

  QueryBuilder<DealFieldsTest, DealFieldsTest, QAfterFilterCondition>
      matchingFieldIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'matchingField',
      ));
    });
  }

  QueryBuilder<DealFieldsTest, DealFieldsTest, QAfterFilterCondition>
      matchingFieldEqualTo(
    MatchingField? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'matchingField',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DealFieldsTest, DealFieldsTest, QAfterFilterCondition>
      matchingFieldGreaterThan(
    MatchingField? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'matchingField',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DealFieldsTest, DealFieldsTest, QAfterFilterCondition>
      matchingFieldLessThan(
    MatchingField? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'matchingField',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DealFieldsTest, DealFieldsTest, QAfterFilterCondition>
      matchingFieldBetween(
    MatchingField? lower,
    MatchingField? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'matchingField',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DealFieldsTest, DealFieldsTest, QAfterFilterCondition>
      matchingFieldStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'matchingField',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DealFieldsTest, DealFieldsTest, QAfterFilterCondition>
      matchingFieldEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'matchingField',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DealFieldsTest, DealFieldsTest, QAfterFilterCondition>
      matchingFieldContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'matchingField',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DealFieldsTest, DealFieldsTest, QAfterFilterCondition>
      matchingFieldMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'matchingField',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DealFieldsTest, DealFieldsTest, QAfterFilterCondition>
      matchingFieldIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'matchingField',
        value: '',
      ));
    });
  }

  QueryBuilder<DealFieldsTest, DealFieldsTest, QAfterFilterCondition>
      matchingFieldIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'matchingField',
        value: '',
      ));
    });
  }

  QueryBuilder<DealFieldsTest, DealFieldsTest, QAfterFilterCondition>
      matchingRuleIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'matchingRule',
      ));
    });
  }

  QueryBuilder<DealFieldsTest, DealFieldsTest, QAfterFilterCondition>
      matchingRuleIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'matchingRule',
      ));
    });
  }

  QueryBuilder<DealFieldsTest, DealFieldsTest, QAfterFilterCondition>
      matchingRuleEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'matchingRule',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DealFieldsTest, DealFieldsTest, QAfterFilterCondition>
      matchingRuleGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'matchingRule',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DealFieldsTest, DealFieldsTest, QAfterFilterCondition>
      matchingRuleLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'matchingRule',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DealFieldsTest, DealFieldsTest, QAfterFilterCondition>
      matchingRuleBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'matchingRule',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DealFieldsTest, DealFieldsTest, QAfterFilterCondition>
      matchingRuleStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'matchingRule',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DealFieldsTest, DealFieldsTest, QAfterFilterCondition>
      matchingRuleEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'matchingRule',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DealFieldsTest, DealFieldsTest, QAfterFilterCondition>
      matchingRuleContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'matchingRule',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DealFieldsTest, DealFieldsTest, QAfterFilterCondition>
      matchingRuleMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'matchingRule',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DealFieldsTest, DealFieldsTest, QAfterFilterCondition>
      matchingRuleIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'matchingRule',
        value: '',
      ));
    });
  }

  QueryBuilder<DealFieldsTest, DealFieldsTest, QAfterFilterCondition>
      matchingRuleIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'matchingRule',
        value: '',
      ));
    });
  }

  QueryBuilder<DealFieldsTest, DealFieldsTest, QAfterFilterCondition>
      matchingRuleValue1IsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'matchingRuleValue1',
      ));
    });
  }

  QueryBuilder<DealFieldsTest, DealFieldsTest, QAfterFilterCondition>
      matchingRuleValue1IsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'matchingRuleValue1',
      ));
    });
  }

  QueryBuilder<DealFieldsTest, DealFieldsTest, QAfterFilterCondition>
      matchingRuleValue1EqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'matchingRuleValue1',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DealFieldsTest, DealFieldsTest, QAfterFilterCondition>
      matchingRuleValue1GreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'matchingRuleValue1',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DealFieldsTest, DealFieldsTest, QAfterFilterCondition>
      matchingRuleValue1LessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'matchingRuleValue1',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DealFieldsTest, DealFieldsTest, QAfterFilterCondition>
      matchingRuleValue1Between(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'matchingRuleValue1',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DealFieldsTest, DealFieldsTest, QAfterFilterCondition>
      matchingRuleValue1StartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'matchingRuleValue1',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DealFieldsTest, DealFieldsTest, QAfterFilterCondition>
      matchingRuleValue1EndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'matchingRuleValue1',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DealFieldsTest, DealFieldsTest, QAfterFilterCondition>
      matchingRuleValue1Contains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'matchingRuleValue1',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DealFieldsTest, DealFieldsTest, QAfterFilterCondition>
      matchingRuleValue1Matches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'matchingRuleValue1',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DealFieldsTest, DealFieldsTest, QAfterFilterCondition>
      matchingRuleValue1IsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'matchingRuleValue1',
        value: '',
      ));
    });
  }

  QueryBuilder<DealFieldsTest, DealFieldsTest, QAfterFilterCondition>
      matchingRuleValue1IsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'matchingRuleValue1',
        value: '',
      ));
    });
  }

  QueryBuilder<DealFieldsTest, DealFieldsTest, QAfterFilterCondition>
      matchingRuleValue2IsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'matchingRuleValue2',
      ));
    });
  }

  QueryBuilder<DealFieldsTest, DealFieldsTest, QAfterFilterCondition>
      matchingRuleValue2IsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'matchingRuleValue2',
      ));
    });
  }

  QueryBuilder<DealFieldsTest, DealFieldsTest, QAfterFilterCondition>
      matchingRuleValue2EqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'matchingRuleValue2',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DealFieldsTest, DealFieldsTest, QAfterFilterCondition>
      matchingRuleValue2GreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'matchingRuleValue2',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DealFieldsTest, DealFieldsTest, QAfterFilterCondition>
      matchingRuleValue2LessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'matchingRuleValue2',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DealFieldsTest, DealFieldsTest, QAfterFilterCondition>
      matchingRuleValue2Between(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'matchingRuleValue2',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DealFieldsTest, DealFieldsTest, QAfterFilterCondition>
      matchingRuleValue2StartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'matchingRuleValue2',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DealFieldsTest, DealFieldsTest, QAfterFilterCondition>
      matchingRuleValue2EndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'matchingRuleValue2',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DealFieldsTest, DealFieldsTest, QAfterFilterCondition>
      matchingRuleValue2Contains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'matchingRuleValue2',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DealFieldsTest, DealFieldsTest, QAfterFilterCondition>
      matchingRuleValue2Matches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'matchingRuleValue2',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DealFieldsTest, DealFieldsTest, QAfterFilterCondition>
      matchingRuleValue2IsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'matchingRuleValue2',
        value: '',
      ));
    });
  }

  QueryBuilder<DealFieldsTest, DealFieldsTest, QAfterFilterCondition>
      matchingRuleValue2IsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'matchingRuleValue2',
        value: '',
      ));
    });
  }
}

extension DealFieldsTestQueryObject
    on QueryBuilder<DealFieldsTest, DealFieldsTest, QFilterCondition> {}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters

const DealItemSchema = Schema(
  name: r'DealItem',
  id: 4292969764548989785,
  properties: {
    r'action': PropertySchema(
      id: 0,
      name: r'action',
      type: IsarType.string,
      enumMap: _DealItemactionEnumValueMap,
    ),
    r'actionQuantity': PropertySchema(
      id: 1,
      name: r'actionQuantity',
      type: IsarType.double,
    ),
    r'actionValue': PropertySchema(
      id: 2,
      name: r'actionValue',
      type: IsarType.double,
    ),
    r'maxQuantity': PropertySchema(
      id: 3,
      name: r'maxQuantity',
      type: IsarType.double,
    ),
    r'minItemTotal': PropertySchema(
      id: 4,
      name: r'minItemTotal',
      type: IsarType.double,
    ),
    r'minQuantity': PropertySchema(
      id: 5,
      name: r'minQuantity',
      type: IsarType.double,
    )
  },
  estimateSize: _dealItemEstimateSize,
  serialize: _dealItemSerialize,
  deserialize: _dealItemDeserialize,
  deserializeProp: _dealItemDeserializeProp,
);

int _dealItemEstimateSize(
  DealItem object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.action;
    if (value != null) {
      bytesCount += 3 + value.name.length * 3;
    }
  }
  return bytesCount;
}

void _dealItemSerialize(
  DealItem object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.action?.name);
  writer.writeDouble(offsets[1], object.actionQuantity);
  writer.writeDouble(offsets[2], object.actionValue);
  writer.writeDouble(offsets[3], object.maxQuantity);
  writer.writeDouble(offsets[4], object.minItemTotal);
  writer.writeDouble(offsets[5], object.minQuantity);
}

DealItem _dealItemDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = DealItem(
    action: _DealItemactionValueEnumMap[reader.readStringOrNull(offsets[0])],
    actionQuantity: reader.readDoubleOrNull(offsets[1]),
    actionValue: reader.readDoubleOrNull(offsets[2]),
    maxQuantity: reader.readDoubleOrNull(offsets[3]) ?? 1,
    minItemTotal: reader.readDoubleOrNull(offsets[4]),
    minQuantity: reader.readDoubleOrNull(offsets[5]) ?? 1,
  );
  return object;
}

P _dealItemDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (_DealItemactionValueEnumMap[reader.readStringOrNull(offset)])
          as P;
    case 1:
      return (reader.readDoubleOrNull(offset)) as P;
    case 2:
      return (reader.readDoubleOrNull(offset)) as P;
    case 3:
      return (reader.readDoubleOrNull(offset) ?? 1) as P;
    case 4:
      return (reader.readDoubleOrNull(offset)) as P;
    case 5:
      return (reader.readDoubleOrNull(offset) ?? 1) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _DealItemactionEnumValueMap = {
  r'newPrice': r'newPrice',
  r'percentOff': r'percentOff',
  r'currencyOff': r'currencyOff',
};
const _DealItemactionValueEnumMap = {
  r'newPrice': DealAction.newPrice,
  r'percentOff': DealAction.percentOff,
  r'currencyOff': DealAction.currencyOff,
};

extension DealItemQueryFilter
    on QueryBuilder<DealItem, DealItem, QFilterCondition> {
  QueryBuilder<DealItem, DealItem, QAfterFilterCondition> actionIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'action',
      ));
    });
  }

  QueryBuilder<DealItem, DealItem, QAfterFilterCondition> actionIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'action',
      ));
    });
  }

  QueryBuilder<DealItem, DealItem, QAfterFilterCondition> actionEqualTo(
    DealAction? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'action',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DealItem, DealItem, QAfterFilterCondition> actionGreaterThan(
    DealAction? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'action',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DealItem, DealItem, QAfterFilterCondition> actionLessThan(
    DealAction? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'action',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DealItem, DealItem, QAfterFilterCondition> actionBetween(
    DealAction? lower,
    DealAction? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'action',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DealItem, DealItem, QAfterFilterCondition> actionStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'action',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DealItem, DealItem, QAfterFilterCondition> actionEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'action',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DealItem, DealItem, QAfterFilterCondition> actionContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'action',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DealItem, DealItem, QAfterFilterCondition> actionMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'action',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DealItem, DealItem, QAfterFilterCondition> actionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'action',
        value: '',
      ));
    });
  }

  QueryBuilder<DealItem, DealItem, QAfterFilterCondition> actionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'action',
        value: '',
      ));
    });
  }

  QueryBuilder<DealItem, DealItem, QAfterFilterCondition>
      actionQuantityIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'actionQuantity',
      ));
    });
  }

  QueryBuilder<DealItem, DealItem, QAfterFilterCondition>
      actionQuantityIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'actionQuantity',
      ));
    });
  }

  QueryBuilder<DealItem, DealItem, QAfterFilterCondition> actionQuantityEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'actionQuantity',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DealItem, DealItem, QAfterFilterCondition>
      actionQuantityGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'actionQuantity',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DealItem, DealItem, QAfterFilterCondition>
      actionQuantityLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'actionQuantity',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DealItem, DealItem, QAfterFilterCondition> actionQuantityBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'actionQuantity',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DealItem, DealItem, QAfterFilterCondition> actionValueIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'actionValue',
      ));
    });
  }

  QueryBuilder<DealItem, DealItem, QAfterFilterCondition>
      actionValueIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'actionValue',
      ));
    });
  }

  QueryBuilder<DealItem, DealItem, QAfterFilterCondition> actionValueEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'actionValue',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DealItem, DealItem, QAfterFilterCondition>
      actionValueGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'actionValue',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DealItem, DealItem, QAfterFilterCondition> actionValueLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'actionValue',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DealItem, DealItem, QAfterFilterCondition> actionValueBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'actionValue',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DealItem, DealItem, QAfterFilterCondition> maxQuantityEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'maxQuantity',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DealItem, DealItem, QAfterFilterCondition>
      maxQuantityGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'maxQuantity',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DealItem, DealItem, QAfterFilterCondition> maxQuantityLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'maxQuantity',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DealItem, DealItem, QAfterFilterCondition> maxQuantityBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'maxQuantity',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DealItem, DealItem, QAfterFilterCondition> minItemTotalIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'minItemTotal',
      ));
    });
  }

  QueryBuilder<DealItem, DealItem, QAfterFilterCondition>
      minItemTotalIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'minItemTotal',
      ));
    });
  }

  QueryBuilder<DealItem, DealItem, QAfterFilterCondition> minItemTotalEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'minItemTotal',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DealItem, DealItem, QAfterFilterCondition>
      minItemTotalGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'minItemTotal',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DealItem, DealItem, QAfterFilterCondition> minItemTotalLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'minItemTotal',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DealItem, DealItem, QAfterFilterCondition> minItemTotalBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'minItemTotal',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DealItem, DealItem, QAfterFilterCondition> minQuantityEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'minQuantity',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DealItem, DealItem, QAfterFilterCondition>
      minQuantityGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'minQuantity',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DealItem, DealItem, QAfterFilterCondition> minQuantityLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'minQuantity',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DealItem, DealItem, QAfterFilterCondition> minQuantityBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'minQuantity',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }
}

extension DealItemQueryObject
    on QueryBuilder<DealItem, DealItem, QFilterCondition> {}
