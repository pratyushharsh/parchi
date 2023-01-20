// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'country_entity.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters

extension GetCountryEntityCollection on Isar {
  IsarCollection<CountryEntity> get countryEntitys => this.collection();
}

const CountryEntitySchema = CollectionSchema(
  name: r'CountryEntity',
  id: -8411656036090539845,
  properties: {
    r'capital': PropertySchema(
      id: 0,
      name: r'capital',
      type: IsarType.string,
    ),
    r'continent': PropertySchema(
      id: 1,
      name: r'continent',
      type: IsarType.string,
    ),
    r'currencies': PropertySchema(
      id: 2,
      name: r'currencies',
      type: IsarType.stringList,
    ),
    r'currency': PropertySchema(
      id: 3,
      name: r'currency',
      type: IsarType.string,
    ),
    r'flag': PropertySchema(
      id: 4,
      name: r'flag',
      type: IsarType.string,
    ),
    r'iso2': PropertySchema(
      id: 5,
      name: r'iso2',
      type: IsarType.string,
    ),
    r'iso3': PropertySchema(
      id: 6,
      name: r'iso3',
      type: IsarType.string,
    ),
    r'isoNumeric': PropertySchema(
      id: 7,
      name: r'isoNumeric',
      type: IsarType.string,
    ),
    r'languages': PropertySchema(
      id: 8,
      name: r'languages',
      type: IsarType.stringList,
    ),
    r'name': PropertySchema(
      id: 9,
      name: r'name',
      type: IsarType.string,
    ),
    r'phoneCode': PropertySchema(
      id: 10,
      name: r'phoneCode',
      type: IsarType.string,
    ),
    r'timeZone': PropertySchema(
      id: 11,
      name: r'timeZone',
      type: IsarType.string,
    )
  },
  estimateSize: _countryEntityEstimateSize,
  serialize: _countryEntitySerialize,
  deserialize: _countryEntityDeserialize,
  deserializeProp: _countryEntityDeserializeProp,
  idName: r'id',
  indexes: {
    r'iso2': IndexSchema(
      id: 2638051978238995226,
      name: r'iso2',
      unique: true,
      replace: true,
      properties: [
        IndexPropertySchema(
          name: r'iso2',
          type: IndexType.value,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _countryEntityGetId,
  getLinks: _countryEntityGetLinks,
  attach: _countryEntityAttach,
  version: '3.0.5',
);

int _countryEntityEstimateSize(
  CountryEntity object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.capital;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.continent.length * 3;
  bytesCount += 3 + object.currencies.length * 3;
  {
    for (var i = 0; i < object.currencies.length; i++) {
      final value = object.currencies[i];
      bytesCount += value.length * 3;
    }
  }
  {
    final value = object.currency;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.flag;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.iso2.length * 3;
  bytesCount += 3 + object.iso3.length * 3;
  bytesCount += 3 + object.isoNumeric.length * 3;
  bytesCount += 3 + object.languages.length * 3;
  {
    for (var i = 0; i < object.languages.length; i++) {
      final value = object.languages[i];
      bytesCount += value.length * 3;
    }
  }
  bytesCount += 3 + object.name.length * 3;
  bytesCount += 3 + object.phoneCode.length * 3;
  {
    final value = object.timeZone;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _countryEntitySerialize(
  CountryEntity object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.capital);
  writer.writeString(offsets[1], object.continent);
  writer.writeStringList(offsets[2], object.currencies);
  writer.writeString(offsets[3], object.currency);
  writer.writeString(offsets[4], object.flag);
  writer.writeString(offsets[5], object.iso2);
  writer.writeString(offsets[6], object.iso3);
  writer.writeString(offsets[7], object.isoNumeric);
  writer.writeStringList(offsets[8], object.languages);
  writer.writeString(offsets[9], object.name);
  writer.writeString(offsets[10], object.phoneCode);
  writer.writeString(offsets[11], object.timeZone);
}

CountryEntity _countryEntityDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = CountryEntity(
    capital: reader.readStringOrNull(offsets[0]),
    continent: reader.readString(offsets[1]),
    currencies: reader.readStringList(offsets[2]) ?? [],
    currency: reader.readStringOrNull(offsets[3]),
    flag: reader.readStringOrNull(offsets[4]),
    id: id,
    iso2: reader.readString(offsets[5]),
    iso3: reader.readString(offsets[6]),
    isoNumeric: reader.readString(offsets[7]),
    languages: reader.readStringList(offsets[8]) ?? [],
    name: reader.readString(offsets[9]),
    phoneCode: reader.readString(offsets[10]),
    timeZone: reader.readStringOrNull(offsets[11]),
  );
  return object;
}

P _countryEntityDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readStringList(offset) ?? []) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    case 4:
      return (reader.readStringOrNull(offset)) as P;
    case 5:
      return (reader.readString(offset)) as P;
    case 6:
      return (reader.readString(offset)) as P;
    case 7:
      return (reader.readString(offset)) as P;
    case 8:
      return (reader.readStringList(offset) ?? []) as P;
    case 9:
      return (reader.readString(offset)) as P;
    case 10:
      return (reader.readString(offset)) as P;
    case 11:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _countryEntityGetId(CountryEntity object) {
  return object.id ?? Isar.autoIncrement;
}

List<IsarLinkBase<dynamic>> _countryEntityGetLinks(CountryEntity object) {
  return [];
}

void _countryEntityAttach(
    IsarCollection<dynamic> col, Id id, CountryEntity object) {}

extension CountryEntityByIndex on IsarCollection<CountryEntity> {
  Future<CountryEntity?> getByIso2(String iso2) {
    return getByIndex(r'iso2', [iso2]);
  }

  CountryEntity? getByIso2Sync(String iso2) {
    return getByIndexSync(r'iso2', [iso2]);
  }

  Future<bool> deleteByIso2(String iso2) {
    return deleteByIndex(r'iso2', [iso2]);
  }

  bool deleteByIso2Sync(String iso2) {
    return deleteByIndexSync(r'iso2', [iso2]);
  }

  Future<List<CountryEntity?>> getAllByIso2(List<String> iso2Values) {
    final values = iso2Values.map((e) => [e]).toList();
    return getAllByIndex(r'iso2', values);
  }

  List<CountryEntity?> getAllByIso2Sync(List<String> iso2Values) {
    final values = iso2Values.map((e) => [e]).toList();
    return getAllByIndexSync(r'iso2', values);
  }

  Future<int> deleteAllByIso2(List<String> iso2Values) {
    final values = iso2Values.map((e) => [e]).toList();
    return deleteAllByIndex(r'iso2', values);
  }

  int deleteAllByIso2Sync(List<String> iso2Values) {
    final values = iso2Values.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'iso2', values);
  }

  Future<Id> putByIso2(CountryEntity object) {
    return putByIndex(r'iso2', object);
  }

  Id putByIso2Sync(CountryEntity object, {bool saveLinks = true}) {
    return putByIndexSync(r'iso2', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByIso2(List<CountryEntity> objects) {
    return putAllByIndex(r'iso2', objects);
  }

  List<Id> putAllByIso2Sync(List<CountryEntity> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'iso2', objects, saveLinks: saveLinks);
  }
}

extension CountryEntityQueryWhereSort
    on QueryBuilder<CountryEntity, CountryEntity, QWhere> {
  QueryBuilder<CountryEntity, CountryEntity, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<CountryEntity, CountryEntity, QAfterWhere> anyIso2() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'iso2'),
      );
    });
  }
}

