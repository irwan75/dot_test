import 'package:data/const/sized_font.dart';
import 'package:data/const/sized_font_weight.dart';
import 'package:dot_test/app/res/colors.dart';
import 'package:flutter/material.dart';

class StylesCustom {
  StylesCustom._privateConstructor();

  static final StylesCustom _instance = StylesCustom._privateConstructor();

  static StylesCustom get getInstance => _instance;

  BoxDecoration boxDecorationPengeluaran(
      {Color colorBackground = Colors.white}) {
    return BoxDecoration(
      color: colorBackground,
    );
  }

  static const TextStyle textWhiteBold = TextStyle(
    color: ColorsCustom.fontWhite,
    fontWeight: SizedFontWeight.textBold,
    fontSize: SizedFont.textLarge
  );
}
