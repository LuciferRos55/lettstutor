import 'package:flutter/material.dart';

class AppColors {
  AppColors._(); // this basically makes it so you can't instantiate this class

  static const Map<String, Color> colors = const <String, Color>{
    "systemColor": Color(0xFF0085FF),
    "textColor1": Color(0xFF17431D),
    "textColor2": Color(0xFF595959),
    "textColor3": Color(0xFF8C8C8C),
    "errorColor": Color(0xFFFE5638),
    "successColor": Color(0xFF4DDD8A),
    "backgroundColor": Color(0xFFFAFAFA),
    "priceColor": Color(0xFFFAAD14),
    "breakColor": Color(0xFFF1F1F1),
  };
}
