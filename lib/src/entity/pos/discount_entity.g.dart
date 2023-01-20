// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'discount_entity.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters

extension GetDiscountEntityCollection on Isar {
  IsarCollection<DiscountEntity> get discountEntitys => this.collection();
}

const DiscountEntitySchema = CollectionSchema(
  name: r'DiscountEntity',
  id: -1772134003818676459,
  properties: {
    r'amount': PropertySchema(
      id: 0,
      name: r'amount',
      type: IsarType.double,
    ),
    r'description': PropertySchema(
      id: 1,
      name: r'description',
      type: IsarType.string,
    ),
    r'discountCode': PropertySchema(
      id: 2,
      name: r'discountCode',
      type: IsarType.string,
    ),
    r'discountGroupCode': PropertySchema(
      id: 3,
      name: r'discountGroupCode',
      type: IsarType.string,
    ),
    r'discountId': PropertySchema(
      id: 4,
      name: r'discountId',
      type: IsarType.string,
    ),
    r'discountType': PropertySchema(
      id: 5,
      name: r'discountType',
      type: IsarType.string,
    ),
    r'percent': PropertySchema(
      id: 6,
      name: r'percent',
      type: IsarType.double,
    )
  },
  estimateSize: _discountEntityEstimateSize,
  serialize: _discountEntitySerialize,
  deserialize: _discountEntityDeserialize,
  deserializeProp: _discountEntityDeserializeProp,
  idName: r'id',
  indexes: {
    r'discountId': IndexSchema(
      id: -4140893043458845452,
      name: r'discountId',
      unique: true,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'discountId',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _discountEntityGetId,
  getLinks: _discountEntityGetLinks,
  attach: _discountEntityAttach,
  version: '3.0.5',
);

int _discountEntityEstimateSize(
  DiscountEntity object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.description.length * 3;
  bytesCount += 3 + object.discountCode.length * 3;
  {
    final value = object.discountGroupCode;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.discountId.length * 3;
  bytesCount += 3 + object.discountType.length * 3;
  return bytesCount;
}

void _discountEntitySerialize(
  DiscountEntity object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDouble(offsets[0], object.amount);
  writer.writeString(offsets[1], object.description);
  writer.writeString(offsets[2], object.discountCode);
  writer.writeString(offsets[3], object.discountGroupCode);
  writer.writeString(offsets[4], object.discountId);
  writer.writeString(offsets[5], object.discountType);
  writer.writeDouble(offsets[6], object.percent);
}

DiscountEntity _discountEntityDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = DiscountEntity(
    amount: reader.readDoubleOrNull(offsets[0]),
    description: reader.readString(offsets[1]),
    discountCode: reader.readString(offsets[2]),
    discountGroupCode: reader.readStringOrNull(offsets[3]),
    discountId: reader.readString(offsets[4]),
    discountType: reader.readString(offsets[5]),
    id: id,
    percent: reader.readDoubleOrNull(offsets[6]),
  );
  return object;
}

P _discountEntityDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDoubleOrNull(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    case 4:
      return (reader.readString(offset)) as P;
    case 5:
      return (reader.readString(offset)) as P;
    case 6:
      return (reader.readDoubleOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _discountEntityGetId(DiscountEntity object) {
  return object.id ?? Isar.autoIncrement;
}

List<IsarLinkBase<dynamic>> _discountEntityGetLinks(DiscountEntity object) {
  return [];
}

void _discountEntityAttach(
    IsarCollection<dynamic> col, Id id, DiscountEntity object) {}

extension DiscountEntityByIndex on IsarCollection<DiscountEntity> {
  Future<DiscountEntity?> getByDiscountId(String discountId) {
    return getByIndex(r'discountId', [discountId]);
  }

  DiscountEntity? getByDiscountIdSync(String discountId) {
    return getByIndexSync(r'discountId', [discountId]);
  }

  Future<bool> deleteByDiscountId(String discountId) {
    return deleteByIndex(r'discountId', [discountId]);
  }

  bool deleteByDiscountIdSync(String discountId) {
    return deleteByIndexSync(r'discountId', [discountId]);
  }

  Future<List<DiscountEntity?>> getAllByDiscountId(
      List<String> discountIdValues) {
    final values = discountIdValues.map((e) => [e]).toList();
    return getAllByIndex(r'discountId', values);
  }

  List<DiscountEntity?> getAllByDiscountIdSync(List<String> discountIdValues) {
    final values = discountIdValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'discountId', values);
  }

  Future<int> deleteAllByDiscountId(List<String> discountIdValues) {
    final values = discountIdValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'discountId', values);
  }

  int deleteAllByDiscountIdSync(List<String> discountIdValues) {
    final values = discountIdValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'discountId', values);
  }

  Future<Id> putByDiscountId(DiscountEntity object) {
    return putByIndex(r'discountId', object);
  }

  Id putByDiscountIdSync(DiscountEntity object, {bool saveLinks = true}) {
    return putByIndexSync(r'discountId', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByDiscountId(List<DiscountEntity> objects) {
    return putAllByIndex(r'discountId', objects);
  }

  List<Id> putAllByDiscountIdSync(List<DiscountEntity> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'discountId', objects, saveLinks: saveLinks);
  }
}

extension DiscountEntityQueryWhereSort
    on QueryBuilder<DiscountEntity, DiscountEntity, QWhere> {
  QueryBuilder<DiscountEntity, DiscountEntity, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension DiscountEntityQueryWhere
    on QueryBuilder<DiscountEntity, DiscountEntity, QWhereClause> {
  QueryBuilder<DiscountEntity, DiscountEntity, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<DiscountEntity, DiscountEntity, QAfterWhereClause> idNotEqualTo(
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

  QueryBuilder<DiscountEntity, DiscountEntity, QAfterWhereClause> idGreaterThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<DiscountEntity, DiscountEntity, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<DiscountEntity, DiscountEntity, QAfterWhereClause> idBetween(
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

  QueryBuilder<DiscountEntity, DiscountEntity, QAfterWhereClause>
      discountIdEqualTo(String discountId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'discountId',
        value: [discountId],
      ));
    });
  }

  QueryBuilder<DiscountEntity, DiscountEntity, QAfterWhereClause>
      discountIdNotEqualTo(String discountId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'discountId',
              lower: [],
              upper: [discountId],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'discountId',
              lower: [discountId],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'discountId',
              lower: [discountId],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'discountId',
              lower: [],
              upper: [discountId],
              includeUpper: false,
            ));
      }
    });
  }
}

