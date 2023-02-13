// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_price_entity.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters

extension GetItemPriceEntityCollection on Isar {
  IsarCollection<ItemPriceEntity> get itemPriceEntitys => this.collection();
}

const ItemPriceEntitySchema = CollectionSchema(
  name: r'ItemPriceEntity',
  id: -2407489747410402320,
  properties: {
    r'effectiveDate': PropertySchema(
      id: 0,
      name: r'effectiveDate',
      type: IsarType.dateTime,
    ),
    r'expiryDate': PropertySchema(
      id: 1,
      name: r'expiryDate',
      type: IsarType.dateTime,
    ),
    r'price': PropertySchema(
      id: 2,
      name: r'price',
      type: IsarType.double,
    ),
    r'pricePropertyCode': PropertySchema(
      id: 3,
      name: r'pricePropertyCode',
      type: IsarType.string,
    ),
    r'priceQuantity': PropertySchema(
      id: 4,
      name: r'priceQuantity',
      type: IsarType.double,
    ),
    r'productId': PropertySchema(
      id: 5,
      name: r'productId',
      type: IsarType.string,
    )
  },
  estimateSize: _itemPriceEntityEstimateSize,
  serialize: _itemPriceEntitySerialize,
  deserialize: _itemPriceEntityDeserialize,
  deserializeProp: _itemPriceEntityDeserializeProp,
  idName: r'id',
  indexes: {
    r'productId_pricePropertyCode_effectiveDate_priceQuantity': IndexSchema(
      id: -9063104595715523639,
      name: r'productId_pricePropertyCode_effectiveDate_priceQuantity',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'productId',
          type: IndexType.hash,
          caseSensitive: true,
        ),
        IndexPropertySchema(
          name: r'pricePropertyCode',
          type: IndexType.hash,
          caseSensitive: true,
        ),
        IndexPropertySchema(
          name: r'effectiveDate',
          type: IndexType.value,
          caseSensitive: false,
        ),
        IndexPropertySchema(
          name: r'priceQuantity',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _itemPriceEntityGetId,
  getLinks: _itemPriceEntityGetLinks,
  attach: _itemPriceEntityAttach,
  version: '3.0.5',
);

int _itemPriceEntityEstimateSize(
  ItemPriceEntity object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.pricePropertyCode.length * 3;
  bytesCount += 3 + object.productId.length * 3;
  return bytesCount;
}

void _itemPriceEntitySerialize(
  ItemPriceEntity object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDateTime(offsets[0], object.effectiveDate);
  writer.writeDateTime(offsets[1], object.expiryDate);
  writer.writeDouble(offsets[2], object.price);
  writer.writeString(offsets[3], object.pricePropertyCode);
  writer.writeDouble(offsets[4], object.priceQuantity);
  writer.writeString(offsets[5], object.productId);
}

ItemPriceEntity _itemPriceEntityDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = ItemPriceEntity(
    effectiveDate: reader.readDateTime(offsets[0]),
    expiryDate: reader.readDateTimeOrNull(offsets[1]),
    id: id,
    price: reader.readDouble(offsets[2]),
    pricePropertyCode: reader.readString(offsets[3]),
    priceQuantity: reader.readDouble(offsets[4]),
    productId: reader.readString(offsets[5]),
  );
  return object;
}

P _itemPriceEntityDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDateTime(offset)) as P;
    case 1:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 2:
      return (reader.readDouble(offset)) as P;
    case 3:
      return (reader.readString(offset)) as P;
    case 4:
      return (reader.readDouble(offset)) as P;
    case 5:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _itemPriceEntityGetId(ItemPriceEntity object) {
  return object.id ?? Isar.autoIncrement;
}

List<IsarLinkBase<dynamic>> _itemPriceEntityGetLinks(ItemPriceEntity object) {
  return [];
}

void _itemPriceEntityAttach(
    IsarCollection<dynamic> col, Id id, ItemPriceEntity object) {
  object.id = id;
}

