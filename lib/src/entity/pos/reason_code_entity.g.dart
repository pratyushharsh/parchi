// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reason_code_entity.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters

extension GetReasonCodeEntityCollection on Isar {
  IsarCollection<ReasonCodeEntity> get reasonCodeEntitys => this.collection();
}

const ReasonCodeEntitySchema = CollectionSchema(
  name: r'ReasonCodeEntity',
  id: 620100474243163054,
  properties: {
    r'commentRequired': PropertySchema(
      id: 0,
      name: r'commentRequired',
      type: IsarType.bool,
    ),
    r'description': PropertySchema(
      id: 1,
      name: r'description',
      type: IsarType.string,
    ),
    r'hashCode': PropertySchema(
      id: 2,
      name: r'hashCode',
      type: IsarType.long,
    ),
    r'parentCode': PropertySchema(
      id: 3,
      name: r'parentCode',
      type: IsarType.string,
    ),
    r'reasonCode': PropertySchema(
      id: 4,
      name: r'reasonCode',
      type: IsarType.string,
    ),
    r'reasonTypeCode': PropertySchema(
      id: 5,
      name: r'reasonTypeCode',
      type: IsarType.string,
    )
  },
  estimateSize: _reasonCodeEntityEstimateSize,
  serialize: _reasonCodeEntitySerialize,
  deserialize: _reasonCodeEntityDeserialize,
  deserializeProp: _reasonCodeEntityDeserializeProp,
  idName: r'id',
  indexes: {
    r'reasonTypeCode_reasonCode': IndexSchema(
      id: 1057822285026408487,
      name: r'reasonTypeCode_reasonCode',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'reasonTypeCode',
          type: IndexType.hash,
          caseSensitive: true,
        ),
        IndexPropertySchema(
          name: r'reasonCode',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _reasonCodeEntityGetId,
  getLinks: _reasonCodeEntityGetLinks,
  attach: _reasonCodeEntityAttach,
  version: '3.0.5',
);

int _reasonCodeEntityEstimateSize(
  ReasonCodeEntity object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.description.length * 3;
  {
    final value = object.parentCode;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.reasonCode.length * 3;
  bytesCount += 3 + object.reasonTypeCode.length * 3;
  return bytesCount;
}

void _reasonCodeEntitySerialize(
  ReasonCodeEntity object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeBool(offsets[0], object.commentRequired);
  writer.writeString(offsets[1], object.description);
  writer.writeLong(offsets[2], object.hashCode);
  writer.writeString(offsets[3], object.parentCode);
  writer.writeString(offsets[4], object.reasonCode);
  writer.writeString(offsets[5], object.reasonTypeCode);
}

ReasonCodeEntity _reasonCodeEntityDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = ReasonCodeEntity(
    commentRequired: reader.readBool(offsets[0]),
    description: reader.readString(offsets[1]),
    id: id,
    parentCode: reader.readStringOrNull(offsets[3]),
    reasonCode: reader.readString(offsets[4]),
    reasonTypeCode: reader.readString(offsets[5]),
  );
  return object;
}

P _reasonCodeEntityDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readBool(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readLong(offset)) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    case 4:
      return (reader.readString(offset)) as P;
    case 5:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _reasonCodeEntityGetId(ReasonCodeEntity object) {
  return object.id ?? Isar.autoIncrement;
}

List<IsarLinkBase<dynamic>> _reasonCodeEntityGetLinks(ReasonCodeEntity object) {
  return [];
}

void _reasonCodeEntityAttach(
    IsarCollection<dynamic> col, Id id, ReasonCodeEntity object) {}

extension ReasonCodeEntityQueryWhereSort
    on QueryBuilder<ReasonCodeEntity, ReasonCodeEntity, QWhere> {
  QueryBuilder<ReasonCodeEntity, ReasonCodeEntity, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension ReasonCodeEntityQueryWhere
    on QueryBuilder<ReasonCodeEntity, ReasonCodeEntity, QWhereClause> {
  QueryBuilder<ReasonCodeEntity, ReasonCodeEntity, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<ReasonCodeEntity, ReasonCodeEntity, QAfterWhereClause>
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

  QueryBuilder<ReasonCodeEntity, ReasonCodeEntity, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<ReasonCodeEntity, ReasonCodeEntity, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<ReasonCodeEntity, ReasonCodeEntity, QAfterWhereClause> idBetween(
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

  QueryBuilder<ReasonCodeEntity, ReasonCodeEntity, QAfterWhereClause>
      reasonTypeCodeEqualToAnyReasonCode(String reasonTypeCode) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'reasonTypeCode_reasonCode',
        value: [reasonTypeCode],
      ));
    });
  }

  QueryBuilder<ReasonCodeEntity, ReasonCodeEntity, QAfterWhereClause>
      reasonTypeCodeNotEqualToAnyReasonCode(String reasonTypeCode) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'reasonTypeCode_reasonCode',
              lower: [],
              upper: [reasonTypeCode],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'reasonTypeCode_reasonCode',
              lower: [reasonTypeCode],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'reasonTypeCode_reasonCode',
              lower: [reasonTypeCode],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'reasonTypeCode_reasonCode',
              lower: [],
              upper: [reasonTypeCode],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<ReasonCodeEntity, ReasonCodeEntity, QAfterWhereClause>
      reasonTypeCodeReasonCodeEqualTo(
          String reasonTypeCode, String reasonCode) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'reasonTypeCode_reasonCode',
        value: [reasonTypeCode, reasonCode],
      ));
    });
  }

  QueryBuilder<ReasonCodeEntity, ReasonCodeEntity, QAfterWhereClause>
      reasonTypeCodeEqualToReasonCodeNotEqualTo(
          String reasonTypeCode, String reasonCode) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'reasonTypeCode_reasonCode',
              lower: [reasonTypeCode],
              upper: [reasonTypeCode, reasonCode],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'reasonTypeCode_reasonCode',
              lower: [reasonTypeCode, reasonCode],
              includeLower: false,
              upper: [reasonTypeCode],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'reasonTypeCode_reasonCode',
              lower: [reasonTypeCode, reasonCode],
              includeLower: false,
              upper: [reasonTypeCode],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'reasonTypeCode_reasonCode',
              lower: [reasonTypeCode],
              upper: [reasonTypeCode, reasonCode],
              includeUpper: false,
            ));
      }
    });
  }
}

