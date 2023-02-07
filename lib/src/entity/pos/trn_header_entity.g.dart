// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trn_header_entity.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters

extension GetTransactionHeaderEntityCollection on Isar {
  IsarCollection<TransactionHeaderEntity> get transactionHeaderEntitys =>
      this.collection();
}

const TransactionHeaderEntitySchema = CollectionSchema(
  name: r'TransactionHeaderEntity',
  id: -2037456124358543318,
  properties: {
    r'associateId': PropertySchema(
      id: 0,
      name: r'associateId',
      type: IsarType.string,
    ),
    r'associateName': PropertySchema(
      id: 1,
      name: r'associateName',
      type: IsarType.string,
    ),
    r'beginDatetime': PropertySchema(
      id: 2,
      name: r'beginDatetime',
      type: IsarType.dateTime,
    ),
    r'billingAddress': PropertySchema(
      id: 3,
      name: r'billingAddress',
      type: IsarType.object,
      target: r'Address',
    ),
    r'businessDate': PropertySchema(
      id: 4,
      name: r'businessDate',
      type: IsarType.dateTime,
    ),
    r'customerId': PropertySchema(
      id: 5,
      name: r'customerId',
      type: IsarType.string,
    ),
    r'customerName': PropertySchema(
      id: 6,
      name: r'customerName',
      type: IsarType.string,
    ),
    r'customerPhone': PropertySchema(
      id: 7,
      name: r'customerPhone',
      type: IsarType.string,
    ),
    r'discountTotal': PropertySchema(
      id: 8,
      name: r'discountTotal',
      type: IsarType.double,
    ),
    r'endDateTime': PropertySchema(
      id: 9,
      name: r'endDateTime',
      type: IsarType.dateTime,
    ),
    r'isVoid': PropertySchema(
      id: 10,
      name: r'isVoid',
      type: IsarType.bool,
    ),
    r'lastChangedAt': PropertySchema(
      id: 11,
      name: r'lastChangedAt',
      type: IsarType.dateTime,
    ),
    r'lastSyncAt': PropertySchema(
      id: 12,
      name: r'lastSyncAt',
      type: IsarType.dateTime,
    ),
    r'lineItems': PropertySchema(
      id: 13,
      name: r'lineItems',
      type: IsarType.objectList,
      target: r'TransactionLineItemEntity',
    ),
    r'locked': PropertySchema(
      id: 14,
      name: r'locked',
      type: IsarType.bool,
    ),
    r'notes': PropertySchema(
      id: 15,
      name: r'notes',
      type: IsarType.string,
    ),
    r'paymentLineItems': PropertySchema(
      id: 16,
      name: r'paymentLineItems',
      type: IsarType.objectList,
      target: r'TransactionPaymentLineItemEntity',
    ),
    r'returnRef': PropertySchema(
      id: 17,
      name: r'returnRef',
      type: IsarType.stringList,
    ),
    r'roundTotal': PropertySchema(
      id: 18,
      name: r'roundTotal',
      type: IsarType.double,
    ),
    r'shippingAddress': PropertySchema(
      id: 19,
      name: r'shippingAddress',
      type: IsarType.object,
      target: r'Address',
    ),
    r'status': PropertySchema(
      id: 20,
      name: r'status',
      type: IsarType.string,
      enumMap: _TransactionHeaderEntitystatusEnumValueMap,
    ),
    r'storeCurrency': PropertySchema(
      id: 21,
      name: r'storeCurrency',
      type: IsarType.string,
    ),
    r'storeId': PropertySchema(
      id: 22,
      name: r'storeId',
      type: IsarType.long,
    ),
    r'storeLocale': PropertySchema(
      id: 23,
      name: r'storeLocale',
      type: IsarType.string,
    ),
    r'subtotal': PropertySchema(
      id: 24,
      name: r'subtotal',
      type: IsarType.double,
    ),
    r'syncState': PropertySchema(
      id: 25,
      name: r'syncState',
      type: IsarType.long,
    ),
    r'taxTotal': PropertySchema(
      id: 26,
      name: r'taxTotal',
      type: IsarType.double,
    ),
    r'total': PropertySchema(
      id: 27,
      name: r'total',
      type: IsarType.double,
    ),
    r'transId': PropertySchema(
      id: 28,
      name: r'transId',
      type: IsarType.string,
    ),
    r'transactionType': PropertySchema(
      id: 29,
      name: r'transactionType',
      type: IsarType.string,
      enumMap: _TransactionHeaderEntitytransactionTypeEnumValueMap,
    )
  },
  estimateSize: _transactionHeaderEntityEstimateSize,
  serialize: _transactionHeaderEntitySerialize,
  deserialize: _transactionHeaderEntityDeserialize,
  deserializeProp: _transactionHeaderEntityDeserializeProp,
  idName: r'id',
  indexes: {
    r'transId': IndexSchema(
      id: -6078223865517958927,
      name: r'transId',
      unique: true,
      replace: true,
      properties: [
        IndexPropertySchema(
          name: r'transId',
          type: IndexType.value,
          caseSensitive: true,
        )
      ],
    ),
    r'transactionType': IndexSchema(
      id: -8267383906769644232,
      name: r'transactionType',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'transactionType',
          type: IndexType.value,
          caseSensitive: true,
        )
      ],
    ),
    r'businessDate': IndexSchema(
      id: -3882326336059088368,
      name: r'businessDate',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'businessDate',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    ),
    r'status': IndexSchema(
      id: -107785170620420283,
      name: r'status',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'status',
          type: IndexType.value,
          caseSensitive: true,
        )
      ],
    ),
    r'customerId': IndexSchema(
      id: 1498639901530368639,
      name: r'customerId',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'customerId',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    ),
    r'customerPhone': IndexSchema(
      id: -8632026876438867685,
      name: r'customerPhone',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'customerPhone',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    ),
    r'lastChangedAt': IndexSchema(
      id: -4409887940193105571,
      name: r'lastChangedAt',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'lastChangedAt',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    ),
    r'lastSyncAt': IndexSchema(
      id: -8300919554834343292,
      name: r'lastSyncAt',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'lastSyncAt',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    ),
    r'syncState': IndexSchema(
      id: -413052077849439895,
      name: r'syncState',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'syncState',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    ),
    r'locked': IndexSchema(
      id: 497338535767934804,
      name: r'locked',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'locked',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    ),
    r'returnRef': IndexSchema(
      id: -7551087479532740082,
      name: r'returnRef',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'returnRef',
          type: IndexType.value,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {
    r'Address': AddressSchema,
    r'TransactionLineItemEntity': TransactionLineItemEntitySchema,
    r'TransactionLineItemModifierEntity':
        TransactionLineItemModifierEntitySchema,
    r'TransactionLineItemTaxModifier': TransactionLineItemTaxModifierSchema,
    r'TransactionPaymentLineItemEntity': TransactionPaymentLineItemEntitySchema
  },
  getId: _transactionHeaderEntityGetId,
  getLinks: _transactionHeaderEntityGetLinks,
  attach: _transactionHeaderEntityAttach,
  version: '3.0.5',
);

