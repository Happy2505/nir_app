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
      idFurniture: fields[1] as int,
      positionX: fields[2] as double,
      positionY: fields[3] as double,
      positionZ: fields[4] as double,
      rotation: fields[5] as double,
      data: fields[6] as DateTime,
      name: fields[7] as String,
    );
  }

  @override
  void write(BinaryWriter writer, SavePlan obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.idFurniture)
      ..writeByte(2)
      ..write(obj.positionX)
      ..writeByte(3)
      ..write(obj.positionY)
      ..writeByte(4)
      ..write(obj.positionZ)
      ..writeByte(5)
      ..write(obj.rotation)
      ..writeByte(6)
      ..write(obj.data)
      ..writeByte(7)
      ..write(obj.name);
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
