import 'package:data/const/sized_border_radius.dart';
import 'package:data/const/sized_margin_padding.dart';
import 'package:data/const/sized_space.dart';
import 'package:dot_test/app/res/path_image_icon.dart';
import 'package:dot_test/app/res/styles.dart';
import 'package:flutter/material.dart';
import 'package:services/internal_services/render_svg_file.dart';
import 'package:services/utils/extension_custom.dart';

class CustomCard {
  CustomCard._privateConstructor();

  static final CustomCard _instance = CustomCard._privateConstructor();

  static CustomCard get getInstance => _instance;

  Widget cardPengeluaran({String title = "", int nominal = 0}) {
    return Expanded(
      flex: 1,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: SizedMarginPadding.sizedMarginPaddingSmall_xx,
          vertical: SizedMarginPadding.sizedMarginPaddingSmall_xx,
        ),
        decoration: StylesCustom.getInstance
            .boxDecorationPengeluaran(colorBackground: Colors.blueGrey),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title),
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
      decoration: StylesCustom.getInstance
          .boxDecorationPengeluaran(colorBackground: Colors.blueGrey),
      child: Column(
        children: [
          Image.asset(PathIcon.basePath + pathIcon),
          Text(title),
          Text("Rp. ${nominal.toMoneyIdrFormat()}"),
        ],
      ),
    );
  }

  Widget cardList(
      {String pathIcon = "",
      String title = "",
      int nominal = 0,
      int colorHex = 0}) {
    return Container(
      decoration: StylesCustom.getInstance
          .boxDecorationPengeluaran(colorBackground: Colors.blueGrey),
      child: Row(
        children: [
          RenderSvgFile.getInstance
              .renderSvgFile(pathImage: PathIcon.basePath+pathIcon, colorIcon: Color(colorHex)),
          Expanded(
            child: Text(title),
          ),
          Text("Rp. ${nominal.toMoneyIdrFormat()}"),
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
                color: Colors.grey,
              ),
              child: Icon(Icons.chevron_right),
            )
          ],
        ),
      ),
    );
  }
}