int _transactionHeaderEntityEstimateSize(
  TransactionHeaderEntity object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.associateId;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.associateName;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.billingAddress;
    if (value != null) {
      bytesCount += 3 +
          AddressSchema.estimateSize(value, allOffsets[Address]!, allOffsets);
    }
  }
  {
    final value = object.customerId;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.customerName;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.customerPhone;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.lineItems.length * 3;
  {
    final offsets = allOffsets[TransactionLineItemEntity]!;
    for (var i = 0; i < object.lineItems.length; i++) {
      final value = object.lineItems[i];
      bytesCount += TransactionLineItemEntitySchema.estimateSize(
          value, offsets, allOffsets);
    }
  }
  {
    final value = object.notes;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.paymentLineItems.length * 3;
  {
    final offsets = allOffsets[TransactionPaymentLineItemEntity]!;
    for (var i = 0; i < object.paymentLineItems.length; i++) {
      final value = object.paymentLineItems[i];
      bytesCount += TransactionPaymentLineItemEntitySchema.estimateSize(
          value, offsets, allOffsets);
    }
  }
  bytesCount += 3 + object.returnRef.length * 3;
  {
    for (var i = 0; i < object.returnRef.length; i++) {
      final value = object.returnRef[i];
      bytesCount += value.length * 3;
    }
  }
  {
    final value = object.shippingAddress;
    if (value != null) {
      bytesCount += 3 +
          AddressSchema.estimateSize(value, allOffsets[Address]!, allOffsets);
    }
  }
  bytesCount += 3 + object.status.name.length * 3;
  bytesCount += 3 + object.storeCurrency.length * 3;
  bytesCount += 3 + object.storeLocale.length * 3;
  bytesCount += 3 + object.transId.length * 3;
  bytesCount += 3 + object.transactionType.name.length * 3;
  return bytesCount;
}

void _transactionHeaderEntitySerialize(
  TransactionHeaderEntity object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.associateId);
  writer.writeString(offsets[1], object.associateName);
  writer.writeDateTime(offsets[2], object.beginDatetime);
  writer.writeObject<Address>(
    offsets[3],
    allOffsets,
    AddressSchema.serialize,
    object.billingAddress,
  );
  writer.writeDateTime(offsets[4], object.businessDate);
  writer.writeString(offsets[5], object.customerId);
  writer.writeString(offsets[6], object.customerName);
  writer.writeString(offsets[7], object.customerPhone);
  writer.writeDouble(offsets[8], object.discountTotal);
  writer.writeDateTime(offsets[9], object.endDateTime);
  writer.writeBool(offsets[10], object.isVoid);
  writer.writeDateTime(offsets[11], object.lastChangedAt);
  writer.writeDateTime(offsets[12], object.lastSyncAt);
  writer.writeObjectList<TransactionLineItemEntity>(
    offsets[13],
    allOffsets,
    TransactionLineItemEntitySchema.serialize,
    object.lineItems,
  );
  writer.writeBool(offsets[14], object.locked);
  writer.writeString(offsets[15], object.notes);
  writer.writeObjectList<TransactionPaymentLineItemEntity>(
    offsets[16],
    allOffsets,
    TransactionPaymentLineItemEntitySchema.serialize,
    object.paymentLineItems,
  );
  writer.writeStringList(offsets[17], object.returnRef);
  writer.writeDouble(offsets[18], object.roundTotal);
  writer.writeObject<Address>(
    offsets[19],
    allOffsets,
    AddressSchema.serialize,
    object.shippingAddress,
  );
  writer.writeString(offsets[20], object.status.name);
  writer.writeString(offsets[21], object.storeCurrency);
  writer.writeLong(offsets[22], object.storeId);
  writer.writeString(offsets[23], object.storeLocale);
  writer.writeDouble(offsets[24], object.subtotal);
  writer.writeLong(offsets[25], object.syncState);
  writer.writeDouble(offsets[26], object.taxTotal);
  writer.writeDouble(offsets[27], object.total);
  writer.writeString(offsets[28], object.transId);
  writer.writeString(offsets[29], object.transactionType.name);
}

TransactionHeaderEntity _transactionHeaderEntityDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = TransactionHeaderEntity(
    associateId: reader.readStringOrNull(offsets[0]),
    associateName: reader.readStringOrNull(offsets[1]),
    beginDatetime: reader.readDateTime(offsets[2]),
    billingAddress: reader.readObjectOrNull<Address>(
      offsets[3],
      AddressSchema.deserialize,
      allOffsets,
    ),
    businessDate: reader.readDateTime(offsets[4]),
    customerId: reader.readStringOrNull(offsets[5]),
    customerName: reader.readStringOrNull(offsets[6]),
    customerPhone: reader.readStringOrNull(offsets[7]),
    discountTotal: reader.readDouble(offsets[8]),
    endDateTime: reader.readDateTimeOrNull(offsets[9]),
    isVoid: reader.readBoolOrNull(offsets[10]) ?? false,
    lastChangedAt: reader.readDateTimeOrNull(offsets[11]),
    lastSyncAt: reader.readDateTimeOrNull(offsets[12]),
    lineItems: reader.readObjectList<TransactionLineItemEntity>(
          offsets[13],
          TransactionLineItemEntitySchema.deserialize,
          allOffsets,
          TransactionLineItemEntity(),
        ) ??
        const [],
    locked: reader.readBoolOrNull(offsets[14]) ?? false,
    notes: reader.readStringOrNull(offsets[15]),
    paymentLineItems: reader.readObjectList<TransactionPaymentLineItemEntity>(
          offsets[16],
          TransactionPaymentLineItemEntitySchema.deserialize,
          allOffsets,
          TransactionPaymentLineItemEntity(),
        ) ??
        const [],
    returnRef: reader.readStringList(offsets[17]) ?? const [],
    roundTotal: reader.readDouble(offsets[18]),
    shippingAddress: reader.readObjectOrNull<Address>(
      offsets[19],
      AddressSchema.deserialize,
      allOffsets,
    ),
    status: _TransactionHeaderEntitystatusValueEnumMap[
            reader.readStringOrNull(offsets[20])] ??
        TransactionStatus.created,
    storeCurrency: reader.readString(offsets[21]),
    storeId: reader.readLong(offsets[22]),
    storeLocale: reader.readString(offsets[23]),
    subtotal: reader.readDouble(offsets[24]),
    syncState: reader.readLongOrNull(offsets[25]),
    taxTotal: reader.readDouble(offsets[26]),
    total: reader.readDouble(offsets[27]),
    transId: reader.readString(offsets[28]),
    transactionType: _TransactionHeaderEntitytransactionTypeValueEnumMap[
            reader.readStringOrNull(offsets[29])] ??
        TransactionType.sale,
  );
  object.id = id;
  return object;
}

P _transactionHeaderEntityDeserializeProp<P>(
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
      return (reader.readDateTime(offset)) as P;
    case 3:
      return (reader.readObjectOrNull<Address>(
        offset,
        AddressSchema.deserialize,
        allOffsets,
      )) as P;
    case 4:
      return (reader.readDateTime(offset)) as P;
    case 5:
      return (reader.readStringOrNull(offset)) as P;
    case 6:
      return (reader.readStringOrNull(offset)) as P;
    case 7:
      return (reader.readStringOrNull(offset)) as P;
    case 8:
      return (reader.readDouble(offset)) as P;
    case 9:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 10:
      return (reader.readBoolOrNull(offset) ?? false) as P;
    case 11:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 12:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 13:
      return (reader.readObjectList<TransactionLineItemEntity>(
            offset,
            TransactionLineItemEntitySchema.deserialize,
            allOffsets,
            TransactionLineItemEntity(),
          ) ??
          const []) as P;
    case 14:
      return (reader.readBoolOrNull(offset) ?? false) as P;
    case 15:
      return (reader.readStringOrNull(offset)) as P;
    case 16:
      return (reader.readObjectList<TransactionPaymentLineItemEntity>(
            offset,
            TransactionPaymentLineItemEntitySchema.deserialize,
            allOffsets,
            TransactionPaymentLineItemEntity(),
          ) ??
          const []) as P;
    case 17:
      return (reader.readStringList(offset) ?? const []) as P;
    case 18:
      return (reader.readDouble(offset)) as P;
    case 19:
      return (reader.readObjectOrNull<Address>(
        offset,
        AddressSchema.deserialize,
        allOffsets,
      )) as P;
    case 20:
      return (_TransactionHeaderEntitystatusValueEnumMap[
              reader.readStringOrNull(offset)] ??
          TransactionStatus.created) as P;
    case 21:
      return (reader.readString(offset)) as P;
    case 22:
      return (reader.readLong(offset)) as P;
    case 23:
      return (reader.readString(offset)) as P;
    case 24:
      return (reader.readDouble(offset)) as P;
    case 25:
      return (reader.readLongOrNull(offset)) as P;
    case 26:
      return (reader.readDouble(offset)) as P;
    case 27:
      return (reader.readDouble(offset)) as P;
    case 28:
      return (reader.readString(offset)) as P;
    case 29:
      return (_TransactionHeaderEntitytransactionTypeValueEnumMap[
              reader.readStringOrNull(offset)] ??
          TransactionType.sale) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _TransactionHeaderEntitystatusEnumValueMap = {
  r'created': r'created',
  r'voided': r'voided',
  r'suspended': r'suspended',
  r'completed': r'completed',
  r'inProgress': r'inProgress',
  r'cancelled': r'cancelled',
  r'partialPayment': r'partialPayment',
};
const _TransactionHeaderEntitystatusValueEnumMap = {
  r'created': TransactionStatus.created,
  r'voided': TransactionStatus.voided,
  r'suspended': TransactionStatus.suspended,
  r'completed': TransactionStatus.completed,
  r'inProgress': TransactionStatus.inProgress,
  r'cancelled': TransactionStatus.cancelled,
  r'partialPayment': TransactionStatus.partialPayment,
};
const _TransactionHeaderEntitytransactionTypeEnumValueMap = {
  r'sale': r'sale',
  r'returns': r'returns',
  r'refund': r'refund',
  r'exchange': r'exchange',
  r'payment': r'payment',
  r'receipt': r'receipt',
};
const _TransactionHeaderEntitytransactionTypeValueEnumMap = {
  r'sale': TransactionType.sale,
  r'returns': TransactionType.returns,
  r'refund': TransactionType.refund,
  r'exchange': TransactionType.exchange,
  r'payment': TransactionType.payment,
  r'receipt': TransactionType.receipt,
};

Id _transactionHeaderEntityGetId(TransactionHeaderEntity object) {
  return object.id ?? Isar.autoIncrement;
}

List<IsarLinkBase<dynamic>> _transactionHeaderEntityGetLinks(
    TransactionHeaderEntity object) {
  return [];
}

void _transactionHeaderEntityAttach(
    IsarCollection<dynamic> col, Id id, TransactionHeaderEntity object) {
  object.id = id;
}

extension TransactionHeaderEntityByIndex
    on IsarCollection<TransactionHeaderEntity> {
  Future<TransactionHeaderEntity?> getByTransId(String transId) {
    return getByIndex(r'transId', [transId]);
  }

  TransactionHeaderEntity? getByTransIdSync(String transId) {
    return getByIndexSync(r'transId', [transId]);
  }

  Future<bool> deleteByTransId(String transId) {
    return deleteByIndex(r'transId', [transId]);
  }

  bool deleteByTransIdSync(String transId) {
    return deleteByIndexSync(r'transId', [transId]);
  }

  Future<List<TransactionHeaderEntity?>> getAllByTransId(
      List<String> transIdValues) {
    final values = transIdValues.map((e) => [e]).toList();
    return getAllByIndex(r'transId', values);
  }

  List<TransactionHeaderEntity?> getAllByTransIdSync(
      List<String> transIdValues) {
    final values = transIdValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'transId', values);
  }

  Future<int> deleteAllByTransId(List<String> transIdValues) {
    final values = transIdValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'transId', values);
  }

  int deleteAllByTransIdSync(List<String> transIdValues) {
    final values = transIdValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'transId', values);
  }

  Future<Id> putByTransId(TransactionHeaderEntity object) {
    return putByIndex(r'transId', object);
  }

  Id putByTransIdSync(TransactionHeaderEntity object, {bool saveLinks = true}) {
    return putByIndexSync(r'transId', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByTransId(List<TransactionHeaderEntity> objects) {
    return putAllByIndex(r'transId', objects);
  }

  List<Id> putAllByTransIdSync(List<TransactionHeaderEntity> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'transId', objects, saveLinks: saveLinks);
  }
}