extension ItemPriceEntityQueryWhereSort
    on QueryBuilder<ItemPriceEntity, ItemPriceEntity, QWhere> {
  QueryBuilder<ItemPriceEntity, ItemPriceEntity, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension ItemPriceEntityQueryWhere
    on QueryBuilder<ItemPriceEntity, ItemPriceEntity, QWhereClause> {
  QueryBuilder<ItemPriceEntity, ItemPriceEntity, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<ItemPriceEntity, ItemPriceEntity, QAfterWhereClause>
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

  QueryBuilder<ItemPriceEntity, ItemPriceEntity, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<ItemPriceEntity, ItemPriceEntity, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<ItemPriceEntity, ItemPriceEntity, QAfterWhereClause> idBetween(
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

  QueryBuilder<ItemPriceEntity, ItemPriceEntity, QAfterWhereClause>
      productIdEqualToAnyPricePropertyCodeEffectiveDatePriceQuantity(
          String productId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'productId_pricePropertyCode_effectiveDate_priceQuantity',
        value: [productId],
      ));
    });
  }

  QueryBuilder<ItemPriceEntity, ItemPriceEntity, QAfterWhereClause>
      productIdNotEqualToAnyPricePropertyCodeEffectiveDatePriceQuantity(
          String productId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName:
                  r'productId_pricePropertyCode_effectiveDate_priceQuantity',
              lower: [],
              upper: [productId],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName:
                  r'productId_pricePropertyCode_effectiveDate_priceQuantity',
              lower: [productId],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName:
                  r'productId_pricePropertyCode_effectiveDate_priceQuantity',
              lower: [productId],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName:
                  r'productId_pricePropertyCode_effectiveDate_priceQuantity',
              lower: [],
              upper: [productId],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<ItemPriceEntity, ItemPriceEntity, QAfterWhereClause>
      productIdPricePropertyCodeEqualToAnyEffectiveDatePriceQuantity(
          String productId, String pricePropertyCode) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'productId_pricePropertyCode_effectiveDate_priceQuantity',
        value: [productId, pricePropertyCode],
      ));
    });
  }

  QueryBuilder<ItemPriceEntity, ItemPriceEntity, QAfterWhereClause>
      productIdEqualToPricePropertyCodeNotEqualToAnyEffectiveDatePriceQuantity(
          String productId, String pricePropertyCode) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName:
                  r'productId_pricePropertyCode_effectiveDate_priceQuantity',
              lower: [productId],
              upper: [productId, pricePropertyCode],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName:
                  r'productId_pricePropertyCode_effectiveDate_priceQuantity',
              lower: [productId, pricePropertyCode],
              includeLower: false,
              upper: [productId],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName:
                  r'productId_pricePropertyCode_effectiveDate_priceQuantity',
              lower: [productId, pricePropertyCode],
              includeLower: false,
              upper: [productId],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName:
                  r'productId_pricePropertyCode_effectiveDate_priceQuantity',
              lower: [productId],
              upper: [productId, pricePropertyCode],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<ItemPriceEntity, ItemPriceEntity, QAfterWhereClause>
      productIdPricePropertyCodeEffectiveDateEqualToAnyPriceQuantity(
          String productId, String pricePropertyCode, DateTime effectiveDate) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'productId_pricePropertyCode_effectiveDate_priceQuantity',
        value: [productId, pricePropertyCode, effectiveDate],
      ));
    });
  }

  QueryBuilder<ItemPriceEntity, ItemPriceEntity, QAfterWhereClause>
      productIdPricePropertyCodeEqualToEffectiveDateNotEqualToAnyPriceQuantity(
          String productId, String pricePropertyCode, DateTime effectiveDate) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName:
                  r'productId_pricePropertyCode_effectiveDate_priceQuantity',
              lower: [productId, pricePropertyCode],
              upper: [productId, pricePropertyCode, effectiveDate],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName:
                  r'productId_pricePropertyCode_effectiveDate_priceQuantity',
              lower: [productId, pricePropertyCode, effectiveDate],
              includeLower: false,
              upper: [productId, pricePropertyCode],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName:
                  r'productId_pricePropertyCode_effectiveDate_priceQuantity',
              lower: [productId, pricePropertyCode, effectiveDate],
              includeLower: false,
              upper: [productId, pricePropertyCode],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName:
                  r'productId_pricePropertyCode_effectiveDate_priceQuantity',
              lower: [productId, pricePropertyCode],
              upper: [productId, pricePropertyCode, effectiveDate],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<ItemPriceEntity, ItemPriceEntity, QAfterWhereClause>
      productIdPricePropertyCodeEqualToEffectiveDateGreaterThanAnyPriceQuantity(
    String productId,
    String pricePropertyCode,
    DateTime effectiveDate, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'productId_pricePropertyCode_effectiveDate_priceQuantity',
        lower: [productId, pricePropertyCode, effectiveDate],
        includeLower: include,
        upper: [productId, pricePropertyCode],
      ));
    });
  }

  QueryBuilder<ItemPriceEntity, ItemPriceEntity, QAfterWhereClause>
      productIdPricePropertyCodeEqualToEffectiveDateLessThanAnyPriceQuantity(
    String productId,
    String pricePropertyCode,
    DateTime effectiveDate, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'productId_pricePropertyCode_effectiveDate_priceQuantity',
        lower: [productId, pricePropertyCode],
        upper: [productId, pricePropertyCode, effectiveDate],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<ItemPriceEntity, ItemPriceEntity, QAfterWhereClause>
      productIdPricePropertyCodeEqualToEffectiveDateBetweenAnyPriceQuantity(
    String productId,
    String pricePropertyCode,
    DateTime lowerEffectiveDate,
    DateTime upperEffectiveDate, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'productId_pricePropertyCode_effectiveDate_priceQuantity',
        lower: [productId, pricePropertyCode, lowerEffectiveDate],
        includeLower: includeLower,
        upper: [productId, pricePropertyCode, upperEffectiveDate],
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ItemPriceEntity, ItemPriceEntity, QAfterWhereClause>
      productIdPricePropertyCodeEffectiveDatePriceQuantityEqualTo(
          String productId,
          String pricePropertyCode,
          DateTime effectiveDate,
          double priceQuantity) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'productId_pricePropertyCode_effectiveDate_priceQuantity',
        value: [productId, pricePropertyCode, effectiveDate, priceQuantity],
      ));
    });
  }

  QueryBuilder<ItemPriceEntity, ItemPriceEntity, QAfterWhereClause>
      productIdPricePropertyCodeEffectiveDateEqualToPriceQuantityNotEqualTo(
          String productId,
          String pricePropertyCode,
          DateTime effectiveDate,
          double priceQuantity) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName:
                  r'productId_pricePropertyCode_effectiveDate_priceQuantity',
              lower: [productId, pricePropertyCode, effectiveDate],
              upper: [
                productId,
                pricePropertyCode,
                effectiveDate,
                priceQuantity
              ],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName:
                  r'productId_pricePropertyCode_effectiveDate_priceQuantity',
              lower: [
                productId,
                pricePropertyCode,
                effectiveDate,
                priceQuantity
              ],
              includeLower: false,
              upper: [productId, pricePropertyCode, effectiveDate],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName:
                  r'productId_pricePropertyCode_effectiveDate_priceQuantity',
              lower: [
                productId,
                pricePropertyCode,
                effectiveDate,
                priceQuantity
              ],
              includeLower: false,
              upper: [productId, pricePropertyCode, effectiveDate],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName:
                  r'productId_pricePropertyCode_effectiveDate_priceQuantity',
              lower: [productId, pricePropertyCode, effectiveDate],
              upper: [
                productId,
                pricePropertyCode,
                effectiveDate,
                priceQuantity
              ],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<ItemPriceEntity, ItemPriceEntity, QAfterWhereClause>
      productIdPricePropertyCodeEffectiveDateEqualToPriceQuantityGreaterThan(
    String productId,
    String pricePropertyCode,
    DateTime effectiveDate,
    double priceQuantity, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'productId_pricePropertyCode_effectiveDate_priceQuantity',
        lower: [productId, pricePropertyCode, effectiveDate, priceQuantity],
        includeLower: include,
        upper: [productId, pricePropertyCode, effectiveDate],
      ));
    });
  }

  QueryBuilder<ItemPriceEntity, ItemPriceEntity, QAfterWhereClause>
      productIdPricePropertyCodeEffectiveDateEqualToPriceQuantityLessThan(
    String productId,
    String pricePropertyCode,
    DateTime effectiveDate,
    double priceQuantity, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'productId_pricePropertyCode_effectiveDate_priceQuantity',
        lower: [productId, pricePropertyCode, effectiveDate],
        upper: [productId, pricePropertyCode, effectiveDate, priceQuantity],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<ItemPriceEntity, ItemPriceEntity, QAfterWhereClause>
      productIdPricePropertyCodeEffectiveDateEqualToPriceQuantityBetween(
    String productId,
    String pricePropertyCode,
    DateTime effectiveDate,
    double lowerPriceQuantity,
    double upperPriceQuantity, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'productId_pricePropertyCode_effectiveDate_priceQuantity',
        lower: [
          productId,
          pricePropertyCode,
          effectiveDate,
          lowerPriceQuantity
        ],
        includeLower: includeLower,
        upper: [
          productId,
          pricePropertyCode,
          effectiveDate,
          upperPriceQuantity
        ],
        includeUpper: includeUpper,
      ));
    });
  }
}

