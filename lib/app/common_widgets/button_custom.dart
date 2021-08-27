import 'package:data/const/sized_margin_padding.dart';
import 'package:dot_test/app/res/colors.dart';
import 'package:dot_test/app/res/styles.dart';
import 'package:flutter/material.dart';

class ButtonCustom {
  ButtonCustom._privateConstructor();

  static final ButtonCustom _instance = ButtonCustom._privateConstructor();

  static ButtonCustom get getInstance => _instance;

  Widget buttonCustomNormal({
    String title = "",
    Color colorBackground = ColorsCustom.primaryColor,
    required GestureTapCallback onTap,
  }) {
    return Container(
      width: double.infinity,
      child: MaterialButton(
        padding: EdgeInsets.symmetric(vertical: SizedMarginPadding.sizedMarginPaddingMedium_xx),
        onPressed: onTap,
        child: Text(
          title,
          style: StylesCustom.textWhiteBold,
        ),
        color: colorBackground,
      ),
    );
  }
}
