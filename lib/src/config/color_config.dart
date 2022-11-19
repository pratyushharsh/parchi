import 'dart:math';
import 'dart:ui';

import '../entity/pos/entity.dart';

class ColorConstants {
  static Map<String, Color> categoryColor = {};
  static Map<String, Color> brandColor = {};

  static Color getCategoryColor(String category) {
    if (categoryColor.containsKey(category)) {
      return categoryColor[category]!;
    }
    final color = Color((Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0);
    categoryColor[category] = color;
    return color;
  }

  static Color getBrandColor(String category) {
    if (brandColor.containsKey(category)) {
      return brandColor[category]!;
    }
    final color = Color((Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0);
    brandColor[category] = color;
    return color;
  }

  static Color getColorForTransactionType(TransactionType type) {
    switch(type) {
      case TransactionType.sale:
        return const Color(0xFF4CAF50);
      case TransactionType.returns:
        return const Color(0xFFE91E63);
      case TransactionType.receipt:
        return const Color(0xFF2196F3);
      case TransactionType.refund:
        return const Color(0xFF9C27B0);
      case TransactionType.exchange:
        return const Color(0xFFFF9800);
      case TransactionType.payment:
        return const Color(0xFF795548);
    }
  }
}