extension TransactionHeaderEntityQueryWhereSort
    on QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity, QWhere> {
  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity, QAfterWhere>
      anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity, QAfterWhere>
      anyTransId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'transId'),
      );
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity, QAfterWhere>
      anyTransactionType() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'transactionType'),
      );
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity, QAfterWhere>
      anyBusinessDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'businessDate'),
      );
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity, QAfterWhere>
      anyStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'status'),
      );
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity, QAfterWhere>
      anyLastChangedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'lastChangedAt'),
      );
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity, QAfterWhere>
      anyLastSyncAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'lastSyncAt'),
      );
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity, QAfterWhere>
      anySyncState() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'syncState'),
      );
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity, QAfterWhere>
      anyLocked() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'locked'),
      );
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity, QAfterWhere>
      anyReturnRefElement() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'returnRef'),
      );
    });
  }
}

extension TransactionHeaderEntityQueryWhere on QueryBuilder<
    TransactionHeaderEntity, TransactionHeaderEntity, QWhereClause> {
  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity,
      QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity,
      QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity,
      QAfterWhereClause> idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity,
      QAfterWhereClause> idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity,
      QAfterWhereClause> idBetween(
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

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity,
      QAfterWhereClause> transIdEqualTo(String transId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'transId',
        value: [transId],
      ));
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity,
      QAfterWhereClause> transIdNotEqualTo(String transId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'transId',
              lower: [],
              upper: [transId],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'transId',
              lower: [transId],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'transId',
              lower: [transId],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'transId',
              lower: [],
              upper: [transId],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity,
      QAfterWhereClause> transIdGreaterThan(
    String transId, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'transId',
        lower: [transId],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity,
      QAfterWhereClause> transIdLessThan(
    String transId, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'transId',
        lower: [],
        upper: [transId],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity,
      QAfterWhereClause> transIdBetween(
    String lowerTransId,
    String upperTransId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'transId',
        lower: [lowerTransId],
        includeLower: includeLower,
        upper: [upperTransId],
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity,
      QAfterWhereClause> transIdStartsWith(String TransIdPrefix) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'transId',
        lower: [TransIdPrefix],
        upper: ['$TransIdPrefix\u{FFFFF}'],
      ));
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity,
      QAfterWhereClause> transIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'transId',
        value: [''],
      ));
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity,
      QAfterWhereClause> transIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.lessThan(
              indexName: r'transId',
              upper: [''],
            ))
            .addWhereClause(IndexWhereClause.greaterThan(
              indexName: r'transId',
              lower: [''],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.greaterThan(
              indexName: r'transId',
              lower: [''],
            ))
            .addWhereClause(IndexWhereClause.lessThan(
              indexName: r'transId',
              upper: [''],
            ));
      }
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity,
          QAfterWhereClause>
      transactionTypeEqualTo(TransactionType transactionType) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'transactionType',
        value: [transactionType],
      ));
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity,
          QAfterWhereClause>
      transactionTypeNotEqualTo(TransactionType transactionType) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'transactionType',
              lower: [],
              upper: [transactionType],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'transactionType',
              lower: [transactionType],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'transactionType',
              lower: [transactionType],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'transactionType',
              lower: [],
              upper: [transactionType],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity,
      QAfterWhereClause> transactionTypeGreaterThan(
    TransactionType transactionType, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'transactionType',
        lower: [transactionType],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity,
      QAfterWhereClause> transactionTypeLessThan(
    TransactionType transactionType, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'transactionType',
        lower: [],
        upper: [transactionType],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity,
      QAfterWhereClause> transactionTypeBetween(
    TransactionType lowerTransactionType,
    TransactionType upperTransactionType, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'transactionType',
        lower: [lowerTransactionType],
        includeLower: includeLower,
        upper: [upperTransactionType],
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity,
          QAfterWhereClause>
      transactionTypeStartsWith(String TransactionTypePrefix) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'transactionType',
        lower: [TransactionTypePrefix],
        upper: ['$TransactionTypePrefix\u{FFFFF}'],
      ));
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity,
      QAfterWhereClause> transactionTypeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'transactionType',
        value: [''],
      ));
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity,
      QAfterWhereClause> transactionTypeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.lessThan(
              indexName: r'transactionType',
              upper: [''],
            ))
            .addWhereClause(IndexWhereClause.greaterThan(
              indexName: r'transactionType',
              lower: [''],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.greaterThan(
              indexName: r'transactionType',
              lower: [''],
            ))
            .addWhereClause(IndexWhereClause.lessThan(
              indexName: r'transactionType',
              upper: [''],
            ));
      }
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity,
      QAfterWhereClause> businessDateEqualTo(DateTime businessDate) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'businessDate',
        value: [businessDate],
      ));
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity,
      QAfterWhereClause> businessDateNotEqualTo(DateTime businessDate) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'businessDate',
              lower: [],
              upper: [businessDate],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'businessDate',
              lower: [businessDate],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'businessDate',
              lower: [businessDate],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'businessDate',
              lower: [],
              upper: [businessDate],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity,
      QAfterWhereClause> businessDateGreaterThan(
    DateTime businessDate, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'businessDate',
        lower: [businessDate],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity,
      QAfterWhereClause> businessDateLessThan(
    DateTime businessDate, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'businessDate',
        lower: [],
        upper: [businessDate],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity,
      QAfterWhereClause> businessDateBetween(
    DateTime lowerBusinessDate,
    DateTime upperBusinessDate, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'businessDate',
        lower: [lowerBusinessDate],
        includeLower: includeLower,
        upper: [upperBusinessDate],
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity,
      QAfterWhereClause> statusEqualTo(TransactionStatus status) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'status',
        value: [status],
      ));
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity,
      QAfterWhereClause> statusNotEqualTo(TransactionStatus status) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'status',
              lower: [],
              upper: [status],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'status',
              lower: [status],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'status',
              lower: [status],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'status',
              lower: [],
              upper: [status],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity,
      QAfterWhereClause> statusGreaterThan(
    TransactionStatus status, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'status',
        lower: [status],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity,
      QAfterWhereClause> statusLessThan(
    TransactionStatus status, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'status',
        lower: [],
        upper: [status],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity,
      QAfterWhereClause> statusBetween(
    TransactionStatus lowerStatus,
    TransactionStatus upperStatus, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'status',
        lower: [lowerStatus],
        includeLower: includeLower,
        upper: [upperStatus],
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity,
      QAfterWhereClause> statusStartsWith(String StatusPrefix) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'status',
        lower: [StatusPrefix],
        upper: ['$StatusPrefix\u{FFFFF}'],
      ));
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity,
      QAfterWhereClause> statusIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'status',
        value: [''],
      ));
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity,
      QAfterWhereClause> statusIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.lessThan(
              indexName: r'status',
              upper: [''],
            ))
            .addWhereClause(IndexWhereClause.greaterThan(
              indexName: r'status',
              lower: [''],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.greaterThan(
              indexName: r'status',
              lower: [''],
            ))
            .addWhereClause(IndexWhereClause.lessThan(
              indexName: r'status',
              upper: [''],
            ));
      }
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity,
      QAfterWhereClause> customerIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'customerId',
        value: [null],
      ));
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity,
      QAfterWhereClause> customerIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'customerId',
        lower: [null],
        includeLower: false,
        upper: [],
      ));
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity,
      QAfterWhereClause> customerIdEqualTo(String? customerId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'customerId',
        value: [customerId],
      ));
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity,
      QAfterWhereClause> customerIdNotEqualTo(String? customerId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'customerId',
              lower: [],
              upper: [customerId],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'customerId',
              lower: [customerId],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'customerId',
              lower: [customerId],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'customerId',
              lower: [],
              upper: [customerId],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity,
      QAfterWhereClause> customerPhoneIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'customerPhone',
        value: [null],
      ));
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity,
      QAfterWhereClause> customerPhoneIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'customerPhone',
        lower: [null],
        includeLower: false,
        upper: [],
      ));
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity,
      QAfterWhereClause> customerPhoneEqualTo(String? customerPhone) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'customerPhone',
        value: [customerPhone],
      ));
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity,
      QAfterWhereClause> customerPhoneNotEqualTo(String? customerPhone) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'customerPhone',
              lower: [],
              upper: [customerPhone],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'customerPhone',
              lower: [customerPhone],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'customerPhone',
              lower: [customerPhone],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'customerPhone',
              lower: [],
              upper: [customerPhone],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity,
      QAfterWhereClause> lastChangedAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'lastChangedAt',
        value: [null],
      ));
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity,
      QAfterWhereClause> lastChangedAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'lastChangedAt',
        lower: [null],
        includeLower: false,
        upper: [],
      ));
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity,
      QAfterWhereClause> lastChangedAtEqualTo(DateTime? lastChangedAt) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'lastChangedAt',
        value: [lastChangedAt],
      ));
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity,
      QAfterWhereClause> lastChangedAtNotEqualTo(DateTime? lastChangedAt) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'lastChangedAt',
              lower: [],
              upper: [lastChangedAt],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'lastChangedAt',
              lower: [lastChangedAt],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'lastChangedAt',
              lower: [lastChangedAt],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'lastChangedAt',
              lower: [],
              upper: [lastChangedAt],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity,
      QAfterWhereClause> lastChangedAtGreaterThan(
    DateTime? lastChangedAt, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'lastChangedAt',
        lower: [lastChangedAt],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity,
      QAfterWhereClause> lastChangedAtLessThan(
    DateTime? lastChangedAt, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'lastChangedAt',
        lower: [],
        upper: [lastChangedAt],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity,
      QAfterWhereClause> lastChangedAtBetween(
    DateTime? lowerLastChangedAt,
    DateTime? upperLastChangedAt, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'lastChangedAt',
        lower: [lowerLastChangedAt],
        includeLower: includeLower,
        upper: [upperLastChangedAt],
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity,
      QAfterWhereClause> lastSyncAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'lastSyncAt',
        value: [null],
      ));
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity,
      QAfterWhereClause> lastSyncAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'lastSyncAt',
        lower: [null],
        includeLower: false,
        upper: [],
      ));
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity,
      QAfterWhereClause> lastSyncAtEqualTo(DateTime? lastSyncAt) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'lastSyncAt',
        value: [lastSyncAt],
      ));
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity,
      QAfterWhereClause> lastSyncAtNotEqualTo(DateTime? lastSyncAt) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'lastSyncAt',
              lower: [],
              upper: [lastSyncAt],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'lastSyncAt',
              lower: [lastSyncAt],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'lastSyncAt',
              lower: [lastSyncAt],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'lastSyncAt',
              lower: [],
              upper: [lastSyncAt],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity,
      QAfterWhereClause> lastSyncAtGreaterThan(
    DateTime? lastSyncAt, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'lastSyncAt',
        lower: [lastSyncAt],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity,
      QAfterWhereClause> lastSyncAtLessThan(
    DateTime? lastSyncAt, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'lastSyncAt',
        lower: [],
        upper: [lastSyncAt],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity,
      QAfterWhereClause> lastSyncAtBetween(
    DateTime? lowerLastSyncAt,
    DateTime? upperLastSyncAt, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'lastSyncAt',
        lower: [lowerLastSyncAt],
        includeLower: includeLower,
        upper: [upperLastSyncAt],
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity,
      QAfterWhereClause> syncStateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'syncState',
        value: [null],
      ));
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity,
      QAfterWhereClause> syncStateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'syncState',
        lower: [null],
        includeLower: false,
        upper: [],
      ));
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity,
      QAfterWhereClause> syncStateEqualTo(int? syncState) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'syncState',
        value: [syncState],
      ));
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity,
      QAfterWhereClause> syncStateNotEqualTo(int? syncState) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'syncState',
              lower: [],
              upper: [syncState],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'syncState',
              lower: [syncState],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'syncState',
              lower: [syncState],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'syncState',
              lower: [],
              upper: [syncState],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity,
      QAfterWhereClause> syncStateGreaterThan(
    int? syncState, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'syncState',
        lower: [syncState],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity,
      QAfterWhereClause> syncStateLessThan(
    int? syncState, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'syncState',
        lower: [],
        upper: [syncState],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity,
      QAfterWhereClause> syncStateBetween(
    int? lowerSyncState,
    int? upperSyncState, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'syncState',
        lower: [lowerSyncState],
        includeLower: includeLower,
        upper: [upperSyncState],
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity,
      QAfterWhereClause> lockedEqualTo(bool locked) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'locked',
        value: [locked],
      ));
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity,
      QAfterWhereClause> lockedNotEqualTo(bool locked) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'locked',
              lower: [],
              upper: [locked],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'locked',
              lower: [locked],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'locked',
              lower: [locked],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'locked',
              lower: [],
              upper: [locked],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity,
      QAfterWhereClause> returnRefElementEqualTo(String returnRefElement) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'returnRef',
        value: [returnRefElement],
      ));
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity,
      QAfterWhereClause> returnRefElementNotEqualTo(String returnRefElement) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'returnRef',
              lower: [],
              upper: [returnRefElement],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'returnRef',
              lower: [returnRefElement],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'returnRef',
              lower: [returnRefElement],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'returnRef',
              lower: [],
              upper: [returnRefElement],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity,
      QAfterWhereClause> returnRefElementGreaterThan(
    String returnRefElement, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'returnRef',
        lower: [returnRefElement],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity,
      QAfterWhereClause> returnRefElementLessThan(
    String returnRefElement, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'returnRef',
        lower: [],
        upper: [returnRefElement],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity,
      QAfterWhereClause> returnRefElementBetween(
    String lowerReturnRefElement,
    String upperReturnRefElement, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'returnRef',
        lower: [lowerReturnRefElement],
        includeLower: includeLower,
        upper: [upperReturnRefElement],
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity,
          QAfterWhereClause>
      returnRefElementStartsWith(String ReturnRefElementPrefix) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'returnRef',
        lower: [ReturnRefElementPrefix],
        upper: ['$ReturnRefElementPrefix\u{FFFFF}'],
      ));
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity,
      QAfterWhereClause> returnRefElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'returnRef',
        value: [''],
      ));
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity,
      QAfterWhereClause> returnRefElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.lessThan(
              indexName: r'returnRef',
              upper: [''],
            ))
            .addWhereClause(IndexWhereClause.greaterThan(
              indexName: r'returnRef',
              lower: [''],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.greaterThan(
              indexName: r'returnRef',
              lower: [''],
            ))
            .addWhereClause(IndexWhereClause.lessThan(
              indexName: r'returnRef',
              upper: [''],
            ));
      }
    });
  }
}

