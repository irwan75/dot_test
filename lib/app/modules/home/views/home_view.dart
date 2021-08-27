import 'package:data/const/sized_margin_padding.dart';
import 'package:data/const/sized_space.dart';
import 'package:dot_test/app/common_widgets/custom_card.dart';
import 'package:dot_test/app/res/colors.dart';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:services/utils/extension_custom.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(
              horizontal: SizedMarginPadding.sizedMarginPaddingSmatphone),
          child: ListView(
            children: [
              SizedBox(height: SizedSpace.sizedSpaceMedium_xx),
              Text("Halo, User!"),
              Text("Jangan lupa catat keuanganmu setiap hari!"),
              Obx(
                () => Row(
                  children: [
                    CustomCard.getInstance.cardPengeluaran(
                      title: "title_pengeluaranmu_hari_ini".tr,
                      nominal: controller.pengeluaranHariIni.value,
                    ),
                    SizedBox(width: SizedSpace.sizedSpaceNormal_x),
                    CustomCard.getInstance.cardPengeluaran(
                      title: "title_pengeluaranmu_bulan_ini".tr,
                      nominal: controller.pengeluaranBulanIni.value,
                    ),
                  ],
                ),
              ),
              Text("Pengeluaran berdasarkan kategori"),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Obx(
                  () => (controller.thereIsChange.isNaN)
                      ? Container()
                      : Row(
                          children: controller.dataListCategory
                              .map(
                                (e) => CustomCard.getInstance.cardKategori(
                                  pathIcon: e.pathImageRounded,
                                  title: e.title,
                                  nominal: controller.getNominalCategory(e.id),
                                ),
                              )
                              .toList(),
                        ),
                ),
              ),
              Text("Hari Ini"),
              Obx(
                () => ListView.builder(
                  itemCount: controller.dataListHiveHariIni.length,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  reverse: true,
                  itemBuilder: (context, index) {
                    return CustomCard.getInstance.cardList(
                      title:
                          controller.dataListHiveHariIni[index].namePengeluaran,
                      nominal: controller.dataListHiveHariIni[index].nominal,
                      pathIcon: controller
                          .dataListHiveHariIni[index].pathIconCategory,
                      colorHex: int.parse(controller
                          .dataListHiveHariIni[index].colorIconCategory),
                    );
                  },
                ),
              ),
              Text("Kemarin"),
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
                      nominal: controller.dataListHiveKemarinIni[index].nominal,
                      pathIcon: controller
                          .dataListHiveKemarinIni[index].pathIconCategory,
                      colorHex: int.parse(controller
                          .dataListHiveKemarinIni[index].colorIconCategory),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => controller.tambahData(),
        child: const Icon(
          Icons.add,
          color: ColorsCustom.primaryColor,
        ),
      ),
    );
  }
}
