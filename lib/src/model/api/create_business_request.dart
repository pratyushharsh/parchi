class CreateBusinessRequest {
  String name;
  String legalName;
  String? email;
  String? address1;
  String? address2;
  String? city;
  String? state;
  String? postalCode;
  String? country;
  String? currency;
  String? phone;
  String? locale;
  String? gst;
  String? pan;
  String? createdBy;

  CreateBusinessRequest(
      {required this.name,
      required this.legalName,
        this.email,
      this.address1,
      this.address2,
      this.city,
      this.state,
      this.postalCode,
      this.country,
      this.currency,
      this.phone,
      this.locale,
      this.gst,
      this.pan,
      this.createdBy});

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'legal_name': legalName,
      'email': email,
      'address1': address1,
      'address2': address2,
      'city': city,
      'state': state,
      'postal_code': postalCode,
      'country': country,
      'currency': currency,
      'phone': phone,
      'locale': locale,
      'gst': gst,
      'pan': pan,
      'created_by': createdBy
    };
  }

  factory CreateBusinessRequest.fromMap(Map<String, dynamic> map) {
    return CreateBusinessRequest(
      name: map['name'] as String,
      legalName: map['legal_name'] as String,
      email: map['email'] as String?,
      address1: map['address1'] as String?,
      address2: map['address2'] as String?,
      city: map['city'] as String?,
      state: map['state'] as String?,
      postalCode: map['postalCode'] as String?,
      country: map['country'] as String?,
      currency: map['currency'] as String?,
      phone: map['phone'] as String?,
      locale: map['locale'] as String?,
      gst: map['gst'] as String?,
      pan: map['pan'] as String?,
    );
  }
}