extension TransactionHeaderEntityQueryFilter on QueryBuilder<
    TransactionHeaderEntity, TransactionHeaderEntity, QFilterCondition> {
  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity,
      QAfterFilterCondition> associateIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'associateId',
      ));
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity,
      QAfterFilterCondition> associateIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'associateId',
      ));
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity,
      QAfterFilterCondition> associateIdEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'associateId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity,
      QAfterFilterCondition> associateIdGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'associateId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity,
      QAfterFilterCondition> associateIdLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'associateId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity,
      QAfterFilterCondition> associateIdBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'associateId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity,
      QAfterFilterCondition> associateIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'associateId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity,
      QAfterFilterCondition> associateIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'associateId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity,
          QAfterFilterCondition>
      associateIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'associateId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity,
          QAfterFilterCondition>
      associateIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'associateId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity,
      QAfterFilterCondition> associateIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'associateId',
        value: '',
      ));
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity,
      QAfterFilterCondition> associateIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'associateId',
        value: '',
      ));
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity,
      QAfterFilterCondition> associateNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'associateName',
      ));
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity,
      QAfterFilterCondition> associateNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'associateName',
      ));
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity,
      QAfterFilterCondition> associateNameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'associateName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity,
      QAfterFilterCondition> associateNameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'associateName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity,
      QAfterFilterCondition> associateNameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'associateName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity,
      QAfterFilterCondition> associateNameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'associateName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity,
      QAfterFilterCondition> associateNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'associateName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity,
      QAfterFilterCondition> associateNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'associateName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity,
          QAfterFilterCondition>
      associateNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'associateName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity,
          QAfterFilterCondition>
      associateNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'associateName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity,
      QAfterFilterCondition> associateNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'associateName',
        value: '',
      ));
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity,
      QAfterFilterCondition> associateNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'associateName',
        value: '',
      ));
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity,
      QAfterFilterCondition> beginDatetimeEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'beginDatetime',
        value: value,
      ));
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity,
      QAfterFilterCondition> beginDatetimeGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'beginDatetime',
        value: value,
      ));
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity,
      QAfterFilterCondition> beginDatetimeLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'beginDatetime',
        value: value,
      ));
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity,
      QAfterFilterCondition> beginDatetimeBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'beginDatetime',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity,
      QAfterFilterCondition> billingAddressIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'billingAddress',
      ));
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity,
      QAfterFilterCondition> billingAddressIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'billingAddress',
      ));
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity,
      QAfterFilterCondition> businessDateEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'businessDate',
        value: value,
      ));
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity,
      QAfterFilterCondition> businessDateGreaterThan(
    DateTime value, {
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

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity,
      QAfterFilterCondition> businessDateLessThan(
    DateTime value, {
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

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity,
      QAfterFilterCondition> businessDateBetween(
    DateTime lower,
    DateTime upper, {
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

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity,
      QAfterFilterCondition> customerIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'customerId',
      ));
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity,
      QAfterFilterCondition> customerIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'customerId',
      ));
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity,
      QAfterFilterCondition> customerIdEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'customerId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity,
      QAfterFilterCondition> customerIdGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'customerId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity,
      QAfterFilterCondition> customerIdLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'customerId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity,
      QAfterFilterCondition> customerIdBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'customerId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity,
      QAfterFilterCondition> customerIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'customerId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity,
      QAfterFilterCondition> customerIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'customerId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity,
          QAfterFilterCondition>
      customerIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'customerId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity,
          QAfterFilterCondition>
      customerIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'customerId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity,
      QAfterFilterCondition> customerIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'customerId',
        value: '',
      ));
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity,
      QAfterFilterCondition> customerIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'customerId',
        value: '',
      ));
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity,
      QAfterFilterCondition> customerNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'customerName',
      ));
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity,
      QAfterFilterCondition> customerNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'customerName',
      ));
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity,
      QAfterFilterCondition> customerNameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'customerName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity,
      QAfterFilterCondition> customerNameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'customerName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity,
      QAfterFilterCondition> customerNameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'customerName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity,
      QAfterFilterCondition> customerNameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'customerName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity,
      QAfterFilterCondition> customerNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'customerName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity,
      QAfterFilterCondition> customerNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'customerName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity,
          QAfterFilterCondition>
      customerNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'customerName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity,
          QAfterFilterCondition>
      customerNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'customerName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity,
      QAfterFilterCondition> customerNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'customerName',
        value: '',
      ));
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity,
      QAfterFilterCondition> customerNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'customerName',
        value: '',
      ));
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity,
      QAfterFilterCondition> customerPhoneIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'customerPhone',
      ));
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity,
      QAfterFilterCondition> customerPhoneIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'customerPhone',
      ));
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity,
      QAfterFilterCondition> customerPhoneEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'customerPhone',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity,
      QAfterFilterCondition> customerPhoneGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'customerPhone',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity,
      QAfterFilterCondition> customerPhoneLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'customerPhone',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity,
      QAfterFilterCondition> customerPhoneBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'customerPhone',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity,
      QAfterFilterCondition> customerPhoneStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'customerPhone',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity,
      QAfterFilterCondition> customerPhoneEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'customerPhone',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity,
          QAfterFilterCondition>
      customerPhoneContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'customerPhone',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity,
          QAfterFilterCondition>
      customerPhoneMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'customerPhone',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity,
      QAfterFilterCondition> customerPhoneIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'customerPhone',
        value: '',
      ));
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity,
      QAfterFilterCondition> customerPhoneIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'customerPhone',
        value: '',
      ));
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity,
      QAfterFilterCondition> discountTotalEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'discountTotal',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity,
      QAfterFilterCondition> discountTotalGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'discountTotal',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity,
      QAfterFilterCondition> discountTotalLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'discountTotal',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity,
      QAfterFilterCondition> discountTotalBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'discountTotal',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity,
      QAfterFilterCondition> endDateTimeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'endDateTime',
      ));
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity,
      QAfterFilterCondition> endDateTimeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'endDateTime',
      ));
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity,
      QAfterFilterCondition> endDateTimeEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'endDateTime',
        value: value,
      ));
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity,
      QAfterFilterCondition> endDateTimeGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'endDateTime',
        value: value,
      ));
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity,
      QAfterFilterCondition> endDateTimeLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'endDateTime',
        value: value,
      ));
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity,
      QAfterFilterCondition> endDateTimeBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'endDateTime',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity,
      QAfterFilterCondition> idIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity,
      QAfterFilterCondition> idIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity,
      QAfterFilterCondition> idEqualTo(Id? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity,
      QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity,
      QAfterFilterCondition> idLessThan(
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

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity,
      QAfterFilterCondition> idBetween(
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

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity,
      QAfterFilterCondition> isVoidEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isVoid',
        value: value,
      ));
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity,
      QAfterFilterCondition> lastChangedAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'lastChangedAt',
      ));
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity,
      QAfterFilterCondition> lastChangedAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'lastChangedAt',
      ));
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity,
      QAfterFilterCondition> lastChangedAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lastChangedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity,
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

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity,
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

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity,
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

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity,
      QAfterFilterCondition> lastSyncAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'lastSyncAt',
      ));
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity,
      QAfterFilterCondition> lastSyncAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'lastSyncAt',
      ));
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity,
      QAfterFilterCondition> lastSyncAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lastSyncAt',
        value: value,
      ));
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity,
      QAfterFilterCondition> lastSyncAtGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'lastSyncAt',
        value: value,
      ));
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity,
      QAfterFilterCondition> lastSyncAtLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'lastSyncAt',
        value: value,
      ));
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity,
      QAfterFilterCondition> lastSyncAtBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'lastSyncAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity,
      QAfterFilterCondition> lineItemsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'lineItems',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity,
      QAfterFilterCondition> lineItemsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'lineItems',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity,
      QAfterFilterCondition> lineItemsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'lineItems',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity,
      QAfterFilterCondition> lineItemsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'lineItems',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity,
      QAfterFilterCondition> lineItemsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'lineItems',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity,
      QAfterFilterCondition> lineItemsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'lineItems',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity,
      QAfterFilterCondition> lockedEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'locked',
        value: value,
      ));
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity,
      QAfterFilterCondition> notesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'notes',
      ));
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity,
      QAfterFilterCondition> notesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'notes',
      ));
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity,
      QAfterFilterCondition> notesEqualTo(
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

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity,
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

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity,
      QAfterFilterCondition> notesLessThan(
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

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity,
      QAfterFilterCondition> notesBetween(
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

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity,
      QAfterFilterCondition> notesStartsWith(
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

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity,
      QAfterFilterCondition> notesEndsWith(
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

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity,
          QAfterFilterCondition>
      notesContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'notes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity,
          QAfterFilterCondition>
      notesMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'notes',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity,
      QAfterFilterCondition> notesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'notes',
        value: '',
      ));
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity,
      QAfterFilterCondition> notesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'notes',
        value: '',
      ));
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity,
      QAfterFilterCondition> paymentLineItemsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'paymentLineItems',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity,
      QAfterFilterCondition> paymentLineItemsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'paymentLineItems',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity,
      QAfterFilterCondition> paymentLineItemsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'paymentLineItems',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity,
      QAfterFilterCondition> paymentLineItemsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'paymentLineItems',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity,
      QAfterFilterCondition> paymentLineItemsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'paymentLineItems',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity,
      QAfterFilterCondition> paymentLineItemsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'paymentLineItems',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity,
      QAfterFilterCondition> returnRefElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'returnRef',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity,
      QAfterFilterCondition> returnRefElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'returnRef',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity,
      QAfterFilterCondition> returnRefElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'returnRef',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity,
      QAfterFilterCondition> returnRefElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'returnRef',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity,
      QAfterFilterCondition> returnRefElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'returnRef',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity,
      QAfterFilterCondition> returnRefElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'returnRef',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity,
          QAfterFilterCondition>
      returnRefElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'returnRef',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity,
          QAfterFilterCondition>
      returnRefElementMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'returnRef',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity,
      QAfterFilterCondition> returnRefElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'returnRef',
        value: '',
      ));
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity,
      QAfterFilterCondition> returnRefElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'returnRef',
        value: '',
      ));
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity,
      QAfterFilterCondition> returnRefLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'returnRef',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity,
      QAfterFilterCondition> returnRefIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'returnRef',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity,
      QAfterFilterCondition> returnRefIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'returnRef',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity,
      QAfterFilterCondition> returnRefLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'returnRef',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity,
      QAfterFilterCondition> returnRefLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'returnRef',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity,
      QAfterFilterCondition> returnRefLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'returnRef',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity,
      QAfterFilterCondition> roundTotalEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'roundTotal',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity,
      QAfterFilterCondition> roundTotalGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'roundTotal',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity,
      QAfterFilterCondition> roundTotalLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'roundTotal',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity,
      QAfterFilterCondition> roundTotalBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'roundTotal',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity,
      QAfterFilterCondition> shippingAddressIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'shippingAddress',
      ));
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity,
      QAfterFilterCondition> shippingAddressIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'shippingAddress',
      ));
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity,
      QAfterFilterCondition> statusEqualTo(
    TransactionStatus value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'status',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity,
      QAfterFilterCondition> statusGreaterThan(
    TransactionStatus value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'status',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity,
      QAfterFilterCondition> statusLessThan(
    TransactionStatus value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'status',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity,
      QAfterFilterCondition> statusBetween(
    TransactionStatus lower,
    TransactionStatus upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'status',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity,
      QAfterFilterCondition> statusStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'status',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity,
      QAfterFilterCondition> statusEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'status',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity,
          QAfterFilterCondition>
      statusContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'status',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity,
          QAfterFilterCondition>
      statusMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'status',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity,
      QAfterFilterCondition> statusIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'status',
        value: '',
      ));
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity,
      QAfterFilterCondition> statusIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'status',
        value: '',
      ));
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity,
      QAfterFilterCondition> storeCurrencyEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'storeCurrency',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity,
      QAfterFilterCondition> storeCurrencyGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'storeCurrency',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity,
      QAfterFilterCondition> storeCurrencyLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'storeCurrency',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity,
      QAfterFilterCondition> storeCurrencyBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'storeCurrency',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity,
      QAfterFilterCondition> storeCurrencyStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'storeCurrency',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity,
      QAfterFilterCondition> storeCurrencyEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'storeCurrency',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity,
          QAfterFilterCondition>
      storeCurrencyContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'storeCurrency',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity,
          QAfterFilterCondition>
      storeCurrencyMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'storeCurrency',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity,
      QAfterFilterCondition> storeCurrencyIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'storeCurrency',
        value: '',
      ));
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity,
      QAfterFilterCondition> storeCurrencyIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'storeCurrency',
        value: '',
      ));
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity,
      QAfterFilterCondition> storeIdEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'storeId',
        value: value,
      ));
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity,
      QAfterFilterCondition> storeIdGreaterThan(
    int value, {
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

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity,
      QAfterFilterCondition> storeIdLessThan(
    int value, {
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

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity,
      QAfterFilterCondition> storeIdBetween(
    int lower,
    int upper, {
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

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity,
      QAfterFilterCondition> storeLocaleEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'storeLocale',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity,
      QAfterFilterCondition> storeLocaleGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'storeLocale',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity,
      QAfterFilterCondition> storeLocaleLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'storeLocale',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity,
      QAfterFilterCondition> storeLocaleBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'storeLocale',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity,
      QAfterFilterCondition> storeLocaleStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'storeLocale',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity,
      QAfterFilterCondition> storeLocaleEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'storeLocale',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity,
          QAfterFilterCondition>
      storeLocaleContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'storeLocale',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity,
          QAfterFilterCondition>
      storeLocaleMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'storeLocale',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity,
      QAfterFilterCondition> storeLocaleIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'storeLocale',
        value: '',
      ));
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity,
      QAfterFilterCondition> storeLocaleIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'storeLocale',
        value: '',
      ));
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity,
      QAfterFilterCondition> subtotalEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'subtotal',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity,
      QAfterFilterCondition> subtotalGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'subtotal',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity,
      QAfterFilterCondition> subtotalLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'subtotal',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity,
      QAfterFilterCondition> subtotalBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'subtotal',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity,
      QAfterFilterCondition> syncStateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'syncState',
      ));
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity,
      QAfterFilterCondition> syncStateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'syncState',
      ));
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity,
      QAfterFilterCondition> syncStateEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'syncState',
        value: value,
      ));
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity,
      QAfterFilterCondition> syncStateGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'syncState',
        value: value,
      ));
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity,
      QAfterFilterCondition> syncStateLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'syncState',
        value: value,
      ));
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity,
      QAfterFilterCondition> syncStateBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'syncState',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity,
      QAfterFilterCondition> taxTotalEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'taxTotal',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity,
      QAfterFilterCondition> taxTotalGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'taxTotal',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity,
      QAfterFilterCondition> taxTotalLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'taxTotal',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity,
      QAfterFilterCondition> taxTotalBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'taxTotal',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity,
      QAfterFilterCondition> totalEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'total',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity,
      QAfterFilterCondition> totalGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'total',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity,
      QAfterFilterCondition> totalLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'total',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity,
      QAfterFilterCondition> totalBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'total',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity,
      QAfterFilterCondition> transIdEqualTo(
    String value, {
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

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity,
      QAfterFilterCondition> transIdGreaterThan(
    String value, {
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

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity,
      QAfterFilterCondition> transIdLessThan(
    String value, {
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

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity,
      QAfterFilterCondition> transIdBetween(
    String lower,
    String upper, {
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

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity,
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

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity,
      QAfterFilterCondition> transIdEndsWith(
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

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity,
          QAfterFilterCondition>
      transIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'transId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity,
          QAfterFilterCondition>
      transIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'transId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity,
      QAfterFilterCondition> transIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'transId',
        value: '',
      ));
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity,
      QAfterFilterCondition> transIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'transId',
        value: '',
      ));
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity,
      QAfterFilterCondition> transactionTypeEqualTo(
    TransactionType value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'transactionType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity,
      QAfterFilterCondition> transactionTypeGreaterThan(
    TransactionType value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'transactionType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity,
      QAfterFilterCondition> transactionTypeLessThan(
    TransactionType value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'transactionType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity,
      QAfterFilterCondition> transactionTypeBetween(
    TransactionType lower,
    TransactionType upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'transactionType',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity,
      QAfterFilterCondition> transactionTypeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'transactionType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity,
      QAfterFilterCondition> transactionTypeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'transactionType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity,
          QAfterFilterCondition>
      transactionTypeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'transactionType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity,
          QAfterFilterCondition>
      transactionTypeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'transactionType',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity,
      QAfterFilterCondition> transactionTypeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'transactionType',
        value: '',
      ));
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity,
      QAfterFilterCondition> transactionTypeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'transactionType',
        value: '',
      ));
    });
  }
}

extension TransactionHeaderEntityQueryObject on QueryBuilder<
    TransactionHeaderEntity, TransactionHeaderEntity, QFilterCondition> {
  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity,
      QAfterFilterCondition> billingAddress(FilterQuery<Address> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'billingAddress');
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity,
          QAfterFilterCondition>
      lineItemsElement(FilterQuery<TransactionLineItemEntity> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'lineItems');
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity,
          QAfterFilterCondition>
      paymentLineItemsElement(FilterQuery<TransactionPaymentLineItemEntity> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'paymentLineItems');
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity,
      QAfterFilterCondition> shippingAddress(FilterQuery<Address> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'shippingAddress');
    });
  }
}

