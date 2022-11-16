// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'business_entity.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters

extension GetRetailLocationEntityCollection on Isar {
  IsarCollection<RetailLocationEntity> get retailLocationEntitys =>
      this.collection();
}

const RetailLocationEntitySchema = CollectionSchema(
  name: r'RetailLocationEntity',
  id: 1894392434087363926,
  properties: {
    r'address': PropertySchema(
      id: 0,
      name: r'address',
      type: IsarType.object,
      target: r'Address',
    ),
    r'createTime': PropertySchema(
      id: 1,
      name: r'createTime',
      type: IsarType.dateTime,
    ),
    r'currencyId': PropertySchema(
      id: 2,
      name: r'currencyId',
      type: IsarType.string,
    ),
    r'gst': PropertySchema(
      id: 3,
      name: r'gst',
      type: IsarType.string,
    ),
    r'lastChangedAt': PropertySchema(
      id: 4,
      name: r'lastChangedAt',
      type: IsarType.dateTime,
    ),
    r'legalBusiness': PropertySchema(
      id: 5,
      name: r'legalBusiness',
      type: IsarType.string,
    ),
    r'locale': PropertySchema(
      id: 6,
      name: r'locale',
      type: IsarType.string,
    ),
    r'logo': PropertySchema(
      id: 7,
      name: r'logo',
      type: IsarType.stringList,
    ),
    r'pan': PropertySchema(
      id: 8,
      name: r'pan',
      type: IsarType.string,
    ),
    r'storeContact': PropertySchema(
      id: 9,
      name: r'storeContact',
      type: IsarType.string,
    ),
    r'storeEmail': PropertySchema(
      id: 10,
      name: r'storeEmail',
      type: IsarType.string,
    ),
    r'storeName': PropertySchema(
      id: 11,
      name: r'storeName',
      type: IsarType.string,
    ),
    r'storeNumber': PropertySchema(
      id: 12,
      name: r'storeNumber',
      type: IsarType.string,
    ),
    r'updateTime': PropertySchema(
      id: 13,
      name: r'updateTime',
      type: IsarType.dateTime,
    ),
    r'version': PropertySchema(
      id: 14,
      name: r'version',
      type: IsarType.long,
    )
  },
  estimateSize: _retailLocationEntityEstimateSize,
  serialize: _retailLocationEntitySerialize,
  deserialize: _retailLocationEntityDeserialize,
  deserializeProp: _retailLocationEntityDeserializeProp,
  idName: r'rtlLocId',
  indexes: {},
  links: {},
  embeddedSchemas: {r'Address': AddressSchema},
  getId: _retailLocationEntityGetId,
  getLinks: _retailLocationEntityGetLinks,
  attach: _retailLocationEntityAttach,
  version: '3.0.4',
);

int _retailLocationEntityEstimateSize(
  RetailLocationEntity object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.address;
    if (value != null) {
      bytesCount += 3 +
          AddressSchema.estimateSize(value, allOffsets[Address]!, allOffsets);
    }
  }
  {
    final value = object.currencyId;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.gst;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.legalBusiness;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.locale;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final list = object.logo;
    if (list != null) {
      bytesCount += 3 + list.length * 3;
      {
        for (var i = 0; i < list.length; i++) {
          final value = list[i];
          bytesCount += value.length * 3;
        }
      }
    }
  }
  {
    final value = object.pan;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.storeContact;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.storeEmail;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.storeName;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.storeNumber;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _retailLocationEntitySerialize(
  RetailLocationEntity object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeObject<Address>(
    offsets[0],
    allOffsets,
    AddressSchema.serialize,
    object.address,
  );
  writer.writeDateTime(offsets[1], object.createTime);
  writer.writeString(offsets[2], object.currencyId);
  writer.writeString(offsets[3], object.gst);
  writer.writeDateTime(offsets[4], object.lastChangedAt);
  writer.writeString(offsets[5], object.legalBusiness);
  writer.writeString(offsets[6], object.locale);
  writer.writeStringList(offsets[7], object.logo);
  writer.writeString(offsets[8], object.pan);
  writer.writeString(offsets[9], object.storeContact);
  writer.writeString(offsets[10], object.storeEmail);
  writer.writeString(offsets[11], object.storeName);
  writer.writeString(offsets[12], object.storeNumber);
  writer.writeDateTime(offsets[13], object.updateTime);
  writer.writeLong(offsets[14], object.version);
}

RetailLocationEntity _retailLocationEntityDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = RetailLocationEntity(
    address: reader.readObjectOrNull<Address>(
      offsets[0],
      AddressSchema.deserialize,
      allOffsets,
    ),
    createTime: reader.readDateTime(offsets[1]),
    currencyId: reader.readStringOrNull(offsets[2]),
    gst: reader.readStringOrNull(offsets[3]),
    lastChangedAt: reader.readDateTimeOrNull(offsets[4]),
    legalBusiness: reader.readStringOrNull(offsets[5]),
    locale: reader.readStringOrNull(offsets[6]),
    logo: reader.readStringList(offsets[7]),
    pan: reader.readStringOrNull(offsets[8]),
    rtlLocId: id,
    storeContact: reader.readStringOrNull(offsets[9]),
    storeEmail: reader.readStringOrNull(offsets[10]),
    storeName: reader.readStringOrNull(offsets[11]),
    storeNumber: reader.readStringOrNull(offsets[12]),
    updateTime: reader.readDateTimeOrNull(offsets[13]),
    version: reader.readLongOrNull(offsets[14]) ?? 1,
  );
  return object;
}

