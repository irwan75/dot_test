import 'dart:convert';

class DataListCategory {
  int id;
  String title;
  String pathImage;
  String pathImageRounded;
  String colorHexIcon;
  DataListCategory({
    required this.id,
    required this.title,
    required this.pathImage,
    required this.pathImageRounded,
    required this.colorHexIcon,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'pathImage': pathImage,
      'pathImageRounded': pathImageRounded,
      'colorHexIcon': colorHexIcon,
    };
  }

  factory DataListCategory.fromMap(Map<String, dynamic> map) {
    return DataListCategory(
      id: map['id'],
      title: map['title'],
      pathImage: map['pathImage'],
      pathImageRounded: map['pathImageRounded'],
      colorHexIcon: map['colorHexIcon'],
    );
  }

  String toJson() => json.encode(toMap());

  factory DataListCategory.fromJson(String source) =>
      DataListCategory.fromMap(json.decode(source));
}

class SetDataListCategory {
  List<DataListCategory> dataList;
  SetDataListCategory({
    required this.dataList,
  });
  

  Map<String, dynamic> toMap() {
    return {
      'dataList': dataList.map((x) => x.toMap()).toList(),
    };
  }

  factory SetDataListCategory.fromMap(Map<String, dynamic> map) {
    return SetDataListCategory(
      dataList: List<DataListCategory>.from(map['dataList']?.map((x) => DataListCategory.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory SetDataListCategory.fromJson(String source) => SetDataListCategory.fromMap(json.decode(source));
}