extension TransactionHeaderEntityQueryLinks on QueryBuilder<
    TransactionHeaderEntity, TransactionHeaderEntity, QFilterCondition> {}

extension TransactionHeaderEntityQuerySortBy
    on QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity, QSortBy> {
  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity, QAfterSortBy>
      sortByAssociateId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'associateId', Sort.asc);
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity, QAfterSortBy>
      sortByAssociateIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'associateId', Sort.desc);
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity, QAfterSortBy>
      sortByAssociateName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'associateName', Sort.asc);
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity, QAfterSortBy>
      sortByAssociateNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'associateName', Sort.desc);
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity, QAfterSortBy>
      sortByBeginDatetime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'beginDatetime', Sort.asc);
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity, QAfterSortBy>
      sortByBeginDatetimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'beginDatetime', Sort.desc);
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity, QAfterSortBy>
      sortByBusinessDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'businessDate', Sort.asc);
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity, QAfterSortBy>
      sortByBusinessDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'businessDate', Sort.desc);
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity, QAfterSortBy>
      sortByCustomerId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'customerId', Sort.asc);
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity, QAfterSortBy>
      sortByCustomerIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'customerId', Sort.desc);
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity, QAfterSortBy>
      sortByCustomerName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'customerName', Sort.asc);
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity, QAfterSortBy>
      sortByCustomerNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'customerName', Sort.desc);
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity, QAfterSortBy>
      sortByCustomerPhone() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'customerPhone', Sort.asc);
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity, QAfterSortBy>
      sortByCustomerPhoneDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'customerPhone', Sort.desc);
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity, QAfterSortBy>
      sortByDiscountTotal() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'discountTotal', Sort.asc);
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity, QAfterSortBy>
      sortByDiscountTotalDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'discountTotal', Sort.desc);
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity, QAfterSortBy>
      sortByEndDateTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'endDateTime', Sort.asc);
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity, QAfterSortBy>
      sortByEndDateTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'endDateTime', Sort.desc);
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity, QAfterSortBy>
      sortByIsVoid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isVoid', Sort.asc);
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity, QAfterSortBy>
      sortByIsVoidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isVoid', Sort.desc);
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity, QAfterSortBy>
      sortByLastChangedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastChangedAt', Sort.asc);
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity, QAfterSortBy>
      sortByLastChangedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastChangedAt', Sort.desc);
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity, QAfterSortBy>
      sortByLastSyncAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastSyncAt', Sort.asc);
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity, QAfterSortBy>
      sortByLastSyncAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastSyncAt', Sort.desc);
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity, QAfterSortBy>
      sortByLocked() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'locked', Sort.asc);
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity, QAfterSortBy>
      sortByLockedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'locked', Sort.desc);
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity, QAfterSortBy>
      sortByNotes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notes', Sort.asc);
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity, QAfterSortBy>
      sortByNotesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notes', Sort.desc);
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity, QAfterSortBy>
      sortByRoundTotal() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'roundTotal', Sort.asc);
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity, QAfterSortBy>
      sortByRoundTotalDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'roundTotal', Sort.desc);
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity, QAfterSortBy>
      sortByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity, QAfterSortBy>
      sortByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity, QAfterSortBy>
      sortByStoreCurrency() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'storeCurrency', Sort.asc);
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity, QAfterSortBy>
      sortByStoreCurrencyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'storeCurrency', Sort.desc);
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity, QAfterSortBy>
      sortByStoreId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'storeId', Sort.asc);
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity, QAfterSortBy>
      sortByStoreIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'storeId', Sort.desc);
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity, QAfterSortBy>
      sortByStoreLocale() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'storeLocale', Sort.asc);
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity, QAfterSortBy>
      sortByStoreLocaleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'storeLocale', Sort.desc);
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity, QAfterSortBy>
      sortBySubtotal() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'subtotal', Sort.asc);
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity, QAfterSortBy>
      sortBySubtotalDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'subtotal', Sort.desc);
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity, QAfterSortBy>
      sortBySyncState() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncState', Sort.asc);
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity, QAfterSortBy>
      sortBySyncStateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncState', Sort.desc);
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity, QAfterSortBy>
      sortByTaxTotal() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'taxTotal', Sort.asc);
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity, QAfterSortBy>
      sortByTaxTotalDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'taxTotal', Sort.desc);
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity, QAfterSortBy>
      sortByTotal() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'total', Sort.asc);
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity, QAfterSortBy>
      sortByTotalDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'total', Sort.desc);
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity, QAfterSortBy>
      sortByTransId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'transId', Sort.asc);
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity, QAfterSortBy>
      sortByTransIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'transId', Sort.desc);
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity, QAfterSortBy>
      sortByTransactionType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'transactionType', Sort.asc);
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity, QAfterSortBy>
      sortByTransactionTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'transactionType', Sort.desc);
    });
  }
}