P _retailLocationEntityDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readObjectOrNull<Address>(
        offset,
        AddressSchema.deserialize,
        allOffsets,
      )) as P;
    case 1:
      return (reader.readDateTime(offset)) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    case 4:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 5:
      return (reader.readStringOrNull(offset)) as P;
    case 6:
      return (reader.readStringOrNull(offset)) as P;
    case 7:
      return (reader.readStringList(offset)) as P;
    case 8:
      return (reader.readStringOrNull(offset)) as P;
    case 9:
      return (reader.readStringOrNull(offset)) as P;
    case 10:
      return (reader.readStringOrNull(offset)) as P;
    case 11:
      return (reader.readStringOrNull(offset)) as P;
    case 12:
      return (reader.readStringOrNull(offset)) as P;
    case 13:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 14:
      return (reader.readLongOrNull(offset) ?? 1) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _retailLocationEntityGetId(RetailLocationEntity object) {
  return object.rtlLocId;
}

List<IsarLinkBase<dynamic>> _retailLocationEntityGetLinks(
    RetailLocationEntity object) {
  return [];
}

void _retailLocationEntityAttach(
    IsarCollection<dynamic> col, Id id, RetailLocationEntity object) {}

extension RetailLocationEntityQueryWhereSort
    on QueryBuilder<RetailLocationEntity, RetailLocationEntity, QWhere> {
  QueryBuilder<RetailLocationEntity, RetailLocationEntity, QAfterWhere>
      anyRtlLocId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension RetailLocationEntityQueryWhere
    on QueryBuilder<RetailLocationEntity, RetailLocationEntity, QWhereClause> {
  QueryBuilder<RetailLocationEntity, RetailLocationEntity, QAfterWhereClause>
      rtlLocIdEqualTo(Id rtlLocId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: rtlLocId,
        upper: rtlLocId,
      ));
    });
  }

  QueryBuilder<RetailLocationEntity, RetailLocationEntity, QAfterWhereClause>
      rtlLocIdNotEqualTo(Id rtlLocId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: rtlLocId, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: rtlLocId, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: rtlLocId, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: rtlLocId, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<RetailLocationEntity, RetailLocationEntity, QAfterWhereClause>
      rtlLocIdGreaterThan(Id rtlLocId, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: rtlLocId, includeLower: include),
      );
    });
  }

  QueryBuilder<RetailLocationEntity, RetailLocationEntity, QAfterWhereClause>
      rtlLocIdLessThan(Id rtlLocId, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: rtlLocId, includeUpper: include),
      );
    });
  }

  QueryBuilder<RetailLocationEntity, RetailLocationEntity, QAfterWhereClause>
      rtlLocIdBetween(
    Id lowerRtlLocId,
    Id upperRtlLocId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerRtlLocId,
        includeLower: includeLower,
        upper: upperRtlLocId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension RetailLocationEntityQueryFilter on QueryBuilder<RetailLocationEntity,
    RetailLocationEntity, QFilterCondition> {
  QueryBuilder<RetailLocationEntity, RetailLocationEntity,
      QAfterFilterCondition> addressIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'address',
      ));
    });
  }

  QueryBuilder<RetailLocationEntity, RetailLocationEntity,
      QAfterFilterCondition> addressIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'address',
      ));
    });
  }

  QueryBuilder<RetailLocationEntity, RetailLocationEntity,
      QAfterFilterCondition> createTimeEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createTime',
        value: value,
      ));
    });
  }

  QueryBuilder<RetailLocationEntity, RetailLocationEntity,
      QAfterFilterCondition> createTimeGreaterThan(
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

  QueryBuilder<RetailLocationEntity, RetailLocationEntity,
      QAfterFilterCondition> createTimeLessThan(
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

  QueryBuilder<RetailLocationEntity, RetailLocationEntity,
      QAfterFilterCondition> createTimeBetween(
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

  QueryBuilder<RetailLocationEntity, RetailLocationEntity,
      QAfterFilterCondition> currencyIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'currencyId',
      ));
    });
  }

  QueryBuilder<RetailLocationEntity, RetailLocationEntity,
      QAfterFilterCondition> currencyIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'currencyId',
      ));
    });
  }

  QueryBuilder<RetailLocationEntity, RetailLocationEntity,
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

  QueryBuilder<RetailLocationEntity, RetailLocationEntity,
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

  QueryBuilder<RetailLocationEntity, RetailLocationEntity,
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

  QueryBuilder<RetailLocationEntity, RetailLocationEntity,
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

  QueryBuilder<RetailLocationEntity, RetailLocationEntity,
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

  QueryBuilder<RetailLocationEntity, RetailLocationEntity,
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

  QueryBuilder<RetailLocationEntity, RetailLocationEntity,
          QAfterFilterCondition>
      currencyIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'currencyId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RetailLocationEntity, RetailLocationEntity,
          QAfterFilterCondition>
      currencyIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'currencyId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RetailLocationEntity, RetailLocationEntity,
      QAfterFilterCondition> currencyIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'currencyId',
        value: '',
      ));
    });
  }

  QueryBuilder<RetailLocationEntity, RetailLocationEntity,
      QAfterFilterCondition> currencyIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'currencyId',
        value: '',
      ));
    });
  }

  QueryBuilder<RetailLocationEntity, RetailLocationEntity,
      QAfterFilterCondition> gstIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'gst',
      ));
    });
  }

  QueryBuilder<RetailLocationEntity, RetailLocationEntity,
      QAfterFilterCondition> gstIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'gst',
      ));
    });
  }

  QueryBuilder<RetailLocationEntity, RetailLocationEntity,
      QAfterFilterCondition> gstEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'gst',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RetailLocationEntity, RetailLocationEntity,
      QAfterFilterCondition> gstGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'gst',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RetailLocationEntity, RetailLocationEntity,
      QAfterFilterCondition> gstLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'gst',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RetailLocationEntity, RetailLocationEntity,
      QAfterFilterCondition> gstBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'gst',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RetailLocationEntity, RetailLocationEntity,
      QAfterFilterCondition> gstStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'gst',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RetailLocationEntity, RetailLocationEntity,
      QAfterFilterCondition> gstEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'gst',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RetailLocationEntity, RetailLocationEntity,
          QAfterFilterCondition>
      gstContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'gst',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RetailLocationEntity, RetailLocationEntity,
          QAfterFilterCondition>
      gstMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'gst',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RetailLocationEntity, RetailLocationEntity,
      QAfterFilterCondition> gstIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'gst',
        value: '',
      ));
    });
  }

  QueryBuilder<RetailLocationEntity, RetailLocationEntity,
      QAfterFilterCondition> gstIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'gst',
        value: '',
      ));
    });
  }

  QueryBuilder<RetailLocationEntity, RetailLocationEntity,
      QAfterFilterCondition> lastChangedAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'lastChangedAt',
      ));
    });
  }

  QueryBuilder<RetailLocationEntity, RetailLocationEntity,
      QAfterFilterCondition> lastChangedAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'lastChangedAt',
      ));
    });
  }

  QueryBuilder<RetailLocationEntity, RetailLocationEntity,
      QAfterFilterCondition> lastChangedAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lastChangedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<RetailLocationEntity, RetailLocationEntity,
      QAfterFilterCondition> lastChangedAtGreaterThan(
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

  QueryBuilder<RetailLocationEntity, RetailLocationEntity,
      QAfterFilterCondition> lastChangedAtLessThan(
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

  QueryBuilder<RetailLocationEntity, RetailLocationEntity,
      QAfterFilterCondition> lastChangedAtBetween(
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

  QueryBuilder<RetailLocationEntity, RetailLocationEntity,
      QAfterFilterCondition> legalBusinessIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'legalBusiness',
      ));
    });
  }

  QueryBuilder<RetailLocationEntity, RetailLocationEntity,
      QAfterFilterCondition> legalBusinessIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'legalBusiness',
      ));
    });
  }

  QueryBuilder<RetailLocationEntity, RetailLocationEntity,
      QAfterFilterCondition> legalBusinessEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'legalBusiness',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RetailLocationEntity, RetailLocationEntity,
      QAfterFilterCondition> legalBusinessGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'legalBusiness',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RetailLocationEntity, RetailLocationEntity,
      QAfterFilterCondition> legalBusinessLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'legalBusiness',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RetailLocationEntity, RetailLocationEntity,
      QAfterFilterCondition> legalBusinessBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'legalBusiness',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RetailLocationEntity, RetailLocationEntity,
      QAfterFilterCondition> legalBusinessStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'legalBusiness',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RetailLocationEntity, RetailLocationEntity,
      QAfterFilterCondition> legalBusinessEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'legalBusiness',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RetailLocationEntity, RetailLocationEntity,
          QAfterFilterCondition>
      legalBusinessContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'legalBusiness',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RetailLocationEntity, RetailLocationEntity,
          QAfterFilterCondition>
      legalBusinessMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'legalBusiness',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RetailLocationEntity, RetailLocationEntity,
      QAfterFilterCondition> legalBusinessIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'legalBusiness',
        value: '',
      ));
    });
  }

  QueryBuilder<RetailLocationEntity, RetailLocationEntity,
      QAfterFilterCondition> legalBusinessIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'legalBusiness',
        value: '',
      ));
    });
  }

  QueryBuilder<RetailLocationEntity, RetailLocationEntity,
      QAfterFilterCondition> localeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'locale',
      ));
    });
  }

  QueryBuilder<RetailLocationEntity, RetailLocationEntity,
      QAfterFilterCondition> localeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'locale',
      ));
    });
  }

  QueryBuilder<RetailLocationEntity, RetailLocationEntity,
      QAfterFilterCondition> localeEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'locale',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RetailLocationEntity, RetailLocationEntity,
      QAfterFilterCondition> localeGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'locale',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RetailLocationEntity, RetailLocationEntity,
      QAfterFilterCondition> localeLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'locale',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RetailLocationEntity, RetailLocationEntity,
      QAfterFilterCondition> localeBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'locale',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RetailLocationEntity, RetailLocationEntity,
      QAfterFilterCondition> localeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'locale',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RetailLocationEntity, RetailLocationEntity,
      QAfterFilterCondition> localeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'locale',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RetailLocationEntity, RetailLocationEntity,
          QAfterFilterCondition>
      localeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'locale',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RetailLocationEntity, RetailLocationEntity,
          QAfterFilterCondition>
      localeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'locale',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RetailLocationEntity, RetailLocationEntity,
      QAfterFilterCondition> localeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'locale',
        value: '',
      ));
    });
  }

  QueryBuilder<RetailLocationEntity, RetailLocationEntity,
      QAfterFilterCondition> localeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'locale',
        value: '',
      ));
    });
  }

  QueryBuilder<RetailLocationEntity, RetailLocationEntity,
      QAfterFilterCondition> logoIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'logo',
      ));
    });
  }

  QueryBuilder<RetailLocationEntity, RetailLocationEntity,
      QAfterFilterCondition> logoIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'logo',
      ));
    });
  }

  QueryBuilder<RetailLocationEntity, RetailLocationEntity,
      QAfterFilterCondition> logoElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'logo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RetailLocationEntity, RetailLocationEntity,
      QAfterFilterCondition> logoElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'logo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RetailLocationEntity, RetailLocationEntity,
      QAfterFilterCondition> logoElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'logo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RetailLocationEntity, RetailLocationEntity,
      QAfterFilterCondition> logoElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'logo',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RetailLocationEntity, RetailLocationEntity,
      QAfterFilterCondition> logoElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'logo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RetailLocationEntity, RetailLocationEntity,
      QAfterFilterCondition> logoElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'logo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RetailLocationEntity, RetailLocationEntity,
          QAfterFilterCondition>
      logoElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'logo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RetailLocationEntity, RetailLocationEntity,
          QAfterFilterCondition>
      logoElementMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'logo',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RetailLocationEntity, RetailLocationEntity,
      QAfterFilterCondition> logoElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'logo',
        value: '',
      ));
    });
  }

  QueryBuilder<RetailLocationEntity, RetailLocationEntity,
      QAfterFilterCondition> logoElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'logo',
        value: '',
      ));
    });
  }

  QueryBuilder<RetailLocationEntity, RetailLocationEntity,
      QAfterFilterCondition> logoLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'logo',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<RetailLocationEntity, RetailLocationEntity,
      QAfterFilterCondition> logoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'logo',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<RetailLocationEntity, RetailLocationEntity,
      QAfterFilterCondition> logoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'logo',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<RetailLocationEntity, RetailLocationEntity,
      QAfterFilterCondition> logoLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'logo',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<RetailLocationEntity, RetailLocationEntity,
      QAfterFilterCondition> logoLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'logo',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<RetailLocationEntity, RetailLocationEntity,
      QAfterFilterCondition> logoLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'logo',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<RetailLocationEntity, RetailLocationEntity,
      QAfterFilterCondition> panIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'pan',
      ));
    });
  }

  QueryBuilder<RetailLocationEntity, RetailLocationEntity,
      QAfterFilterCondition> panIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'pan',
      ));
    });
  }

  QueryBuilder<RetailLocationEntity, RetailLocationEntity,
      QAfterFilterCondition> panEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'pan',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RetailLocationEntity, RetailLocationEntity,
      QAfterFilterCondition> panGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'pan',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RetailLocationEntity, RetailLocationEntity,
      QAfterFilterCondition> panLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'pan',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RetailLocationEntity, RetailLocationEntity,
      QAfterFilterCondition> panBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'pan',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RetailLocationEntity, RetailLocationEntity,
      QAfterFilterCondition> panStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'pan',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RetailLocationEntity, RetailLocationEntity,
      QAfterFilterCondition> panEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'pan',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RetailLocationEntity, RetailLocationEntity,
          QAfterFilterCondition>
      panContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'pan',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RetailLocationEntity, RetailLocationEntity,
          QAfterFilterCondition>
      panMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'pan',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RetailLocationEntity, RetailLocationEntity,
      QAfterFilterCondition> panIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'pan',
        value: '',
      ));
    });
  }

  QueryBuilder<RetailLocationEntity, RetailLocationEntity,
      QAfterFilterCondition> panIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'pan',
        value: '',
      ));
    });
  }

  QueryBuilder<RetailLocationEntity, RetailLocationEntity,
      QAfterFilterCondition> rtlLocIdEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'rtlLocId',
        value: value,
      ));
    });
  }

  QueryBuilder<RetailLocationEntity, RetailLocationEntity,
      QAfterFilterCondition> rtlLocIdGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'rtlLocId',
        value: value,
      ));
    });
  }

  QueryBuilder<RetailLocationEntity, RetailLocationEntity,
      QAfterFilterCondition> rtlLocIdLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'rtlLocId',
        value: value,
      ));
    });
  }

  QueryBuilder<RetailLocationEntity, RetailLocationEntity,
      QAfterFilterCondition> rtlLocIdBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'rtlLocId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<RetailLocationEntity, RetailLocationEntity,
      QAfterFilterCondition> storeContactIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'storeContact',
      ));
    });
  }

  QueryBuilder<RetailLocationEntity, RetailLocationEntity,
      QAfterFilterCondition> storeContactIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'storeContact',
      ));
    });
  }

  QueryBuilder<RetailLocationEntity, RetailLocationEntity,
      QAfterFilterCondition> storeContactEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'storeContact',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RetailLocationEntity, RetailLocationEntity,
      QAfterFilterCondition> storeContactGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'storeContact',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RetailLocationEntity, RetailLocationEntity,
      QAfterFilterCondition> storeContactLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'storeContact',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RetailLocationEntity, RetailLocationEntity,
      QAfterFilterCondition> storeContactBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'storeContact',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RetailLocationEntity, RetailLocationEntity,
      QAfterFilterCondition> storeContactStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'storeContact',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RetailLocationEntity, RetailLocationEntity,
      QAfterFilterCondition> storeContactEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'storeContact',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RetailLocationEntity, RetailLocationEntity,
          QAfterFilterCondition>
      storeContactContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'storeContact',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RetailLocationEntity, RetailLocationEntity,
          QAfterFilterCondition>
      storeContactMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'storeContact',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RetailLocationEntity, RetailLocationEntity,
      QAfterFilterCondition> storeContactIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'storeContact',
        value: '',
      ));
    });
  }

  QueryBuilder<RetailLocationEntity, RetailLocationEntity,
      QAfterFilterCondition> storeContactIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'storeContact',
        value: '',
      ));
    });
  }

  QueryBuilder<RetailLocationEntity, RetailLocationEntity,
      QAfterFilterCondition> storeEmailIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'storeEmail',
      ));
    });
  }

  QueryBuilder<RetailLocationEntity, RetailLocationEntity,
      QAfterFilterCondition> storeEmailIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'storeEmail',
      ));
    });
  }

  QueryBuilder<RetailLocationEntity, RetailLocationEntity,
      QAfterFilterCondition> storeEmailEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'storeEmail',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RetailLocationEntity, RetailLocationEntity,
      QAfterFilterCondition> storeEmailGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'storeEmail',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RetailLocationEntity, RetailLocationEntity,
      QAfterFilterCondition> storeEmailLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'storeEmail',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RetailLocationEntity, RetailLocationEntity,
      QAfterFilterCondition> storeEmailBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'storeEmail',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RetailLocationEntity, RetailLocationEntity,
      QAfterFilterCondition> storeEmailStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'storeEmail',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RetailLocationEntity, RetailLocationEntity,
      QAfterFilterCondition> storeEmailEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'storeEmail',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RetailLocationEntity, RetailLocationEntity,
          QAfterFilterCondition>
      storeEmailContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'storeEmail',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RetailLocationEntity, RetailLocationEntity,
          QAfterFilterCondition>
      storeEmailMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'storeEmail',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RetailLocationEntity, RetailLocationEntity,
      QAfterFilterCondition> storeEmailIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'storeEmail',
        value: '',
      ));
    });
  }

  QueryBuilder<RetailLocationEntity, RetailLocationEntity,
      QAfterFilterCondition> storeEmailIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'storeEmail',
        value: '',
      ));
    });
  }

  QueryBuilder<RetailLocationEntity, RetailLocationEntity,
      QAfterFilterCondition> storeNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'storeName',
      ));
    });
  }

  QueryBuilder<RetailLocationEntity, RetailLocationEntity,
      QAfterFilterCondition> storeNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'storeName',
      ));
    });
  }

  QueryBuilder<RetailLocationEntity, RetailLocationEntity,
      QAfterFilterCondition> storeNameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'storeName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RetailLocationEntity, RetailLocationEntity,
      QAfterFilterCondition> storeNameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'storeName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RetailLocationEntity, RetailLocationEntity,
      QAfterFilterCondition> storeNameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'storeName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RetailLocationEntity, RetailLocationEntity,
      QAfterFilterCondition> storeNameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'storeName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RetailLocationEntity, RetailLocationEntity,
      QAfterFilterCondition> storeNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'storeName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RetailLocationEntity, RetailLocationEntity,
      QAfterFilterCondition> storeNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'storeName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RetailLocationEntity, RetailLocationEntity,
          QAfterFilterCondition>
      storeNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'storeName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RetailLocationEntity, RetailLocationEntity,
          QAfterFilterCondition>
      storeNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'storeName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RetailLocationEntity, RetailLocationEntity,
      QAfterFilterCondition> storeNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'storeName',
        value: '',
      ));
    });
  }

  QueryBuilder<RetailLocationEntity, RetailLocationEntity,
      QAfterFilterCondition> storeNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'storeName',
        value: '',
      ));
    });
  }

  QueryBuilder<RetailLocationEntity, RetailLocationEntity,
      QAfterFilterCondition> storeNumberIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'storeNumber',
      ));
    });
  }

  QueryBuilder<RetailLocationEntity, RetailLocationEntity,
      QAfterFilterCondition> storeNumberIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'storeNumber',
      ));
    });
  }

  QueryBuilder<RetailLocationEntity, RetailLocationEntity,
      QAfterFilterCondition> storeNumberEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'storeNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RetailLocationEntity, RetailLocationEntity,
      QAfterFilterCondition> storeNumberGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'storeNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RetailLocationEntity, RetailLocationEntity,
      QAfterFilterCondition> storeNumberLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'storeNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RetailLocationEntity, RetailLocationEntity,
      QAfterFilterCondition> storeNumberBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'storeNumber',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RetailLocationEntity, RetailLocationEntity,
      QAfterFilterCondition> storeNumberStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'storeNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RetailLocationEntity, RetailLocationEntity,
      QAfterFilterCondition> storeNumberEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'storeNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RetailLocationEntity, RetailLocationEntity,
          QAfterFilterCondition>
      storeNumberContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'storeNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RetailLocationEntity, RetailLocationEntity,
          QAfterFilterCondition>
      storeNumberMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'storeNumber',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RetailLocationEntity, RetailLocationEntity,
      QAfterFilterCondition> storeNumberIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'storeNumber',
        value: '',
      ));
    });
  }

  QueryBuilder<RetailLocationEntity, RetailLocationEntity,
      QAfterFilterCondition> storeNumberIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'storeNumber',
        value: '',
      ));
    });
  }

  QueryBuilder<RetailLocationEntity, RetailLocationEntity,
      QAfterFilterCondition> updateTimeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'updateTime',
      ));
    });
  }

  QueryBuilder<RetailLocationEntity, RetailLocationEntity,
      QAfterFilterCondition> updateTimeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'updateTime',
      ));
    });
  }

  QueryBuilder<RetailLocationEntity, RetailLocationEntity,
      QAfterFilterCondition> updateTimeEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'updateTime',
        value: value,
      ));
    });
  }

  QueryBuilder<RetailLocationEntity, RetailLocationEntity,
      QAfterFilterCondition> updateTimeGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'updateTime',
        value: value,
      ));
    });
  }

  QueryBuilder<RetailLocationEntity, RetailLocationEntity,
      QAfterFilterCondition> updateTimeLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'updateTime',
        value: value,
      ));
    });
  }

  QueryBuilder<RetailLocationEntity, RetailLocationEntity,
      QAfterFilterCondition> updateTimeBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'updateTime',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<RetailLocationEntity, RetailLocationEntity,
      QAfterFilterCondition> versionEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'version',
        value: value,
      ));
    });
  }

  QueryBuilder<RetailLocationEntity, RetailLocationEntity,
      QAfterFilterCondition> versionGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'version',
        value: value,
      ));
    });
  }

  QueryBuilder<RetailLocationEntity, RetailLocationEntity,
      QAfterFilterCondition> versionLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'version',
        value: value,
      ));
    });
  }

  QueryBuilder<RetailLocationEntity, RetailLocationEntity,
      QAfterFilterCondition> versionBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'version',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension RetailLocationEntityQueryObject on QueryBuilder<RetailLocationEntity,
    RetailLocationEntity, QFilterCondition> {
  QueryBuilder<RetailLocationEntity, RetailLocationEntity,
      QAfterFilterCondition> address(FilterQuery<Address> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'address');
    });
  }
}