extension DiscountEntityQueryFilter
    on QueryBuilder<DiscountEntity, DiscountEntity, QFilterCondition> {
  QueryBuilder<DiscountEntity, DiscountEntity, QAfterFilterCondition>
      amountIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'amount',
      ));
    });
  }

  QueryBuilder<DiscountEntity, DiscountEntity, QAfterFilterCondition>
      amountIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'amount',
      ));
    });
  }

  QueryBuilder<DiscountEntity, DiscountEntity, QAfterFilterCondition>
      amountEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'amount',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DiscountEntity, DiscountEntity, QAfterFilterCondition>
      amountGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'amount',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DiscountEntity, DiscountEntity, QAfterFilterCondition>
      amountLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'amount',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DiscountEntity, DiscountEntity, QAfterFilterCondition>
      amountBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'amount',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DiscountEntity, DiscountEntity, QAfterFilterCondition>
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

  QueryBuilder<DiscountEntity, DiscountEntity, QAfterFilterCondition>
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

  QueryBuilder<DiscountEntity, DiscountEntity, QAfterFilterCondition>
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

  QueryBuilder<DiscountEntity, DiscountEntity, QAfterFilterCondition>
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

  QueryBuilder<DiscountEntity, DiscountEntity, QAfterFilterCondition>
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

  QueryBuilder<DiscountEntity, DiscountEntity, QAfterFilterCondition>
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

  QueryBuilder<DiscountEntity, DiscountEntity, QAfterFilterCondition>
      descriptionContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DiscountEntity, DiscountEntity, QAfterFilterCondition>
      descriptionMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'description',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DiscountEntity, DiscountEntity, QAfterFilterCondition>
      descriptionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'description',
        value: '',
      ));
    });
  }

  QueryBuilder<DiscountEntity, DiscountEntity, QAfterFilterCondition>
      descriptionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'description',
        value: '',
      ));
    });
  }

  QueryBuilder<DiscountEntity, DiscountEntity, QAfterFilterCondition>
      discountCodeEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'discountCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DiscountEntity, DiscountEntity, QAfterFilterCondition>
      discountCodeGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'discountCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DiscountEntity, DiscountEntity, QAfterFilterCondition>
      discountCodeLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'discountCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DiscountEntity, DiscountEntity, QAfterFilterCondition>
      discountCodeBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'discountCode',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DiscountEntity, DiscountEntity, QAfterFilterCondition>
      discountCodeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'discountCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DiscountEntity, DiscountEntity, QAfterFilterCondition>
      discountCodeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'discountCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DiscountEntity, DiscountEntity, QAfterFilterCondition>
      discountCodeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'discountCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DiscountEntity, DiscountEntity, QAfterFilterCondition>
      discountCodeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'discountCode',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DiscountEntity, DiscountEntity, QAfterFilterCondition>
      discountCodeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'discountCode',
        value: '',
      ));
    });
  }

  QueryBuilder<DiscountEntity, DiscountEntity, QAfterFilterCondition>
      discountCodeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'discountCode',
        value: '',
      ));
    });
  }

  QueryBuilder<DiscountEntity, DiscountEntity, QAfterFilterCondition>
      discountGroupCodeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'discountGroupCode',
      ));
    });
  }

  QueryBuilder<DiscountEntity, DiscountEntity, QAfterFilterCondition>
      discountGroupCodeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'discountGroupCode',
      ));
    });
  }

  QueryBuilder<DiscountEntity, DiscountEntity, QAfterFilterCondition>
      discountGroupCodeEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'discountGroupCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DiscountEntity, DiscountEntity, QAfterFilterCondition>
      discountGroupCodeGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'discountGroupCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DiscountEntity, DiscountEntity, QAfterFilterCondition>
      discountGroupCodeLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'discountGroupCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DiscountEntity, DiscountEntity, QAfterFilterCondition>
      discountGroupCodeBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'discountGroupCode',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DiscountEntity, DiscountEntity, QAfterFilterCondition>
      discountGroupCodeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'discountGroupCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DiscountEntity, DiscountEntity, QAfterFilterCondition>
      discountGroupCodeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'discountGroupCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DiscountEntity, DiscountEntity, QAfterFilterCondition>
      discountGroupCodeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'discountGroupCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DiscountEntity, DiscountEntity, QAfterFilterCondition>
      discountGroupCodeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'discountGroupCode',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DiscountEntity, DiscountEntity, QAfterFilterCondition>
      discountGroupCodeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'discountGroupCode',
        value: '',
      ));
    });
  }

  QueryBuilder<DiscountEntity, DiscountEntity, QAfterFilterCondition>
      discountGroupCodeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'discountGroupCode',
        value: '',
      ));
    });
  }

  QueryBuilder<DiscountEntity, DiscountEntity, QAfterFilterCondition>
      discountIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'discountId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DiscountEntity, DiscountEntity, QAfterFilterCondition>
      discountIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'discountId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DiscountEntity, DiscountEntity, QAfterFilterCondition>
      discountIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'discountId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DiscountEntity, DiscountEntity, QAfterFilterCondition>
      discountIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'discountId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DiscountEntity, DiscountEntity, QAfterFilterCondition>
      discountIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'discountId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DiscountEntity, DiscountEntity, QAfterFilterCondition>
      discountIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'discountId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DiscountEntity, DiscountEntity, QAfterFilterCondition>
      discountIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'discountId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DiscountEntity, DiscountEntity, QAfterFilterCondition>
      discountIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'discountId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DiscountEntity, DiscountEntity, QAfterFilterCondition>
      discountIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'discountId',
        value: '',
      ));
    });
  }

  QueryBuilder<DiscountEntity, DiscountEntity, QAfterFilterCondition>
      discountIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'discountId',
        value: '',
      ));
    });
  }

  QueryBuilder<DiscountEntity, DiscountEntity, QAfterFilterCondition>
      discountTypeEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'discountType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DiscountEntity, DiscountEntity, QAfterFilterCondition>
      discountTypeGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'discountType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DiscountEntity, DiscountEntity, QAfterFilterCondition>
      discountTypeLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'discountType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DiscountEntity, DiscountEntity, QAfterFilterCondition>
      discountTypeBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'discountType',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DiscountEntity, DiscountEntity, QAfterFilterCondition>
      discountTypeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'discountType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DiscountEntity, DiscountEntity, QAfterFilterCondition>
      discountTypeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'discountType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DiscountEntity, DiscountEntity, QAfterFilterCondition>
      discountTypeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'discountType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DiscountEntity, DiscountEntity, QAfterFilterCondition>
      discountTypeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'discountType',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DiscountEntity, DiscountEntity, QAfterFilterCondition>
      discountTypeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'discountType',
        value: '',
      ));
    });
  }

  QueryBuilder<DiscountEntity, DiscountEntity, QAfterFilterCondition>
      discountTypeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'discountType',
        value: '',
      ));
    });
  }

  QueryBuilder<DiscountEntity, DiscountEntity, QAfterFilterCondition>
      idIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<DiscountEntity, DiscountEntity, QAfterFilterCondition>
      idIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<DiscountEntity, DiscountEntity, QAfterFilterCondition> idEqualTo(
      Id? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<DiscountEntity, DiscountEntity, QAfterFilterCondition>
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

  QueryBuilder<DiscountEntity, DiscountEntity, QAfterFilterCondition>
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

  QueryBuilder<DiscountEntity, DiscountEntity, QAfterFilterCondition> idBetween(
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

  QueryBuilder<DiscountEntity, DiscountEntity, QAfterFilterCondition>
      percentIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'percent',
      ));
    });
  }

  QueryBuilder<DiscountEntity, DiscountEntity, QAfterFilterCondition>
      percentIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'percent',
      ));
    });
  }

  QueryBuilder<DiscountEntity, DiscountEntity, QAfterFilterCondition>
      percentEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'percent',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DiscountEntity, DiscountEntity, QAfterFilterCondition>
      percentGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'percent',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DiscountEntity, DiscountEntity, QAfterFilterCondition>
      percentLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'percent',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DiscountEntity, DiscountEntity, QAfterFilterCondition>
      percentBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'percent',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }
}

