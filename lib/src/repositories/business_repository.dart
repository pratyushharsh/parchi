import 'dart:convert';
import 'dart:typed_data';

import 'package:logging/logging.dart';

import '../database/db_provider.dart';
import '../entity/pos/address.dart';
import '../entity/pos/entity.dart';
import '../model/api/api.dart';
import '../model/api/create_business_response.dart';
import '../util/helper/rest_api.dart';

class BusinessRepository with DatabaseProvider {
  final log = Logger('BusinessRepository');

  final RestApiClient restClient;

  BusinessRepository({required this.restClient});

  Future<RetailLocationEntity> findAndPersistBusiness(int businessId) async {
    try {
      var option = RestOptions(path: '/business/$businessId');
      var rawResp = await restClient.get(restOptions: option);
      if (rawResp.statusCode == 200) {
        try {
          var resp = CreateBusinessResponse.fromJson(
              restClient.parsedResponse(rawResp));

          List<String> imgs = [];
          // build image
          if (resp.logo != null) {
            String? small = resp.logo!.small;
            String? medium = resp.logo!.medium;
            String? large = resp.logo!.large;
            if (small != null) {
              imgs.add(small);
            }

            if (medium != null) {
              imgs.add(medium);
            }

            if (large != null) {
              imgs.add(large);
            }
          }

          var entity = RetailLocationEntity(
            rtlLocId: resp.businessId!,
            version: 1,
            createTime: resp.createdAt!,
            storeName: resp.name,
            storeEmail: resp.email,
            storeNumber: '${resp.businessId}',
            legalBusiness: resp.legalName,
            storeContact: resp.phone,
            address: Address(
              address1: resp.address1,
              address2: resp.address2,
              city: resp.city,
              state: resp.state,
              zipcode: resp.postalCode,
              country: resp.country,
            ),
            pan: resp.customAttribute?.gST,
            gst: resp.customAttribute?.pAN,
            currencyId: resp.currency,
            locale: resp.locale,
            logo: imgs,
          );
          await db.writeTxn(() => db.retailLocationEntitys.put(entity));
          return entity;
        } catch (e) {
          log.severe(e);
          throw 'Error While Parsing business';
        }
      } else {
        throw 'Unable to create new business. Contact Admin';
      }
    } catch (e) {
      log.severe(e);
      throw 'Error while creating business';
    }
  }

  Future<RetailLocationEntity> getBusinessById(int businessId) async {
    try {
      var data = await db.retailLocationEntitys.get(businessId);

      if (data == null) {
        log.info('Cannot find business in the database');
        data = await findAndPersistBusiness(businessId);
      }

      return data;
    } catch (e) {
      log.severe(e);
      throw 'Error while getting business';
    }
  }

  Future<RetailLocationEntity> updateBusiness(
      int businessId, CreateBusinessRequest request) async {
    try {
      var option = RestOptions(
          path: '/business/$businessId', body: json.encode(request.toMap()));
      await restClient.put(restOptions: option);
      return findAndPersistBusiness(businessId);
    } catch (e) {
      log.severe(e);
      throw 'Error while updating business';
    }
  }

  Future<RetailLocationEntity> createNewBusiness(
      CreateBusinessRequest request) async {
    try {
      var option =
          RestOptions(path: '/business', body: json.encode(request.toMap()));
      var rawResp = await restClient.post(restOptions: option);
      if (rawResp.statusCode == 200) {
        try {
          var resp = CreateBusinessResponse.fromJson(
              restClient.parsedResponse(rawResp));

          var entity = RetailLocationEntity(
            rtlLocId: resp.businessId!,
            version: 1,
            createTime: resp.createdAt!,
            storeName: resp.name,
            storeEmail: resp.email,
            storeNumber: '${resp.businessId}',
            storeContact: resp.phone,
            address: Address(
              address1: resp.address1,
              address2: resp.address2,
              city: resp.city,
              state: resp.state,
              zipcode: resp.postalCode,
              country: resp.country,
            ),
            pan: resp.customAttribute?.gST,
            gst: resp.customAttribute?.pAN,
            currencyId: resp.currency,
            locale: resp.locale,
          );
          await db.writeTxn(() => db.retailLocationEntitys.put(entity));
          return entity;
        } catch (e) {
          log.severe(e);
          throw 'Error While Parsing business';
        }
      } else {
        throw 'Unable to create new business. Contact Admin';
      }
    } catch (e) {
      log.severe(e);
      throw 'Error while creating business';
    }
  }

  Future<String> getLogoUploadUrl(int businessId) async {
    try {
      var option = RestOptions(path: '/business/$businessId/logo');
      var rawResp = await restClient.get(restOptions: option);
      if (rawResp.statusCode == 200) {
        try {
          var resp = restClient.parsedResponse(rawResp);
          return resp['uploadURL'];
        } catch (e) {
          log.severe(e);
          throw 'Error While Parsing business';
        }
      } else {
        throw 'Unable to create new business. Contact Admin';
      }
    } catch (e) {
      log.severe(e);
      throw 'Error while creating business';
    }
  }

  Future<void> uploadImage(String url, Uint8List inp) async {
    try {
      var option = RestOptions(url: url, body: inp, path: '');
      var rawResp = await restClient.rawPut(restOptions: option);
      if (rawResp.statusCode == 200) {
        return;
      } else {
        throw 'Unable to upload image. Contact Admin';
      }
    } catch (e) {
      log.severe(e);
      throw 'Error while uploading the image.';
    }
  }
}
