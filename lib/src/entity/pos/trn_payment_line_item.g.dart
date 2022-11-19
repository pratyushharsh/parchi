// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trn_payment_line_item.dart';

// **************************************************************************
// IsarEmbeddedGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters

const TransactionPaymentLineItemEntitySchema = Schema(
  name: r'TransactionPaymentLineItemEntity',
  id: 3195217490948360581,
  properties: {
    r'amount': PropertySchema(
      id: 0,
      name: r'amount',
      type: IsarType.double,
    ),
    r'authCode': PropertySchema(
      id: 1,
      name: r'authCode',
      type: IsarType.string,
    ),
    r'beginDate': PropertySchema(
      id: 2,
      name: r'beginDate',
      type: IsarType.dateTime,
    ),
    r'currencyId': PropertySchema(
      id: 3,
      name: r'currencyId',
      type: IsarType.string,
    ),
    r'endDate': PropertySchema(
      id: 4,
      name: r'endDate',
      type: IsarType.dateTime,
    ),
    r'isVoid': PropertySchema(
      id: 5,
      name: r'isVoid',
      type: IsarType.bool,
    ),
    r'paymentSeq': PropertySchema(
      id: 6,
      name: r'paymentSeq',
      type: IsarType.long,
    ),
    r'tenderId': PropertySchema(
      id: 7,
      name: r'tenderId',
      type: IsarType.string,
    ),
    r'tenderStatusCode': PropertySchema(
      id: 8,
      name: r'tenderStatusCode',
      type: IsarType.string,
    ),
    r'token': PropertySchema(
      id: 9,
      name: r'token',
      type: IsarType.string,
    ),
    r'transId': PropertySchema(
      id: 10,
      name: r'transId',
      type: IsarType.string,
    )
  },
  estimateSize: _transactionPaymentLineItemEntityEstimateSize,
  serialize: _transactionPaymentLineItemEntitySerialize,
  deserialize: _transactionPaymentLineItemEntityDeserialize,
  deserializeProp: _transactionPaymentLineItemEntityDeserializeProp,
);

int _transactionPaymentLineItemEntityEstimateSize(
  TransactionPaymentLineItemEntity object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.authCode;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.currencyId;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.tenderId;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.tenderStatusCode;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.token;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.transId;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _transactionPaymentLineItemEntitySerialize(
  TransactionPaymentLineItemEntity object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDouble(offsets[0], object.amount);
  writer.writeString(offsets[1], object.authCode);
  writer.writeDateTime(offsets[2], object.beginDate);
  writer.writeString(offsets[3], object.currencyId);
  writer.writeDateTime(offsets[4], object.endDate);
  writer.writeBool(offsets[5], object.isVoid);
  writer.writeLong(offsets[6], object.paymentSeq);
  writer.writeString(offsets[7], object.tenderId);
  writer.writeString(offsets[8], object.tenderStatusCode);
  writer.writeString(offsets[9], object.token);
  writer.writeString(offsets[10], object.transId);
}

TransactionPaymentLineItemEntity _transactionPaymentLineItemEntityDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = TransactionPaymentLineItemEntity(
    amount: reader.readDoubleOrNull(offsets[0]),
    authCode: reader.readStringOrNull(offsets[1]),
    beginDate: reader.readDateTimeOrNull(offsets[2]),
    currencyId: reader.readStringOrNull(offsets[3]),
    endDate: reader.readDateTimeOrNull(offsets[4]),
    isVoid: reader.readBoolOrNull(offsets[5]) ?? false,
    paymentSeq: reader.readLongOrNull(offsets[6]),
    tenderId: reader.readStringOrNull(offsets[7]),
    tenderStatusCode: reader.readStringOrNull(offsets[8]),
    token: reader.readStringOrNull(offsets[9]),
    transId: reader.readStringOrNull(offsets[10]),
  );
  return object;
}

