import 'package:isar/isar.dart';
part 'address.g.dart';

@embedded
class Address {
  final String? address1;
  final String? address2;
  final String? city;
  final String? state;
  final String? stateCode;
  final String? country;
  final String? countryCode;
  final String? zipcode;

  Address(
      {this.address1,
      this.address2,
      this.city,
      this.state,
      this.stateCode,
      this.country,
      this.countryCode,
      this.zipcode});


  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Address &&
          runtimeType == other.runtimeType &&
          address1 == other.address1 &&
          address2 == other.address2 &&
          city == other.city &&
          state == other.state &&
          stateCode == other.stateCode &&
          country == other.country &&
          countryCode == other.countryCode &&
          zipcode == other.zipcode;

  @override
  int get hashCode =>
      address1.hashCode ^
      address2.hashCode ^
      city.hashCode ^
      state.hashCode ^
      stateCode.hashCode ^
      country.hashCode ^
      countryCode.hashCode ^
      zipcode.hashCode;

  @override
  String toString() {
    return '$address1, $address2\n$city, $state\n$country, $zipcode';
  }
}