extension CountryEntityQueryWhere
    on QueryBuilder<CountryEntity, CountryEntity, QWhereClause> {
  QueryBuilder<CountryEntity, CountryEntity, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<CountryEntity, CountryEntity, QAfterWhereClause> idNotEqualTo(
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

  QueryBuilder<CountryEntity, CountryEntity, QAfterWhereClause> idGreaterThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<CountryEntity, CountryEntity, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<CountryEntity, CountryEntity, QAfterWhereClause> idBetween(
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

  QueryBuilder<CountryEntity, CountryEntity, QAfterWhereClause> iso2EqualTo(
      String iso2) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'iso2',
        value: [iso2],
      ));
    });
  }

  QueryBuilder<CountryEntity, CountryEntity, QAfterWhereClause> iso2NotEqualTo(
      String iso2) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'iso2',
              lower: [],
              upper: [iso2],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'iso2',
              lower: [iso2],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'iso2',
              lower: [iso2],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'iso2',
              lower: [],
              upper: [iso2],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<CountryEntity, CountryEntity, QAfterWhereClause> iso2GreaterThan(
    String iso2, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'iso2',
        lower: [iso2],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<CountryEntity, CountryEntity, QAfterWhereClause> iso2LessThan(
    String iso2, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'iso2',
        lower: [],
        upper: [iso2],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<CountryEntity, CountryEntity, QAfterWhereClause> iso2Between(
    String lowerIso2,
    String upperIso2, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'iso2',
        lower: [lowerIso2],
        includeLower: includeLower,
        upper: [upperIso2],
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<CountryEntity, CountryEntity, QAfterWhereClause> iso2StartsWith(
      String Iso2Prefix) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'iso2',
        lower: [Iso2Prefix],
        upper: ['$Iso2Prefix\u{FFFFF}'],
      ));
    });
  }

  QueryBuilder<CountryEntity, CountryEntity, QAfterWhereClause> iso2IsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'iso2',
        value: [''],
      ));
    });
  }

  QueryBuilder<CountryEntity, CountryEntity, QAfterWhereClause>
      iso2IsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.lessThan(
              indexName: r'iso2',
              upper: [''],
            ))
            .addWhereClause(IndexWhereClause.greaterThan(
              indexName: r'iso2',
              lower: [''],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.greaterThan(
              indexName: r'iso2',
              lower: [''],
            ))
            .addWhereClause(IndexWhereClause.lessThan(
              indexName: r'iso2',
              upper: [''],
            ));
      }
    });
  }
}

