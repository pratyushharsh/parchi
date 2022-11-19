// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trn_line_item_modifier.dart';

// **************************************************************************
// IsarEmbeddedGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters

const TransactionLineItemModifierEntitySchema = Schema(
  name: r'TransactionLineItemModifierEntity',
  id: 2684381876269442098,
  properties: {
    r'amount': PropertySchema(
      id: 0,
      name: r'amount',
      type: IsarType.double,
    ),
    r'businessDate': PropertySchema(
      id: 1,
      name: r'businessDate',
      type: IsarType.dateTime,
    ),
    r'dealId': PropertySchema(
      id: 2,
      name: r'dealId',
      type: IsarType.string,
    ),
    r'description': PropertySchema(
      id: 3,
      name: r'description',
      type: IsarType.string,
    ),
    r'discountCode': PropertySchema(
      id: 4,
      name: r'discountCode',
      type: IsarType.string,
    ),
    r'discountReasonCode': PropertySchema(
      id: 5,
      name: r'discountReasonCode',
      type: IsarType.string,
    ),
    r'extendedAmount': PropertySchema(
      id: 6,
      name: r'extendedAmount',
      type: IsarType.double,
    ),
    r'groupDiscountId': PropertySchema(
      id: 7,
      name: r'groupDiscountId',
      type: IsarType.string,
    ),
    r'isVoid': PropertySchema(
      id: 8,
      name: r'isVoid',
      type: IsarType.bool,
    ),
    r'lineItemModSeq': PropertySchema(
      id: 9,
      name: r'lineItemModSeq',
      type: IsarType.long,
    ),
    r'lineItemSeq': PropertySchema(
      id: 10,
      name: r'lineItemSeq',
      type: IsarType.long,
    ),
    r'notes': PropertySchema(
      id: 11,
      name: r'notes',
      type: IsarType.string,
    ),
    r'percent': PropertySchema(
      id: 12,
      name: r'percent',
      type: IsarType.double,
    ),
    r'posId': PropertySchema(
      id: 13,
      name: r'posId',
      type: IsarType.long,
    ),
    r'priceModifierReasonCode': PropertySchema(
      id: 14,
      name: r'priceModifierReasonCode',
      type: IsarType.string,
    ),
    r'promotionId': PropertySchema(
      id: 15,
      name: r'promotionId',
      type: IsarType.string,
    ),
    r'storeId': PropertySchema(
      id: 16,
      name: r'storeId',
      type: IsarType.long,
    ),
    r'transSeq': PropertySchema(
      id: 17,
      name: r'transSeq',
      type: IsarType.string,
    )
  },
  estimateSize: _transactionLineItemModifierEntityEstimateSize,
  serialize: _transactionLineItemModifierEntitySerialize,
  deserialize: _transactionLineItemModifierEntityDeserialize,
  deserializeProp: _transactionLineItemModifierEntityDeserializeProp,
);

int _transactionLineItemModifierEntityEstimateSize(
  TransactionLineItemModifierEntity object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.dealId;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.description;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.discountCode;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.discountReasonCode;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.groupDiscountId;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.notes;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.priceModifierReasonCode;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.promotionId;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.transSeq;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _transactionLineItemModifierEntitySerialize(
  TransactionLineItemModifierEntity object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDouble(offsets[0], object.amount);
  writer.writeDateTime(offsets[1], object.businessDate);
  writer.writeString(offsets[2], object.dealId);
  writer.writeString(offsets[3], object.description);
  writer.writeString(offsets[4], object.discountCode);
  writer.writeString(offsets[5], object.discountReasonCode);
  writer.writeDouble(offsets[6], object.extendedAmount);
  writer.writeString(offsets[7], object.groupDiscountId);
  writer.writeBool(offsets[8], object.isVoid);
  writer.writeLong(offsets[9], object.lineItemModSeq);
  writer.writeLong(offsets[10], object.lineItemSeq);
  writer.writeString(offsets[11], object.notes);
  writer.writeDouble(offsets[12], object.percent);
  writer.writeLong(offsets[13], object.posId);
  writer.writeString(offsets[14], object.priceModifierReasonCode);
  writer.writeString(offsets[15], object.promotionId);
  writer.writeLong(offsets[16], object.storeId);
  writer.writeString(offsets[17], object.transSeq);
}

TransactionLineItemModifierEntity _transactionLineItemModifierEntityDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = TransactionLineItemModifierEntity(
    amount: reader.readDoubleOrNull(offsets[0]) ?? 0,
    businessDate: reader.readDateTimeOrNull(offsets[1]),
    dealId: reader.readStringOrNull(offsets[2]),
    description: reader.readStringOrNull(offsets[3]),
    discountCode: reader.readStringOrNull(offsets[4]),
    discountReasonCode: reader.readStringOrNull(offsets[5]),
    extendedAmount: reader.readDoubleOrNull(offsets[6]) ?? 0,
    groupDiscountId: reader.readStringOrNull(offsets[7]),
    isVoid: reader.readBoolOrNull(offsets[8]),
    lineItemModSeq: reader.readLongOrNull(offsets[9]),
    lineItemSeq: reader.readLongOrNull(offsets[10]),
    notes: reader.readStringOrNull(offsets[11]),
    percent: reader.readDoubleOrNull(offsets[12]),
    posId: reader.readLongOrNull(offsets[13]),
    priceModifierReasonCode: reader.readStringOrNull(offsets[14]),
    promotionId: reader.readStringOrNull(offsets[15]),
    storeId: reader.readLongOrNull(offsets[16]),
    transSeq: reader.readStringOrNull(offsets[17]),
  );
  return object;
}

P _transactionLineItemModifierEntityDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDoubleOrNull(offset) ?? 0) as P;
    case 1:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    case 4:
      return (reader.readStringOrNull(offset)) as P;
    case 5:
      return (reader.readStringOrNull(offset)) as P;
    case 6:
      return (reader.readDoubleOrNull(offset) ?? 0) as P;
    case 7:
      return (reader.readStringOrNull(offset)) as P;
    case 8:
      return (reader.readBoolOrNull(offset)) as P;
    case 9:
      return (reader.readLongOrNull(offset)) as P;
    case 10:
      return (reader.readLongOrNull(offset)) as P;
    case 11:
      return (reader.readStringOrNull(offset)) as P;
    case 12:
      return (reader.readDoubleOrNull(offset)) as P;
    case 13:
      return (reader.readLongOrNull(offset)) as P;
    case 14:
      return (reader.readStringOrNull(offset)) as P;
    case 15:
      return (reader.readStringOrNull(offset)) as P;
    case 16:
      return (reader.readLongOrNull(offset)) as P;
    case 17:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension TransactionLineItemModifierEntityQueryFilter on QueryBuilder<
    TransactionLineItemModifierEntity,
    TransactionLineItemModifierEntity,
    QFilterCondition> {
  QueryBuilder<TransactionLineItemModifierEntity,
      TransactionLineItemModifierEntity, QAfterFilterCondition> amountEqualTo(
    double value, {
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

  QueryBuilder<
      TransactionLineItemModifierEntity,
      TransactionLineItemModifierEntity,
      QAfterFilterCondition> amountGreaterThan(
    double value, {
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

  QueryBuilder<TransactionLineItemModifierEntity,
      TransactionLineItemModifierEntity, QAfterFilterCondition> amountLessThan(
    double value, {
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

  QueryBuilder<TransactionLineItemModifierEntity,
      TransactionLineItemModifierEntity, QAfterFilterCondition> amountBetween(
    double lower,
    double upper, {
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

  QueryBuilder<
      TransactionLineItemModifierEntity,
      TransactionLineItemModifierEntity,
      QAfterFilterCondition> businessDateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'businessDate',
      ));
    });
  }

  QueryBuilder<
      TransactionLineItemModifierEntity,
      TransactionLineItemModifierEntity,
      QAfterFilterCondition> businessDateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'businessDate',
      ));
    });
  }

  QueryBuilder<
      TransactionLineItemModifierEntity,
      TransactionLineItemModifierEntity,
      QAfterFilterCondition> businessDateEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'businessDate',
        value: value,
      ));
    });
  }

  QueryBuilder<
      TransactionLineItemModifierEntity,
      TransactionLineItemModifierEntity,
      QAfterFilterCondition> businessDateGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'businessDate',
        value: value,
      ));
    });
  }

  QueryBuilder<
      TransactionLineItemModifierEntity,
      TransactionLineItemModifierEntity,
      QAfterFilterCondition> businessDateLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'businessDate',
        value: value,
      ));
    });
  }

  QueryBuilder<
      TransactionLineItemModifierEntity,
      TransactionLineItemModifierEntity,
      QAfterFilterCondition> businessDateBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'businessDate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<TransactionLineItemModifierEntity,
      TransactionLineItemModifierEntity, QAfterFilterCondition> dealIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'dealId',
      ));
    });
  }

  QueryBuilder<
      TransactionLineItemModifierEntity,
      TransactionLineItemModifierEntity,
      QAfterFilterCondition> dealIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'dealId',
      ));
    });
  }

  QueryBuilder<TransactionLineItemModifierEntity,
      TransactionLineItemModifierEntity, QAfterFilterCondition> dealIdEqualTo(
    String? value, {
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

  QueryBuilder<
      TransactionLineItemModifierEntity,
      TransactionLineItemModifierEntity,
      QAfterFilterCondition> dealIdGreaterThan(
    String? value, {
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

  QueryBuilder<TransactionLineItemModifierEntity,
      TransactionLineItemModifierEntity, QAfterFilterCondition> dealIdLessThan(
    String? value, {
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

  QueryBuilder<TransactionLineItemModifierEntity,
      TransactionLineItemModifierEntity, QAfterFilterCondition> dealIdBetween(
    String? lower,
    String? upper, {
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

  QueryBuilder<
      TransactionLineItemModifierEntity,
      TransactionLineItemModifierEntity,
      QAfterFilterCondition> dealIdStartsWith(
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

  QueryBuilder<TransactionLineItemModifierEntity,
      TransactionLineItemModifierEntity, QAfterFilterCondition> dealIdEndsWith(
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

  QueryBuilder<TransactionLineItemModifierEntity,
          TransactionLineItemModifierEntity, QAfterFilterCondition>
      dealIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'dealId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionLineItemModifierEntity,
          TransactionLineItemModifierEntity, QAfterFilterCondition>
      dealIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'dealId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<
      TransactionLineItemModifierEntity,
      TransactionLineItemModifierEntity,
      QAfterFilterCondition> dealIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'dealId',
        value: '',
      ));
    });
  }

  QueryBuilder<
      TransactionLineItemModifierEntity,
      TransactionLineItemModifierEntity,
      QAfterFilterCondition> dealIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'dealId',
        value: '',
      ));
    });
  }

  QueryBuilder<
      TransactionLineItemModifierEntity,
      TransactionLineItemModifierEntity,
      QAfterFilterCondition> descriptionIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'description',
      ));
    });
  }

  QueryBuilder<
      TransactionLineItemModifierEntity,
      TransactionLineItemModifierEntity,
      QAfterFilterCondition> descriptionIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'description',
      ));
    });
  }

  QueryBuilder<
      TransactionLineItemModifierEntity,
      TransactionLineItemModifierEntity,
      QAfterFilterCondition> descriptionEqualTo(
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

  QueryBuilder<
      TransactionLineItemModifierEntity,
      TransactionLineItemModifierEntity,
      QAfterFilterCondition> descriptionGreaterThan(
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

  QueryBuilder<
      TransactionLineItemModifierEntity,
      TransactionLineItemModifierEntity,
      QAfterFilterCondition> descriptionLessThan(
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

  QueryBuilder<
      TransactionLineItemModifierEntity,
      TransactionLineItemModifierEntity,
      QAfterFilterCondition> descriptionBetween(
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

  QueryBuilder<
      TransactionLineItemModifierEntity,
      TransactionLineItemModifierEntity,
      QAfterFilterCondition> descriptionStartsWith(
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

  QueryBuilder<
      TransactionLineItemModifierEntity,
      TransactionLineItemModifierEntity,
      QAfterFilterCondition> descriptionEndsWith(
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

  QueryBuilder<TransactionLineItemModifierEntity,
          TransactionLineItemModifierEntity, QAfterFilterCondition>
      descriptionContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionLineItemModifierEntity,
          TransactionLineItemModifierEntity, QAfterFilterCondition>
      descriptionMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'description',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<
      TransactionLineItemModifierEntity,
      TransactionLineItemModifierEntity,
      QAfterFilterCondition> descriptionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'description',
        value: '',
      ));
    });
  }

  QueryBuilder<
      TransactionLineItemModifierEntity,
      TransactionLineItemModifierEntity,
      QAfterFilterCondition> descriptionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'description',
        value: '',
      ));
    });
  }

  QueryBuilder<
      TransactionLineItemModifierEntity,
      TransactionLineItemModifierEntity,
      QAfterFilterCondition> discountCodeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'discountCode',
      ));
    });
  }

  QueryBuilder<
      TransactionLineItemModifierEntity,
      TransactionLineItemModifierEntity,
      QAfterFilterCondition> discountCodeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'discountCode',
      ));
    });
  }

  QueryBuilder<
      TransactionLineItemModifierEntity,
      TransactionLineItemModifierEntity,
      QAfterFilterCondition> discountCodeEqualTo(
    String? value, {
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

  QueryBuilder<
      TransactionLineItemModifierEntity,
      TransactionLineItemModifierEntity,
      QAfterFilterCondition> discountCodeGreaterThan(
    String? value, {
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

  QueryBuilder<
      TransactionLineItemModifierEntity,
      TransactionLineItemModifierEntity,
      QAfterFilterCondition> discountCodeLessThan(
    String? value, {
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

  QueryBuilder<
      TransactionLineItemModifierEntity,
      TransactionLineItemModifierEntity,
      QAfterFilterCondition> discountCodeBetween(
    String? lower,
    String? upper, {
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

  QueryBuilder<
      TransactionLineItemModifierEntity,
      TransactionLineItemModifierEntity,
      QAfterFilterCondition> discountCodeStartsWith(
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

  QueryBuilder<
      TransactionLineItemModifierEntity,
      TransactionLineItemModifierEntity,
      QAfterFilterCondition> discountCodeEndsWith(
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

  QueryBuilder<TransactionLineItemModifierEntity,
          TransactionLineItemModifierEntity, QAfterFilterCondition>
      discountCodeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'discountCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionLineItemModifierEntity,
          TransactionLineItemModifierEntity, QAfterFilterCondition>
      discountCodeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'discountCode',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<
      TransactionLineItemModifierEntity,
      TransactionLineItemModifierEntity,
      QAfterFilterCondition> discountCodeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'discountCode',
        value: '',
      ));
    });
  }

  QueryBuilder<
      TransactionLineItemModifierEntity,
      TransactionLineItemModifierEntity,
      QAfterFilterCondition> discountCodeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'discountCode',
        value: '',
      ));
    });
  }

  QueryBuilder<
      TransactionLineItemModifierEntity,
      TransactionLineItemModifierEntity,
      QAfterFilterCondition> discountReasonCodeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'discountReasonCode',
      ));
    });
  }

  QueryBuilder<
      TransactionLineItemModifierEntity,
      TransactionLineItemModifierEntity,
      QAfterFilterCondition> discountReasonCodeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'discountReasonCode',
      ));
    });
  }

  QueryBuilder<
      TransactionLineItemModifierEntity,
      TransactionLineItemModifierEntity,
      QAfterFilterCondition> discountReasonCodeEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'discountReasonCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<
      TransactionLineItemModifierEntity,
      TransactionLineItemModifierEntity,
      QAfterFilterCondition> discountReasonCodeGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'discountReasonCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<
      TransactionLineItemModifierEntity,
      TransactionLineItemModifierEntity,
      QAfterFilterCondition> discountReasonCodeLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'discountReasonCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<
      TransactionLineItemModifierEntity,
      TransactionLineItemModifierEntity,
      QAfterFilterCondition> discountReasonCodeBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'discountReasonCode',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<
      TransactionLineItemModifierEntity,
      TransactionLineItemModifierEntity,
      QAfterFilterCondition> discountReasonCodeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'discountReasonCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<
      TransactionLineItemModifierEntity,
      TransactionLineItemModifierEntity,
      QAfterFilterCondition> discountReasonCodeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'discountReasonCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionLineItemModifierEntity,
          TransactionLineItemModifierEntity, QAfterFilterCondition>
      discountReasonCodeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'discountReasonCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionLineItemModifierEntity,
          TransactionLineItemModifierEntity, QAfterFilterCondition>
      discountReasonCodeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'discountReasonCode',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<
      TransactionLineItemModifierEntity,
      TransactionLineItemModifierEntity,
      QAfterFilterCondition> discountReasonCodeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'discountReasonCode',
        value: '',
      ));
    });
  }

  QueryBuilder<
      TransactionLineItemModifierEntity,
      TransactionLineItemModifierEntity,
      QAfterFilterCondition> discountReasonCodeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'discountReasonCode',
        value: '',
      ));
    });
  }

  QueryBuilder<
      TransactionLineItemModifierEntity,
      TransactionLineItemModifierEntity,
      QAfterFilterCondition> extendedAmountEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'extendedAmount',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<
      TransactionLineItemModifierEntity,
      TransactionLineItemModifierEntity,
      QAfterFilterCondition> extendedAmountGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'extendedAmount',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<
      TransactionLineItemModifierEntity,
      TransactionLineItemModifierEntity,
      QAfterFilterCondition> extendedAmountLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'extendedAmount',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<
      TransactionLineItemModifierEntity,
      TransactionLineItemModifierEntity,
      QAfterFilterCondition> extendedAmountBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'extendedAmount',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<
      TransactionLineItemModifierEntity,
      TransactionLineItemModifierEntity,
      QAfterFilterCondition> groupDiscountIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'groupDiscountId',
      ));
    });
  }

  QueryBuilder<
      TransactionLineItemModifierEntity,
      TransactionLineItemModifierEntity,
      QAfterFilterCondition> groupDiscountIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'groupDiscountId',
      ));
    });
  }

  QueryBuilder<
      TransactionLineItemModifierEntity,
      TransactionLineItemModifierEntity,
      QAfterFilterCondition> groupDiscountIdEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'groupDiscountId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<
      TransactionLineItemModifierEntity,
      TransactionLineItemModifierEntity,
      QAfterFilterCondition> groupDiscountIdGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'groupDiscountId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<
      TransactionLineItemModifierEntity,
      TransactionLineItemModifierEntity,
      QAfterFilterCondition> groupDiscountIdLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'groupDiscountId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<
      TransactionLineItemModifierEntity,
      TransactionLineItemModifierEntity,
      QAfterFilterCondition> groupDiscountIdBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'groupDiscountId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<
      TransactionLineItemModifierEntity,
      TransactionLineItemModifierEntity,
      QAfterFilterCondition> groupDiscountIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'groupDiscountId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<
      TransactionLineItemModifierEntity,
      TransactionLineItemModifierEntity,
      QAfterFilterCondition> groupDiscountIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'groupDiscountId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionLineItemModifierEntity,
          TransactionLineItemModifierEntity, QAfterFilterCondition>
      groupDiscountIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'groupDiscountId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionLineItemModifierEntity,
          TransactionLineItemModifierEntity, QAfterFilterCondition>
      groupDiscountIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'groupDiscountId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<
      TransactionLineItemModifierEntity,
      TransactionLineItemModifierEntity,
      QAfterFilterCondition> groupDiscountIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'groupDiscountId',
        value: '',
      ));
    });
  }

  QueryBuilder<
      TransactionLineItemModifierEntity,
      TransactionLineItemModifierEntity,
      QAfterFilterCondition> groupDiscountIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'groupDiscountId',
        value: '',
      ));
    });
  }

  QueryBuilder<TransactionLineItemModifierEntity,
      TransactionLineItemModifierEntity, QAfterFilterCondition> isVoidIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'isVoid',
      ));
    });
  }

  QueryBuilder<
      TransactionLineItemModifierEntity,
      TransactionLineItemModifierEntity,
      QAfterFilterCondition> isVoidIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'isVoid',
      ));
    });
  }

  QueryBuilder<
      TransactionLineItemModifierEntity,
      TransactionLineItemModifierEntity,
      QAfterFilterCondition> isVoidEqualTo(bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isVoid',
        value: value,
      ));
    });
  }

  QueryBuilder<
      TransactionLineItemModifierEntity,
      TransactionLineItemModifierEntity,
      QAfterFilterCondition> lineItemModSeqIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'lineItemModSeq',
      ));
    });
  }

  QueryBuilder<
      TransactionLineItemModifierEntity,
      TransactionLineItemModifierEntity,
      QAfterFilterCondition> lineItemModSeqIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'lineItemModSeq',
      ));
    });
  }

  QueryBuilder<
      TransactionLineItemModifierEntity,
      TransactionLineItemModifierEntity,
      QAfterFilterCondition> lineItemModSeqEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lineItemModSeq',
        value: value,
      ));
    });
  }

  QueryBuilder<
      TransactionLineItemModifierEntity,
      TransactionLineItemModifierEntity,
      QAfterFilterCondition> lineItemModSeqGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'lineItemModSeq',
        value: value,
      ));
    });
  }

  QueryBuilder<
      TransactionLineItemModifierEntity,
      TransactionLineItemModifierEntity,
      QAfterFilterCondition> lineItemModSeqLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'lineItemModSeq',
        value: value,
      ));
    });
  }

  QueryBuilder<
      TransactionLineItemModifierEntity,
      TransactionLineItemModifierEntity,
      QAfterFilterCondition> lineItemModSeqBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'lineItemModSeq',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<
      TransactionLineItemModifierEntity,
      TransactionLineItemModifierEntity,
      QAfterFilterCondition> lineItemSeqIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'lineItemSeq',
      ));
    });
  }

  QueryBuilder<
      TransactionLineItemModifierEntity,
      TransactionLineItemModifierEntity,
      QAfterFilterCondition> lineItemSeqIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'lineItemSeq',
      ));
    });
  }

  QueryBuilder<
      TransactionLineItemModifierEntity,
      TransactionLineItemModifierEntity,
      QAfterFilterCondition> lineItemSeqEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lineItemSeq',
        value: value,
      ));
    });
  }

  QueryBuilder<
      TransactionLineItemModifierEntity,
      TransactionLineItemModifierEntity,
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

  QueryBuilder<
      TransactionLineItemModifierEntity,
      TransactionLineItemModifierEntity,
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

  QueryBuilder<
      TransactionLineItemModifierEntity,
      TransactionLineItemModifierEntity,
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

  QueryBuilder<TransactionLineItemModifierEntity,
      TransactionLineItemModifierEntity, QAfterFilterCondition> notesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'notes',
      ));
    });
  }

  QueryBuilder<
      TransactionLineItemModifierEntity,
      TransactionLineItemModifierEntity,
      QAfterFilterCondition> notesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'notes',
      ));
    });
  }

  QueryBuilder<TransactionLineItemModifierEntity,
      TransactionLineItemModifierEntity, QAfterFilterCondition> notesEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'notes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<
      TransactionLineItemModifierEntity,
      TransactionLineItemModifierEntity,
      QAfterFilterCondition> notesGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'notes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionLineItemModifierEntity,
      TransactionLineItemModifierEntity, QAfterFilterCondition> notesLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'notes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionLineItemModifierEntity,
      TransactionLineItemModifierEntity, QAfterFilterCondition> notesBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'notes',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionLineItemModifierEntity,
      TransactionLineItemModifierEntity, QAfterFilterCondition> notesStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'notes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionLineItemModifierEntity,
      TransactionLineItemModifierEntity, QAfterFilterCondition> notesEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'notes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionLineItemModifierEntity,
          TransactionLineItemModifierEntity, QAfterFilterCondition>
      notesContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'notes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionLineItemModifierEntity,
          TransactionLineItemModifierEntity, QAfterFilterCondition>
      notesMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'notes',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionLineItemModifierEntity,
      TransactionLineItemModifierEntity, QAfterFilterCondition> notesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'notes',
        value: '',
      ));
    });
  }

  QueryBuilder<
      TransactionLineItemModifierEntity,
      TransactionLineItemModifierEntity,
      QAfterFilterCondition> notesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'notes',
        value: '',
      ));
    });
  }

  QueryBuilder<
      TransactionLineItemModifierEntity,
      TransactionLineItemModifierEntity,
      QAfterFilterCondition> percentIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'percent',
      ));
    });
  }

  QueryBuilder<
      TransactionLineItemModifierEntity,
      TransactionLineItemModifierEntity,
      QAfterFilterCondition> percentIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'percent',
      ));
    });
  }

  QueryBuilder<TransactionLineItemModifierEntity,
      TransactionLineItemModifierEntity, QAfterFilterCondition> percentEqualTo(
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

  QueryBuilder<
      TransactionLineItemModifierEntity,
      TransactionLineItemModifierEntity,
      QAfterFilterCondition> percentGreaterThan(
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

  QueryBuilder<TransactionLineItemModifierEntity,
      TransactionLineItemModifierEntity, QAfterFilterCondition> percentLessThan(
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

  QueryBuilder<TransactionLineItemModifierEntity,
      TransactionLineItemModifierEntity, QAfterFilterCondition> percentBetween(
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

  QueryBuilder<TransactionLineItemModifierEntity,
      TransactionLineItemModifierEntity, QAfterFilterCondition> posIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'posId',
      ));
    });
  }

  QueryBuilder<
      TransactionLineItemModifierEntity,
      TransactionLineItemModifierEntity,
      QAfterFilterCondition> posIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'posId',
      ));
    });
  }

  QueryBuilder<
      TransactionLineItemModifierEntity,
      TransactionLineItemModifierEntity,
      QAfterFilterCondition> posIdEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'posId',
        value: value,
      ));
    });
  }

  QueryBuilder<
      TransactionLineItemModifierEntity,
      TransactionLineItemModifierEntity,
      QAfterFilterCondition> posIdGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'posId',
        value: value,
      ));
    });
  }

  QueryBuilder<TransactionLineItemModifierEntity,
      TransactionLineItemModifierEntity, QAfterFilterCondition> posIdLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'posId',
        value: value,
      ));
    });
  }

  QueryBuilder<TransactionLineItemModifierEntity,
      TransactionLineItemModifierEntity, QAfterFilterCondition> posIdBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'posId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<
      TransactionLineItemModifierEntity,
      TransactionLineItemModifierEntity,
      QAfterFilterCondition> priceModifierReasonCodeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'priceModifierReasonCode',
      ));
    });
  }

  QueryBuilder<
      TransactionLineItemModifierEntity,
      TransactionLineItemModifierEntity,
      QAfterFilterCondition> priceModifierReasonCodeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'priceModifierReasonCode',
      ));
    });
  }

  QueryBuilder<
      TransactionLineItemModifierEntity,
      TransactionLineItemModifierEntity,
      QAfterFilterCondition> priceModifierReasonCodeEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'priceModifierReasonCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<
      TransactionLineItemModifierEntity,
      TransactionLineItemModifierEntity,
      QAfterFilterCondition> priceModifierReasonCodeGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'priceModifierReasonCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<
      TransactionLineItemModifierEntity,
      TransactionLineItemModifierEntity,
      QAfterFilterCondition> priceModifierReasonCodeLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'priceModifierReasonCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<
      TransactionLineItemModifierEntity,
      TransactionLineItemModifierEntity,
      QAfterFilterCondition> priceModifierReasonCodeBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'priceModifierReasonCode',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<
      TransactionLineItemModifierEntity,
      TransactionLineItemModifierEntity,
      QAfterFilterCondition> priceModifierReasonCodeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'priceModifierReasonCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<
      TransactionLineItemModifierEntity,
      TransactionLineItemModifierEntity,
      QAfterFilterCondition> priceModifierReasonCodeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'priceModifierReasonCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionLineItemModifierEntity,
          TransactionLineItemModifierEntity, QAfterFilterCondition>
      priceModifierReasonCodeContains(String value,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'priceModifierReasonCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionLineItemModifierEntity,
          TransactionLineItemModifierEntity, QAfterFilterCondition>
      priceModifierReasonCodeMatches(String pattern,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'priceModifierReasonCode',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<
      TransactionLineItemModifierEntity,
      TransactionLineItemModifierEntity,
      QAfterFilterCondition> priceModifierReasonCodeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'priceModifierReasonCode',
        value: '',
      ));
    });
  }

  QueryBuilder<
      TransactionLineItemModifierEntity,
      TransactionLineItemModifierEntity,
      QAfterFilterCondition> priceModifierReasonCodeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'priceModifierReasonCode',
        value: '',
      ));
    });
  }

  QueryBuilder<
      TransactionLineItemModifierEntity,
      TransactionLineItemModifierEntity,
      QAfterFilterCondition> promotionIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'promotionId',
      ));
    });
  }

  QueryBuilder<
      TransactionLineItemModifierEntity,
      TransactionLineItemModifierEntity,
      QAfterFilterCondition> promotionIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'promotionId',
      ));
    });
  }

  QueryBuilder<
      TransactionLineItemModifierEntity,
      TransactionLineItemModifierEntity,
      QAfterFilterCondition> promotionIdEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'promotionId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<
      TransactionLineItemModifierEntity,
      TransactionLineItemModifierEntity,
      QAfterFilterCondition> promotionIdGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'promotionId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<
      TransactionLineItemModifierEntity,
      TransactionLineItemModifierEntity,
      QAfterFilterCondition> promotionIdLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'promotionId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<
      TransactionLineItemModifierEntity,
      TransactionLineItemModifierEntity,
      QAfterFilterCondition> promotionIdBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'promotionId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<
      TransactionLineItemModifierEntity,
      TransactionLineItemModifierEntity,
      QAfterFilterCondition> promotionIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'promotionId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<
      TransactionLineItemModifierEntity,
      TransactionLineItemModifierEntity,
      QAfterFilterCondition> promotionIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'promotionId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionLineItemModifierEntity,
          TransactionLineItemModifierEntity, QAfterFilterCondition>
      promotionIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'promotionId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionLineItemModifierEntity,
          TransactionLineItemModifierEntity, QAfterFilterCondition>
      promotionIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'promotionId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<
      TransactionLineItemModifierEntity,
      TransactionLineItemModifierEntity,
      QAfterFilterCondition> promotionIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'promotionId',
        value: '',
      ));
    });
  }

  QueryBuilder<
      TransactionLineItemModifierEntity,
      TransactionLineItemModifierEntity,
      QAfterFilterCondition> promotionIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'promotionId',
        value: '',
      ));
    });
  }

  QueryBuilder<
      TransactionLineItemModifierEntity,
      TransactionLineItemModifierEntity,
      QAfterFilterCondition> storeIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'storeId',
      ));
    });
  }

  QueryBuilder<
      TransactionLineItemModifierEntity,
      TransactionLineItemModifierEntity,
      QAfterFilterCondition> storeIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'storeId',
      ));
    });
  }

  QueryBuilder<
      TransactionLineItemModifierEntity,
      TransactionLineItemModifierEntity,
      QAfterFilterCondition> storeIdEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'storeId',
        value: value,
      ));
    });
  }

  QueryBuilder<
      TransactionLineItemModifierEntity,
      TransactionLineItemModifierEntity,
      QAfterFilterCondition> storeIdGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'storeId',
        value: value,
      ));
    });
  }

  QueryBuilder<TransactionLineItemModifierEntity,
      TransactionLineItemModifierEntity, QAfterFilterCondition> storeIdLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'storeId',
        value: value,
      ));
    });
  }

  QueryBuilder<TransactionLineItemModifierEntity,
      TransactionLineItemModifierEntity, QAfterFilterCondition> storeIdBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'storeId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<
      TransactionLineItemModifierEntity,
      TransactionLineItemModifierEntity,
      QAfterFilterCondition> transSeqIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'transSeq',
      ));
    });
  }

  QueryBuilder<
      TransactionLineItemModifierEntity,
      TransactionLineItemModifierEntity,
      QAfterFilterCondition> transSeqIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'transSeq',
      ));
    });
  }

  QueryBuilder<TransactionLineItemModifierEntity,
      TransactionLineItemModifierEntity, QAfterFilterCondition> transSeqEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'transSeq',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<
      TransactionLineItemModifierEntity,
      TransactionLineItemModifierEntity,
      QAfterFilterCondition> transSeqGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'transSeq',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<
      TransactionLineItemModifierEntity,
      TransactionLineItemModifierEntity,
      QAfterFilterCondition> transSeqLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'transSeq',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionLineItemModifierEntity,
      TransactionLineItemModifierEntity, QAfterFilterCondition> transSeqBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'transSeq',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<
      TransactionLineItemModifierEntity,
      TransactionLineItemModifierEntity,
      QAfterFilterCondition> transSeqStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'transSeq',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<
      TransactionLineItemModifierEntity,
      TransactionLineItemModifierEntity,
      QAfterFilterCondition> transSeqEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'transSeq',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionLineItemModifierEntity,
          TransactionLineItemModifierEntity, QAfterFilterCondition>
      transSeqContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'transSeq',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionLineItemModifierEntity,
          TransactionLineItemModifierEntity, QAfterFilterCondition>
      transSeqMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'transSeq',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<
      TransactionLineItemModifierEntity,
      TransactionLineItemModifierEntity,
      QAfterFilterCondition> transSeqIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'transSeq',
        value: '',
      ));
    });
  }

  QueryBuilder<
      TransactionLineItemModifierEntity,
      TransactionLineItemModifierEntity,
      QAfterFilterCondition> transSeqIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'transSeq',
        value: '',
      ));
    });
  }
}

extension TransactionLineItemModifierEntityQueryObject on QueryBuilder<
    TransactionLineItemModifierEntity,
    TransactionLineItemModifierEntity,
    QFilterCondition> {}
