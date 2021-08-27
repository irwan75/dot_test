import 'dart:io';
import 'dart:async';

import 'package:data/models/local_database/hive_add_model.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart' as pathProvider;

class HiveHelper {
  HiveHelper._privateConstructor();

  static final HiveHelper _instance = HiveHelper._privateConstructor();

  static HiveHelper get getInstance => _instance;

  late var box = Hive.box('dotTest');

  Future<void> initializeSetup() async {
    Directory directory = await pathProvider.getApplicationDocumentsDirectory();
    Hive.init(directory.path);
    await Hive.initFlutter();
    Hive.registerAdapter(AddDataHiveAdapter());
    await Hive.openBox('dotTest');
  }

  set addDataHive(AddDataHive person) => box.add(person);

  void deleteDataHive() {}

  void updateDataHive() {}

  get readDataHive => box.values.toList();
}
