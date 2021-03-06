import 'dart:math';

import 'package:flutter/material.dart';

class LightColors  {
  static const Color kLightYellow = Color(0xFFFFF9EC);
  static const Color kLightYellow2 = Color(0xFFFFE4C7);
  static const Color kDarkYellow = Color(0xFFF9BE7C);
  static const Color kPalePink = Color(0xFFFED4D6);

  static const Color kRed = Color(0xFFE46472);
  static const Color kLavender = Color(0xFFD5E4FE);
  static const Color kBlue = Color(0xFF6488E4);
  static const Color kLightGreen = Color(0xFFD9E6DC);
  static const Color kGreen = Color(0xFF309397);

  static const Color kDarkBlue = Color(0xFF0D253F);

  static Color getRandomColor() {
    final random = new Random();
    final index = random.nextInt(7);
    switch(index) {
      case 0: return kLightYellow2;
      case 1: return kDarkYellow;
      case 2: return kPalePink;
      case 3: return kRed;
      case 4: return kBlue;
      case 5: return kGreen;
      default: return kDarkBlue;
    }
  }
}