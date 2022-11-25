import 'package:isar/isar.dart';
part 'country_entity.g.dart';

@Collection()
class CountryEntity {
  final Id? id;

  @Index(
      unique: true, replace: true, caseSensitive: true, type: IndexType.value)
  final String iso2;
  final String iso3;

  final String name;
  final String isoNumeric;
  final String phoneCode;
  final String continent;
  final String? flag;
  final String? capital;
  final String? timeZone;
  final String? currency;

  final List<String> languages;
  final List<String> currencies;

  CountryEntity(
      {this.id,
      required this.name,
      required this.iso2,
      required this.iso3,
      required this.isoNumeric,
      required this.phoneCode,
      required this.continent,
      this.flag,
      this.capital,
      this.timeZone,
      this.currency,
      required this.languages,
      required this.currencies});
}