extension TransactionHeaderEntityQuerySortThenBy on QueryBuilder<
    TransactionHeaderEntity, TransactionHeaderEntity, QSortThenBy> {
  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity, QAfterSortBy>
      thenByAssociateId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'associateId', Sort.asc);
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity, QAfterSortBy>
      thenByAssociateIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'associateId', Sort.desc);
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity, QAfterSortBy>
      thenByAssociateName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'associateName', Sort.asc);
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity, QAfterSortBy>
      thenByAssociateNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'associateName', Sort.desc);
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity, QAfterSortBy>
      thenByBeginDatetime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'beginDatetime', Sort.asc);
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity, QAfterSortBy>
      thenByBeginDatetimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'beginDatetime', Sort.desc);
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity, QAfterSortBy>
      thenByBusinessDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'businessDate', Sort.asc);
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity, QAfterSortBy>
      thenByBusinessDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'businessDate', Sort.desc);
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity, QAfterSortBy>
      thenByCustomerId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'customerId', Sort.asc);
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity, QAfterSortBy>
      thenByCustomerIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'customerId', Sort.desc);
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity, QAfterSortBy>
      thenByCustomerName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'customerName', Sort.asc);
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity, QAfterSortBy>
      thenByCustomerNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'customerName', Sort.desc);
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity, QAfterSortBy>
      thenByCustomerPhone() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'customerPhone', Sort.asc);
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity, QAfterSortBy>
      thenByCustomerPhoneDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'customerPhone', Sort.desc);
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity, QAfterSortBy>
      thenByDiscountTotal() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'discountTotal', Sort.asc);
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity, QAfterSortBy>
      thenByDiscountTotalDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'discountTotal', Sort.desc);
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity, QAfterSortBy>
      thenByEndDateTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'endDateTime', Sort.asc);
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity, QAfterSortBy>
      thenByEndDateTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'endDateTime', Sort.desc);
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity, QAfterSortBy>
      thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity, QAfterSortBy>
      thenByIsVoid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isVoid', Sort.asc);
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity, QAfterSortBy>
      thenByIsVoidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isVoid', Sort.desc);
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity, QAfterSortBy>
      thenByLastChangedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastChangedAt', Sort.asc);
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity, QAfterSortBy>
      thenByLastChangedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastChangedAt', Sort.desc);
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity, QAfterSortBy>
      thenByLastSyncAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastSyncAt', Sort.asc);
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity, QAfterSortBy>
      thenByLastSyncAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastSyncAt', Sort.desc);
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity, QAfterSortBy>
      thenByLocked() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'locked', Sort.asc);
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity, QAfterSortBy>
      thenByLockedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'locked', Sort.desc);
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity, QAfterSortBy>
      thenByNotes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notes', Sort.asc);
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity, QAfterSortBy>
      thenByNotesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notes', Sort.desc);
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity, QAfterSortBy>
      thenByRoundTotal() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'roundTotal', Sort.asc);
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity, QAfterSortBy>
      thenByRoundTotalDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'roundTotal', Sort.desc);
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity, QAfterSortBy>
      thenByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity, QAfterSortBy>
      thenByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity, QAfterSortBy>
      thenByStoreCurrency() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'storeCurrency', Sort.asc);
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity, QAfterSortBy>
      thenByStoreCurrencyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'storeCurrency', Sort.desc);
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity, QAfterSortBy>
      thenByStoreId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'storeId', Sort.asc);
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity, QAfterSortBy>
      thenByStoreIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'storeId', Sort.desc);
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity, QAfterSortBy>
      thenByStoreLocale() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'storeLocale', Sort.asc);
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity, QAfterSortBy>
      thenByStoreLocaleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'storeLocale', Sort.desc);
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity, QAfterSortBy>
      thenBySubtotal() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'subtotal', Sort.asc);
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity, QAfterSortBy>
      thenBySubtotalDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'subtotal', Sort.desc);
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity, QAfterSortBy>
      thenBySyncState() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncState', Sort.asc);
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity, QAfterSortBy>
      thenBySyncStateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncState', Sort.desc);
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity, QAfterSortBy>
      thenByTaxTotal() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'taxTotal', Sort.asc);
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity, QAfterSortBy>
      thenByTaxTotalDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'taxTotal', Sort.desc);
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity, QAfterSortBy>
      thenByTotal() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'total', Sort.asc);
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity, QAfterSortBy>
      thenByTotalDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'total', Sort.desc);
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity, QAfterSortBy>
      thenByTransId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'transId', Sort.asc);
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity, QAfterSortBy>
      thenByTransIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'transId', Sort.desc);
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity, QAfterSortBy>
      thenByTransactionType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'transactionType', Sort.asc);
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity, QAfterSortBy>
      thenByTransactionTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'transactionType', Sort.desc);
    });
  }
}

