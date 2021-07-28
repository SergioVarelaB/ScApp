import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class TextStyles {
  static TextStyle? itemTitle() {
    return TextStyle(
        fontSize: 24.0,
        fontFamily: 'Roboto Bold',
        color: HexColor('#FFFFFF')
    );
  }

  static TextStyle? itemSubtitle() {
    return TextStyle(
        fontSize: 18.0,
        fontFamily: 'Roboto Bold',
        color: HexColor('#FFFFFF')
    );
  }
}