extension RetailLocationEntityQueryLinks on QueryBuilder<RetailLocationEntity,
    RetailLocationEntity, QFilterCondition> {}

extension RetailLocationEntityQuerySortBy
    on QueryBuilder<RetailLocationEntity, RetailLocationEntity, QSortBy> {
  QueryBuilder<RetailLocationEntity, RetailLocationEntity, QAfterSortBy>
      sortByCreateTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createTime', Sort.asc);
    });
  }

  QueryBuilder<RetailLocationEntity, RetailLocationEntity, QAfterSortBy>
      sortByCreateTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createTime', Sort.desc);
    });
  }

  QueryBuilder<RetailLocationEntity, RetailLocationEntity, QAfterSortBy>
      sortByCurrencyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currencyId', Sort.asc);
    });
  }

  QueryBuilder<RetailLocationEntity, RetailLocationEntity, QAfterSortBy>
      sortByCurrencyIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currencyId', Sort.desc);
    });
  }

  QueryBuilder<RetailLocationEntity, RetailLocationEntity, QAfterSortBy>
      sortByGst() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'gst', Sort.asc);
    });
  }

  QueryBuilder<RetailLocationEntity, RetailLocationEntity, QAfterSortBy>
      sortByGstDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'gst', Sort.desc);
    });
  }

  QueryBuilder<RetailLocationEntity, RetailLocationEntity, QAfterSortBy>
      sortByLastChangedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastChangedAt', Sort.asc);
    });
  }

  QueryBuilder<RetailLocationEntity, RetailLocationEntity, QAfterSortBy>
      sortByLastChangedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastChangedAt', Sort.desc);
    });
  }

  QueryBuilder<RetailLocationEntity, RetailLocationEntity, QAfterSortBy>
      sortByLegalBusiness() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'legalBusiness', Sort.asc);
    });
  }

  QueryBuilder<RetailLocationEntity, RetailLocationEntity, QAfterSortBy>
      sortByLegalBusinessDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'legalBusiness', Sort.desc);
    });
  }

  QueryBuilder<RetailLocationEntity, RetailLocationEntity, QAfterSortBy>
      sortByLocale() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'locale', Sort.asc);
    });
  }

  QueryBuilder<RetailLocationEntity, RetailLocationEntity, QAfterSortBy>
      sortByLocaleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'locale', Sort.desc);
    });
  }

  QueryBuilder<RetailLocationEntity, RetailLocationEntity, QAfterSortBy>
      sortByPan() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pan', Sort.asc);
    });
  }

  QueryBuilder<RetailLocationEntity, RetailLocationEntity, QAfterSortBy>
      sortByPanDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pan', Sort.desc);
    });
  }

  QueryBuilder<RetailLocationEntity, RetailLocationEntity, QAfterSortBy>
      sortByStoreContact() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'storeContact', Sort.asc);
    });
  }

  QueryBuilder<RetailLocationEntity, RetailLocationEntity, QAfterSortBy>
      sortByStoreContactDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'storeContact', Sort.desc);
    });
  }

  QueryBuilder<RetailLocationEntity, RetailLocationEntity, QAfterSortBy>
      sortByStoreEmail() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'storeEmail', Sort.asc);
    });
  }

  QueryBuilder<RetailLocationEntity, RetailLocationEntity, QAfterSortBy>
      sortByStoreEmailDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'storeEmail', Sort.desc);
    });
  }

  QueryBuilder<RetailLocationEntity, RetailLocationEntity, QAfterSortBy>
      sortByStoreName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'storeName', Sort.asc);
    });
  }

  QueryBuilder<RetailLocationEntity, RetailLocationEntity, QAfterSortBy>
      sortByStoreNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'storeName', Sort.desc);
    });
  }

  QueryBuilder<RetailLocationEntity, RetailLocationEntity, QAfterSortBy>
      sortByStoreNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'storeNumber', Sort.asc);
    });
  }

  QueryBuilder<RetailLocationEntity, RetailLocationEntity, QAfterSortBy>
      sortByStoreNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'storeNumber', Sort.desc);
    });
  }

  QueryBuilder<RetailLocationEntity, RetailLocationEntity, QAfterSortBy>
      sortByUpdateTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updateTime', Sort.asc);
    });
  }

  QueryBuilder<RetailLocationEntity, RetailLocationEntity, QAfterSortBy>
      sortByUpdateTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updateTime', Sort.desc);
    });
  }

  QueryBuilder<RetailLocationEntity, RetailLocationEntity, QAfterSortBy>
      sortByVersion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'version', Sort.asc);
    });
  }

  QueryBuilder<RetailLocationEntity, RetailLocationEntity, QAfterSortBy>
      sortByVersionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'version', Sort.desc);
    });
  }
}