extension ReasonCodeEntityQueryFilter
    on QueryBuilder<ReasonCodeEntity, ReasonCodeEntity, QFilterCondition> {
  QueryBuilder<ReasonCodeEntity, ReasonCodeEntity, QAfterFilterCondition>
      commentRequiredEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'commentRequired',
        value: value,
      ));
    });
  }

  QueryBuilder<ReasonCodeEntity, ReasonCodeEntity, QAfterFilterCondition>
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

  QueryBuilder<ReasonCodeEntity, ReasonCodeEntity, QAfterFilterCondition>
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

  QueryBuilder<ReasonCodeEntity, ReasonCodeEntity, QAfterFilterCondition>
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

  QueryBuilder<ReasonCodeEntity, ReasonCodeEntity, QAfterFilterCondition>
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

  QueryBuilder<ReasonCodeEntity, ReasonCodeEntity, QAfterFilterCondition>
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

  QueryBuilder<ReasonCodeEntity, ReasonCodeEntity, QAfterFilterCondition>
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

  QueryBuilder<ReasonCodeEntity, ReasonCodeEntity, QAfterFilterCondition>
      descriptionContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReasonCodeEntity, ReasonCodeEntity, QAfterFilterCondition>
      descriptionMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'description',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReasonCodeEntity, ReasonCodeEntity, QAfterFilterCondition>
      descriptionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'description',
        value: '',
      ));
    });
  }

  QueryBuilder<ReasonCodeEntity, ReasonCodeEntity, QAfterFilterCondition>
      descriptionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'description',
        value: '',
      ));
    });
  }

  QueryBuilder<ReasonCodeEntity, ReasonCodeEntity, QAfterFilterCondition>
      hashCodeEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'hashCode',
        value: value,
      ));
    });
  }

  QueryBuilder<ReasonCodeEntity, ReasonCodeEntity, QAfterFilterCondition>
      hashCodeGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'hashCode',
        value: value,
      ));
    });
  }

  QueryBuilder<ReasonCodeEntity, ReasonCodeEntity, QAfterFilterCondition>
      hashCodeLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'hashCode',
        value: value,
      ));
    });
  }

  QueryBuilder<ReasonCodeEntity, ReasonCodeEntity, QAfterFilterCondition>
      hashCodeBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'hashCode',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ReasonCodeEntity, ReasonCodeEntity, QAfterFilterCondition>
      idIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<ReasonCodeEntity, ReasonCodeEntity, QAfterFilterCondition>
      idIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<ReasonCodeEntity, ReasonCodeEntity, QAfterFilterCondition>
      idEqualTo(Id? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<ReasonCodeEntity, ReasonCodeEntity, QAfterFilterCondition>
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

  QueryBuilder<ReasonCodeEntity, ReasonCodeEntity, QAfterFilterCondition>
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

  QueryBuilder<ReasonCodeEntity, ReasonCodeEntity, QAfterFilterCondition>
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

  QueryBuilder<ReasonCodeEntity, ReasonCodeEntity, QAfterFilterCondition>
      parentCodeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'parentCode',
      ));
    });
  }

  QueryBuilder<ReasonCodeEntity, ReasonCodeEntity, QAfterFilterCondition>
      parentCodeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'parentCode',
      ));
    });
  }

  QueryBuilder<ReasonCodeEntity, ReasonCodeEntity, QAfterFilterCondition>
      parentCodeEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'parentCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReasonCodeEntity, ReasonCodeEntity, QAfterFilterCondition>
      parentCodeGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'parentCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReasonCodeEntity, ReasonCodeEntity, QAfterFilterCondition>
      parentCodeLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'parentCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReasonCodeEntity, ReasonCodeEntity, QAfterFilterCondition>
      parentCodeBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'parentCode',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReasonCodeEntity, ReasonCodeEntity, QAfterFilterCondition>
      parentCodeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'parentCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReasonCodeEntity, ReasonCodeEntity, QAfterFilterCondition>
      parentCodeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'parentCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReasonCodeEntity, ReasonCodeEntity, QAfterFilterCondition>
      parentCodeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'parentCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReasonCodeEntity, ReasonCodeEntity, QAfterFilterCondition>
      parentCodeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'parentCode',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReasonCodeEntity, ReasonCodeEntity, QAfterFilterCondition>
      parentCodeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'parentCode',
        value: '',
      ));
    });
  }

  QueryBuilder<ReasonCodeEntity, ReasonCodeEntity, QAfterFilterCondition>
      parentCodeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'parentCode',
        value: '',
      ));
    });
  }

  QueryBuilder<ReasonCodeEntity, ReasonCodeEntity, QAfterFilterCondition>
      reasonCodeEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'reasonCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReasonCodeEntity, ReasonCodeEntity, QAfterFilterCondition>
      reasonCodeGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'reasonCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReasonCodeEntity, ReasonCodeEntity, QAfterFilterCondition>
      reasonCodeLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'reasonCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReasonCodeEntity, ReasonCodeEntity, QAfterFilterCondition>
      reasonCodeBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'reasonCode',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReasonCodeEntity, ReasonCodeEntity, QAfterFilterCondition>
      reasonCodeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'reasonCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReasonCodeEntity, ReasonCodeEntity, QAfterFilterCondition>
      reasonCodeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'reasonCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReasonCodeEntity, ReasonCodeEntity, QAfterFilterCondition>
      reasonCodeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'reasonCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReasonCodeEntity, ReasonCodeEntity, QAfterFilterCondition>
      reasonCodeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'reasonCode',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReasonCodeEntity, ReasonCodeEntity, QAfterFilterCondition>
      reasonCodeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'reasonCode',
        value: '',
      ));
    });
  }

  QueryBuilder<ReasonCodeEntity, ReasonCodeEntity, QAfterFilterCondition>
      reasonCodeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'reasonCode',
        value: '',
      ));
    });
  }

  QueryBuilder<ReasonCodeEntity, ReasonCodeEntity, QAfterFilterCondition>
      reasonTypeCodeEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'reasonTypeCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReasonCodeEntity, ReasonCodeEntity, QAfterFilterCondition>
      reasonTypeCodeGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'reasonTypeCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReasonCodeEntity, ReasonCodeEntity, QAfterFilterCondition>
      reasonTypeCodeLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'reasonTypeCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReasonCodeEntity, ReasonCodeEntity, QAfterFilterCondition>
      reasonTypeCodeBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'reasonTypeCode',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReasonCodeEntity, ReasonCodeEntity, QAfterFilterCondition>
      reasonTypeCodeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'reasonTypeCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReasonCodeEntity, ReasonCodeEntity, QAfterFilterCondition>
      reasonTypeCodeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'reasonTypeCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReasonCodeEntity, ReasonCodeEntity, QAfterFilterCondition>
      reasonTypeCodeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'reasonTypeCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReasonCodeEntity, ReasonCodeEntity, QAfterFilterCondition>
      reasonTypeCodeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'reasonTypeCode',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReasonCodeEntity, ReasonCodeEntity, QAfterFilterCondition>
      reasonTypeCodeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'reasonTypeCode',
        value: '',
      ));
    });
  }

  QueryBuilder<ReasonCodeEntity, ReasonCodeEntity, QAfterFilterCondition>
      reasonTypeCodeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'reasonTypeCode',
        value: '',
      ));
    });
  }
}

