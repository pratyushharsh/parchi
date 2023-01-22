

// Store Id
// Workstation Id
// User Id
// User Name
// User Email
// User Phone
// Business Date

class StoreConfigCacheManager {
  static int storeId = 0;
  static int workstationId = 0;
  static String userId = "";
  static String userName = "";
  static String userEmail = "";

  static init({required int storeId, required int workstationId, required String userId, required String userName, required String userEmail}) {
    StoreConfigCacheManager.storeId = storeId;
    StoreConfigCacheManager.workstationId = workstationId;
    StoreConfigCacheManager.userId = userId;
    StoreConfigCacheManager.userName = userName;
    StoreConfigCacheManager.userEmail = userEmail;
  }
}