extension RetailLocationEntityQuerySortThenBy
    on QueryBuilder<RetailLocationEntity, RetailLocationEntity, QSortThenBy> {
  QueryBuilder<RetailLocationEntity, RetailLocationEntity, QAfterSortBy>
      thenByCreateTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createTime', Sort.asc);
    });
  }

  QueryBuilder<RetailLocationEntity, RetailLocationEntity, QAfterSortBy>
      thenByCreateTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createTime', Sort.desc);
    });
  }

  QueryBuilder<RetailLocationEntity, RetailLocationEntity, QAfterSortBy>
      thenByCurrencyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currencyId', Sort.asc);
    });
  }

  QueryBuilder<RetailLocationEntity, RetailLocationEntity, QAfterSortBy>
      thenByCurrencyIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currencyId', Sort.desc);
    });
  }

  QueryBuilder<RetailLocationEntity, RetailLocationEntity, QAfterSortBy>
      thenByGst() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'gst', Sort.asc);
    });
  }

  QueryBuilder<RetailLocationEntity, RetailLocationEntity, QAfterSortBy>
      thenByGstDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'gst', Sort.desc);
    });
  }

  QueryBuilder<RetailLocationEntity, RetailLocationEntity, QAfterSortBy>
      thenByLastChangedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastChangedAt', Sort.asc);
    });
  }

  QueryBuilder<RetailLocationEntity, RetailLocationEntity, QAfterSortBy>
      thenByLastChangedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastChangedAt', Sort.desc);
    });
  }

  QueryBuilder<RetailLocationEntity, RetailLocationEntity, QAfterSortBy>
      thenByLegalBusiness() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'legalBusiness', Sort.asc);
    });
  }

  QueryBuilder<RetailLocationEntity, RetailLocationEntity, QAfterSortBy>
      thenByLegalBusinessDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'legalBusiness', Sort.desc);
    });
  }

  QueryBuilder<RetailLocationEntity, RetailLocationEntity, QAfterSortBy>
      thenByLocale() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'locale', Sort.asc);
    });
  }

  QueryBuilder<RetailLocationEntity, RetailLocationEntity, QAfterSortBy>
      thenByLocaleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'locale', Sort.desc);
    });
  }

  QueryBuilder<RetailLocationEntity, RetailLocationEntity, QAfterSortBy>
      thenByPan() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pan', Sort.asc);
    });
  }

  QueryBuilder<RetailLocationEntity, RetailLocationEntity, QAfterSortBy>
      thenByPanDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pan', Sort.desc);
    });
  }

  QueryBuilder<RetailLocationEntity, RetailLocationEntity, QAfterSortBy>
      thenByRtlLocId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rtlLocId', Sort.asc);
    });
  }

  QueryBuilder<RetailLocationEntity, RetailLocationEntity, QAfterSortBy>
      thenByRtlLocIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rtlLocId', Sort.desc);
    });
  }

  QueryBuilder<RetailLocationEntity, RetailLocationEntity, QAfterSortBy>
      thenByStoreContact() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'storeContact', Sort.asc);
    });
  }

  QueryBuilder<RetailLocationEntity, RetailLocationEntity, QAfterSortBy>
      thenByStoreContactDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'storeContact', Sort.desc);
    });
  }

  QueryBuilder<RetailLocationEntity, RetailLocationEntity, QAfterSortBy>
      thenByStoreEmail() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'storeEmail', Sort.asc);
    });
  }

  QueryBuilder<RetailLocationEntity, RetailLocationEntity, QAfterSortBy>
      thenByStoreEmailDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'storeEmail', Sort.desc);
    });
  }

  QueryBuilder<RetailLocationEntity, RetailLocationEntity, QAfterSortBy>
      thenByStoreName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'storeName', Sort.asc);
    });
  }

  QueryBuilder<RetailLocationEntity, RetailLocationEntity, QAfterSortBy>
      thenByStoreNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'storeName', Sort.desc);
    });
  }

  QueryBuilder<RetailLocationEntity, RetailLocationEntity, QAfterSortBy>
      thenByStoreNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'storeNumber', Sort.asc);
    });
  }

  QueryBuilder<RetailLocationEntity, RetailLocationEntity, QAfterSortBy>
      thenByStoreNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'storeNumber', Sort.desc);
    });
  }

  QueryBuilder<RetailLocationEntity, RetailLocationEntity, QAfterSortBy>
      thenByUpdateTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updateTime', Sort.asc);
    });
  }

  QueryBuilder<RetailLocationEntity, RetailLocationEntity, QAfterSortBy>
      thenByUpdateTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updateTime', Sort.desc);
    });
  }

  QueryBuilder<RetailLocationEntity, RetailLocationEntity, QAfterSortBy>
      thenByVersion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'version', Sort.asc);
    });
  }

  QueryBuilder<RetailLocationEntity, RetailLocationEntity, QAfterSortBy>
      thenByVersionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'version', Sort.desc);
    });
  }
}