extension DiscountEntityQueryObject
    on QueryBuilder<DiscountEntity, DiscountEntity, QFilterCondition> {}

extension DiscountEntityQueryLinks
    on QueryBuilder<DiscountEntity, DiscountEntity, QFilterCondition> {}

extension DiscountEntityQuerySortBy
    on QueryBuilder<DiscountEntity, DiscountEntity, QSortBy> {
  QueryBuilder<DiscountEntity, DiscountEntity, QAfterSortBy> sortByAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'amount', Sort.asc);
    });
  }

  QueryBuilder<DiscountEntity, DiscountEntity, QAfterSortBy>
      sortByAmountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'amount', Sort.desc);
    });
  }

  QueryBuilder<DiscountEntity, DiscountEntity, QAfterSortBy>
      sortByDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.asc);
    });
  }

  QueryBuilder<DiscountEntity, DiscountEntity, QAfterSortBy>
      sortByDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.desc);
    });
  }

  QueryBuilder<DiscountEntity, DiscountEntity, QAfterSortBy>
      sortByDiscountCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'discountCode', Sort.asc);
    });
  }

  QueryBuilder<DiscountEntity, DiscountEntity, QAfterSortBy>
      sortByDiscountCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'discountCode', Sort.desc);
    });
  }

  QueryBuilder<DiscountEntity, DiscountEntity, QAfterSortBy>
      sortByDiscountGroupCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'discountGroupCode', Sort.asc);
    });
  }

  QueryBuilder<DiscountEntity, DiscountEntity, QAfterSortBy>
      sortByDiscountGroupCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'discountGroupCode', Sort.desc);
    });
  }

  QueryBuilder<DiscountEntity, DiscountEntity, QAfterSortBy>
      sortByDiscountId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'discountId', Sort.asc);
    });
  }

  QueryBuilder<DiscountEntity, DiscountEntity, QAfterSortBy>
      sortByDiscountIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'discountId', Sort.desc);
    });
  }

  QueryBuilder<DiscountEntity, DiscountEntity, QAfterSortBy>
      sortByDiscountType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'discountType', Sort.asc);
    });
  }

  QueryBuilder<DiscountEntity, DiscountEntity, QAfterSortBy>
      sortByDiscountTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'discountType', Sort.desc);
    });
  }

  QueryBuilder<DiscountEntity, DiscountEntity, QAfterSortBy> sortByPercent() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'percent', Sort.asc);
    });
  }

  QueryBuilder<DiscountEntity, DiscountEntity, QAfterSortBy>
      sortByPercentDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'percent', Sort.desc);
    });
  }
}

