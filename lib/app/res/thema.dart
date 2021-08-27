import 'package:dot_test/app/res/colors.dart';
import 'package:flutter/material.dart';

class ThemaCustom {
  static final darkTheme = ThemeData(
    primarySwatch: Colors.grey,
    primaryColor: Colors.black,
    brightness: Brightness.dark,
    backgroundColor: const Color(0xFF212121),
    accentColor: Colors.white,
    accentIconTheme: IconThemeData(color: Colors.black),
    dividerColor: Colors.black12,
  );

  static final lightTheme = ThemeData(
    primarySwatch: Colors.grey,
    primaryColor: ColorsCustom.primaryColor,
    brightness: Brightness.light,
    backgroundColor: const Color(0xFFE5E5E5),
    accentColor: Colors.black,
    accentIconTheme: IconThemeData(color: Colors.white),
    dividerColor: Colors.white54,
    fontFamily: "Inter",
  );
}
