import 'package:data/const/sized_border_radius.dart';
import 'package:data/const/sized_font.dart';
import 'package:data/const/sized_font_weight.dart';
import 'package:data/const/sized_margin_padding.dart';
import 'package:data/const/sized_space.dart';
import 'package:dot_test/app/common_widgets/button_custom.dart';
import 'package:dot_test/app/common_widgets/custom_card.dart';
import 'package:dot_test/app/common_widgets/text_form_custom.dart';
import 'package:dot_test/app/res/colors.dart';
import 'package:dot_test/app/res/path_image_icon.dart';

import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/tambah_pengeluaran_baru_controller.dart';

class TambahPengeluaranBaruView
    extends GetView<TambahPengeluaranBaruController> {
  void showBottomSheet({required BuildContext context}) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return Container(
          padding:
              EdgeInsets.all(SizedMarginPadding.sizedMarginPaddingNormal_xx),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(SizedBorderRadius.borderRadiusMedium_x),
              topRight: Radius.circular(SizedBorderRadius.borderRadiusMedium_x),
            ),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "title_pilih_kategori".tr,
                    style: TextStyle(
                      fontSize: SizedFont.textMedium_xx,
                      fontWeight: SizedFontWeight.textBoldLight,
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.close),
                    onPressed: () => Get.back(),
                  ),
                ],
              ),
              SizedBox(height: SizedSpace.sizedSpaceNormal),
              Expanded(
                child: GridView.count(
                  crossAxisCount: 3,
                  childAspectRatio: 2 / 1.7,
                  children: controller.dataListCategory
                      .map(
                        (e) => GestureDetector(
                          onTap: () => controller.onTapCateogry(e),
                          child: Container(
                            child: Column(
                              children: [
                                Image.asset(
                                    PathIcon.basePath + e.pathImageRounded),
                                SizedBox(height: SizedSpace.sizedSpaceSmall_xx),
                                Text(e.title,
                                    style:
                                        TextStyle(color: ColorsCustom.grey3)),
                              ],
                            ),
                          ),
                        ),
                      )
                      .toList(),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('title_tambah_pengeluaran_baru'.tr),
        centerTitle: true,
        elevation: 0,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(
            horizontal: SizedMarginPadding.sizedMarginPaddingSmatphone),
        child: ListView(
          children: [
            TextFormCustom.getInstance.textFormCustom(
              hintText: "hint_text_nama_pengeluaran".tr,
              onTap: () {},
              onChange: (value) => controller.onChange(),
              controller: controller.formNamaPengeluaran,
              suffixIcon: Visibility(visible: false, child: Container()),
            ),
            Obx(
              () => CustomCard.getInstance.cardChooseCatgory(
                title: controller.dataCategory.value.title,
                pathIcon:
                    PathIcon.basePath + controller.dataCategory.value.pathImage,
                colorIcon: Color(
                    int.parse(controller.dataCategory.value.colorHexIcon)),
                onTap: () => showBottomSheet(context: context),
              ),
            ),
            Obx(
              () => TextFormCustom.getInstance.textFormCustom(
                onChange: (value) => controller.onChange(),
                hintText: "hint_text_tanggal_pengeluaran".tr,
                suffixIcon: Icon(Icons.date_range),
                onTap: () => controller.setTanggalPengeluaran(context: context),
                controller: controller.formTanggalPengeluaran.value,
              ),
            ),
            TextFormCustom.getInstance.textFormCustom(
              hintText: "hint_text_nominal_pengeluaran".tr,
              onChange: (value) => controller.onChange(),
              textInputType: TextInputType.number,
              onTap: () {},
              suffixIcon: Visibility(visible: false, child: Container()),
              controller: controller.formNominalPengeluaran,
            ),
            SizedBox(height: SizedSpace.sizedSpaceNormal_xx),
            Obx(
              () => ButtonCustom.getInstance.buttonCustomNormal(
                title: "button_simpan".tr,
                colorBackground: (controller.enableButton.value)
                    ? ColorsCustom.blueFlat
                    : ColorsCustom.grey5,
                onTap: () => controller.addData(
                  namaPengeluaran: controller.formNamaPengeluaran.value.text,
                  nominal: int.parse(
                    controller.formNominalPengeluaran.value.text,
                  ),
                  titleCategory: controller.dataCategory.value.title,
                  tanggalPengeluaran:
                      controller.formTanggalPengeluaran.value.text,
                  pathIconCategory: controller.dataCategory.value.pathImage,
                  colorPathIconCategory:
                      controller.dataCategory.value.colorHexIcon,
                  idCategory: controller.dataCategory.value.id,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