P _transactionPaymentLineItemEntityDeserializeProp<P>(
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
      return (reader.readDateTimeOrNull(offset)) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    case 4:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 5:
      return (reader.readBoolOrNull(offset) ?? false) as P;
    case 6:
      return (reader.readLongOrNull(offset)) as P;
    case 7:
      return (reader.readStringOrNull(offset)) as P;
    case 8:
      return (reader.readStringOrNull(offset)) as P;
    case 9:
      return (reader.readStringOrNull(offset)) as P;
    case 10:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension TransactionPaymentLineItemEntityQueryFilter on QueryBuilder<
    TransactionPaymentLineItemEntity,
    TransactionPaymentLineItemEntity,
    QFilterCondition> {
  QueryBuilder<TransactionPaymentLineItemEntity,
      TransactionPaymentLineItemEntity, QAfterFilterCondition> amountIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'amount',
      ));
    });
  }

  QueryBuilder<
      TransactionPaymentLineItemEntity,
      TransactionPaymentLineItemEntity,
      QAfterFilterCondition> amountIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'amount',
      ));
    });
  }

  QueryBuilder<TransactionPaymentLineItemEntity,
      TransactionPaymentLineItemEntity, QAfterFilterCondition> amountEqualTo(
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

  QueryBuilder<
      TransactionPaymentLineItemEntity,
      TransactionPaymentLineItemEntity,
      QAfterFilterCondition> amountGreaterThan(
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

  QueryBuilder<TransactionPaymentLineItemEntity,
      TransactionPaymentLineItemEntity, QAfterFilterCondition> amountLessThan(
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

  QueryBuilder<TransactionPaymentLineItemEntity,
      TransactionPaymentLineItemEntity, QAfterFilterCondition> amountBetween(
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

  QueryBuilder<
      TransactionPaymentLineItemEntity,
      TransactionPaymentLineItemEntity,
      QAfterFilterCondition> authCodeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'authCode',
      ));
    });
  }

  QueryBuilder<
      TransactionPaymentLineItemEntity,
      TransactionPaymentLineItemEntity,
      QAfterFilterCondition> authCodeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'authCode',
      ));
    });
  }

  QueryBuilder<TransactionPaymentLineItemEntity,
      TransactionPaymentLineItemEntity, QAfterFilterCondition> authCodeEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'authCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<
      TransactionPaymentLineItemEntity,
      TransactionPaymentLineItemEntity,
      QAfterFilterCondition> authCodeGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'authCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionPaymentLineItemEntity,
      TransactionPaymentLineItemEntity, QAfterFilterCondition> authCodeLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'authCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionPaymentLineItemEntity,
      TransactionPaymentLineItemEntity, QAfterFilterCondition> authCodeBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'authCode',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<
      TransactionPaymentLineItemEntity,
      TransactionPaymentLineItemEntity,
      QAfterFilterCondition> authCodeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'authCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionPaymentLineItemEntity,
      TransactionPaymentLineItemEntity, QAfterFilterCondition> authCodeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'authCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionPaymentLineItemEntity,
          TransactionPaymentLineItemEntity, QAfterFilterCondition>
      authCodeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'authCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionPaymentLineItemEntity,
          TransactionPaymentLineItemEntity, QAfterFilterCondition>
      authCodeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'authCode',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<
      TransactionPaymentLineItemEntity,
      TransactionPaymentLineItemEntity,
      QAfterFilterCondition> authCodeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'authCode',
        value: '',
      ));
    });
  }

  QueryBuilder<
      TransactionPaymentLineItemEntity,
      TransactionPaymentLineItemEntity,
      QAfterFilterCondition> authCodeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'authCode',
        value: '',
      ));
    });
  }

  QueryBuilder<
      TransactionPaymentLineItemEntity,
      TransactionPaymentLineItemEntity,
      QAfterFilterCondition> beginDateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'beginDate',
      ));
    });
  }

  QueryBuilder<
      TransactionPaymentLineItemEntity,
      TransactionPaymentLineItemEntity,
      QAfterFilterCondition> beginDateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'beginDate',
      ));
    });
  }

  QueryBuilder<
      TransactionPaymentLineItemEntity,
      TransactionPaymentLineItemEntity,
      QAfterFilterCondition> beginDateEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'beginDate',
        value: value,
      ));
    });
  }

  QueryBuilder<
      TransactionPaymentLineItemEntity,
      TransactionPaymentLineItemEntity,
      QAfterFilterCondition> beginDateGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'beginDate',
        value: value,
      ));
    });
  }

  QueryBuilder<
      TransactionPaymentLineItemEntity,
      TransactionPaymentLineItemEntity,
      QAfterFilterCondition> beginDateLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'beginDate',
        value: value,
      ));
    });
  }

  QueryBuilder<TransactionPaymentLineItemEntity,
      TransactionPaymentLineItemEntity, QAfterFilterCondition> beginDateBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'beginDate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<
      TransactionPaymentLineItemEntity,
      TransactionPaymentLineItemEntity,
      QAfterFilterCondition> currencyIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'currencyId',
      ));
    });
  }

  QueryBuilder<
      TransactionPaymentLineItemEntity,
      TransactionPaymentLineItemEntity,
      QAfterFilterCondition> currencyIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'currencyId',
      ));
    });
  }

  QueryBuilder<
      TransactionPaymentLineItemEntity,
      TransactionPaymentLineItemEntity,
      QAfterFilterCondition> currencyIdEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'currencyId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<
      TransactionPaymentLineItemEntity,
      TransactionPaymentLineItemEntity,
      QAfterFilterCondition> currencyIdGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'currencyId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<
      TransactionPaymentLineItemEntity,
      TransactionPaymentLineItemEntity,
      QAfterFilterCondition> currencyIdLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'currencyId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<
      TransactionPaymentLineItemEntity,
      TransactionPaymentLineItemEntity,
      QAfterFilterCondition> currencyIdBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'currencyId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<
      TransactionPaymentLineItemEntity,
      TransactionPaymentLineItemEntity,
      QAfterFilterCondition> currencyIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'currencyId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<
      TransactionPaymentLineItemEntity,
      TransactionPaymentLineItemEntity,
      QAfterFilterCondition> currencyIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'currencyId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionPaymentLineItemEntity,
          TransactionPaymentLineItemEntity, QAfterFilterCondition>
      currencyIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'currencyId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionPaymentLineItemEntity,
          TransactionPaymentLineItemEntity, QAfterFilterCondition>
      currencyIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'currencyId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<
      TransactionPaymentLineItemEntity,
      TransactionPaymentLineItemEntity,
      QAfterFilterCondition> currencyIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'currencyId',
        value: '',
      ));
    });
  }

  QueryBuilder<
      TransactionPaymentLineItemEntity,
      TransactionPaymentLineItemEntity,
      QAfterFilterCondition> currencyIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'currencyId',
        value: '',
      ));
    });
  }

  QueryBuilder<TransactionPaymentLineItemEntity,
      TransactionPaymentLineItemEntity, QAfterFilterCondition> endDateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'endDate',
      ));
    });
  }

  QueryBuilder<
      TransactionPaymentLineItemEntity,
      TransactionPaymentLineItemEntity,
      QAfterFilterCondition> endDateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'endDate',
      ));
    });
  }

  QueryBuilder<
      TransactionPaymentLineItemEntity,
      TransactionPaymentLineItemEntity,
      QAfterFilterCondition> endDateEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'endDate',
        value: value,
      ));
    });
  }

  QueryBuilder<
      TransactionPaymentLineItemEntity,
      TransactionPaymentLineItemEntity,
      QAfterFilterCondition> endDateGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'endDate',
        value: value,
      ));
    });
  }

  QueryBuilder<TransactionPaymentLineItemEntity,
      TransactionPaymentLineItemEntity, QAfterFilterCondition> endDateLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'endDate',
        value: value,
      ));
    });
  }

  QueryBuilder<TransactionPaymentLineItemEntity,
      TransactionPaymentLineItemEntity, QAfterFilterCondition> endDateBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'endDate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<
      TransactionPaymentLineItemEntity,
      TransactionPaymentLineItemEntity,
      QAfterFilterCondition> isVoidEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isVoid',
        value: value,
      ));
    });
  }

  QueryBuilder<
      TransactionPaymentLineItemEntity,
      TransactionPaymentLineItemEntity,
      QAfterFilterCondition> paymentSeqIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'paymentSeq',
      ));
    });
  }

  QueryBuilder<
      TransactionPaymentLineItemEntity,
      TransactionPaymentLineItemEntity,
      QAfterFilterCondition> paymentSeqIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'paymentSeq',
      ));
    });
  }

  QueryBuilder<
      TransactionPaymentLineItemEntity,
      TransactionPaymentLineItemEntity,
      QAfterFilterCondition> paymentSeqEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'paymentSeq',
        value: value,
      ));
    });
  }

  QueryBuilder<
      TransactionPaymentLineItemEntity,
      TransactionPaymentLineItemEntity,
      QAfterFilterCondition> paymentSeqGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'paymentSeq',
        value: value,
      ));
    });
  }

  QueryBuilder<
      TransactionPaymentLineItemEntity,
      TransactionPaymentLineItemEntity,
      QAfterFilterCondition> paymentSeqLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'paymentSeq',
        value: value,
      ));
    });
  }

  QueryBuilder<
      TransactionPaymentLineItemEntity,
      TransactionPaymentLineItemEntity,
      QAfterFilterCondition> paymentSeqBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'paymentSeq',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<
      TransactionPaymentLineItemEntity,
      TransactionPaymentLineItemEntity,
      QAfterFilterCondition> tenderIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'tenderId',
      ));
    });
  }

  QueryBuilder<
      TransactionPaymentLineItemEntity,
      TransactionPaymentLineItemEntity,
      QAfterFilterCondition> tenderIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'tenderId',
      ));
    });
  }

  QueryBuilder<TransactionPaymentLineItemEntity,
      TransactionPaymentLineItemEntity, QAfterFilterCondition> tenderIdEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'tenderId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<
      TransactionPaymentLineItemEntity,
      TransactionPaymentLineItemEntity,
      QAfterFilterCondition> tenderIdGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'tenderId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionPaymentLineItemEntity,
      TransactionPaymentLineItemEntity, QAfterFilterCondition> tenderIdLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'tenderId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionPaymentLineItemEntity,
      TransactionPaymentLineItemEntity, QAfterFilterCondition> tenderIdBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'tenderId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<
      TransactionPaymentLineItemEntity,
      TransactionPaymentLineItemEntity,
      QAfterFilterCondition> tenderIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'tenderId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionPaymentLineItemEntity,
      TransactionPaymentLineItemEntity, QAfterFilterCondition> tenderIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'tenderId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionPaymentLineItemEntity,
          TransactionPaymentLineItemEntity, QAfterFilterCondition>
      tenderIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'tenderId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionPaymentLineItemEntity,
          TransactionPaymentLineItemEntity, QAfterFilterCondition>
      tenderIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'tenderId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<
      TransactionPaymentLineItemEntity,
      TransactionPaymentLineItemEntity,
      QAfterFilterCondition> tenderIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'tenderId',
        value: '',
      ));
    });
  }

  QueryBuilder<
      TransactionPaymentLineItemEntity,
      TransactionPaymentLineItemEntity,
      QAfterFilterCondition> tenderIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'tenderId',
        value: '',
      ));
    });
  }

  QueryBuilder<
      TransactionPaymentLineItemEntity,
      TransactionPaymentLineItemEntity,
      QAfterFilterCondition> tenderStatusCodeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'tenderStatusCode',
      ));
    });
  }

  QueryBuilder<
      TransactionPaymentLineItemEntity,
      TransactionPaymentLineItemEntity,
      QAfterFilterCondition> tenderStatusCodeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'tenderStatusCode',
      ));
    });
  }

  QueryBuilder<
      TransactionPaymentLineItemEntity,
      TransactionPaymentLineItemEntity,
      QAfterFilterCondition> tenderStatusCodeEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'tenderStatusCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<
      TransactionPaymentLineItemEntity,
      TransactionPaymentLineItemEntity,
      QAfterFilterCondition> tenderStatusCodeGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'tenderStatusCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<
      TransactionPaymentLineItemEntity,
      TransactionPaymentLineItemEntity,
      QAfterFilterCondition> tenderStatusCodeLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'tenderStatusCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<
      TransactionPaymentLineItemEntity,
      TransactionPaymentLineItemEntity,
      QAfterFilterCondition> tenderStatusCodeBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'tenderStatusCode',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<
      TransactionPaymentLineItemEntity,
      TransactionPaymentLineItemEntity,
      QAfterFilterCondition> tenderStatusCodeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'tenderStatusCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<
      TransactionPaymentLineItemEntity,
      TransactionPaymentLineItemEntity,
      QAfterFilterCondition> tenderStatusCodeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'tenderStatusCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionPaymentLineItemEntity,
          TransactionPaymentLineItemEntity, QAfterFilterCondition>
      tenderStatusCodeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'tenderStatusCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionPaymentLineItemEntity,
          TransactionPaymentLineItemEntity, QAfterFilterCondition>
      tenderStatusCodeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'tenderStatusCode',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<
      TransactionPaymentLineItemEntity,
      TransactionPaymentLineItemEntity,
      QAfterFilterCondition> tenderStatusCodeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'tenderStatusCode',
        value: '',
      ));
    });
  }

  QueryBuilder<
      TransactionPaymentLineItemEntity,
      TransactionPaymentLineItemEntity,
      QAfterFilterCondition> tenderStatusCodeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'tenderStatusCode',
        value: '',
      ));
    });
  }

  QueryBuilder<TransactionPaymentLineItemEntity,
      TransactionPaymentLineItemEntity, QAfterFilterCondition> tokenIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'token',
      ));
    });
  }

  QueryBuilder<
      TransactionPaymentLineItemEntity,
      TransactionPaymentLineItemEntity,
      QAfterFilterCondition> tokenIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'token',
      ));
    });
  }

  QueryBuilder<TransactionPaymentLineItemEntity,
      TransactionPaymentLineItemEntity, QAfterFilterCondition> tokenEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'token',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionPaymentLineItemEntity,
      TransactionPaymentLineItemEntity, QAfterFilterCondition> tokenGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'token',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionPaymentLineItemEntity,
      TransactionPaymentLineItemEntity, QAfterFilterCondition> tokenLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'token',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionPaymentLineItemEntity,
      TransactionPaymentLineItemEntity, QAfterFilterCondition> tokenBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'token',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionPaymentLineItemEntity,
      TransactionPaymentLineItemEntity, QAfterFilterCondition> tokenStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'token',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionPaymentLineItemEntity,
      TransactionPaymentLineItemEntity, QAfterFilterCondition> tokenEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'token',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionPaymentLineItemEntity,
          TransactionPaymentLineItemEntity, QAfterFilterCondition>
      tokenContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'token',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionPaymentLineItemEntity,
          TransactionPaymentLineItemEntity, QAfterFilterCondition>
      tokenMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'token',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionPaymentLineItemEntity,
      TransactionPaymentLineItemEntity, QAfterFilterCondition> tokenIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'token',
        value: '',
      ));
    });
  }

  QueryBuilder<
      TransactionPaymentLineItemEntity,
      TransactionPaymentLineItemEntity,
      QAfterFilterCondition> tokenIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'token',
        value: '',
      ));
    });
  }

  QueryBuilder<TransactionPaymentLineItemEntity,
      TransactionPaymentLineItemEntity, QAfterFilterCondition> transIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'transId',
      ));
    });
  }

  QueryBuilder<
      TransactionPaymentLineItemEntity,
      TransactionPaymentLineItemEntity,
      QAfterFilterCondition> transIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'transId',
      ));
    });
  }

  QueryBuilder<TransactionPaymentLineItemEntity,
      TransactionPaymentLineItemEntity, QAfterFilterCondition> transIdEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'transId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<
      TransactionPaymentLineItemEntity,
      TransactionPaymentLineItemEntity,
      QAfterFilterCondition> transIdGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'transId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionPaymentLineItemEntity,
      TransactionPaymentLineItemEntity, QAfterFilterCondition> transIdLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'transId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionPaymentLineItemEntity,
      TransactionPaymentLineItemEntity, QAfterFilterCondition> transIdBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'transId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<
      TransactionPaymentLineItemEntity,
      TransactionPaymentLineItemEntity,
      QAfterFilterCondition> transIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'transId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionPaymentLineItemEntity,
      TransactionPaymentLineItemEntity, QAfterFilterCondition> transIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'transId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionPaymentLineItemEntity,
          TransactionPaymentLineItemEntity, QAfterFilterCondition>
      transIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'transId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionPaymentLineItemEntity,
          TransactionPaymentLineItemEntity, QAfterFilterCondition>
      transIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'transId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<
      TransactionPaymentLineItemEntity,
      TransactionPaymentLineItemEntity,
      QAfterFilterCondition> transIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'transId',
        value: '',
      ));
    });
  }

  QueryBuilder<
      TransactionPaymentLineItemEntity,
      TransactionPaymentLineItemEntity,
      QAfterFilterCondition> transIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'transId',
        value: '',
      ));
    });
  }
}

extension TransactionPaymentLineItemEntityQueryObject on QueryBuilder<
    TransactionPaymentLineItemEntity,
    TransactionPaymentLineItemEntity,
    QFilterCondition> {}
