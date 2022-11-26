// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'savePlan.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SavePlanAdapter extends TypeAdapter<SavePlan> {
  @override
  final int typeId = 0;

  @override
  SavePlan read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SavePlan(
      id: fields[0] as int,
      data: fields[1] as DateTime,
      name: fields[2] as String,
    )..furniture = (fields[3] as HiveList?)?.castHiveList();
  }

  @override
  void write(BinaryWriter writer, SavePlan obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.data)
      ..writeByte(2)
      ..write(obj.name)
      ..writeByte(3)
      ..write(obj.furniture);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SavePlanAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
