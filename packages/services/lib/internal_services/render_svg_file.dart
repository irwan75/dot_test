import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RenderSvgFile {
  RenderSvgFile._privateConstructor();

  static final RenderSvgFile _instance = RenderSvgFile._privateConstructor();

  static RenderSvgFile get getInstance => _instance;

  Widget renderSvgFile(
      {String pathImage = "", Color colorIcon = Colors.black}) {
    return SvgPicture.asset(pathImage, color: colorIcon);
  }
}