extension CountryEntityQueryFilter
    on QueryBuilder<CountryEntity, CountryEntity, QFilterCondition> {
  QueryBuilder<CountryEntity, CountryEntity, QAfterFilterCondition>
      capitalIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'capital',
      ));
    });
  }

  QueryBuilder<CountryEntity, CountryEntity, QAfterFilterCondition>
      capitalIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'capital',
      ));
    });
  }

  QueryBuilder<CountryEntity, CountryEntity, QAfterFilterCondition>
      capitalEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'capital',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CountryEntity, CountryEntity, QAfterFilterCondition>
      capitalGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'capital',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CountryEntity, CountryEntity, QAfterFilterCondition>
      capitalLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'capital',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CountryEntity, CountryEntity, QAfterFilterCondition>
      capitalBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'capital',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CountryEntity, CountryEntity, QAfterFilterCondition>
      capitalStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'capital',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CountryEntity, CountryEntity, QAfterFilterCondition>
      capitalEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'capital',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CountryEntity, CountryEntity, QAfterFilterCondition>
      capitalContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'capital',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CountryEntity, CountryEntity, QAfterFilterCondition>
      capitalMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'capital',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CountryEntity, CountryEntity, QAfterFilterCondition>
      capitalIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'capital',
        value: '',
      ));
    });
  }

  QueryBuilder<CountryEntity, CountryEntity, QAfterFilterCondition>
      capitalIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'capital',
        value: '',
      ));
    });
  }

  QueryBuilder<CountryEntity, CountryEntity, QAfterFilterCondition>
      continentEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'continent',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CountryEntity, CountryEntity, QAfterFilterCondition>
      continentGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'continent',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CountryEntity, CountryEntity, QAfterFilterCondition>
      continentLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'continent',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CountryEntity, CountryEntity, QAfterFilterCondition>
      continentBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'continent',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CountryEntity, CountryEntity, QAfterFilterCondition>
      continentStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'continent',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CountryEntity, CountryEntity, QAfterFilterCondition>
      continentEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'continent',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CountryEntity, CountryEntity, QAfterFilterCondition>
      continentContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'continent',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CountryEntity, CountryEntity, QAfterFilterCondition>
      continentMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'continent',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CountryEntity, CountryEntity, QAfterFilterCondition>
      continentIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'continent',
        value: '',
      ));
    });
  }

  QueryBuilder<CountryEntity, CountryEntity, QAfterFilterCondition>
      continentIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'continent',
        value: '',
      ));
    });
  }

  QueryBuilder<CountryEntity, CountryEntity, QAfterFilterCondition>
      currenciesElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'currencies',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CountryEntity, CountryEntity, QAfterFilterCondition>
      currenciesElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'currencies',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CountryEntity, CountryEntity, QAfterFilterCondition>
      currenciesElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'currencies',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CountryEntity, CountryEntity, QAfterFilterCondition>
      currenciesElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'currencies',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CountryEntity, CountryEntity, QAfterFilterCondition>
      currenciesElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'currencies',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CountryEntity, CountryEntity, QAfterFilterCondition>
      currenciesElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'currencies',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CountryEntity, CountryEntity, QAfterFilterCondition>
      currenciesElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'currencies',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CountryEntity, CountryEntity, QAfterFilterCondition>
      currenciesElementMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'currencies',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CountryEntity, CountryEntity, QAfterFilterCondition>
      currenciesElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'currencies',
        value: '',
      ));
    });
  }

  QueryBuilder<CountryEntity, CountryEntity, QAfterFilterCondition>
      currenciesElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'currencies',
        value: '',
      ));
    });
  }

  QueryBuilder<CountryEntity, CountryEntity, QAfterFilterCondition>
      currenciesLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'currencies',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<CountryEntity, CountryEntity, QAfterFilterCondition>
      currenciesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'currencies',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<CountryEntity, CountryEntity, QAfterFilterCondition>
      currenciesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'currencies',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<CountryEntity, CountryEntity, QAfterFilterCondition>
      currenciesLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'currencies',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<CountryEntity, CountryEntity, QAfterFilterCondition>
      currenciesLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'currencies',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<CountryEntity, CountryEntity, QAfterFilterCondition>
      currenciesLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'currencies',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<CountryEntity, CountryEntity, QAfterFilterCondition>
      currencyIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'currency',
      ));
    });
  }

  QueryBuilder<CountryEntity, CountryEntity, QAfterFilterCondition>
      currencyIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'currency',
      ));
    });
  }

  QueryBuilder<CountryEntity, CountryEntity, QAfterFilterCondition>
      currencyEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'currency',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CountryEntity, CountryEntity, QAfterFilterCondition>
      currencyGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'currency',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CountryEntity, CountryEntity, QAfterFilterCondition>
      currencyLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'currency',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CountryEntity, CountryEntity, QAfterFilterCondition>
      currencyBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'currency',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CountryEntity, CountryEntity, QAfterFilterCondition>
      currencyStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'currency',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CountryEntity, CountryEntity, QAfterFilterCondition>
      currencyEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'currency',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CountryEntity, CountryEntity, QAfterFilterCondition>
      currencyContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'currency',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CountryEntity, CountryEntity, QAfterFilterCondition>
      currencyMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'currency',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CountryEntity, CountryEntity, QAfterFilterCondition>
      currencyIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'currency',
        value: '',
      ));
    });
  }

  QueryBuilder<CountryEntity, CountryEntity, QAfterFilterCondition>
      currencyIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'currency',
        value: '',
      ));
    });
  }

  QueryBuilder<CountryEntity, CountryEntity, QAfterFilterCondition>
      flagIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'flag',
      ));
    });
  }

  QueryBuilder<CountryEntity, CountryEntity, QAfterFilterCondition>
      flagIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'flag',
      ));
    });
  }

  QueryBuilder<CountryEntity, CountryEntity, QAfterFilterCondition> flagEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'flag',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CountryEntity, CountryEntity, QAfterFilterCondition>
      flagGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'flag',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CountryEntity, CountryEntity, QAfterFilterCondition>
      flagLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'flag',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CountryEntity, CountryEntity, QAfterFilterCondition> flagBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'flag',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CountryEntity, CountryEntity, QAfterFilterCondition>
      flagStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'flag',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CountryEntity, CountryEntity, QAfterFilterCondition>
      flagEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'flag',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CountryEntity, CountryEntity, QAfterFilterCondition>
      flagContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'flag',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CountryEntity, CountryEntity, QAfterFilterCondition> flagMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'flag',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CountryEntity, CountryEntity, QAfterFilterCondition>
      flagIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'flag',
        value: '',
      ));
    });
  }

  QueryBuilder<CountryEntity, CountryEntity, QAfterFilterCondition>
      flagIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'flag',
        value: '',
      ));
    });
  }

  QueryBuilder<CountryEntity, CountryEntity, QAfterFilterCondition> idIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<CountryEntity, CountryEntity, QAfterFilterCondition>
      idIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<CountryEntity, CountryEntity, QAfterFilterCondition> idEqualTo(
      Id? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<CountryEntity, CountryEntity, QAfterFilterCondition>
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

  QueryBuilder<CountryEntity, CountryEntity, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<CountryEntity, CountryEntity, QAfterFilterCondition> idBetween(
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

  QueryBuilder<CountryEntity, CountryEntity, QAfterFilterCondition> iso2EqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'iso2',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CountryEntity, CountryEntity, QAfterFilterCondition>
      iso2GreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'iso2',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CountryEntity, CountryEntity, QAfterFilterCondition>
      iso2LessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'iso2',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CountryEntity, CountryEntity, QAfterFilterCondition> iso2Between(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'iso2',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CountryEntity, CountryEntity, QAfterFilterCondition>
      iso2StartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'iso2',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CountryEntity, CountryEntity, QAfterFilterCondition>
      iso2EndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'iso2',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CountryEntity, CountryEntity, QAfterFilterCondition>
      iso2Contains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'iso2',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CountryEntity, CountryEntity, QAfterFilterCondition> iso2Matches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'iso2',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CountryEntity, CountryEntity, QAfterFilterCondition>
      iso2IsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'iso2',
        value: '',
      ));
    });
  }

  QueryBuilder<CountryEntity, CountryEntity, QAfterFilterCondition>
      iso2IsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'iso2',
        value: '',
      ));
    });
  }

  QueryBuilder<CountryEntity, CountryEntity, QAfterFilterCondition> iso3EqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'iso3',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CountryEntity, CountryEntity, QAfterFilterCondition>
      iso3GreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'iso3',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CountryEntity, CountryEntity, QAfterFilterCondition>
      iso3LessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'iso3',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CountryEntity, CountryEntity, QAfterFilterCondition> iso3Between(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'iso3',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CountryEntity, CountryEntity, QAfterFilterCondition>
      iso3StartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'iso3',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CountryEntity, CountryEntity, QAfterFilterCondition>
      iso3EndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'iso3',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CountryEntity, CountryEntity, QAfterFilterCondition>
      iso3Contains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'iso3',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CountryEntity, CountryEntity, QAfterFilterCondition> iso3Matches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'iso3',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CountryEntity, CountryEntity, QAfterFilterCondition>
      iso3IsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'iso3',
        value: '',
      ));
    });
  }

  QueryBuilder<CountryEntity, CountryEntity, QAfterFilterCondition>
      iso3IsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'iso3',
        value: '',
      ));
    });
  }

  QueryBuilder<CountryEntity, CountryEntity, QAfterFilterCondition>
      isoNumericEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isoNumeric',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CountryEntity, CountryEntity, QAfterFilterCondition>
      isoNumericGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'isoNumeric',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CountryEntity, CountryEntity, QAfterFilterCondition>
      isoNumericLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'isoNumeric',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CountryEntity, CountryEntity, QAfterFilterCondition>
      isoNumericBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'isoNumeric',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CountryEntity, CountryEntity, QAfterFilterCondition>
      isoNumericStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'isoNumeric',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CountryEntity, CountryEntity, QAfterFilterCondition>
      isoNumericEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'isoNumeric',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CountryEntity, CountryEntity, QAfterFilterCondition>
      isoNumericContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'isoNumeric',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CountryEntity, CountryEntity, QAfterFilterCondition>
      isoNumericMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'isoNumeric',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CountryEntity, CountryEntity, QAfterFilterCondition>
      isoNumericIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isoNumeric',
        value: '',
      ));
    });
  }

  QueryBuilder<CountryEntity, CountryEntity, QAfterFilterCondition>
      isoNumericIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'isoNumeric',
        value: '',
      ));
    });
  }

  QueryBuilder<CountryEntity, CountryEntity, QAfterFilterCondition>
      languagesElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'languages',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CountryEntity, CountryEntity, QAfterFilterCondition>
      languagesElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'languages',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CountryEntity, CountryEntity, QAfterFilterCondition>
      languagesElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'languages',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CountryEntity, CountryEntity, QAfterFilterCondition>
      languagesElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'languages',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CountryEntity, CountryEntity, QAfterFilterCondition>
      languagesElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'languages',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CountryEntity, CountryEntity, QAfterFilterCondition>
      languagesElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'languages',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CountryEntity, CountryEntity, QAfterFilterCondition>
      languagesElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'languages',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CountryEntity, CountryEntity, QAfterFilterCondition>
      languagesElementMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'languages',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CountryEntity, CountryEntity, QAfterFilterCondition>
      languagesElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'languages',
        value: '',
      ));
    });
  }

  QueryBuilder<CountryEntity, CountryEntity, QAfterFilterCondition>
      languagesElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'languages',
        value: '',
      ));
    });
  }

  QueryBuilder<CountryEntity, CountryEntity, QAfterFilterCondition>
      languagesLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'languages',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<CountryEntity, CountryEntity, QAfterFilterCondition>
      languagesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'languages',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<CountryEntity, CountryEntity, QAfterFilterCondition>
      languagesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'languages',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<CountryEntity, CountryEntity, QAfterFilterCondition>
      languagesLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'languages',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<CountryEntity, CountryEntity, QAfterFilterCondition>
      languagesLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'languages',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<CountryEntity, CountryEntity, QAfterFilterCondition>
      languagesLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'languages',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<CountryEntity, CountryEntity, QAfterFilterCondition> nameEqualTo(
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

  QueryBuilder<CountryEntity, CountryEntity, QAfterFilterCondition>
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

  QueryBuilder<CountryEntity, CountryEntity, QAfterFilterCondition>
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

  QueryBuilder<CountryEntity, CountryEntity, QAfterFilterCondition> nameBetween(
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

  QueryBuilder<CountryEntity, CountryEntity, QAfterFilterCondition>
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

  QueryBuilder<CountryEntity, CountryEntity, QAfterFilterCondition>
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

  QueryBuilder<CountryEntity, CountryEntity, QAfterFilterCondition>
      nameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CountryEntity, CountryEntity, QAfterFilterCondition> nameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'name',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CountryEntity, CountryEntity, QAfterFilterCondition>
      nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<CountryEntity, CountryEntity, QAfterFilterCondition>
      nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<CountryEntity, CountryEntity, QAfterFilterCondition>
      phoneCodeEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'phoneCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CountryEntity, CountryEntity, QAfterFilterCondition>
      phoneCodeGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'phoneCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CountryEntity, CountryEntity, QAfterFilterCondition>
      phoneCodeLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'phoneCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CountryEntity, CountryEntity, QAfterFilterCondition>
      phoneCodeBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'phoneCode',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CountryEntity, CountryEntity, QAfterFilterCondition>
      phoneCodeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'phoneCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CountryEntity, CountryEntity, QAfterFilterCondition>
      phoneCodeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'phoneCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CountryEntity, CountryEntity, QAfterFilterCondition>
      phoneCodeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'phoneCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CountryEntity, CountryEntity, QAfterFilterCondition>
      phoneCodeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'phoneCode',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CountryEntity, CountryEntity, QAfterFilterCondition>
      phoneCodeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'phoneCode',
        value: '',
      ));
    });
  }

  QueryBuilder<CountryEntity, CountryEntity, QAfterFilterCondition>
      phoneCodeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'phoneCode',
        value: '',
      ));
    });
  }

  QueryBuilder<CountryEntity, CountryEntity, QAfterFilterCondition>
      timeZoneIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'timeZone',
      ));
    });
  }

  QueryBuilder<CountryEntity, CountryEntity, QAfterFilterCondition>
      timeZoneIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'timeZone',
      ));
    });
  }

  QueryBuilder<CountryEntity, CountryEntity, QAfterFilterCondition>
      timeZoneEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'timeZone',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CountryEntity, CountryEntity, QAfterFilterCondition>
      timeZoneGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'timeZone',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CountryEntity, CountryEntity, QAfterFilterCondition>
      timeZoneLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'timeZone',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CountryEntity, CountryEntity, QAfterFilterCondition>
      timeZoneBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'timeZone',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CountryEntity, CountryEntity, QAfterFilterCondition>
      timeZoneStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'timeZone',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CountryEntity, CountryEntity, QAfterFilterCondition>
      timeZoneEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'timeZone',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CountryEntity, CountryEntity, QAfterFilterCondition>
      timeZoneContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'timeZone',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CountryEntity, CountryEntity, QAfterFilterCondition>
      timeZoneMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'timeZone',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CountryEntity, CountryEntity, QAfterFilterCondition>
      timeZoneIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'timeZone',
        value: '',
      ));
    });
  }

  QueryBuilder<CountryEntity, CountryEntity, QAfterFilterCondition>
      timeZoneIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'timeZone',
        value: '',
      ));
    });
  }
}

