import 'package:isar/isar.dart';

import 'address.dart';

part 'business_entity.g.dart';

@Collection()
class RetailLocationEntity {

  final Id rtlLocId;
  final String? storeName;
  final String? legalBusiness;
  final String? storeEmail;
  final String? storeContact;
  final String? storeNumber;
  final String? currencyId;
  final String? locale;
  final Address? address;
  final String? gst;
  final String? pan;
  final List<String>? logo;
  late DateTime createTime;
  late DateTime? updateTime;
  late DateTime? lastChangedAt;
  late int version;

  RetailLocationEntity(
      {required this.rtlLocId,
      this.storeName,
      this.legalBusiness,
      this.storeEmail,
      this.storeContact,
      this.storeNumber,
      this.currencyId,
      this.locale,
      this.address,
      this.gst,
      this.pan, this.logo,
      required this.createTime,
      this.version = 1,
      this.lastChangedAt,
      this.updateTime});

  RetailLocationEntity copyWith(
      {Id? rtlLocId,
      String? storeName,
      String? legalBusiness,
      String? storeEmail,
      String? storeContact,
      String? storeNumber,
      String? currencyId,
      String? locale,
      Address? address,
      String? gst,
      String? pan,
      List<String>? logo,
      DateTime? createTime,
      int? version,
      DateTime? lastChangedAt,
      DateTime? updateTime}) {
    return RetailLocationEntity(
      rtlLocId: rtlLocId ?? this.rtlLocId,
      storeName: storeName ?? this.storeName,
      legalBusiness: legalBusiness ?? this.legalBusiness,
      storeEmail: storeEmail ?? this.storeEmail,
      storeContact: storeContact ?? this.storeContact,
      storeNumber: storeNumber ?? this.storeNumber,
      currencyId: currencyId ?? this.currencyId,
      locale: locale ?? this.locale,
      address: address ?? this.address,
      gst: gst ?? this.gst,
      pan: pan ?? this.pan,
      logo: logo ?? this.logo,
      createTime: createTime ?? this.createTime,
      version: version ?? this.version,
      lastChangedAt: lastChangedAt ?? this.lastChangedAt,
      updateTime: updateTime ?? this.updateTime,
    );
  }
}
