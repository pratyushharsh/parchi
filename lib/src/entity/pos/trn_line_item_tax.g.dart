// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trn_line_item_tax.dart';

// **************************************************************************
// IsarEmbeddedGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters

const TransactionLineItemTaxModifierSchema = Schema(
  name: r'TransactionLineItemTaxModifier',
  id: -1101477557729710666,
  properties: {
    r'authorityId': PropertySchema(
      id: 0,
      name: r'authorityId',
      type: IsarType.string,
    ),
    r'authorityName': PropertySchema(
      id: 1,
      name: r'authorityName',
      type: IsarType.string,
    ),
    r'authorityType': PropertySchema(
      id: 2,
      name: r'authorityType',
      type: IsarType.string,
    ),
    r'lineItemSeq': PropertySchema(
      id: 3,
      name: r'lineItemSeq',
      type: IsarType.long,
    ),
    r'originalTaxableAmount': PropertySchema(
      id: 4,
      name: r'originalTaxableAmount',
      type: IsarType.double,
    ),
    r'rawTaxAmount': PropertySchema(
      id: 5,
      name: r'rawTaxAmount',
      type: IsarType.double,
    ),
    r'rawTaxPercentage': PropertySchema(
      id: 6,
      name: r'rawTaxPercentage',
      type: IsarType.double,
    ),
    r'taxAmount': PropertySchema(
      id: 7,
      name: r'taxAmount',
      type: IsarType.double,
    ),
    r'taxGroupId': PropertySchema(
      id: 8,
      name: r'taxGroupId',
      type: IsarType.string,
    ),
    r'taxLocationId': PropertySchema(
      id: 9,
      name: r'taxLocationId',
      type: IsarType.string,
    ),
    r'taxOverride': PropertySchema(
      id: 10,
      name: r'taxOverride',
      type: IsarType.bool,
    ),
    r'taxOverrideAmount': PropertySchema(
      id: 11,
      name: r'taxOverrideAmount',
      type: IsarType.double,
    ),
    r'taxOverridePercent': PropertySchema(
      id: 12,
      name: r'taxOverridePercent',
      type: IsarType.double,
    ),
    r'taxOverrideReasonCode': PropertySchema(
      id: 13,
      name: r'taxOverrideReasonCode',
      type: IsarType.string,
    ),
    r'taxPercent': PropertySchema(
      id: 14,
      name: r'taxPercent',
      type: IsarType.double,
    ),
    r'taxRuleId': PropertySchema(
      id: 15,
      name: r'taxRuleId',
      type: IsarType.string,
    ),
    r'taxRuleName': PropertySchema(
      id: 16,
      name: r'taxRuleName',
      type: IsarType.string,
    ),
    r'taxableAmount': PropertySchema(
      id: 17,
      name: r'taxableAmount',
      type: IsarType.double,
    ),
    r'transSeq': PropertySchema(
      id: 18,
      name: r'transSeq',
      type: IsarType.long,
    )
  },
  estimateSize: _transactionLineItemTaxModifierEstimateSize,
  serialize: _transactionLineItemTaxModifierSerialize,
  deserialize: _transactionLineItemTaxModifierDeserialize,
  deserializeProp: _transactionLineItemTaxModifierDeserializeProp,
);

int _transactionLineItemTaxModifierEstimateSize(
  TransactionLineItemTaxModifier object,
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
    final value = object.taxGroupId;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.taxLocationId;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.taxOverrideReasonCode;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.taxRuleId;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.taxRuleName;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _transactionLineItemTaxModifierSerialize(
  TransactionLineItemTaxModifier object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.authorityId);
  writer.writeString(offsets[1], object.authorityName);
  writer.writeString(offsets[2], object.authorityType);
  writer.writeLong(offsets[3], object.lineItemSeq);
  writer.writeDouble(offsets[4], object.originalTaxableAmount);
  writer.writeDouble(offsets[5], object.rawTaxAmount);
  writer.writeDouble(offsets[6], object.rawTaxPercentage);
  writer.writeDouble(offsets[7], object.taxAmount);
  writer.writeString(offsets[8], object.taxGroupId);
  writer.writeString(offsets[9], object.taxLocationId);
  writer.writeBool(offsets[10], object.taxOverride);
  writer.writeDouble(offsets[11], object.taxOverrideAmount);
  writer.writeDouble(offsets[12], object.taxOverridePercent);
  writer.writeString(offsets[13], object.taxOverrideReasonCode);
  writer.writeDouble(offsets[14], object.taxPercent);
  writer.writeString(offsets[15], object.taxRuleId);
  writer.writeString(offsets[16], object.taxRuleName);
  writer.writeDouble(offsets[17], object.taxableAmount);
  writer.writeLong(offsets[18], object.transSeq);
}