extension ReasonCodeEntityQueryObject
    on QueryBuilder<ReasonCodeEntity, ReasonCodeEntity, QFilterCondition> {}

extension ReasonCodeEntityQueryLinks
    on QueryBuilder<ReasonCodeEntity, ReasonCodeEntity, QFilterCondition> {}

extension ReasonCodeEntityQuerySortBy
    on QueryBuilder<ReasonCodeEntity, ReasonCodeEntity, QSortBy> {
  QueryBuilder<ReasonCodeEntity, ReasonCodeEntity, QAfterSortBy>
      sortByCommentRequired() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'commentRequired', Sort.asc);
    });
  }

  QueryBuilder<ReasonCodeEntity, ReasonCodeEntity, QAfterSortBy>
      sortByCommentRequiredDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'commentRequired', Sort.desc);
    });
  }

  QueryBuilder<ReasonCodeEntity, ReasonCodeEntity, QAfterSortBy>
      sortByDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.asc);
    });
  }

  QueryBuilder<ReasonCodeEntity, ReasonCodeEntity, QAfterSortBy>
      sortByDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.desc);
    });
  }

  QueryBuilder<ReasonCodeEntity, ReasonCodeEntity, QAfterSortBy>
      sortByHashCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hashCode', Sort.asc);
    });
  }

  QueryBuilder<ReasonCodeEntity, ReasonCodeEntity, QAfterSortBy>
      sortByHashCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hashCode', Sort.desc);
    });
  }

  QueryBuilder<ReasonCodeEntity, ReasonCodeEntity, QAfterSortBy>
      sortByParentCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'parentCode', Sort.asc);
    });
  }

  QueryBuilder<ReasonCodeEntity, ReasonCodeEntity, QAfterSortBy>
      sortByParentCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'parentCode', Sort.desc);
    });
  }

  QueryBuilder<ReasonCodeEntity, ReasonCodeEntity, QAfterSortBy>
      sortByReasonCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'reasonCode', Sort.asc);
    });
  }

  QueryBuilder<ReasonCodeEntity, ReasonCodeEntity, QAfterSortBy>
      sortByReasonCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'reasonCode', Sort.desc);
    });
  }

  QueryBuilder<ReasonCodeEntity, ReasonCodeEntity, QAfterSortBy>
      sortByReasonTypeCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'reasonTypeCode', Sort.asc);
    });
  }

  QueryBuilder<ReasonCodeEntity, ReasonCodeEntity, QAfterSortBy>
      sortByReasonTypeCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'reasonTypeCode', Sort.desc);
    });
  }
}

