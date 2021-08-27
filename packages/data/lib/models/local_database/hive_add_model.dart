import 'dart:convert';

import 'package:hive_flutter/adapters.dart';

part 'hive_add_model.g.dart';

@HiveType(typeId: 0)
class AddDataHive extends HiveObject {

  @HiveField(0)
  String namePengeluaran;

  @HiveField(1)
  int idCategory;

  @HiveField(2)
  String pathIconCategory;

  @HiveField(3)
  String colorIconCategory;

  @HiveField(4)
  String category;

  @HiveField(5)
  String tanggalPengeluaran;

  @HiveField(6)
  int nominal;

  @HiveField(7)
  DateTime createdAt;
  AddDataHive({
    required this.namePengeluaran,
    required this.idCategory,
    required this.pathIconCategory,
    required this.colorIconCategory,
    required this.category,
    required this.tanggalPengeluaran,
    required this.nominal,
    required this.createdAt,
  });

  Map<String, dynamic> toMap() {
    return {
      'namePengeluaran': namePengeluaran,
      'idCategory': idCategory,
      'pathIconCategory': pathIconCategory,
      'colorIconCategory': colorIconCategory,
      'category': category,
      'tanggalPengeluaran': tanggalPengeluaran,
      'nominal': nominal,
      'createdAt': createdAt.millisecondsSinceEpoch,
    };
  }

  factory AddDataHive.fromMap(Map<String, dynamic> map) {
    return AddDataHive(
      namePengeluaran: map['namePengeluaran'],
      idCategory: map['idCategory'],
      pathIconCategory: map['pathIconCategory'],
      colorIconCategory: map['colorIconCategory'],
      category: map['category'],
      tanggalPengeluaran: map['tanggalPengeluaran'],
      nominal: map['nominal'],
      createdAt: DateTime.fromMillisecondsSinceEpoch(map['createdAt']),
    );
  }

  String toJson() => json.encode(toMap());

  factory AddDataHive.fromJson(String source) => AddDataHive.fromMap(json.decode(source));
}
