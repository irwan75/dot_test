import 'package:data/const/sized_border_radius.dart';
import 'package:data/const/sized_margin_padding.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFormCustom {
  TextFormCustom._privateConstructor();

  static final TextFormCustom _instance = TextFormCustom._privateConstructor();

  static TextFormCustom get getInstance => _instance;

  Widget textFormCustom({
    String hintText = "",
    TextInputType textInputType = TextInputType.text,
    required GestureTapCallback onTap,
    required TextEditingController controller,
    required Widget suffixIcon,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(
          vertical: SizedMarginPadding.sizedMarginPaddingMedium_x),
      child: TextFormField(
        controller: controller,
        onTap: onTap,
        keyboardType: textInputType,
        decoration: InputDecoration(
          suffixIcon: suffixIcon,
          hintText: hintText,
          contentPadding: EdgeInsets.symmetric(
            vertical: SizedMarginPadding.sizedMarginPaddingMedium_xx,
            horizontal: SizedMarginPadding.sizedMarginPaddingMedium_x,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
                SizedBorderRadius.borderRadiusSuperSmall_xx),
          ),
        ),
      ),
    );
  }
}
