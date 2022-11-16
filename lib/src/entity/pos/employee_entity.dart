import 'package:isar/isar.dart';

part 'employee_entity.g.dart';

@Collection()
class EmployeeEntity {
  Id? id;

  @Index(unique: true, type: IndexType.value, replace: true)
  String? employeeId;

  String? firstName;
  String? middleName;
  String? lastName;
  String? locale;
  String? email;
  String phone;
  String? gender;
  String? picture;
  DateTime? birthDate;
  String? allocatedStore;
  String? currentStore;

  EmployeeEntity({
      this.employeeId,
      this.firstName,
      this.middleName,
      this.lastName,
      this.locale,
      this.email,
      required this.phone,
      this.gender,
      this.picture,
      this.birthDate,
      this.allocatedStore,
      this.currentStore});
}