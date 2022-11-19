import 'dart:math';
import 'dart:ui';

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
}