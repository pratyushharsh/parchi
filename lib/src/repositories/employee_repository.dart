import 'dart:convert';

import 'package:isar/isar.dart';
import 'package:logging/logging.dart';

import '../database/db_provider.dart';
import '../entity/pos/employee_entity.dart';
import '../model/api/api.dart';
import '../model/api/create_store_employee_request.dart';
import '../model/api/get_employee_response.dart';
import '../util/helper/rest_api.dart';

class EmployeeRepository with DatabaseProvider {
  final log = Logger('EmployeeRepository');

  final RestApiClient restClient;

  EmployeeRepository({ required this.restClient});

  // Future<EmployeeEntity?> getEmployeeByUserId(String userId) async {
  //   try {
  //     var data = await db.employeeEntitys.where().employeeIdEqualTo(userId).findFirst();
  //     return data;
  //   } catch (e) {
  //     log.severe(e);
  //   }
  //   return null;
  // }

  Future<List<UserBusiness>> getBusinessAssociatedWithUser(String userId) async {
    List<UserBusiness> userBusinesses = [];
    try {
      var option = RestOptions(path: '/user/$userId/business');
      var rawResp = await restClient.get(restOptions: option);
      if (rawResp.statusCode == 200) {
        var decode = json.decode(rawResp.body) as List;
        for(var item in decode) {
          userBusinesses.add(UserBusiness.fromJson(item));
        }
      }
    } catch (e, st) {
      log.severe(e.toString(), e, st);
    }
    return userBusinesses;
  }

  Future<EmployeeEntity?> getEmployeeByStoreAndUserId(String storeId, String userId) async {

    // Get the data form the local database if present.
    try {
      var data = await db.employeeEntitys.where().employeeIdEqualTo(userId).findFirst();
      if(data != null) {
        return data;
      }
    } catch (e) {
      log.severe(e);
    }


    try {
      var option = RestOptions(path: '/business/$storeId/employee/$userId');
      var rawResp = await restClient.get(restOptions: option);

      if (rawResp.statusCode == 200) {
        var resp = GetUserResponse.fromJson(restClient.parsedResponse(rawResp));

        EmployeeEntity emp = EmployeeEntity(
          employeeId: resp.employee.employeeId,
          firstName: resp.employee.firstName,
          middleName: resp.employee.middleName,
          lastName: resp.employee.lastName,
          locale: resp.employee.locale,
          email: resp.employee.email,
          phone: resp.employee.phone ?? resp.employee.employeeId,
          birthDate: resp.employee.dob,
          gender: resp.employee.gender,
          picture: resp.employee.picture
        );
        await db.writeTxn(() async {
          await db.employeeEntitys.put(emp);
        });

        return emp;
      }
    } catch (e) {
      log.severe(e);
    }
    return null;
  }

  Future<List<StoreEmployee>> getEmployeeByStoreId(String storeId) async {
    List<StoreEmployee> storeEmployees = [];
    try {
      var option = RestOptions(path: '/business/$storeId/employee');
      var rawResp = await restClient.get(restOptions: option);
      if (rawResp.statusCode == 200) {
        var decode = json.decode(rawResp.body) as List;
        for(var item in decode) {
          storeEmployees.add(StoreEmployee.fromJson(item));
        }
      }
    } catch (e) {
      rethrow;
    }
    return storeEmployees;
  }

  Future<void> createNewEmployeeForStore(CreateStoreEmployeeRequest emp) async {
    try {
      var body = json.encode(emp.toJson());
      var option = RestOptions(path: '/business/${emp.businessId}/employee', body: body);
      var rawResp = await restClient.post(restOptions: option);
      if (rawResp.statusCode == 200 || rawResp.statusCode == 201) {

      } else {
        log.info('Failed to create new employee for store');
        throw Exception('Failed to create new employee ${rawResp.statusCode} : ${rawResp.body}');
      }
    } catch (e) {
      log.severe(e);
      rethrow;
    }
  }

  Future<void> updateEmployee(UpdateEmployeeRequest emp, String userId) async {
    try {
      var body = json.encode(emp.toJson());
      var option = RestOptions(path: '/user/$userId', body: body);
      var rawResp = await restClient.put(restOptions: option);
      if (rawResp.statusCode == 200 || rawResp.statusCode == 201) {

      } else {
        log.info('Failed to update employee.');
        throw Exception('Failed update employee ${rawResp.statusCode} : ${rawResp.body}');
      }
    } catch (e) {
      log.severe(e);
      rethrow;
    }
  }
}