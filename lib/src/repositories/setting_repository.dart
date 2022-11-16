import 'package:isar/isar.dart';
import 'package:logging/logging.dart';

import '../config/code_value.dart';
import '../model/model.dart';
import '../database/db_provider.dart';
import '../entity/pos/entity.dart';
import '../util/helper/rest_api.dart';

class SettingsRepository with DatabaseProvider {
  final log = Logger('SettingsRepository');

  final RestApiClient restClient;

  SettingsRepository({required this.restClient});

  Future<ReceiptSettingsModel> updateReceiptSetting(
      ReceiptSettingsModel req) async {
    try {
      db.writeTxn(() async {
        if (req.storeNumber != null) {
          await db.settingEntitys.put(SettingEntity(
            category: SettingsCategory.receipt,
            subCategory: SettingsSubCategory.receiptPhoneNumber,
            value: req.storeNumber!,
          ));
        }

        if (req.tagLine != null) {
          await db.settingEntitys.put(SettingEntity(
            category: SettingsCategory.receipt,
            subCategory: SettingsSubCategory.receiptTagLine,
            value: req.tagLine!,
          ));
        }

        if (req.storeAddress != null) {
          await db.settingEntitys.put(SettingEntity(
            category: SettingsCategory.receipt,
            subCategory: SettingsSubCategory.receiptStoreAddress,
            value: req.storeAddress!,
          ));
        }

        if (req.footerTitle != null) {
          await db.settingEntitys.put(SettingEntity(
            category: SettingsCategory.receipt,
            subCategory: SettingsSubCategory.receiptFooterTitle,
            value: req.footerTitle!,
          ));
        }

        if (req.footerSubtitle != null) {
          await db.settingEntitys.put(SettingEntity(
            category: SettingsCategory.receipt,
            subCategory: SettingsSubCategory.receiptFooterSubTitle,
            value: req.footerSubtitle!,
          ));
        }
      });
    } catch (e) {
      log.severe(e);
    }
    return req;
  }

  Future<ReceiptSettingsModel> getReceiptSettings() async {
    List<SettingEntity> res = await db.settingEntitys
        .filter()
        .categoryEqualTo(SettingsCategory.receipt)
        .findAll();

    return ReceiptSettingsModel(
      storeNumber: res
          .firstWhere(
              (element) =>
                  SettingsSubCategory.receiptPhoneNumber == element.subCategory,
              orElse: () =>
                  SettingEntity(category: '', subCategory: '', value: ''))
          .value,
      storeAddress: res
          .firstWhere(
              (element) =>
                  SettingsSubCategory.receiptStoreAddress ==
                  element.subCategory,
              orElse: () =>
                  SettingEntity(category: '', subCategory: '', value: ''))
          .value,
      tagLine: res
          .firstWhere(
              (element) =>
                  SettingsSubCategory.receiptTagLine == element.subCategory,
              orElse: () =>
                  SettingEntity(category: '', subCategory: '', value: ''))
          .value,
      footerTitle: res
          .firstWhere(
              (element) =>
                  SettingsSubCategory.receiptFooterTitle == element.subCategory,
              orElse: () =>
                  SettingEntity(category: '', subCategory: '', value: ''))
          .value,
      footerSubtitle: res
          .firstWhere(
              (element) =>
                  SettingsSubCategory.receiptFooterSubTitle ==
                  element.subCategory,
              orElse: () =>
                  SettingEntity(category: '', subCategory: '', value: ''))
          .value,
    );
  }
}