extension ItemPriceEntityQueryFilter
    on QueryBuilder<ItemPriceEntity, ItemPriceEntity, QFilterCondition> {
  QueryBuilder<ItemPriceEntity, ItemPriceEntity, QAfterFilterCondition>
      effectiveDateEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'effectiveDate',
        value: value,
      ));
    });
  }

  QueryBuilder<ItemPriceEntity, ItemPriceEntity, QAfterFilterCondition>
      effectiveDateGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'effectiveDate',
        value: value,
      ));
    });
  }

  QueryBuilder<ItemPriceEntity, ItemPriceEntity, QAfterFilterCondition>
      effectiveDateLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'effectiveDate',
        value: value,
      ));
    });
  }

  QueryBuilder<ItemPriceEntity, ItemPriceEntity, QAfterFilterCondition>
      effectiveDateBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'effectiveDate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ItemPriceEntity, ItemPriceEntity, QAfterFilterCondition>
      expiryDateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'expiryDate',
      ));
    });
  }

  QueryBuilder<ItemPriceEntity, ItemPriceEntity, QAfterFilterCondition>
      expiryDateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'expiryDate',
      ));
    });
  }

  QueryBuilder<ItemPriceEntity, ItemPriceEntity, QAfterFilterCondition>
      expiryDateEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'expiryDate',
        value: value,
      ));
    });
  }

  QueryBuilder<ItemPriceEntity, ItemPriceEntity, QAfterFilterCondition>
      expiryDateGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'expiryDate',
        value: value,
      ));
    });
  }

  QueryBuilder<ItemPriceEntity, ItemPriceEntity, QAfterFilterCondition>
      expiryDateLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'expiryDate',
        value: value,
      ));
    });
  }

  QueryBuilder<ItemPriceEntity, ItemPriceEntity, QAfterFilterCondition>
      expiryDateBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'expiryDate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ItemPriceEntity, ItemPriceEntity, QAfterFilterCondition>
      idIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<ItemPriceEntity, ItemPriceEntity, QAfterFilterCondition>
      idIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<ItemPriceEntity, ItemPriceEntity, QAfterFilterCondition>
      idEqualTo(Id? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<ItemPriceEntity, ItemPriceEntity, QAfterFilterCondition>
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

  QueryBuilder<ItemPriceEntity, ItemPriceEntity, QAfterFilterCondition>
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

  QueryBuilder<ItemPriceEntity, ItemPriceEntity, QAfterFilterCondition>
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

  QueryBuilder<ItemPriceEntity, ItemPriceEntity, QAfterFilterCondition>
      priceEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'price',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ItemPriceEntity, ItemPriceEntity, QAfterFilterCondition>
      priceGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'price',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ItemPriceEntity, ItemPriceEntity, QAfterFilterCondition>
      priceLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'price',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ItemPriceEntity, ItemPriceEntity, QAfterFilterCondition>
      priceBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'price',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ItemPriceEntity, ItemPriceEntity, QAfterFilterCondition>
      pricePropertyCodeEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'pricePropertyCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ItemPriceEntity, ItemPriceEntity, QAfterFilterCondition>
      pricePropertyCodeGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'pricePropertyCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ItemPriceEntity, ItemPriceEntity, QAfterFilterCondition>
      pricePropertyCodeLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'pricePropertyCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ItemPriceEntity, ItemPriceEntity, QAfterFilterCondition>
      pricePropertyCodeBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'pricePropertyCode',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ItemPriceEntity, ItemPriceEntity, QAfterFilterCondition>
      pricePropertyCodeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'pricePropertyCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ItemPriceEntity, ItemPriceEntity, QAfterFilterCondition>
      pricePropertyCodeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'pricePropertyCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ItemPriceEntity, ItemPriceEntity, QAfterFilterCondition>
      pricePropertyCodeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'pricePropertyCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ItemPriceEntity, ItemPriceEntity, QAfterFilterCondition>
      pricePropertyCodeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'pricePropertyCode',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ItemPriceEntity, ItemPriceEntity, QAfterFilterCondition>
      pricePropertyCodeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'pricePropertyCode',
        value: '',
      ));
    });
  }

  QueryBuilder<ItemPriceEntity, ItemPriceEntity, QAfterFilterCondition>
      pricePropertyCodeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'pricePropertyCode',
        value: '',
      ));
    });
  }

  QueryBuilder<ItemPriceEntity, ItemPriceEntity, QAfterFilterCondition>
      priceQuantityEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'priceQuantity',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ItemPriceEntity, ItemPriceEntity, QAfterFilterCondition>
      priceQuantityGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'priceQuantity',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ItemPriceEntity, ItemPriceEntity, QAfterFilterCondition>
      priceQuantityLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'priceQuantity',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ItemPriceEntity, ItemPriceEntity, QAfterFilterCondition>
      priceQuantityBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'priceQuantity',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ItemPriceEntity, ItemPriceEntity, QAfterFilterCondition>
      productIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'productId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ItemPriceEntity, ItemPriceEntity, QAfterFilterCondition>
      productIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'productId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ItemPriceEntity, ItemPriceEntity, QAfterFilterCondition>
      productIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'productId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ItemPriceEntity, ItemPriceEntity, QAfterFilterCondition>
      productIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'productId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ItemPriceEntity, ItemPriceEntity, QAfterFilterCondition>
      productIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'productId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ItemPriceEntity, ItemPriceEntity, QAfterFilterCondition>
      productIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'productId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ItemPriceEntity, ItemPriceEntity, QAfterFilterCondition>
      productIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'productId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ItemPriceEntity, ItemPriceEntity, QAfterFilterCondition>
      productIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'productId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ItemPriceEntity, ItemPriceEntity, QAfterFilterCondition>
      productIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'productId',
        value: '',
      ));
    });
  }

  QueryBuilder<ItemPriceEntity, ItemPriceEntity, QAfterFilterCondition>
      productIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'productId',
        value: '',
      ));
    });
  }
}

