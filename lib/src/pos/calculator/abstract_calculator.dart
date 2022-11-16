import '../../entity/pos/entity.dart';

abstract class AbstractCalculator {
  Future<List<TransactionLineItemEntity>> handleLineItemEvent(List<TransactionLineItemEntity> lineItems);
}