extension TransactionHeaderEntityQueryWhereDistinct on QueryBuilder<
    TransactionHeaderEntity, TransactionHeaderEntity, QDistinct> {
  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity, QDistinct>
      distinctByAssociateId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'associateId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity, QDistinct>
      distinctByAssociateName({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'associateName',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity, QDistinct>
      distinctByBeginDatetime() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'beginDatetime');
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity, QDistinct>
      distinctByBusinessDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'businessDate');
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity, QDistinct>
      distinctByCustomerId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'customerId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity, QDistinct>
      distinctByCustomerName({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'customerName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity, QDistinct>
      distinctByCustomerPhone({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'customerPhone',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity, QDistinct>
      distinctByDiscountTotal() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'discountTotal');
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity, QDistinct>
      distinctByEndDateTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'endDateTime');
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity, QDistinct>
      distinctByIsVoid() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isVoid');
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity, QDistinct>
      distinctByLastChangedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lastChangedAt');
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity, QDistinct>
      distinctByLastSyncAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lastSyncAt');
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity, QDistinct>
      distinctByLocked() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'locked');
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity, QDistinct>
      distinctByNotes({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'notes', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity, QDistinct>
      distinctByReturnRef() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'returnRef');
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity, QDistinct>
      distinctByRoundTotal() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'roundTotal');
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity, QDistinct>
      distinctByStatus({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'status', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity, QDistinct>
      distinctByStoreCurrency({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'storeCurrency',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity, QDistinct>
      distinctByStoreId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'storeId');
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity, QDistinct>
      distinctByStoreLocale({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'storeLocale', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity, QDistinct>
      distinctBySubtotal() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'subtotal');
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity, QDistinct>
      distinctBySyncState() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'syncState');
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity, QDistinct>
      distinctByTaxTotal() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'taxTotal');
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity, QDistinct>
      distinctByTotal() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'total');
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity, QDistinct>
      distinctByTransId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'transId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionHeaderEntity, QDistinct>
      distinctByTransactionType({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'transactionType',
          caseSensitive: caseSensitive);
    });
  }
}