extension ItemPriceEntityQueryObject
    on QueryBuilder<ItemPriceEntity, ItemPriceEntity, QFilterCondition> {}

extension ItemPriceEntityQueryLinks
    on QueryBuilder<ItemPriceEntity, ItemPriceEntity, QFilterCondition> {}

extension ItemPriceEntityQuerySortBy
    on QueryBuilder<ItemPriceEntity, ItemPriceEntity, QSortBy> {
  QueryBuilder<ItemPriceEntity, ItemPriceEntity, QAfterSortBy>
      sortByEffectiveDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'effectiveDate', Sort.asc);
    });
  }

  QueryBuilder<ItemPriceEntity, ItemPriceEntity, QAfterSortBy>
      sortByEffectiveDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'effectiveDate', Sort.desc);
    });
  }

  QueryBuilder<ItemPriceEntity, ItemPriceEntity, QAfterSortBy>
      sortByExpiryDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'expiryDate', Sort.asc);
    });
  }

  QueryBuilder<ItemPriceEntity, ItemPriceEntity, QAfterSortBy>
      sortByExpiryDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'expiryDate', Sort.desc);
    });
  }

  QueryBuilder<ItemPriceEntity, ItemPriceEntity, QAfterSortBy> sortByPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'price', Sort.asc);
    });
  }

  QueryBuilder<ItemPriceEntity, ItemPriceEntity, QAfterSortBy>
      sortByPriceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'price', Sort.desc);
    });
  }

  QueryBuilder<ItemPriceEntity, ItemPriceEntity, QAfterSortBy>
      sortByPricePropertyCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pricePropertyCode', Sort.asc);
    });
  }

  QueryBuilder<ItemPriceEntity, ItemPriceEntity, QAfterSortBy>
      sortByPricePropertyCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pricePropertyCode', Sort.desc);
    });
  }

  QueryBuilder<ItemPriceEntity, ItemPriceEntity, QAfterSortBy>
      sortByPriceQuantity() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'priceQuantity', Sort.asc);
    });
  }

  QueryBuilder<ItemPriceEntity, ItemPriceEntity, QAfterSortBy>
      sortByPriceQuantityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'priceQuantity', Sort.desc);
    });
  }

  QueryBuilder<ItemPriceEntity, ItemPriceEntity, QAfterSortBy>
      sortByProductId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'productId', Sort.asc);
    });
  }

  QueryBuilder<ItemPriceEntity, ItemPriceEntity, QAfterSortBy>
      sortByProductIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'productId', Sort.desc);
    });
  }
}

