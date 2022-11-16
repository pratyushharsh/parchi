import 'package:isar/isar.dart';

part 'employee_role_entity.g.dart';

@Collection()
class EmployeeRoleEntity {
  Id? id;

  @Index(composite: [CompositeIndex("storeId")], unique: true)
  String employeeId;
  String storeId;
  String role;
  String createdBy;
  String locale;

  EmployeeRoleEntity({
      required this.employeeId,
      required this.storeId,
      required this.role,
      required this.createdBy,
      required this.locale});
}