extension DiscountEntityQuerySortThenBy
    on QueryBuilder<DiscountEntity, DiscountEntity, QSortThenBy> {
  QueryBuilder<DiscountEntity, DiscountEntity, QAfterSortBy> thenByAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'amount', Sort.asc);
    });
  }

  QueryBuilder<DiscountEntity, DiscountEntity, QAfterSortBy>
      thenByAmountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'amount', Sort.desc);
    });
  }

  QueryBuilder<DiscountEntity, DiscountEntity, QAfterSortBy>
      thenByDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.asc);
    });
  }

  QueryBuilder<DiscountEntity, DiscountEntity, QAfterSortBy>
      thenByDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.desc);
    });
  }

  QueryBuilder<DiscountEntity, DiscountEntity, QAfterSortBy>
      thenByDiscountCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'discountCode', Sort.asc);
    });
  }

  QueryBuilder<DiscountEntity, DiscountEntity, QAfterSortBy>
      thenByDiscountCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'discountCode', Sort.desc);
    });
  }

  QueryBuilder<DiscountEntity, DiscountEntity, QAfterSortBy>
      thenByDiscountGroupCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'discountGroupCode', Sort.asc);
    });
  }

  QueryBuilder<DiscountEntity, DiscountEntity, QAfterSortBy>
      thenByDiscountGroupCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'discountGroupCode', Sort.desc);
    });
  }

  QueryBuilder<DiscountEntity, DiscountEntity, QAfterSortBy>
      thenByDiscountId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'discountId', Sort.asc);
    });
  }

  QueryBuilder<DiscountEntity, DiscountEntity, QAfterSortBy>
      thenByDiscountIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'discountId', Sort.desc);
    });
  }

  QueryBuilder<DiscountEntity, DiscountEntity, QAfterSortBy>
      thenByDiscountType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'discountType', Sort.asc);
    });
  }

  QueryBuilder<DiscountEntity, DiscountEntity, QAfterSortBy>
      thenByDiscountTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'discountType', Sort.desc);
    });
  }

  QueryBuilder<DiscountEntity, DiscountEntity, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<DiscountEntity, DiscountEntity, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<DiscountEntity, DiscountEntity, QAfterSortBy> thenByPercent() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'percent', Sort.asc);
    });
  }

  QueryBuilder<DiscountEntity, DiscountEntity, QAfterSortBy>
      thenByPercentDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'percent', Sort.desc);
    });
  }
}