extension ItemPriceEntityQuerySortThenBy
    on QueryBuilder<ItemPriceEntity, ItemPriceEntity, QSortThenBy> {
  QueryBuilder<ItemPriceEntity, ItemPriceEntity, QAfterSortBy>
      thenByEffectiveDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'effectiveDate', Sort.asc);
    });
  }

  QueryBuilder<ItemPriceEntity, ItemPriceEntity, QAfterSortBy>
      thenByEffectiveDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'effectiveDate', Sort.desc);
    });
  }

  QueryBuilder<ItemPriceEntity, ItemPriceEntity, QAfterSortBy>
      thenByExpiryDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'expiryDate', Sort.asc);
    });
  }

  QueryBuilder<ItemPriceEntity, ItemPriceEntity, QAfterSortBy>
      thenByExpiryDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'expiryDate', Sort.desc);
    });
  }

  QueryBuilder<ItemPriceEntity, ItemPriceEntity, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<ItemPriceEntity, ItemPriceEntity, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<ItemPriceEntity, ItemPriceEntity, QAfterSortBy> thenByPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'price', Sort.asc);
    });
  }

  QueryBuilder<ItemPriceEntity, ItemPriceEntity, QAfterSortBy>
      thenByPriceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'price', Sort.desc);
    });
  }

  QueryBuilder<ItemPriceEntity, ItemPriceEntity, QAfterSortBy>
      thenByPricePropertyCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pricePropertyCode', Sort.asc);
    });
  }

  QueryBuilder<ItemPriceEntity, ItemPriceEntity, QAfterSortBy>
      thenByPricePropertyCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pricePropertyCode', Sort.desc);
    });
  }

  QueryBuilder<ItemPriceEntity, ItemPriceEntity, QAfterSortBy>
      thenByPriceQuantity() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'priceQuantity', Sort.asc);
    });
  }

  QueryBuilder<ItemPriceEntity, ItemPriceEntity, QAfterSortBy>
      thenByPriceQuantityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'priceQuantity', Sort.desc);
    });
  }

  QueryBuilder<ItemPriceEntity, ItemPriceEntity, QAfterSortBy>
      thenByProductId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'productId', Sort.asc);
    });
  }

  QueryBuilder<ItemPriceEntity, ItemPriceEntity, QAfterSortBy>
      thenByProductIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'productId', Sort.desc);
    });
  }
}

