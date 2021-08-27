import 'package:data/models/local_database/hive_add_model.dart';
import 'package:dot_test/app/res/data_dummy.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:services/internal_services/get_time_picker.dart';
import 'package:services/internal_services/hive_helper.dart';
import 'package:services/utils/formatter_custom.dart';
import 'package:data/models/others/data_list_kategori.dart';

class TambahPengeluaranBaruController extends GetxController {
  var formNamaPengeluaran = new TextEditingController();
  var formTanggalPengeluaran =
      new Rx<TextEditingController>(TextEditingController(text: ""));
  var formNominalPengeluaran = new TextEditingController();

  List<DataListCategory> dataListCategory = [];

  Rx<bool> enableButton = false.obs;

  var dataCategory = Rx<DataListCategory>(
    DataListCategory(
        colorHexIcon: "0XFFF2C94C",
        id: 1,
        pathImage: "/icMakanan.svg",
        pathImageRounded: "/icRoundedMakanan.png",
        title: "Makanan"),
  );

  @override
  void onInit() {
    super.onInit();
    initializeValue();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  void initializeValue() {
    dataListCategory =
        SetDataListCategory.fromMap(dataDummyListKategori).dataList;
  }

  void setTanggalPengeluaran({required BuildContext context}) async {
    final dateGet =
        await GetTimePicker.getInstance.showDateTimePicker(context: context);
    if (dateGet != null) {
      formTanggalPengeluaran.value.text =
          FormatterCustom.getInstance.justFormatDate(dateTime: dateGet);
    }
    onChange();
  }

  void addData({
    String namaPengeluaran = "",
    int nominal = 0,
    String pathIconCategory = "",
    String titleCategory = "",
    String colorPathIconCategory = "",
    String tanggalPengeluaran = "",
    int idCategory = 0,
  }) {
    AddDataHive dataHive = AddDataHive(
      category: titleCategory,
      namePengeluaran: namaPengeluaran,
      nominal: nominal,
      tanggalPengeluaran: tanggalPengeluaran,
      pathIconCategory: pathIconCategory,
      createdAt: DateTime.now(),
      colorIconCategory: colorPathIconCategory,
      idCategory: idCategory,
    );

    HiveHelper.getInstance.addDataHive = dataHive;
    Get.back(result: dataHive);
  }

  void onTapCateogry(DataListCategory e) {
    Get.back();
    dataCategory.value = e;
  }

  void onChange() {
    if (!formNamaPengeluaran.value.text.isEmpty &&
        !formTanggalPengeluaran.value.text.isEmpty &&
        !formNominalPengeluaran.value.text.isEmpty) {
      enableButton.value = true;
    } else {
      enableButton.value = false;
    }
  }
}