extension CountryEntityQueryObject
    on QueryBuilder<CountryEntity, CountryEntity, QFilterCondition> {}

extension CountryEntityQueryLinks
    on QueryBuilder<CountryEntity, CountryEntity, QFilterCondition> {}

extension CountryEntityQuerySortBy
    on QueryBuilder<CountryEntity, CountryEntity, QSortBy> {
  QueryBuilder<CountryEntity, CountryEntity, QAfterSortBy> sortByCapital() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'capital', Sort.asc);
    });
  }

  QueryBuilder<CountryEntity, CountryEntity, QAfterSortBy> sortByCapitalDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'capital', Sort.desc);
    });
  }

  QueryBuilder<CountryEntity, CountryEntity, QAfterSortBy> sortByContinent() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'continent', Sort.asc);
    });
  }

  QueryBuilder<CountryEntity, CountryEntity, QAfterSortBy>
      sortByContinentDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'continent', Sort.desc);
    });
  }

  QueryBuilder<CountryEntity, CountryEntity, QAfterSortBy> sortByCurrency() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currency', Sort.asc);
    });
  }

  QueryBuilder<CountryEntity, CountryEntity, QAfterSortBy>
      sortByCurrencyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currency', Sort.desc);
    });
  }

  QueryBuilder<CountryEntity, CountryEntity, QAfterSortBy> sortByFlag() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'flag', Sort.asc);
    });
  }

  QueryBuilder<CountryEntity, CountryEntity, QAfterSortBy> sortByFlagDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'flag', Sort.desc);
    });
  }

  QueryBuilder<CountryEntity, CountryEntity, QAfterSortBy> sortByIso2() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'iso2', Sort.asc);
    });
  }

  QueryBuilder<CountryEntity, CountryEntity, QAfterSortBy> sortByIso2Desc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'iso2', Sort.desc);
    });
  }

  QueryBuilder<CountryEntity, CountryEntity, QAfterSortBy> sortByIso3() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'iso3', Sort.asc);
    });
  }

  QueryBuilder<CountryEntity, CountryEntity, QAfterSortBy> sortByIso3Desc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'iso3', Sort.desc);
    });
  }

  QueryBuilder<CountryEntity, CountryEntity, QAfterSortBy> sortByIsoNumeric() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isoNumeric', Sort.asc);
    });
  }

  QueryBuilder<CountryEntity, CountryEntity, QAfterSortBy>
      sortByIsoNumericDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isoNumeric', Sort.desc);
    });
  }

  QueryBuilder<CountryEntity, CountryEntity, QAfterSortBy> sortByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<CountryEntity, CountryEntity, QAfterSortBy> sortByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<CountryEntity, CountryEntity, QAfterSortBy> sortByPhoneCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'phoneCode', Sort.asc);
    });
  }

  QueryBuilder<CountryEntity, CountryEntity, QAfterSortBy>
      sortByPhoneCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'phoneCode', Sort.desc);
    });
  }

  QueryBuilder<CountryEntity, CountryEntity, QAfterSortBy> sortByTimeZone() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timeZone', Sort.asc);
    });
  }

  QueryBuilder<CountryEntity, CountryEntity, QAfterSortBy>
      sortByTimeZoneDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timeZone', Sort.desc);
    });
  }
}