extension ItemPriceEntityQueryWhereDistinct
    on QueryBuilder<ItemPriceEntity, ItemPriceEntity, QDistinct> {
  QueryBuilder<ItemPriceEntity, ItemPriceEntity, QDistinct>
      distinctByEffectiveDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'effectiveDate');
    });
  }

  QueryBuilder<ItemPriceEntity, ItemPriceEntity, QDistinct>
      distinctByExpiryDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'expiryDate');
    });
  }

  QueryBuilder<ItemPriceEntity, ItemPriceEntity, QDistinct> distinctByPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'price');
    });
  }

  QueryBuilder<ItemPriceEntity, ItemPriceEntity, QDistinct>
      distinctByPricePropertyCode({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'pricePropertyCode',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ItemPriceEntity, ItemPriceEntity, QDistinct>
      distinctByPriceQuantity() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'priceQuantity');
    });
  }

  QueryBuilder<ItemPriceEntity, ItemPriceEntity, QDistinct> distinctByProductId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'productId', caseSensitive: caseSensitive);
    });
  }
}

extension ItemPriceEntityQueryProperty
    on QueryBuilder<ItemPriceEntity, ItemPriceEntity, QQueryProperty> {
  QueryBuilder<ItemPriceEntity, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<ItemPriceEntity, DateTime, QQueryOperations>
      effectiveDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'effectiveDate');
    });
  }

  QueryBuilder<ItemPriceEntity, DateTime?, QQueryOperations>
      expiryDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'expiryDate');
    });
  }

  QueryBuilder<ItemPriceEntity, double, QQueryOperations> priceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'price');
    });
  }

  QueryBuilder<ItemPriceEntity, String, QQueryOperations>
      pricePropertyCodeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'pricePropertyCode');
    });
  }

  QueryBuilder<ItemPriceEntity, double, QQueryOperations>
      priceQuantityProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'priceQuantity');
    });
  }

  QueryBuilder<ItemPriceEntity, String, QQueryOperations> productIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'productId');
    });
  }
}