extension TransactionHeaderEntityQueryProperty on QueryBuilder<
    TransactionHeaderEntity, TransactionHeaderEntity, QQueryProperty> {
  QueryBuilder<TransactionHeaderEntity, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<TransactionHeaderEntity, String?, QQueryOperations>
      associateIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'associateId');
    });
  }

  QueryBuilder<TransactionHeaderEntity, String?, QQueryOperations>
      associateNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'associateName');
    });
  }

  QueryBuilder<TransactionHeaderEntity, DateTime, QQueryOperations>
      beginDatetimeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'beginDatetime');
    });
  }

  QueryBuilder<TransactionHeaderEntity, Address?, QQueryOperations>
      billingAddressProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'billingAddress');
    });
  }

  QueryBuilder<TransactionHeaderEntity, DateTime, QQueryOperations>
      businessDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'businessDate');
    });
  }

  QueryBuilder<TransactionHeaderEntity, String?, QQueryOperations>
      customerIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'customerId');
    });
  }

  QueryBuilder<TransactionHeaderEntity, String?, QQueryOperations>
      customerNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'customerName');
    });
  }

  QueryBuilder<TransactionHeaderEntity, String?, QQueryOperations>
      customerPhoneProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'customerPhone');
    });
  }

  QueryBuilder<TransactionHeaderEntity, double, QQueryOperations>
      discountTotalProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'discountTotal');
    });
  }

  QueryBuilder<TransactionHeaderEntity, DateTime?, QQueryOperations>
      endDateTimeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'endDateTime');
    });
  }

  QueryBuilder<TransactionHeaderEntity, bool, QQueryOperations>
      isVoidProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isVoid');
    });
  }

  QueryBuilder<TransactionHeaderEntity, DateTime?, QQueryOperations>
      lastChangedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lastChangedAt');
    });
  }

  QueryBuilder<TransactionHeaderEntity, DateTime?, QQueryOperations>
      lastSyncAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lastSyncAt');
    });
  }

  QueryBuilder<TransactionHeaderEntity, List<TransactionLineItemEntity>,
      QQueryOperations> lineItemsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lineItems');
    });
  }

  QueryBuilder<TransactionHeaderEntity, bool, QQueryOperations>
      lockedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'locked');
    });
  }

  QueryBuilder<TransactionHeaderEntity, String?, QQueryOperations>
      notesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'notes');
    });
  }

  QueryBuilder<TransactionHeaderEntity, List<TransactionPaymentLineItemEntity>,
      QQueryOperations> paymentLineItemsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'paymentLineItems');
    });
  }

  QueryBuilder<TransactionHeaderEntity, List<String>, QQueryOperations>
      returnRefProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'returnRef');
    });
  }

  QueryBuilder<TransactionHeaderEntity, double, QQueryOperations>
      roundTotalProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'roundTotal');
    });
  }

  QueryBuilder<TransactionHeaderEntity, Address?, QQueryOperations>
      shippingAddressProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'shippingAddress');
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionStatus, QQueryOperations>
      statusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'status');
    });
  }

  QueryBuilder<TransactionHeaderEntity, String, QQueryOperations>
      storeCurrencyProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'storeCurrency');
    });
  }

  QueryBuilder<TransactionHeaderEntity, int, QQueryOperations>
      storeIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'storeId');
    });
  }

  QueryBuilder<TransactionHeaderEntity, String, QQueryOperations>
      storeLocaleProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'storeLocale');
    });
  }

  QueryBuilder<TransactionHeaderEntity, double, QQueryOperations>
      subtotalProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'subtotal');
    });
  }

  QueryBuilder<TransactionHeaderEntity, int?, QQueryOperations>
      syncStateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'syncState');
    });
  }

  QueryBuilder<TransactionHeaderEntity, double, QQueryOperations>
      taxTotalProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'taxTotal');
    });
  }

  QueryBuilder<TransactionHeaderEntity, double, QQueryOperations>
      totalProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'total');
    });
  }

  QueryBuilder<TransactionHeaderEntity, String, QQueryOperations>
      transIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'transId');
    });
  }

  QueryBuilder<TransactionHeaderEntity, TransactionType, QQueryOperations>
      transactionTypeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'transactionType');
    });
  }
}
