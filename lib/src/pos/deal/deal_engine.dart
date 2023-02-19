import '../../entity/pos/entity.dart';

class DealEngine {

  // Find the best deals for the items in the cart
  Map<TransactionLineItemEntity, List<DealsEntity>> findBestDeals(List<DealsEntity> deals, List<TransactionLineItemEntity> cartItems) {
    Map<TransactionLineItemEntity, List<DealsEntity>> bestDeals = <TransactionLineItemEntity, List<DealsEntity>>{};
    /// Using dynamic programming to calculate the best deals for each item in the cart
    // List<List<double>> dp = List.generate(cartItems.length, (index) => List.filled(deals.length, 0.0));
    // for (int i = 0; i < cartItems.length; i++) {
    //   for (int j = 0; j < deals.length; j++) {
    //     if (i == 0) {
    //       dp[i][j] = deals[j].amountCap!;
    //     } else {
    //       dp[i][j] = dp[i - 1][j];
    //       if (j > 0) {
    //         dp[i][j] = max(dp[i][j], dp[i - 1][j - 1] + deals[j].amountCap!);
    //       }
    //     }
    //   }
    // }



    return bestDeals;
  }
}