extension CountryEntityQuerySortThenBy
    on QueryBuilder<CountryEntity, CountryEntity, QSortThenBy> {
  QueryBuilder<CountryEntity, CountryEntity, QAfterSortBy> thenByCapital() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'capital', Sort.asc);
    });
  }

  QueryBuilder<CountryEntity, CountryEntity, QAfterSortBy> thenByCapitalDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'capital', Sort.desc);
    });
  }

  QueryBuilder<CountryEntity, CountryEntity, QAfterSortBy> thenByContinent() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'continent', Sort.asc);
    });
  }

  QueryBuilder<CountryEntity, CountryEntity, QAfterSortBy>
      thenByContinentDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'continent', Sort.desc);
    });
  }

  QueryBuilder<CountryEntity, CountryEntity, QAfterSortBy> thenByCurrency() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currency', Sort.asc);
    });
  }

  QueryBuilder<CountryEntity, CountryEntity, QAfterSortBy>
      thenByCurrencyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currency', Sort.desc);
    });
  }

  QueryBuilder<CountryEntity, CountryEntity, QAfterSortBy> thenByFlag() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'flag', Sort.asc);
    });
  }

  QueryBuilder<CountryEntity, CountryEntity, QAfterSortBy> thenByFlagDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'flag', Sort.desc);
    });
  }

  QueryBuilder<CountryEntity, CountryEntity, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<CountryEntity, CountryEntity, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<CountryEntity, CountryEntity, QAfterSortBy> thenByIso2() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'iso2', Sort.asc);
    });
  }

  QueryBuilder<CountryEntity, CountryEntity, QAfterSortBy> thenByIso2Desc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'iso2', Sort.desc);
    });
  }

  QueryBuilder<CountryEntity, CountryEntity, QAfterSortBy> thenByIso3() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'iso3', Sort.asc);
    });
  }

  QueryBuilder<CountryEntity, CountryEntity, QAfterSortBy> thenByIso3Desc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'iso3', Sort.desc);
    });
  }

  QueryBuilder<CountryEntity, CountryEntity, QAfterSortBy> thenByIsoNumeric() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isoNumeric', Sort.asc);
    });
  }

  QueryBuilder<CountryEntity, CountryEntity, QAfterSortBy>
      thenByIsoNumericDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isoNumeric', Sort.desc);
    });
  }

  QueryBuilder<CountryEntity, CountryEntity, QAfterSortBy> thenByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<CountryEntity, CountryEntity, QAfterSortBy> thenByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<CountryEntity, CountryEntity, QAfterSortBy> thenByPhoneCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'phoneCode', Sort.asc);
    });
  }

  QueryBuilder<CountryEntity, CountryEntity, QAfterSortBy>
      thenByPhoneCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'phoneCode', Sort.desc);
    });
  }

  QueryBuilder<CountryEntity, CountryEntity, QAfterSortBy> thenByTimeZone() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timeZone', Sort.asc);
    });
  }

  QueryBuilder<CountryEntity, CountryEntity, QAfterSortBy>
      thenByTimeZoneDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timeZone', Sort.desc);
    });
  }
}