extension ReasonCodeEntityQuerySortThenBy
    on QueryBuilder<ReasonCodeEntity, ReasonCodeEntity, QSortThenBy> {
  QueryBuilder<ReasonCodeEntity, ReasonCodeEntity, QAfterSortBy>
      thenByCommentRequired() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'commentRequired', Sort.asc);
    });
  }

  QueryBuilder<ReasonCodeEntity, ReasonCodeEntity, QAfterSortBy>
      thenByCommentRequiredDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'commentRequired', Sort.desc);
    });
  }

  QueryBuilder<ReasonCodeEntity, ReasonCodeEntity, QAfterSortBy>
      thenByDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.asc);
    });
  }

  QueryBuilder<ReasonCodeEntity, ReasonCodeEntity, QAfterSortBy>
      thenByDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.desc);
    });
  }

  QueryBuilder<ReasonCodeEntity, ReasonCodeEntity, QAfterSortBy>
      thenByHashCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hashCode', Sort.asc);
    });
  }

  QueryBuilder<ReasonCodeEntity, ReasonCodeEntity, QAfterSortBy>
      thenByHashCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hashCode', Sort.desc);
    });
  }

  QueryBuilder<ReasonCodeEntity, ReasonCodeEntity, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<ReasonCodeEntity, ReasonCodeEntity, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<ReasonCodeEntity, ReasonCodeEntity, QAfterSortBy>
      thenByParentCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'parentCode', Sort.asc);
    });
  }

  QueryBuilder<ReasonCodeEntity, ReasonCodeEntity, QAfterSortBy>
      thenByParentCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'parentCode', Sort.desc);
    });
  }

  QueryBuilder<ReasonCodeEntity, ReasonCodeEntity, QAfterSortBy>
      thenByReasonCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'reasonCode', Sort.asc);
    });
  }

  QueryBuilder<ReasonCodeEntity, ReasonCodeEntity, QAfterSortBy>
      thenByReasonCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'reasonCode', Sort.desc);
    });
  }

  QueryBuilder<ReasonCodeEntity, ReasonCodeEntity, QAfterSortBy>
      thenByReasonTypeCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'reasonTypeCode', Sort.asc);
    });
  }

  QueryBuilder<ReasonCodeEntity, ReasonCodeEntity, QAfterSortBy>
      thenByReasonTypeCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'reasonTypeCode', Sort.desc);
    });
  }
}