extension RetailLocationEntityQueryWhereDistinct
    on QueryBuilder<RetailLocationEntity, RetailLocationEntity, QDistinct> {
  QueryBuilder<RetailLocationEntity, RetailLocationEntity, QDistinct>
      distinctByCreateTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createTime');
    });
  }

  QueryBuilder<RetailLocationEntity, RetailLocationEntity, QDistinct>
      distinctByCurrencyId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'currencyId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<RetailLocationEntity, RetailLocationEntity, QDistinct>
      distinctByGst({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'gst', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<RetailLocationEntity, RetailLocationEntity, QDistinct>
      distinctByLastChangedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lastChangedAt');
    });
  }

  QueryBuilder<RetailLocationEntity, RetailLocationEntity, QDistinct>
      distinctByLegalBusiness({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'legalBusiness',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<RetailLocationEntity, RetailLocationEntity, QDistinct>
      distinctByLocale({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'locale', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<RetailLocationEntity, RetailLocationEntity, QDistinct>
      distinctByLogo() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'logo');
    });
  }

  QueryBuilder<RetailLocationEntity, RetailLocationEntity, QDistinct>
      distinctByPan({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'pan', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<RetailLocationEntity, RetailLocationEntity, QDistinct>
      distinctByStoreContact({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'storeContact', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<RetailLocationEntity, RetailLocationEntity, QDistinct>
      distinctByStoreEmail({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'storeEmail', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<RetailLocationEntity, RetailLocationEntity, QDistinct>
      distinctByStoreName({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'storeName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<RetailLocationEntity, RetailLocationEntity, QDistinct>
      distinctByStoreNumber({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'storeNumber', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<RetailLocationEntity, RetailLocationEntity, QDistinct>
      distinctByUpdateTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'updateTime');
    });
  }

  QueryBuilder<RetailLocationEntity, RetailLocationEntity, QDistinct>
      distinctByVersion() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'version');
    });
  }
}

extension RetailLocationEntityQueryProperty on QueryBuilder<
    RetailLocationEntity, RetailLocationEntity, QQueryProperty> {
  QueryBuilder<RetailLocationEntity, int, QQueryOperations> rtlLocIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'rtlLocId');
    });
  }

  QueryBuilder<RetailLocationEntity, Address?, QQueryOperations>
      addressProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'address');
    });
  }

  QueryBuilder<RetailLocationEntity, DateTime, QQueryOperations>
      createTimeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createTime');
    });
  }

  QueryBuilder<RetailLocationEntity, String?, QQueryOperations>
      currencyIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'currencyId');
    });
  }

  QueryBuilder<RetailLocationEntity, String?, QQueryOperations> gstProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'gst');
    });
  }

  QueryBuilder<RetailLocationEntity, DateTime?, QQueryOperations>
      lastChangedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lastChangedAt');
    });
  }

  QueryBuilder<RetailLocationEntity, String?, QQueryOperations>
      legalBusinessProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'legalBusiness');
    });
  }

  QueryBuilder<RetailLocationEntity, String?, QQueryOperations>
      localeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'locale');
    });
  }

  QueryBuilder<RetailLocationEntity, List<String>?, QQueryOperations>
      logoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'logo');
    });
  }

  QueryBuilder<RetailLocationEntity, String?, QQueryOperations> panProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'pan');
    });
  }

  QueryBuilder<RetailLocationEntity, String?, QQueryOperations>
      storeContactProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'storeContact');
    });
  }

  QueryBuilder<RetailLocationEntity, String?, QQueryOperations>
      storeEmailProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'storeEmail');
    });
  }

  QueryBuilder<RetailLocationEntity, String?, QQueryOperations>
      storeNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'storeName');
    });
  }

  QueryBuilder<RetailLocationEntity, String?, QQueryOperations>
      storeNumberProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'storeNumber');
    });
  }

  QueryBuilder<RetailLocationEntity, DateTime?, QQueryOperations>
      updateTimeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'updateTime');
    });
  }

  QueryBuilder<RetailLocationEntity, int, QQueryOperations> versionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'version');
    });
  }
}
