import 'dart:ffi';

class GetUserResponse {
  Employee employee;
  StoreEmployee storeData;

  GetUserResponse({required this.employee, required this.storeData});

  factory GetUserResponse.fromJson(Map<String, dynamic> json) {
    return GetUserResponse(
      employee: Employee.fromJson(json['employee']),
      storeData: StoreEmployee.fromJson(json['store_data']),
    );
  }
}

class Employee {
  String? type;
  String employeeId;
  String? firstName;
  String? middleName;
  String? lastName;
  String? locale;
  String? email;
  String? phone;
  String? gender;
  String? picture;
  Bool? emailVerified;
  Bool? phoneVerified;
  DateTime? dob;
  String? joinedAt;
  String? createdBy;
  String? createdAt;

  Employee(
      {this.type,
      required this.employeeId,
      this.firstName,
      this.middleName,
      this.lastName,
      this.locale,
      this.email,
      this.phone,
      this.gender,
      this.picture,
      this.emailVerified,
      this.phoneVerified,
      this.dob,
      this.joinedAt,
      this.createdBy,
      this.createdAt});

  factory Employee.fromJson(Map<String, dynamic> json) {
    return Employee(
      type: json['Type'],
      employeeId: json['employee_id'],
      firstName: json['first_name'],
      middleName: json['middle_name'],
      lastName: json['last_name'],
      locale: json['locale'],
      email: json['email'],
      phone: json['phone'],
      gender: json['gender'],
      picture: json['picture'],
      emailVerified: json['email_verified'],
      phoneVerified: json['phone_verified'],
      dob: json['dob'],
      joinedAt: json['joined_at'],
      createdBy: json['created_by'],
      createdAt: json['created_at'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Type'] = type;
    data['employee_id'] = employeeId;
    data['first_name'] = firstName;
    data['middle_name'] = middleName;
    data['last_name'] = lastName;
    data['locale'] = locale;
    data['email'] = email;
    data['phone'] = phone;
    data['gender'] = gender;
    data['picture'] = picture;
    data['email_verified'] = emailVerified;
    data['phone_verified'] = phoneVerified;
    data['dob'] = dob;
    data['joined_at'] = joinedAt;
    data['created_by'] = createdBy;
    data['created_at'] = createdAt;
    return data;
  }
}

class StoreEmployee {
  String employeeId;
  String storeId;
  String roles;
  String? locale;
  String? storeName;
  String? employeeName;
  DateTime joinedAt;
  String? createdBy;
  DateTime? createdAt;

  StoreEmployee(
      {required this.employeeId,
      required this.storeId,
      required this.roles,
      this.locale,
      this.storeName,
      this.employeeName,
      required this.joinedAt,
      this.createdBy,
      this.createdAt});

  factory StoreEmployee.fromJson(Map<String, dynamic> json) => StoreEmployee(
    employeeId: json["employee_id"],
    storeId: json["store_id"],
    roles: json["roles"] ?? "",
    locale: json["locale"],
    storeName: json["store_name"],
    employeeName: json["employee_name"],
    joinedAt: DateTime.parse(json["joined_at"]),
    createdBy: json["created_by"],
    createdAt: DateTime.parse(json["created_at"]),
  );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['employee_id'] = employeeId;
    data['store_id'] = storeId;
    data['roles'] = roles;
    data['locale'] = locale;
    data['store_name'] = storeName;
    data['employee_name'] = employeeName;
    data['joined_at'] = joinedAt.toIso8601String();
    data['created_by'] = createdBy;
    data['created_at'] = createdAt?.toIso8601String();
    return data;
  }
}
