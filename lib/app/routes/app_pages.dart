import 'package:get/get.dart';

import 'package:dot_test/app/modules/home/bindings/home_binding.dart';
import 'package:dot_test/app/modules/home/views/home_view.dart';
import 'package:dot_test/app/modules/tambah_pengeluaran_baru/bindings/tambah_pengeluaran_baru_binding.dart';
import 'package:dot_test/app/modules/tambah_pengeluaran_baru/views/tambah_pengeluaran_baru_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.TAMBAH_PENGELUARAN_BARU,
      page: () => TambahPengeluaranBaruView(),
      binding: TambahPengeluaranBaruBinding(),
    ),
  ];
}
