// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hive_add_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AddDataHiveAdapter extends TypeAdapter<AddDataHive> {
  @override
  final int typeId = 0;

  @override
  AddDataHive read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AddDataHive(
      namePengeluaran: fields[0] as String,
      idCategory: fields[1] as int,
      pathIconCategory: fields[2] as String,
      colorIconCategory: fields[3] as String,
      category: fields[4] as String,
      tanggalPengeluaran: fields[5] as String,
      nominal: fields[6] as int,
      createdAt: fields[7] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, AddDataHive obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.namePengeluaran)
      ..writeByte(1)
      ..write(obj.idCategory)
      ..writeByte(2)
      ..write(obj.pathIconCategory)
      ..writeByte(3)
      ..write(obj.colorIconCategory)
      ..writeByte(4)
      ..write(obj.category)
      ..writeByte(5)
      ..write(obj.tanggalPengeluaran)
      ..writeByte(6)
      ..write(obj.nominal)
      ..writeByte(7)
      ..write(obj.createdAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AddDataHiveAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