extension CountryEntityQueryWhereDistinct
    on QueryBuilder<CountryEntity, CountryEntity, QDistinct> {
  QueryBuilder<CountryEntity, CountryEntity, QDistinct> distinctByCapital(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'capital', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<CountryEntity, CountryEntity, QDistinct> distinctByContinent(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'continent', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<CountryEntity, CountryEntity, QDistinct> distinctByCurrencies() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'currencies');
    });
  }

  QueryBuilder<CountryEntity, CountryEntity, QDistinct> distinctByCurrency(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'currency', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<CountryEntity, CountryEntity, QDistinct> distinctByFlag(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'flag', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<CountryEntity, CountryEntity, QDistinct> distinctByIso2(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'iso2', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<CountryEntity, CountryEntity, QDistinct> distinctByIso3(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'iso3', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<CountryEntity, CountryEntity, QDistinct> distinctByIsoNumeric(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isoNumeric', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<CountryEntity, CountryEntity, QDistinct> distinctByLanguages() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'languages');
    });
  }

  QueryBuilder<CountryEntity, CountryEntity, QDistinct> distinctByName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<CountryEntity, CountryEntity, QDistinct> distinctByPhoneCode(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'phoneCode', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<CountryEntity, CountryEntity, QDistinct> distinctByTimeZone(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'timeZone', caseSensitive: caseSensitive);
    });
  }
}

