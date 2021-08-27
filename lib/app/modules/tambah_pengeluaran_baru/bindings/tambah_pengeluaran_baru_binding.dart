import 'package:get/get.dart';

import '../controllers/tambah_pengeluaran_baru_controller.dart';

class TambahPengeluaranBaruBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TambahPengeluaranBaruController>(
      () => TambahPengeluaranBaruController(),
    );
  }
}
