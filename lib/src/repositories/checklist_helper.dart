import '../database/db_provider.dart';
import '../entity/pos/business_entity.dart';

class CheckListHelper with DatabaseProvider {

  CheckListHelper();

  List<String> validateStore(RetailLocationEntity store) {
    List<String> err = [];
    if (store.storeName == null || store.storeName!.isEmpty) {
      err.add("Store name is required");
    }
    if (store.storeEmail == null || store.storeEmail!.isEmpty) {
      err.add("Store email is required");
    }
    if (store.storeContact == null || store.storeContact!.isEmpty) {
      err.add("Store contact is required");
    }
    if (store.storeNumber == null || store.storeNumber!.isEmpty) {
      err.add("Store number is required");
    }
    if (store.currencyId == null || store.currencyId!.isEmpty) {
      err.add("Store currency is required");
    }
    if (store.locale == null || store.locale!.isEmpty) {
      err.add("Store locale is required");
    }
    if (store.gst == null || store.gst!.isEmpty) {
      err.add("Store gst is required");
    }
    if (store.pan == null || store.pan!.isEmpty) {
      err.add("Store pan is required");
    }

    return err;
  }
}