extension CountryEntityQueryProperty
    on QueryBuilder<CountryEntity, CountryEntity, QQueryProperty> {
  QueryBuilder<CountryEntity, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<CountryEntity, String?, QQueryOperations> capitalProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'capital');
    });
  }

  QueryBuilder<CountryEntity, String, QQueryOperations> continentProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'continent');
    });
  }

  QueryBuilder<CountryEntity, List<String>, QQueryOperations>
      currenciesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'currencies');
    });
  }

  QueryBuilder<CountryEntity, String?, QQueryOperations> currencyProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'currency');
    });
  }

  QueryBuilder<CountryEntity, String?, QQueryOperations> flagProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'flag');
    });
  }

  QueryBuilder<CountryEntity, String, QQueryOperations> iso2Property() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'iso2');
    });
  }

  QueryBuilder<CountryEntity, String, QQueryOperations> iso3Property() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'iso3');
    });
  }

  QueryBuilder<CountryEntity, String, QQueryOperations> isoNumericProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isoNumeric');
    });
  }

  QueryBuilder<CountryEntity, List<String>, QQueryOperations>
      languagesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'languages');
    });
  }

  QueryBuilder<CountryEntity, String, QQueryOperations> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name');
    });
  }

  QueryBuilder<CountryEntity, String, QQueryOperations> phoneCodeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'phoneCode');
    });
  }

  QueryBuilder<CountryEntity, String?, QQueryOperations> timeZoneProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'timeZone');
    });
  }
}
