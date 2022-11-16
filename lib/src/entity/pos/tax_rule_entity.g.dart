// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tax_rule_entity.dart';

// **************************************************************************
// IsarEmbeddedGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters

const TaxRuleEntitySchema = Schema(
  name: r'TaxRuleEntity',
  id: 2130788321021746296,
  properties: {
    r'amount': PropertySchema(
      id: 0,
      name: r'amount',
      type: IsarType.double,
    ),
    r'authorityId': PropertySchema(
      id: 1,
      name: r'authorityId',
      type: IsarType.string,
    ),
    r'authorityName': PropertySchema(
      id: 2,
      name: r'authorityName',
      type: IsarType.string,
    ),
    r'authorityType': PropertySchema(
      id: 3,
      name: r'authorityType',
      type: IsarType.string,
    ),
    r'effectiveDateTimeStamp': PropertySchema(
      id: 4,
      name: r'effectiveDateTimeStamp',
      type: IsarType.dateTime,
    ),
    r'expirationDateTimeStamp': PropertySchema(
      id: 5,
      name: r'expirationDateTimeStamp',
      type: IsarType.dateTime,
    ),
    r'groupId': PropertySchema(
      id: 6,
      name: r'groupId',
      type: IsarType.string,
    ),
    r'locationId': PropertySchema(
      id: 7,
      name: r'locationId',
      type: IsarType.string,
    ),
    r'maximumTaxableAmount': PropertySchema(
      id: 8,
      name: r'maximumTaxableAmount',
      type: IsarType.double,
    ),
    r'minimumTaxableAmount': PropertySchema(
      id: 9,
      name: r'minimumTaxableAmount',
      type: IsarType.double,
    ),
    r'percent': PropertySchema(
      id: 10,
      name: r'percent',
      type: IsarType.double,
    ),
    r'ruleId': PropertySchema(
      id: 11,
      name: r'ruleId',
      type: IsarType.string,
    ),
    r'ruleName': PropertySchema(
      id: 12,
      name: r'ruleName',
      type: IsarType.string,
    ),
    r'ruleSequence': PropertySchema(
      id: 13,
      name: r'ruleSequence',
      type: IsarType.long,
    )
  },
  estimateSize: _taxRuleEntityEstimateSize,
  serialize: _taxRuleEntitySerialize,
  deserialize: _taxRuleEntityDeserialize,
  deserializeProp: _taxRuleEntityDeserializeProp,
);

int _taxRuleEntityEstimateSize(
  TaxRuleEntity object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.authorityId;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.authorityName;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.authorityType;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.groupId;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.locationId;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.ruleId;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.ruleName;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _taxRuleEntitySerialize(
  TaxRuleEntity object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDouble(offsets[0], object.amount);
  writer.writeString(offsets[1], object.authorityId);
  writer.writeString(offsets[2], object.authorityName);
  writer.writeString(offsets[3], object.authorityType);
  writer.writeDateTime(offsets[4], object.effectiveDateTimeStamp);
  writer.writeDateTime(offsets[5], object.expirationDateTimeStamp);
  writer.writeString(offsets[6], object.groupId);
  writer.writeString(offsets[7], object.locationId);
  writer.writeDouble(offsets[8], object.maximumTaxableAmount);
  writer.writeDouble(offsets[9], object.minimumTaxableAmount);
  writer.writeDouble(offsets[10], object.percent);
  writer.writeString(offsets[11], object.ruleId);
  writer.writeString(offsets[12], object.ruleName);
  writer.writeLong(offsets[13], object.ruleSequence);
}

TaxRuleEntity _taxRuleEntityDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = TaxRuleEntity(
    amount: reader.readDoubleOrNull(offsets[0]),
    authorityId: reader.readStringOrNull(offsets[1]),
    authorityName: reader.readStringOrNull(offsets[2]),
    authorityType: reader.readStringOrNull(offsets[3]),
    effectiveDateTimeStamp: reader.readDateTimeOrNull(offsets[4]),
    expirationDateTimeStamp: reader.readDateTimeOrNull(offsets[5]),
    groupId: reader.readStringOrNull(offsets[6]),
    locationId: reader.readStringOrNull(offsets[7]),
    maximumTaxableAmount: reader.readDoubleOrNull(offsets[8]),
    minimumTaxableAmount: reader.readDoubleOrNull(offsets[9]),
    percent: reader.readDoubleOrNull(offsets[10]),
    ruleId: reader.readStringOrNull(offsets[11]),
    ruleName: reader.readStringOrNull(offsets[12]),
    ruleSequence: reader.readLongOrNull(offsets[13]),
  );
  return object;
}

