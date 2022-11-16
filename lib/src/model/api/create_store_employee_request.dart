class CreateStoreEmployeeRequest {
  String businessId;
  String phone;
  String? firstName;
  String? lastName;
  String? locale;
  String createdUserId;

  CreateStoreEmployeeRequest(
      {required this.businessId,
        required this.phone,
        this.firstName,
        this.lastName,
        this.locale,
        required this.createdUserId});

  // CreateStoreEmployeeRequest.fromJson(Map<String, dynamic> json) {
  //   businessId = json['business_id'];
  //   phone = json['phone'];
  //   firstName = json['first_name'];
  //   lastName = json['last_name'];
  //   locale = json['locale'];
  //   createdUserId = json['created_user_id'];
  // }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['business_id'] = businessId;
    data['phone'] = phone;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['locale'] = locale;
    data['created_user_id'] = createdUserId;
    return data;
  }
}

class UpdateEmployeeRequest {
  String? firstName;
  String? middleName;
  String? lastName;
  String? locale;
  String? email;
  String? gender;

  UpdateEmployeeRequest(
      {this.firstName,
        this.middleName,
        this.lastName,
        this.locale,
        this.email,
        this.gender});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['first_name'] = firstName;
    data['middle_name'] = middleName;
    data['last_name'] = lastName;
    data['locale'] = locale;
    data['email'] = email;
    data['gender'] = gender;
    return data;
  }
}