extension ReasonCodeEntityQueryWhereDistinct
    on QueryBuilder<ReasonCodeEntity, ReasonCodeEntity, QDistinct> {
  QueryBuilder<ReasonCodeEntity, ReasonCodeEntity, QDistinct>
      distinctByCommentRequired() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'commentRequired');
    });
  }

  QueryBuilder<ReasonCodeEntity, ReasonCodeEntity, QDistinct>
      distinctByDescription({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'description', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ReasonCodeEntity, ReasonCodeEntity, QDistinct>
      distinctByHashCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'hashCode');
    });
  }

  QueryBuilder<ReasonCodeEntity, ReasonCodeEntity, QDistinct>
      distinctByParentCode({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'parentCode', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ReasonCodeEntity, ReasonCodeEntity, QDistinct>
      distinctByReasonCode({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'reasonCode', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ReasonCodeEntity, ReasonCodeEntity, QDistinct>
      distinctByReasonTypeCode({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'reasonTypeCode',
          caseSensitive: caseSensitive);
    });
  }
}

extension ReasonCodeEntityQueryProperty
    on QueryBuilder<ReasonCodeEntity, ReasonCodeEntity, QQueryProperty> {
  QueryBuilder<ReasonCodeEntity, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<ReasonCodeEntity, bool, QQueryOperations>
      commentRequiredProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'commentRequired');
    });
  }

  QueryBuilder<ReasonCodeEntity, String, QQueryOperations>
      descriptionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'description');
    });
  }

  QueryBuilder<ReasonCodeEntity, int, QQueryOperations> hashCodeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'hashCode');
    });
  }

  QueryBuilder<ReasonCodeEntity, String?, QQueryOperations>
      parentCodeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'parentCode');
    });
  }

  QueryBuilder<ReasonCodeEntity, String, QQueryOperations>
      reasonCodeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'reasonCode');
    });
  }

  QueryBuilder<ReasonCodeEntity, String, QQueryOperations>
      reasonTypeCodeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'reasonTypeCode');
    });
  }
}
