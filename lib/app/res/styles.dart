import 'package:data/const/sized_border_radius.dart';
import 'package:data/const/sized_font.dart';
import 'package:data/const/sized_font_weight.dart';
import 'package:dot_test/app/res/colors.dart';
import 'package:flutter/material.dart';

class StylesCustom {
  StylesCustom._privateConstructor();

  static final StylesCustom _instance = StylesCustom._privateConstructor();

  static StylesCustom get getInstance => _instance;

  BoxDecoration boxDecorationPengeluaran({
    Color colorBackground = Colors.white,
    double borderRadius = SizedBorderRadius.borderRadiusSmall,
  }) {
    return BoxDecoration(
      color: colorBackground,
      borderRadius: BorderRadius.circular(borderRadius),
    );
  }

  static final BoxDecoration boxDecorationListPengeluaran = BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(SizedBorderRadius.borderRadiusSmall_x),
    boxShadow: [
      BoxShadow(
        color: Colors.grey.withOpacity(0.3),
        offset: Offset(0, 3),
        blurRadius: 6,
        spreadRadius: 2,
      ),
    ],
  );

  static final BoxDecoration boxDecorationPengeluaranCategory = BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(SizedBorderRadius.borderRadiusSmall),
    boxShadow: [
      BoxShadow(
        color: Colors.grey.withOpacity(0.3),
        offset: Offset(2, 3),
        blurRadius: 6,
        spreadRadius: 2,
      ),
    ],
  );

  static const TextStyle textWhiteBold = TextStyle(
      color: ColorsCustom.fontWhite,
      fontWeight: SizedFontWeight.textBold,
      fontSize: SizedFont.textLarge);

  static const TextStyle textBlackBold = TextStyle(
    color: ColorsCustom.fontBlack,
    fontWeight: SizedFontWeight.textBold,
  );

  static const TextStyle textWhiteLightPengeluaran = TextStyle(
    color: ColorsCustom.fontWhite,
    fontWeight: SizedFontWeight.textBoldLight,
  );

  TextStyle textStyleBoldTitle({double fontSize = SizedFont.textMedium}) {
    return TextStyle(
      fontSize: fontSize,
      fontWeight: SizedFontWeight.textBold,
    );
  }
}
