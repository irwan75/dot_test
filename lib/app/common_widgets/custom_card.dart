import 'package:data/const/sized_border_radius.dart';
import 'package:data/const/sized_font.dart';
import 'package:data/const/sized_margin_padding.dart';
import 'package:data/const/sized_space.dart';
import 'package:dot_test/app/res/colors.dart';
import 'package:dot_test/app/res/path_image_icon.dart';
import 'package:dot_test/app/res/styles.dart';
import 'package:flutter/material.dart';
import 'package:services/internal_services/render_svg_file.dart';
import 'package:services/utils/extension_custom.dart';

class CustomCard {
  CustomCard._privateConstructor();

  static final CustomCard _instance = CustomCard._privateConstructor();

  static CustomCard get getInstance => _instance;

  Widget cardPengeluaran({
    String title = "",
    int nominal = 0,
    Color colorBackground = Colors.black,
  }) {
    return Expanded(
      flex: 1,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: SizedMarginPadding.sizedMarginPaddingNormal,
          vertical: SizedMarginPadding.sizedMarginPaddingNormal,
        ),
        decoration: StylesCustom.getInstance.boxDecorationPengeluaran(
          colorBackground: colorBackground,
          borderRadius: SizedBorderRadius.borderRadiusSmall_x,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: StylesCustom.textWhiteLightPengeluaran,
            ),
            SizedBox(height: SizedSpace.sizedSpaceMedium_x),
            Text(
              "Rp. ${nominal.toMoneyIdrFormat()}",
              style: StylesCustom.textWhiteBold,
            ),
          ],
        ),
      ),
    );
  }

  Widget cardKategori(
      {String pathIcon = "", String title = "", int nominal = 0}) {
    return Container(
      margin: EdgeInsets.only(
        right: SizedMarginPadding.sizedMarginPaddingNormal_xx,
        top: SizedMarginPadding.sizedMarginPaddingNormal_xx,
        bottom: SizedMarginPadding.sizedMarginPaddingNormal_xx,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: SizedMarginPadding.sizedMarginPaddingNormal_xx,
        vertical: SizedMarginPadding.sizedMarginPaddingNormal_xx,
      ),
      constraints: BoxConstraints(
        minWidth: 130,
        minHeight: 140,
      ),
      decoration: StylesCustom.boxDecorationPengeluaranCategory,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(PathIcon.basePath + pathIcon),
          SizedBox(height: SizedSpace.sizedSpaceNormal),
          Text(
            title,
            style: TextStyle(color: ColorsCustom.grey3),
          ),
          SizedBox(height: SizedSpace.sizedSpaceMedium_x),
          Text(
            "Rp. ${nominal.toMoneyIdrFormat()}",
            style: StylesCustom.textBlackBold,
          ),
        ],
      ),
    );
  }

  Widget cardList({
    String pathIcon = "",
    String title = "",
    int nominal = 0,
    int colorHex = 0,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: SizedMarginPadding.sizedMarginPaddingNormal_xx,
        vertical: SizedMarginPadding.sizedMarginPaddingLarge_x,
      ),
      margin:
          EdgeInsets.only(bottom: SizedMarginPadding.sizedMarginPaddingLarge),
      decoration: StylesCustom.boxDecorationListPengeluaran,
      child: Row(
        children: [
          RenderSvgFile.getInstance.renderSvgFile(
              pathImage: PathIcon.basePath + pathIcon,
              colorIcon: Color(colorHex)),
          SizedBox(width: SizedSpace.sizedSpaceNormal),
          Expanded(
            child: Text(
              title,
              style: TextStyle(
                fontSize: SizedFont.textMedium,
                color: ColorsCustom.grey1,
              ),
            ),
          ),
          Text(
            "Rp. ${nominal.toMoneyIdrFormat()}",
            style: StylesCustom.textBlackBold,
          ),
        ],
      ),
    );
  }

  /// ![](https://flutter.github.io/assets-for-api-docs/assets/material/card.png)
  Widget cardChooseCatgory({
    String title = "",
    String pathIcon = "",
    Color colorIcon = Colors.black,
    required GestureTapCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(width: 1, color: Colors.grey),
          borderRadius: BorderRadius.circular(
              SizedBorderRadius.borderRadiusSuperSmall_xx),
        ),
        margin: EdgeInsets.symmetric(
            vertical: SizedMarginPadding.sizedMarginPaddingMedium_x),
        padding: EdgeInsets.symmetric(
          vertical: SizedMarginPadding.sizedMarginPaddingMedium_xx,
          horizontal: SizedMarginPadding.sizedMarginPaddingMedium_x,
        ),
        child: Row(
          children: [
            RenderSvgFile.getInstance
                .renderSvgFile(pathImage: pathIcon, colorIcon: colorIcon),
            SizedBox(width: SizedSpace.sizedSpaceMedium_xx),
            Expanded(
              child: Text(title),
            ),
            Container(
              padding: EdgeInsets.all(SizedBorderRadius.borderRadiusTiny_xx),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: ColorsCustom.grey5,
              ),
              child: Icon(Icons.chevron_right, color: ColorsCustom.grey3),
            )
          ],
        ),
      ),
    );
  }
}
