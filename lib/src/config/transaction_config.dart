


/// POS STATUS
/// CREATED -> COMPLETED [Successful Transaction]
/// CREATED -> CANCELLED [Transaction Cancelled only after once order is placed.]
///
/// CREATED -> SUSPENDED [Transaction can be retrieved and resumed later]
/// SUSPENDED -> COMPLETED [Successful Transaction]
///
/// CREATED -> PARTIAL_PAYMENT [Transaction with partial payment no item addition allowed later.]
///
// class TransactionStatus {
//   static const String created = 'CREATED';
//   // static const String pending = 'PENDING';
//   // static const String approved = 'APPROVED';
//   // static const String rejected = 'REJECTED';
//   static const String voided = 'VOIDED';
//   static const String suspended = 'SUSPENDED';
//   static const String completed = 'COMPLETED';
//   static const String inProgress = 'IN_PROGRESS';
//   static const String cancelled = 'CANCELLED';
//   static const String partialPayment = 'PARTIAL_PAYMENT';
// }

// class TransactionType {
//   static const String cashSale = "SALE";
//   static const String saleReturn = "RETURN";
// }