extension DiscountEntityQueryWhereDistinct
    on QueryBuilder<DiscountEntity, DiscountEntity, QDistinct> {
  QueryBuilder<DiscountEntity, DiscountEntity, QDistinct> distinctByAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'amount');
    });
  }

  QueryBuilder<DiscountEntity, DiscountEntity, QDistinct> distinctByDescription(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'description', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<DiscountEntity, DiscountEntity, QDistinct>
      distinctByDiscountCode({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'discountCode', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<DiscountEntity, DiscountEntity, QDistinct>
      distinctByDiscountGroupCode({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'discountGroupCode',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<DiscountEntity, DiscountEntity, QDistinct> distinctByDiscountId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'discountId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<DiscountEntity, DiscountEntity, QDistinct>
      distinctByDiscountType({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'discountType', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<DiscountEntity, DiscountEntity, QDistinct> distinctByPercent() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'percent');
    });
  }
}

extension DiscountEntityQueryProperty
    on QueryBuilder<DiscountEntity, DiscountEntity, QQueryProperty> {
  QueryBuilder<DiscountEntity, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<DiscountEntity, double?, QQueryOperations> amountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'amount');
    });
  }

  QueryBuilder<DiscountEntity, String, QQueryOperations> descriptionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'description');
    });
  }

  QueryBuilder<DiscountEntity, String, QQueryOperations>
      discountCodeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'discountCode');
    });
  }

  QueryBuilder<DiscountEntity, String?, QQueryOperations>
      discountGroupCodeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'discountGroupCode');
    });
  }

  QueryBuilder<DiscountEntity, String, QQueryOperations> discountIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'discountId');
    });
  }

  QueryBuilder<DiscountEntity, String, QQueryOperations>
      discountTypeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'discountType');
    });
  }

  QueryBuilder<DiscountEntity, double?, QQueryOperations> percentProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'percent');
    });
  }
}
