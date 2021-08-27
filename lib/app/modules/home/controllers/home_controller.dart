import 'package:data/models/local_database/hive_add_model.dart';
import 'package:data/models/others/data_list_kategori.dart';
import 'package:dot_test/app/res/data_dummy.dart';
import 'package:dot_test/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:services/internal_services/hive_helper.dart';
import 'package:services/utils/formatter_custom.dart';

class HomeController extends GetxController {
  List<AddDataHive> dataListHiveHariIni = <AddDataHive>[].obs;
  List<AddDataHive> dataListHiveKemarinIni = <AddDataHive>[].obs;

  Rx<int> pengeluaranHariIni = 0.obs;
  Rx<int> pengeluaranBulanIni = 0.obs;

  List<DataListCategory> dataListCategory = [];

  Rx<int> thereIsChange = 0.obs;

  @override
  void onInit() {
    super.onInit();
    initializeData();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  void initializeData() {
    initializeValue();
    for (AddDataHive data in HiveHelper.getInstance.readDataHive) {
      var resultDate = FormatterCustom.getInstance
          .convertStringtoDate(date: data.tanggalPengeluaran);
      getPengeluaranHariIni(data, resultDate);
      getPengeluaranBulanIni(data, resultDate);
      addDataLisHiveHariIni(data, resultDate);
      addDataLisHiveBulanIni(data, resultDate);
    }
  }

  void initializeValue() {
    dataListCategory =
        SetDataListCategory.fromMap(dataDummyListKategori).dataList;
  }

  void getPengeluaranHariIni(AddDataHive data, DateTime resultDate) {
    if (resultDate.month == DateTime.now().month &&
        resultDate.day == DateTime.now().day &&
        resultDate.year == DateTime.now().year)
      pengeluaranHariIni.value += data.nominal;
  }

  void getPengeluaranBulanIni(AddDataHive data, DateTime resultDate) {
    if (resultDate.month == DateTime.now().month &&
        resultDate.year == DateTime.now().year)
      pengeluaranBulanIni.value += data.nominal;
  }

  void tambahData() async {
    var resultAwait = await Get.toNamed(Routes.TAMBAH_PENGELUARAN_BARU);
    if (resultAwait != null) {
      var resultDate = FormatterCustom.getInstance.convertStringtoDate(
          date: (resultAwait as AddDataHive).tanggalPengeluaran);
      getPengeluaranHariIni(resultAwait, resultDate);
      getPengeluaranBulanIni(resultAwait, resultDate);
      addDataLisHiveHariIni(resultAwait, resultDate);
      addDataLisHiveBulanIni(resultAwait, resultDate);
      thereIsChange.value++;
    }
  }

  void addDataLisHiveHariIni(AddDataHive resultAwait, DateTime resultDate) {
    if (resultDate.day == DateTime.now().day &&
        resultDate.month == DateTime.now().month)
      dataListHiveHariIni.add(resultAwait);
  }

  void addDataLisHiveBulanIni(AddDataHive resultAwait, DateTime resultDate) {
    if (resultDate.day == DateTime.now().add(Duration(days: -1)).day &&
        resultDate.month == DateTime.now().month)
      dataListHiveKemarinIni.add(resultAwait);
  }

  int getNominalCategory(int id) {
    int total = 0;
    for (AddDataHive data in HiveHelper.getInstance.readDataHive) {
      if (data.idCategory == id) total += data.nominal;
    }
    return total;
  }
}
