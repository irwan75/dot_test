

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:services/internal_services/hive_helper.dart';

import 'app/res/thema.dart';
import 'app/routes/app_pages.dart';
import 'generated/locales.g.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await HiveHelper.getInstance.initializeSetup();

  runApp(
    GetMaterialApp(
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      translationsKeys: AppTranslation.translations,
      locale: Locale('id_ID'),
      theme: ThemaCustom.lightTheme,
    ),
  );
}
