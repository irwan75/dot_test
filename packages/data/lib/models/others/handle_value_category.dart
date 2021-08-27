import 'dart:convert';

class HandleValueCategory {
  int id;
  int nominal;
  HandleValueCategory({
    required this.id,
    required this.nominal,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nominal': nominal,
    };
  }

  factory HandleValueCategory.fromMap(Map<String, dynamic> map) {
    return HandleValueCategory(
      id: map['id'],
      nominal: map['nominal'],
    );
  }

  String toJson() => json.encode(toMap());

  factory HandleValueCategory.fromJson(String source) =>
      HandleValueCategory.fromMap(json.decode(source));
}
