import 'package:data/const/sized_font.dart';
import 'package:data/const/sized_margin_padding.dart';
import 'package:data/const/sized_space.dart';
import 'package:dot_test/app/common_widgets/custom_card.dart';
import 'package:dot_test/app/res/colors.dart';
import 'package:dot_test/app/res/styles.dart';

import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: ListView(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: SizedMarginPadding.sizedMarginPaddingSmatphone),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: SizedSpace.sizedSpaceLarge_x),
                    Text(
                      "title_halo_user".tr,
                      style: StylesCustom.getInstance
                          .textStyleBoldTitle(fontSize: SizedFont.textLarge_x),
                    ),
                    SizedBox(height: SizedSpace.sizedSpaceSmall_xx),
                    Text(
                      "title_jangan_lupa_catat_keuanganmu".tr,
                      style: TextStyle(
                        color: ColorsCustom.grey3,
                      ),
                    ),
                    SizedBox(height: SizedSpace.sizedSpaceLarge_x),
                    Obx(
                      () => Row(
                        children: [
                          CustomCard.getInstance.cardPengeluaran(
                            title: "title_pengeluaranmu_hari_ini".tr,
                            nominal: controller.pengeluaranHariIni.value,
                            colorBackground: ColorsCustom.blueFlat,
                          ),
                          SizedBox(width: SizedSpace.sizedSpaceNormal_x),
                          CustomCard.getInstance.cardPengeluaran(
                            title: "title_pengeluaranmu_bulan_ini".tr,
                            nominal: controller.pengeluaranBulanIni.value,
                            colorBackground: ColorsCustom.greenTeal,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: SizedSpace.sizedSpaceLarge_x),
                    Text(
                      "title_pengeluaran_berdasarkan_kategori".tr,
                      style: StylesCustom.getInstance.textStyleBoldTitle(),
                    ),
                  ],
                ),
              ),
              SizedBox(height: SizedSpace.sizedSpaceSmall_xx),
              Obx(
                () => (controller.thereIsChange.value.isNegative)
                    ? Container()
                    : SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            SizedBox(
                                width: SizedMarginPadding
                                    .sizedMarginPaddingSmatphone),
                            Row(
                              children: controller.dataListCategory
                                  .map(
                                    (e) => CustomCard.getInstance.cardKategori(
                                      pathIcon: e.pathImageRounded,
                                      title: e.title,
                                      nominal:
                                          controller.getNominalCategory(e.id),
                                    ),
                                  )
                                  .toList(),
                            ),
                          ],
                        ),
                      ),
              ),
              SizedBox(height: SizedSpace.sizedSpaceNormal_x),
              Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: SizedMarginPadding.sizedMarginPaddingSmatphone),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "title_hari_ini".tr,
                      style: StylesCustom.getInstance.textStyleBoldTitle(),
                    ),
                    SizedBox(height: SizedSpace.sizedSpaceLarge),
                    Obx(
                      () => ListView.builder(
                        itemCount: controller.dataListHiveHariIni.length,
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        reverse: true,
                        itemBuilder: (context, index) {
                          return CustomCard.getInstance.cardList(
                            title: controller
                                .dataListHiveHariIni[index].namePengeluaran,
                            nominal:
                                controller.dataListHiveHariIni[index].nominal,
                            pathIcon: controller
                                .dataListHiveHariIni[index].pathIconCategory,
                            colorHex: int.parse(controller
                                .dataListHiveHariIni[index].colorIconCategory),
                          );
                        },
                      ),
                    ),
                    SizedBox(height: SizedSpace.sizedSpaceNormal_x),
                    Text(
                      "title_kemarin".tr,
                      style: StylesCustom.getInstance.textStyleBoldTitle(),
                    ),
                    SizedBox(height: SizedSpace.sizedSpaceLarge),
                    Obx(
                      () => ListView.builder(
                        itemCount: controller.dataListHiveKemarinIni.length,
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        reverse: true,
                        itemBuilder: (context, index) {
                          return CustomCard.getInstance.cardList(
                            title: controller
                                .dataListHiveKemarinIni[index].namePengeluaran,
                            nominal: controller
                                .dataListHiveKemarinIni[index].nominal,
                            pathIcon: controller
                                .dataListHiveKemarinIni[index].pathIconCategory,
                            colorHex: int.parse(controller
                                .dataListHiveKemarinIni[index]
                                .colorIconCategory),
                          );
                        },
                      ),
                    ),
                    SizedBox(height: SizedSpace.sizedSpaceSuperLarge_xx),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: ColorsCustom.blueFlat,
        onPressed: () => controller.tambahData(),
        child: const Icon(
          Icons.add,
          color: Colors.white,
          size: 35,
        ),
      ),
    );
  }
}