P _taxRuleEntityDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDoubleOrNull(offset)) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    case 4:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 5:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 6:
      return (reader.readStringOrNull(offset)) as P;
    case 7:
      return (reader.readStringOrNull(offset)) as P;
    case 8:
      return (reader.readDoubleOrNull(offset)) as P;
    case 9:
      return (reader.readDoubleOrNull(offset)) as P;
    case 10:
      return (reader.readDoubleOrNull(offset)) as P;
    case 11:
      return (reader.readStringOrNull(offset)) as P;
    case 12:
      return (reader.readStringOrNull(offset)) as P;
    case 13:
      return (reader.readLongOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension TaxRuleEntityQueryFilter
    on QueryBuilder<TaxRuleEntity, TaxRuleEntity, QFilterCondition> {
  QueryBuilder<TaxRuleEntity, TaxRuleEntity, QAfterFilterCondition>
      amountIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'amount',
      ));
    });
  }

  QueryBuilder<TaxRuleEntity, TaxRuleEntity, QAfterFilterCondition>
      amountIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'amount',
      ));
    });
  }

  QueryBuilder<TaxRuleEntity, TaxRuleEntity, QAfterFilterCondition>
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

  QueryBuilder<TaxRuleEntity, TaxRuleEntity, QAfterFilterCondition>
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

  QueryBuilder<TaxRuleEntity, TaxRuleEntity, QAfterFilterCondition>
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

  QueryBuilder<TaxRuleEntity, TaxRuleEntity, QAfterFilterCondition>
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

  QueryBuilder<TaxRuleEntity, TaxRuleEntity, QAfterFilterCondition>
      authorityIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'authorityId',
      ));
    });
  }

  QueryBuilder<TaxRuleEntity, TaxRuleEntity, QAfterFilterCondition>
      authorityIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'authorityId',
      ));
    });
  }

  QueryBuilder<TaxRuleEntity, TaxRuleEntity, QAfterFilterCondition>
      authorityIdEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'authorityId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaxRuleEntity, TaxRuleEntity, QAfterFilterCondition>
      authorityIdGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'authorityId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaxRuleEntity, TaxRuleEntity, QAfterFilterCondition>
      authorityIdLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'authorityId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaxRuleEntity, TaxRuleEntity, QAfterFilterCondition>
      authorityIdBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'authorityId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaxRuleEntity, TaxRuleEntity, QAfterFilterCondition>
      authorityIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'authorityId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaxRuleEntity, TaxRuleEntity, QAfterFilterCondition>
      authorityIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'authorityId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaxRuleEntity, TaxRuleEntity, QAfterFilterCondition>
      authorityIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'authorityId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaxRuleEntity, TaxRuleEntity, QAfterFilterCondition>
      authorityIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'authorityId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaxRuleEntity, TaxRuleEntity, QAfterFilterCondition>
      authorityIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'authorityId',
        value: '',
      ));
    });
  }

  QueryBuilder<TaxRuleEntity, TaxRuleEntity, QAfterFilterCondition>
      authorityIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'authorityId',
        value: '',
      ));
    });
  }

  QueryBuilder<TaxRuleEntity, TaxRuleEntity, QAfterFilterCondition>
      authorityNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'authorityName',
      ));
    });
  }

  QueryBuilder<TaxRuleEntity, TaxRuleEntity, QAfterFilterCondition>
      authorityNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'authorityName',
      ));
    });
  }

  QueryBuilder<TaxRuleEntity, TaxRuleEntity, QAfterFilterCondition>
      authorityNameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'authorityName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaxRuleEntity, TaxRuleEntity, QAfterFilterCondition>
      authorityNameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'authorityName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaxRuleEntity, TaxRuleEntity, QAfterFilterCondition>
      authorityNameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'authorityName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaxRuleEntity, TaxRuleEntity, QAfterFilterCondition>
      authorityNameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'authorityName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaxRuleEntity, TaxRuleEntity, QAfterFilterCondition>
      authorityNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'authorityName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaxRuleEntity, TaxRuleEntity, QAfterFilterCondition>
      authorityNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'authorityName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaxRuleEntity, TaxRuleEntity, QAfterFilterCondition>
      authorityNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'authorityName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaxRuleEntity, TaxRuleEntity, QAfterFilterCondition>
      authorityNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'authorityName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaxRuleEntity, TaxRuleEntity, QAfterFilterCondition>
      authorityNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'authorityName',
        value: '',
      ));
    });
  }

  QueryBuilder<TaxRuleEntity, TaxRuleEntity, QAfterFilterCondition>
      authorityNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'authorityName',
        value: '',
      ));
    });
  }

  QueryBuilder<TaxRuleEntity, TaxRuleEntity, QAfterFilterCondition>
      authorityTypeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'authorityType',
      ));
    });
  }

  QueryBuilder<TaxRuleEntity, TaxRuleEntity, QAfterFilterCondition>
      authorityTypeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'authorityType',
      ));
    });
  }

  QueryBuilder<TaxRuleEntity, TaxRuleEntity, QAfterFilterCondition>
      authorityTypeEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'authorityType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaxRuleEntity, TaxRuleEntity, QAfterFilterCondition>
      authorityTypeGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'authorityType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaxRuleEntity, TaxRuleEntity, QAfterFilterCondition>
      authorityTypeLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'authorityType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaxRuleEntity, TaxRuleEntity, QAfterFilterCondition>
      authorityTypeBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'authorityType',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaxRuleEntity, TaxRuleEntity, QAfterFilterCondition>
      authorityTypeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'authorityType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaxRuleEntity, TaxRuleEntity, QAfterFilterCondition>
      authorityTypeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'authorityType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaxRuleEntity, TaxRuleEntity, QAfterFilterCondition>
      authorityTypeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'authorityType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaxRuleEntity, TaxRuleEntity, QAfterFilterCondition>
      authorityTypeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'authorityType',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaxRuleEntity, TaxRuleEntity, QAfterFilterCondition>
      authorityTypeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'authorityType',
        value: '',
      ));
    });
  }

  QueryBuilder<TaxRuleEntity, TaxRuleEntity, QAfterFilterCondition>
      authorityTypeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'authorityType',
        value: '',
      ));
    });
  }

  QueryBuilder<TaxRuleEntity, TaxRuleEntity, QAfterFilterCondition>
      effectiveDateTimeStampIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'effectiveDateTimeStamp',
      ));
    });
  }

  QueryBuilder<TaxRuleEntity, TaxRuleEntity, QAfterFilterCondition>
      effectiveDateTimeStampIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'effectiveDateTimeStamp',
      ));
    });
  }

  QueryBuilder<TaxRuleEntity, TaxRuleEntity, QAfterFilterCondition>
      effectiveDateTimeStampEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'effectiveDateTimeStamp',
        value: value,
      ));
    });
  }

  QueryBuilder<TaxRuleEntity, TaxRuleEntity, QAfterFilterCondition>
      effectiveDateTimeStampGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'effectiveDateTimeStamp',
        value: value,
      ));
    });
  }

  QueryBuilder<TaxRuleEntity, TaxRuleEntity, QAfterFilterCondition>
      effectiveDateTimeStampLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'effectiveDateTimeStamp',
        value: value,
      ));
    });
  }

  QueryBuilder<TaxRuleEntity, TaxRuleEntity, QAfterFilterCondition>
      effectiveDateTimeStampBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'effectiveDateTimeStamp',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<TaxRuleEntity, TaxRuleEntity, QAfterFilterCondition>
      expirationDateTimeStampIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'expirationDateTimeStamp',
      ));
    });
  }

  QueryBuilder<TaxRuleEntity, TaxRuleEntity, QAfterFilterCondition>
      expirationDateTimeStampIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'expirationDateTimeStamp',
      ));
    });
  }

  QueryBuilder<TaxRuleEntity, TaxRuleEntity, QAfterFilterCondition>
      expirationDateTimeStampEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'expirationDateTimeStamp',
        value: value,
      ));
    });
  }

  QueryBuilder<TaxRuleEntity, TaxRuleEntity, QAfterFilterCondition>
      expirationDateTimeStampGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'expirationDateTimeStamp',
        value: value,
      ));
    });
  }

  QueryBuilder<TaxRuleEntity, TaxRuleEntity, QAfterFilterCondition>
      expirationDateTimeStampLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'expirationDateTimeStamp',
        value: value,
      ));
    });
  }

  QueryBuilder<TaxRuleEntity, TaxRuleEntity, QAfterFilterCondition>
      expirationDateTimeStampBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'expirationDateTimeStamp',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<TaxRuleEntity, TaxRuleEntity, QAfterFilterCondition>
      groupIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'groupId',
      ));
    });
  }

  QueryBuilder<TaxRuleEntity, TaxRuleEntity, QAfterFilterCondition>
      groupIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'groupId',
      ));
    });
  }

  QueryBuilder<TaxRuleEntity, TaxRuleEntity, QAfterFilterCondition>
      groupIdEqualTo(
    String? value, {
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

  QueryBuilder<TaxRuleEntity, TaxRuleEntity, QAfterFilterCondition>
      groupIdGreaterThan(
    String? value, {
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

  QueryBuilder<TaxRuleEntity, TaxRuleEntity, QAfterFilterCondition>
      groupIdLessThan(
    String? value, {
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

  QueryBuilder<TaxRuleEntity, TaxRuleEntity, QAfterFilterCondition>
      groupIdBetween(
    String? lower,
    String? upper, {
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

  QueryBuilder<TaxRuleEntity, TaxRuleEntity, QAfterFilterCondition>
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

  QueryBuilder<TaxRuleEntity, TaxRuleEntity, QAfterFilterCondition>
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

  QueryBuilder<TaxRuleEntity, TaxRuleEntity, QAfterFilterCondition>
      groupIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'groupId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaxRuleEntity, TaxRuleEntity, QAfterFilterCondition>
      groupIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'groupId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaxRuleEntity, TaxRuleEntity, QAfterFilterCondition>
      groupIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'groupId',
        value: '',
      ));
    });
  }

  QueryBuilder<TaxRuleEntity, TaxRuleEntity, QAfterFilterCondition>
      groupIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'groupId',
        value: '',
      ));
    });
  }

  QueryBuilder<TaxRuleEntity, TaxRuleEntity, QAfterFilterCondition>
      locationIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'locationId',
      ));
    });
  }

  QueryBuilder<TaxRuleEntity, TaxRuleEntity, QAfterFilterCondition>
      locationIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'locationId',
      ));
    });
  }

  QueryBuilder<TaxRuleEntity, TaxRuleEntity, QAfterFilterCondition>
      locationIdEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'locationId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaxRuleEntity, TaxRuleEntity, QAfterFilterCondition>
      locationIdGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'locationId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaxRuleEntity, TaxRuleEntity, QAfterFilterCondition>
      locationIdLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'locationId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaxRuleEntity, TaxRuleEntity, QAfterFilterCondition>
      locationIdBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'locationId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaxRuleEntity, TaxRuleEntity, QAfterFilterCondition>
      locationIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'locationId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaxRuleEntity, TaxRuleEntity, QAfterFilterCondition>
      locationIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'locationId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaxRuleEntity, TaxRuleEntity, QAfterFilterCondition>
      locationIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'locationId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaxRuleEntity, TaxRuleEntity, QAfterFilterCondition>
      locationIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'locationId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaxRuleEntity, TaxRuleEntity, QAfterFilterCondition>
      locationIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'locationId',
        value: '',
      ));
    });
  }

  QueryBuilder<TaxRuleEntity, TaxRuleEntity, QAfterFilterCondition>
      locationIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'locationId',
        value: '',
      ));
    });
  }

  QueryBuilder<TaxRuleEntity, TaxRuleEntity, QAfterFilterCondition>
      maximumTaxableAmountIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'maximumTaxableAmount',
      ));
    });
  }

  QueryBuilder<TaxRuleEntity, TaxRuleEntity, QAfterFilterCondition>
      maximumTaxableAmountIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'maximumTaxableAmount',
      ));
    });
  }

  QueryBuilder<TaxRuleEntity, TaxRuleEntity, QAfterFilterCondition>
      maximumTaxableAmountEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'maximumTaxableAmount',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<TaxRuleEntity, TaxRuleEntity, QAfterFilterCondition>
      maximumTaxableAmountGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'maximumTaxableAmount',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<TaxRuleEntity, TaxRuleEntity, QAfterFilterCondition>
      maximumTaxableAmountLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'maximumTaxableAmount',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<TaxRuleEntity, TaxRuleEntity, QAfterFilterCondition>
      maximumTaxableAmountBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'maximumTaxableAmount',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<TaxRuleEntity, TaxRuleEntity, QAfterFilterCondition>
      minimumTaxableAmountIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'minimumTaxableAmount',
      ));
    });
  }

  QueryBuilder<TaxRuleEntity, TaxRuleEntity, QAfterFilterCondition>
      minimumTaxableAmountIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'minimumTaxableAmount',
      ));
    });
  }

  QueryBuilder<TaxRuleEntity, TaxRuleEntity, QAfterFilterCondition>
      minimumTaxableAmountEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'minimumTaxableAmount',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<TaxRuleEntity, TaxRuleEntity, QAfterFilterCondition>
      minimumTaxableAmountGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'minimumTaxableAmount',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<TaxRuleEntity, TaxRuleEntity, QAfterFilterCondition>
      minimumTaxableAmountLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'minimumTaxableAmount',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<TaxRuleEntity, TaxRuleEntity, QAfterFilterCondition>
      minimumTaxableAmountBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'minimumTaxableAmount',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<TaxRuleEntity, TaxRuleEntity, QAfterFilterCondition>
      percentIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'percent',
      ));
    });
  }

  QueryBuilder<TaxRuleEntity, TaxRuleEntity, QAfterFilterCondition>
      percentIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'percent',
      ));
    });
  }

  QueryBuilder<TaxRuleEntity, TaxRuleEntity, QAfterFilterCondition>
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

  QueryBuilder<TaxRuleEntity, TaxRuleEntity, QAfterFilterCondition>
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

  QueryBuilder<TaxRuleEntity, TaxRuleEntity, QAfterFilterCondition>
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

  QueryBuilder<TaxRuleEntity, TaxRuleEntity, QAfterFilterCondition>
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

  QueryBuilder<TaxRuleEntity, TaxRuleEntity, QAfterFilterCondition>
      ruleIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'ruleId',
      ));
    });
  }

  QueryBuilder<TaxRuleEntity, TaxRuleEntity, QAfterFilterCondition>
      ruleIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'ruleId',
      ));
    });
  }

  QueryBuilder<TaxRuleEntity, TaxRuleEntity, QAfterFilterCondition>
      ruleIdEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'ruleId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaxRuleEntity, TaxRuleEntity, QAfterFilterCondition>
      ruleIdGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'ruleId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaxRuleEntity, TaxRuleEntity, QAfterFilterCondition>
      ruleIdLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'ruleId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaxRuleEntity, TaxRuleEntity, QAfterFilterCondition>
      ruleIdBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'ruleId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaxRuleEntity, TaxRuleEntity, QAfterFilterCondition>
      ruleIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'ruleId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaxRuleEntity, TaxRuleEntity, QAfterFilterCondition>
      ruleIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'ruleId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaxRuleEntity, TaxRuleEntity, QAfterFilterCondition>
      ruleIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'ruleId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaxRuleEntity, TaxRuleEntity, QAfterFilterCondition>
      ruleIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'ruleId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaxRuleEntity, TaxRuleEntity, QAfterFilterCondition>
      ruleIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'ruleId',
        value: '',
      ));
    });
  }

  QueryBuilder<TaxRuleEntity, TaxRuleEntity, QAfterFilterCondition>
      ruleIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'ruleId',
        value: '',
      ));
    });
  }

  QueryBuilder<TaxRuleEntity, TaxRuleEntity, QAfterFilterCondition>
      ruleNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'ruleName',
      ));
    });
  }

  QueryBuilder<TaxRuleEntity, TaxRuleEntity, QAfterFilterCondition>
      ruleNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'ruleName',
      ));
    });
  }

  QueryBuilder<TaxRuleEntity, TaxRuleEntity, QAfterFilterCondition>
      ruleNameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'ruleName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaxRuleEntity, TaxRuleEntity, QAfterFilterCondition>
      ruleNameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'ruleName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaxRuleEntity, TaxRuleEntity, QAfterFilterCondition>
      ruleNameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'ruleName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaxRuleEntity, TaxRuleEntity, QAfterFilterCondition>
      ruleNameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'ruleName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaxRuleEntity, TaxRuleEntity, QAfterFilterCondition>
      ruleNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'ruleName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaxRuleEntity, TaxRuleEntity, QAfterFilterCondition>
      ruleNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'ruleName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaxRuleEntity, TaxRuleEntity, QAfterFilterCondition>
      ruleNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'ruleName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaxRuleEntity, TaxRuleEntity, QAfterFilterCondition>
      ruleNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'ruleName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaxRuleEntity, TaxRuleEntity, QAfterFilterCondition>
      ruleNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'ruleName',
        value: '',
      ));
    });
  }

  QueryBuilder<TaxRuleEntity, TaxRuleEntity, QAfterFilterCondition>
      ruleNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'ruleName',
        value: '',
      ));
    });
  }

  QueryBuilder<TaxRuleEntity, TaxRuleEntity, QAfterFilterCondition>
      ruleSequenceIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'ruleSequence',
      ));
    });
  }

  QueryBuilder<TaxRuleEntity, TaxRuleEntity, QAfterFilterCondition>
      ruleSequenceIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'ruleSequence',
      ));
    });
  }

  QueryBuilder<TaxRuleEntity, TaxRuleEntity, QAfterFilterCondition>
      ruleSequenceEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'ruleSequence',
        value: value,
      ));
    });
  }

  QueryBuilder<TaxRuleEntity, TaxRuleEntity, QAfterFilterCondition>
      ruleSequenceGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'ruleSequence',
        value: value,
      ));
    });
  }

  QueryBuilder<TaxRuleEntity, TaxRuleEntity, QAfterFilterCondition>
      ruleSequenceLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'ruleSequence',
        value: value,
      ));
    });
  }

  QueryBuilder<TaxRuleEntity, TaxRuleEntity, QAfterFilterCondition>
      ruleSequenceBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'ruleSequence',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension TaxRuleEntityQueryObject
    on QueryBuilder<TaxRuleEntity, TaxRuleEntity, QFilterCondition> {}