TransactionLineItemTaxModifier _transactionLineItemTaxModifierDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = TransactionLineItemTaxModifier(
    authorityId: reader.readStringOrNull(offsets[0]),
    authorityName: reader.readStringOrNull(offsets[1]),
    authorityType: reader.readStringOrNull(offsets[2]),
    lineItemSeq: reader.readLongOrNull(offsets[3]),
    originalTaxableAmount: reader.readDoubleOrNull(offsets[4]),
    rawTaxAmount: reader.readDoubleOrNull(offsets[5]),
    rawTaxPercentage: reader.readDoubleOrNull(offsets[6]),
    taxAmount: reader.readDoubleOrNull(offsets[7]),
    taxGroupId: reader.readStringOrNull(offsets[8]),
    taxLocationId: reader.readStringOrNull(offsets[9]),
    taxOverride: reader.readBoolOrNull(offsets[10]) ?? false,
    taxOverrideAmount: reader.readDoubleOrNull(offsets[11]),
    taxOverridePercent: reader.readDoubleOrNull(offsets[12]),
    taxOverrideReasonCode: reader.readStringOrNull(offsets[13]),
    taxPercent: reader.readDoubleOrNull(offsets[14]),
    taxRuleId: reader.readStringOrNull(offsets[15]),
    taxRuleName: reader.readStringOrNull(offsets[16]),
    taxableAmount: reader.readDoubleOrNull(offsets[17]),
    transSeq: reader.readLongOrNull(offsets[18]),
  );
  return object;
}

P _transactionLineItemTaxModifierDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (reader.readLongOrNull(offset)) as P;
    case 4:
      return (reader.readDoubleOrNull(offset)) as P;
    case 5:
      return (reader.readDoubleOrNull(offset)) as P;
    case 6:
      return (reader.readDoubleOrNull(offset)) as P;
    case 7:
      return (reader.readDoubleOrNull(offset)) as P;
    case 8:
      return (reader.readStringOrNull(offset)) as P;
    case 9:
      return (reader.readStringOrNull(offset)) as P;
    case 10:
      return (reader.readBoolOrNull(offset) ?? false) as P;
    case 11:
      return (reader.readDoubleOrNull(offset)) as P;
    case 12:
      return (reader.readDoubleOrNull(offset)) as P;
    case 13:
      return (reader.readStringOrNull(offset)) as P;
    case 14:
      return (reader.readDoubleOrNull(offset)) as P;
    case 15:
      return (reader.readStringOrNull(offset)) as P;
    case 16:
      return (reader.readStringOrNull(offset)) as P;
    case 17:
      return (reader.readDoubleOrNull(offset)) as P;
    case 18:
      return (reader.readLongOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension TransactionLineItemTaxModifierQueryFilter on QueryBuilder<
    TransactionLineItemTaxModifier,
    TransactionLineItemTaxModifier,
    QFilterCondition> {
  QueryBuilder<TransactionLineItemTaxModifier, TransactionLineItemTaxModifier,
      QAfterFilterCondition> authorityIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'authorityId',
      ));
    });
  }

  QueryBuilder<TransactionLineItemTaxModifier, TransactionLineItemTaxModifier,
      QAfterFilterCondition> authorityIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'authorityId',
      ));
    });
  }

  QueryBuilder<TransactionLineItemTaxModifier, TransactionLineItemTaxModifier,
      QAfterFilterCondition> authorityIdEqualTo(
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

  QueryBuilder<TransactionLineItemTaxModifier, TransactionLineItemTaxModifier,
      QAfterFilterCondition> authorityIdGreaterThan(
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

  QueryBuilder<TransactionLineItemTaxModifier, TransactionLineItemTaxModifier,
      QAfterFilterCondition> authorityIdLessThan(
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

  QueryBuilder<TransactionLineItemTaxModifier, TransactionLineItemTaxModifier,
      QAfterFilterCondition> authorityIdBetween(
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

  QueryBuilder<TransactionLineItemTaxModifier, TransactionLineItemTaxModifier,
      QAfterFilterCondition> authorityIdStartsWith(
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

  QueryBuilder<TransactionLineItemTaxModifier, TransactionLineItemTaxModifier,
      QAfterFilterCondition> authorityIdEndsWith(
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

  QueryBuilder<TransactionLineItemTaxModifier, TransactionLineItemTaxModifier,
          QAfterFilterCondition>
      authorityIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'authorityId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionLineItemTaxModifier, TransactionLineItemTaxModifier,
          QAfterFilterCondition>
      authorityIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'authorityId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionLineItemTaxModifier, TransactionLineItemTaxModifier,
      QAfterFilterCondition> authorityIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'authorityId',
        value: '',
      ));
    });
  }

  QueryBuilder<TransactionLineItemTaxModifier, TransactionLineItemTaxModifier,
      QAfterFilterCondition> authorityIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'authorityId',
        value: '',
      ));
    });
  }

  QueryBuilder<TransactionLineItemTaxModifier, TransactionLineItemTaxModifier,
      QAfterFilterCondition> authorityNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'authorityName',
      ));
    });
  }

  QueryBuilder<TransactionLineItemTaxModifier, TransactionLineItemTaxModifier,
      QAfterFilterCondition> authorityNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'authorityName',
      ));
    });
  }

  QueryBuilder<TransactionLineItemTaxModifier, TransactionLineItemTaxModifier,
      QAfterFilterCondition> authorityNameEqualTo(
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

  QueryBuilder<TransactionLineItemTaxModifier, TransactionLineItemTaxModifier,
      QAfterFilterCondition> authorityNameGreaterThan(
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

  QueryBuilder<TransactionLineItemTaxModifier, TransactionLineItemTaxModifier,
      QAfterFilterCondition> authorityNameLessThan(
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

  QueryBuilder<TransactionLineItemTaxModifier, TransactionLineItemTaxModifier,
      QAfterFilterCondition> authorityNameBetween(
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

  QueryBuilder<TransactionLineItemTaxModifier, TransactionLineItemTaxModifier,
      QAfterFilterCondition> authorityNameStartsWith(
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

  QueryBuilder<TransactionLineItemTaxModifier, TransactionLineItemTaxModifier,
      QAfterFilterCondition> authorityNameEndsWith(
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

  QueryBuilder<TransactionLineItemTaxModifier, TransactionLineItemTaxModifier,
          QAfterFilterCondition>
      authorityNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'authorityName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionLineItemTaxModifier, TransactionLineItemTaxModifier,
          QAfterFilterCondition>
      authorityNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'authorityName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionLineItemTaxModifier, TransactionLineItemTaxModifier,
      QAfterFilterCondition> authorityNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'authorityName',
        value: '',
      ));
    });
  }

  QueryBuilder<TransactionLineItemTaxModifier, TransactionLineItemTaxModifier,
      QAfterFilterCondition> authorityNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'authorityName',
        value: '',
      ));
    });
  }

  QueryBuilder<TransactionLineItemTaxModifier, TransactionLineItemTaxModifier,
      QAfterFilterCondition> authorityTypeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'authorityType',
      ));
    });
  }

  QueryBuilder<TransactionLineItemTaxModifier, TransactionLineItemTaxModifier,
      QAfterFilterCondition> authorityTypeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'authorityType',
      ));
    });
  }

  QueryBuilder<TransactionLineItemTaxModifier, TransactionLineItemTaxModifier,
      QAfterFilterCondition> authorityTypeEqualTo(
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

  QueryBuilder<TransactionLineItemTaxModifier, TransactionLineItemTaxModifier,
      QAfterFilterCondition> authorityTypeGreaterThan(
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

  QueryBuilder<TransactionLineItemTaxModifier, TransactionLineItemTaxModifier,
      QAfterFilterCondition> authorityTypeLessThan(
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

  QueryBuilder<TransactionLineItemTaxModifier, TransactionLineItemTaxModifier,
      QAfterFilterCondition> authorityTypeBetween(
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

  QueryBuilder<TransactionLineItemTaxModifier, TransactionLineItemTaxModifier,
      QAfterFilterCondition> authorityTypeStartsWith(
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

  QueryBuilder<TransactionLineItemTaxModifier, TransactionLineItemTaxModifier,
      QAfterFilterCondition> authorityTypeEndsWith(
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

  QueryBuilder<TransactionLineItemTaxModifier, TransactionLineItemTaxModifier,
          QAfterFilterCondition>
      authorityTypeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'authorityType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionLineItemTaxModifier, TransactionLineItemTaxModifier,
          QAfterFilterCondition>
      authorityTypeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'authorityType',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionLineItemTaxModifier, TransactionLineItemTaxModifier,
      QAfterFilterCondition> authorityTypeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'authorityType',
        value: '',
      ));
    });
  }

  QueryBuilder<TransactionLineItemTaxModifier, TransactionLineItemTaxModifier,
      QAfterFilterCondition> authorityTypeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'authorityType',
        value: '',
      ));
    });
  }

  QueryBuilder<TransactionLineItemTaxModifier, TransactionLineItemTaxModifier,
      QAfterFilterCondition> lineItemSeqIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'lineItemSeq',
      ));
    });
  }

  QueryBuilder<TransactionLineItemTaxModifier, TransactionLineItemTaxModifier,
      QAfterFilterCondition> lineItemSeqIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'lineItemSeq',
      ));
    });
  }

  QueryBuilder<TransactionLineItemTaxModifier, TransactionLineItemTaxModifier,
      QAfterFilterCondition> lineItemSeqEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lineItemSeq',
        value: value,
      ));
    });
  }

  QueryBuilder<TransactionLineItemTaxModifier, TransactionLineItemTaxModifier,
      QAfterFilterCondition> lineItemSeqGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'lineItemSeq',
        value: value,
      ));
    });
  }

  QueryBuilder<TransactionLineItemTaxModifier, TransactionLineItemTaxModifier,
      QAfterFilterCondition> lineItemSeqLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'lineItemSeq',
        value: value,
      ));
    });
  }

  QueryBuilder<TransactionLineItemTaxModifier, TransactionLineItemTaxModifier,
      QAfterFilterCondition> lineItemSeqBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'lineItemSeq',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<TransactionLineItemTaxModifier, TransactionLineItemTaxModifier,
      QAfterFilterCondition> originalTaxableAmountIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'originalTaxableAmount',
      ));
    });
  }

  QueryBuilder<TransactionLineItemTaxModifier, TransactionLineItemTaxModifier,
      QAfterFilterCondition> originalTaxableAmountIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'originalTaxableAmount',
      ));
    });
  }

  QueryBuilder<TransactionLineItemTaxModifier, TransactionLineItemTaxModifier,
      QAfterFilterCondition> originalTaxableAmountEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'originalTaxableAmount',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<TransactionLineItemTaxModifier, TransactionLineItemTaxModifier,
      QAfterFilterCondition> originalTaxableAmountGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'originalTaxableAmount',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<TransactionLineItemTaxModifier, TransactionLineItemTaxModifier,
      QAfterFilterCondition> originalTaxableAmountLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'originalTaxableAmount',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<TransactionLineItemTaxModifier, TransactionLineItemTaxModifier,
      QAfterFilterCondition> originalTaxableAmountBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'originalTaxableAmount',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<TransactionLineItemTaxModifier, TransactionLineItemTaxModifier,
      QAfterFilterCondition> rawTaxAmountIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'rawTaxAmount',
      ));
    });
  }

  QueryBuilder<TransactionLineItemTaxModifier, TransactionLineItemTaxModifier,
      QAfterFilterCondition> rawTaxAmountIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'rawTaxAmount',
      ));
    });
  }

  QueryBuilder<TransactionLineItemTaxModifier, TransactionLineItemTaxModifier,
      QAfterFilterCondition> rawTaxAmountEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'rawTaxAmount',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<TransactionLineItemTaxModifier, TransactionLineItemTaxModifier,
      QAfterFilterCondition> rawTaxAmountGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'rawTaxAmount',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<TransactionLineItemTaxModifier, TransactionLineItemTaxModifier,
      QAfterFilterCondition> rawTaxAmountLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'rawTaxAmount',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<TransactionLineItemTaxModifier, TransactionLineItemTaxModifier,
      QAfterFilterCondition> rawTaxAmountBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'rawTaxAmount',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<TransactionLineItemTaxModifier, TransactionLineItemTaxModifier,
      QAfterFilterCondition> rawTaxPercentageIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'rawTaxPercentage',
      ));
    });
  }

  QueryBuilder<TransactionLineItemTaxModifier, TransactionLineItemTaxModifier,
      QAfterFilterCondition> rawTaxPercentageIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'rawTaxPercentage',
      ));
    });
  }

  QueryBuilder<TransactionLineItemTaxModifier, TransactionLineItemTaxModifier,
      QAfterFilterCondition> rawTaxPercentageEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'rawTaxPercentage',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<TransactionLineItemTaxModifier, TransactionLineItemTaxModifier,
      QAfterFilterCondition> rawTaxPercentageGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'rawTaxPercentage',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<TransactionLineItemTaxModifier, TransactionLineItemTaxModifier,
      QAfterFilterCondition> rawTaxPercentageLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'rawTaxPercentage',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<TransactionLineItemTaxModifier, TransactionLineItemTaxModifier,
      QAfterFilterCondition> rawTaxPercentageBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'rawTaxPercentage',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<TransactionLineItemTaxModifier, TransactionLineItemTaxModifier,
      QAfterFilterCondition> taxAmountIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'taxAmount',
      ));
    });
  }

  QueryBuilder<TransactionLineItemTaxModifier, TransactionLineItemTaxModifier,
      QAfterFilterCondition> taxAmountIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'taxAmount',
      ));
    });
  }

  QueryBuilder<TransactionLineItemTaxModifier, TransactionLineItemTaxModifier,
      QAfterFilterCondition> taxAmountEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'taxAmount',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<TransactionLineItemTaxModifier, TransactionLineItemTaxModifier,
      QAfterFilterCondition> taxAmountGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'taxAmount',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<TransactionLineItemTaxModifier, TransactionLineItemTaxModifier,
      QAfterFilterCondition> taxAmountLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'taxAmount',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<TransactionLineItemTaxModifier, TransactionLineItemTaxModifier,
      QAfterFilterCondition> taxAmountBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'taxAmount',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<TransactionLineItemTaxModifier, TransactionLineItemTaxModifier,
      QAfterFilterCondition> taxGroupIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'taxGroupId',
      ));
    });
  }

  QueryBuilder<TransactionLineItemTaxModifier, TransactionLineItemTaxModifier,
      QAfterFilterCondition> taxGroupIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'taxGroupId',
      ));
    });
  }

  QueryBuilder<TransactionLineItemTaxModifier, TransactionLineItemTaxModifier,
      QAfterFilterCondition> taxGroupIdEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'taxGroupId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionLineItemTaxModifier, TransactionLineItemTaxModifier,
      QAfterFilterCondition> taxGroupIdGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'taxGroupId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionLineItemTaxModifier, TransactionLineItemTaxModifier,
      QAfterFilterCondition> taxGroupIdLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'taxGroupId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionLineItemTaxModifier, TransactionLineItemTaxModifier,
      QAfterFilterCondition> taxGroupIdBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'taxGroupId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionLineItemTaxModifier, TransactionLineItemTaxModifier,
      QAfterFilterCondition> taxGroupIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'taxGroupId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionLineItemTaxModifier, TransactionLineItemTaxModifier,
      QAfterFilterCondition> taxGroupIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'taxGroupId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionLineItemTaxModifier, TransactionLineItemTaxModifier,
          QAfterFilterCondition>
      taxGroupIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'taxGroupId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionLineItemTaxModifier, TransactionLineItemTaxModifier,
          QAfterFilterCondition>
      taxGroupIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'taxGroupId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionLineItemTaxModifier, TransactionLineItemTaxModifier,
      QAfterFilterCondition> taxGroupIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'taxGroupId',
        value: '',
      ));
    });
  }

  QueryBuilder<TransactionLineItemTaxModifier, TransactionLineItemTaxModifier,
      QAfterFilterCondition> taxGroupIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'taxGroupId',
        value: '',
      ));
    });
  }

  QueryBuilder<TransactionLineItemTaxModifier, TransactionLineItemTaxModifier,
      QAfterFilterCondition> taxLocationIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'taxLocationId',
      ));
    });
  }

  QueryBuilder<TransactionLineItemTaxModifier, TransactionLineItemTaxModifier,
      QAfterFilterCondition> taxLocationIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'taxLocationId',
      ));
    });
  }

  QueryBuilder<TransactionLineItemTaxModifier, TransactionLineItemTaxModifier,
      QAfterFilterCondition> taxLocationIdEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'taxLocationId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionLineItemTaxModifier, TransactionLineItemTaxModifier,
      QAfterFilterCondition> taxLocationIdGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'taxLocationId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionLineItemTaxModifier, TransactionLineItemTaxModifier,
      QAfterFilterCondition> taxLocationIdLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'taxLocationId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionLineItemTaxModifier, TransactionLineItemTaxModifier,
      QAfterFilterCondition> taxLocationIdBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'taxLocationId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionLineItemTaxModifier, TransactionLineItemTaxModifier,
      QAfterFilterCondition> taxLocationIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'taxLocationId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionLineItemTaxModifier, TransactionLineItemTaxModifier,
      QAfterFilterCondition> taxLocationIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'taxLocationId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionLineItemTaxModifier, TransactionLineItemTaxModifier,
          QAfterFilterCondition>
      taxLocationIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'taxLocationId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionLineItemTaxModifier, TransactionLineItemTaxModifier,
          QAfterFilterCondition>
      taxLocationIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'taxLocationId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionLineItemTaxModifier, TransactionLineItemTaxModifier,
      QAfterFilterCondition> taxLocationIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'taxLocationId',
        value: '',
      ));
    });
  }

  QueryBuilder<TransactionLineItemTaxModifier, TransactionLineItemTaxModifier,
      QAfterFilterCondition> taxLocationIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'taxLocationId',
        value: '',
      ));
    });
  }

  QueryBuilder<TransactionLineItemTaxModifier, TransactionLineItemTaxModifier,
      QAfterFilterCondition> taxOverrideEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'taxOverride',
        value: value,
      ));
    });
  }

  QueryBuilder<TransactionLineItemTaxModifier, TransactionLineItemTaxModifier,
      QAfterFilterCondition> taxOverrideAmountIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'taxOverrideAmount',
      ));
    });
  }

  QueryBuilder<TransactionLineItemTaxModifier, TransactionLineItemTaxModifier,
      QAfterFilterCondition> taxOverrideAmountIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'taxOverrideAmount',
      ));
    });
  }

  QueryBuilder<TransactionLineItemTaxModifier, TransactionLineItemTaxModifier,
      QAfterFilterCondition> taxOverrideAmountEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'taxOverrideAmount',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<TransactionLineItemTaxModifier, TransactionLineItemTaxModifier,
      QAfterFilterCondition> taxOverrideAmountGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'taxOverrideAmount',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<TransactionLineItemTaxModifier, TransactionLineItemTaxModifier,
      QAfterFilterCondition> taxOverrideAmountLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'taxOverrideAmount',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<TransactionLineItemTaxModifier, TransactionLineItemTaxModifier,
      QAfterFilterCondition> taxOverrideAmountBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'taxOverrideAmount',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<TransactionLineItemTaxModifier, TransactionLineItemTaxModifier,
      QAfterFilterCondition> taxOverridePercentIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'taxOverridePercent',
      ));
    });
  }

  QueryBuilder<TransactionLineItemTaxModifier, TransactionLineItemTaxModifier,
      QAfterFilterCondition> taxOverridePercentIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'taxOverridePercent',
      ));
    });
  }

  QueryBuilder<TransactionLineItemTaxModifier, TransactionLineItemTaxModifier,
      QAfterFilterCondition> taxOverridePercentEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'taxOverridePercent',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<TransactionLineItemTaxModifier, TransactionLineItemTaxModifier,
      QAfterFilterCondition> taxOverridePercentGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'taxOverridePercent',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<TransactionLineItemTaxModifier, TransactionLineItemTaxModifier,
      QAfterFilterCondition> taxOverridePercentLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'taxOverridePercent',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<TransactionLineItemTaxModifier, TransactionLineItemTaxModifier,
      QAfterFilterCondition> taxOverridePercentBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'taxOverridePercent',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<TransactionLineItemTaxModifier, TransactionLineItemTaxModifier,
      QAfterFilterCondition> taxOverrideReasonCodeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'taxOverrideReasonCode',
      ));
    });
  }

  QueryBuilder<TransactionLineItemTaxModifier, TransactionLineItemTaxModifier,
      QAfterFilterCondition> taxOverrideReasonCodeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'taxOverrideReasonCode',
      ));
    });
  }

  QueryBuilder<TransactionLineItemTaxModifier, TransactionLineItemTaxModifier,
      QAfterFilterCondition> taxOverrideReasonCodeEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'taxOverrideReasonCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionLineItemTaxModifier, TransactionLineItemTaxModifier,
      QAfterFilterCondition> taxOverrideReasonCodeGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'taxOverrideReasonCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionLineItemTaxModifier, TransactionLineItemTaxModifier,
      QAfterFilterCondition> taxOverrideReasonCodeLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'taxOverrideReasonCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionLineItemTaxModifier, TransactionLineItemTaxModifier,
      QAfterFilterCondition> taxOverrideReasonCodeBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'taxOverrideReasonCode',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionLineItemTaxModifier, TransactionLineItemTaxModifier,
      QAfterFilterCondition> taxOverrideReasonCodeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'taxOverrideReasonCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionLineItemTaxModifier, TransactionLineItemTaxModifier,
      QAfterFilterCondition> taxOverrideReasonCodeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'taxOverrideReasonCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionLineItemTaxModifier, TransactionLineItemTaxModifier,
          QAfterFilterCondition>
      taxOverrideReasonCodeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'taxOverrideReasonCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionLineItemTaxModifier, TransactionLineItemTaxModifier,
          QAfterFilterCondition>
      taxOverrideReasonCodeMatches(String pattern,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'taxOverrideReasonCode',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionLineItemTaxModifier, TransactionLineItemTaxModifier,
      QAfterFilterCondition> taxOverrideReasonCodeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'taxOverrideReasonCode',
        value: '',
      ));
    });
  }

  QueryBuilder<TransactionLineItemTaxModifier, TransactionLineItemTaxModifier,
      QAfterFilterCondition> taxOverrideReasonCodeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'taxOverrideReasonCode',
        value: '',
      ));
    });
  }

  QueryBuilder<TransactionLineItemTaxModifier, TransactionLineItemTaxModifier,
      QAfterFilterCondition> taxPercentIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'taxPercent',
      ));
    });
  }

  QueryBuilder<TransactionLineItemTaxModifier, TransactionLineItemTaxModifier,
      QAfterFilterCondition> taxPercentIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'taxPercent',
      ));
    });
  }

  QueryBuilder<TransactionLineItemTaxModifier, TransactionLineItemTaxModifier,
      QAfterFilterCondition> taxPercentEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'taxPercent',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<TransactionLineItemTaxModifier, TransactionLineItemTaxModifier,
      QAfterFilterCondition> taxPercentGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'taxPercent',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<TransactionLineItemTaxModifier, TransactionLineItemTaxModifier,
      QAfterFilterCondition> taxPercentLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'taxPercent',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<TransactionLineItemTaxModifier, TransactionLineItemTaxModifier,
      QAfterFilterCondition> taxPercentBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'taxPercent',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<TransactionLineItemTaxModifier, TransactionLineItemTaxModifier,
      QAfterFilterCondition> taxRuleIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'taxRuleId',
      ));
    });
  }

  QueryBuilder<TransactionLineItemTaxModifier, TransactionLineItemTaxModifier,
      QAfterFilterCondition> taxRuleIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'taxRuleId',
      ));
    });
  }

  QueryBuilder<TransactionLineItemTaxModifier, TransactionLineItemTaxModifier,
      QAfterFilterCondition> taxRuleIdEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'taxRuleId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionLineItemTaxModifier, TransactionLineItemTaxModifier,
      QAfterFilterCondition> taxRuleIdGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'taxRuleId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionLineItemTaxModifier, TransactionLineItemTaxModifier,
      QAfterFilterCondition> taxRuleIdLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'taxRuleId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionLineItemTaxModifier, TransactionLineItemTaxModifier,
      QAfterFilterCondition> taxRuleIdBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'taxRuleId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionLineItemTaxModifier, TransactionLineItemTaxModifier,
      QAfterFilterCondition> taxRuleIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'taxRuleId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionLineItemTaxModifier, TransactionLineItemTaxModifier,
      QAfterFilterCondition> taxRuleIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'taxRuleId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionLineItemTaxModifier, TransactionLineItemTaxModifier,
          QAfterFilterCondition>
      taxRuleIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'taxRuleId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionLineItemTaxModifier, TransactionLineItemTaxModifier,
          QAfterFilterCondition>
      taxRuleIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'taxRuleId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionLineItemTaxModifier, TransactionLineItemTaxModifier,
      QAfterFilterCondition> taxRuleIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'taxRuleId',
        value: '',
      ));
    });
  }

  QueryBuilder<TransactionLineItemTaxModifier, TransactionLineItemTaxModifier,
      QAfterFilterCondition> taxRuleIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'taxRuleId',
        value: '',
      ));
    });
  }

  QueryBuilder<TransactionLineItemTaxModifier, TransactionLineItemTaxModifier,
      QAfterFilterCondition> taxRuleNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'taxRuleName',
      ));
    });
  }

  QueryBuilder<TransactionLineItemTaxModifier, TransactionLineItemTaxModifier,
      QAfterFilterCondition> taxRuleNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'taxRuleName',
      ));
    });
  }

  QueryBuilder<TransactionLineItemTaxModifier, TransactionLineItemTaxModifier,
      QAfterFilterCondition> taxRuleNameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'taxRuleName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionLineItemTaxModifier, TransactionLineItemTaxModifier,
      QAfterFilterCondition> taxRuleNameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'taxRuleName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionLineItemTaxModifier, TransactionLineItemTaxModifier,
      QAfterFilterCondition> taxRuleNameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'taxRuleName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionLineItemTaxModifier, TransactionLineItemTaxModifier,
      QAfterFilterCondition> taxRuleNameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'taxRuleName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionLineItemTaxModifier, TransactionLineItemTaxModifier,
      QAfterFilterCondition> taxRuleNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'taxRuleName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionLineItemTaxModifier, TransactionLineItemTaxModifier,
      QAfterFilterCondition> taxRuleNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'taxRuleName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionLineItemTaxModifier, TransactionLineItemTaxModifier,
          QAfterFilterCondition>
      taxRuleNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'taxRuleName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionLineItemTaxModifier, TransactionLineItemTaxModifier,
          QAfterFilterCondition>
      taxRuleNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'taxRuleName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionLineItemTaxModifier, TransactionLineItemTaxModifier,
      QAfterFilterCondition> taxRuleNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'taxRuleName',
        value: '',
      ));
    });
  }

  QueryBuilder<TransactionLineItemTaxModifier, TransactionLineItemTaxModifier,
      QAfterFilterCondition> taxRuleNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'taxRuleName',
        value: '',
      ));
    });
  }

  QueryBuilder<TransactionLineItemTaxModifier, TransactionLineItemTaxModifier,
      QAfterFilterCondition> taxableAmountIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'taxableAmount',
      ));
    });
  }

  QueryBuilder<TransactionLineItemTaxModifier, TransactionLineItemTaxModifier,
      QAfterFilterCondition> taxableAmountIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'taxableAmount',
      ));
    });
  }

  QueryBuilder<TransactionLineItemTaxModifier, TransactionLineItemTaxModifier,
      QAfterFilterCondition> taxableAmountEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'taxableAmount',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<TransactionLineItemTaxModifier, TransactionLineItemTaxModifier,
      QAfterFilterCondition> taxableAmountGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'taxableAmount',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<TransactionLineItemTaxModifier, TransactionLineItemTaxModifier,
      QAfterFilterCondition> taxableAmountLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'taxableAmount',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<TransactionLineItemTaxModifier, TransactionLineItemTaxModifier,
      QAfterFilterCondition> taxableAmountBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'taxableAmount',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<TransactionLineItemTaxModifier, TransactionLineItemTaxModifier,
      QAfterFilterCondition> transSeqIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'transSeq',
      ));
    });
  }

  QueryBuilder<TransactionLineItemTaxModifier, TransactionLineItemTaxModifier,
      QAfterFilterCondition> transSeqIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'transSeq',
      ));
    });
  }

  QueryBuilder<TransactionLineItemTaxModifier, TransactionLineItemTaxModifier,
      QAfterFilterCondition> transSeqEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'transSeq',
        value: value,
      ));
    });
  }

  QueryBuilder<TransactionLineItemTaxModifier, TransactionLineItemTaxModifier,
      QAfterFilterCondition> transSeqGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'transSeq',
        value: value,
      ));
    });
  }

  QueryBuilder<TransactionLineItemTaxModifier, TransactionLineItemTaxModifier,
      QAfterFilterCondition> transSeqLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'transSeq',
        value: value,
      ));
    });
  }

  QueryBuilder<TransactionLineItemTaxModifier, TransactionLineItemTaxModifier,
      QAfterFilterCondition> transSeqBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'transSeq',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension TransactionLineItemTaxModifierQueryObject on QueryBuilder<
    TransactionLineItemTaxModifier,
    TransactionLineItemTaxModifier,
    QFilterCondition> {}
