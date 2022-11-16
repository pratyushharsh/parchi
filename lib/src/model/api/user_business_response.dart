class UserBusiness {
  String? employeeId;
  String? storeId;
  String? roles;
  String? locale;
  String? storeName;
  String? employeeName;
  String? joinedAt;
  String? createdBy;
  String? createdAt;

  UserBusiness(
      {this.employeeId,
        this.storeId,
        this.roles,
        this.locale,
        this.storeName,
        this.employeeName,
        this.joinedAt,
        this.createdBy,
        this.createdAt});

  UserBusiness.fromJson(Map<String, dynamic> json) {
    employeeId = json['employee_id'];
    storeId = json['store_id'];
    roles = json['roles'];
    locale = json['locale'];
    storeName = json['store_name'];
    employeeName = json['employee_name'];
    joinedAt = json['joined_at'];
    createdBy = json['created_by'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['employee_id'] = employeeId;
    data['store_id'] = storeId;
    data['roles'] = roles;
    data['locale'] = locale;
    data['store_name'] = storeName;
    data['employee_name'] = employeeName;
    data['joined_at'] = joinedAt;
    data['created_by'] = createdBy;
    data['created_at'] = createdAt;
    return data;
  }
}
