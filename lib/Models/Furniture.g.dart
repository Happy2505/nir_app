// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Furniture.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AllFurniture _$AllFurnitureFromJson(Map<String, dynamic> json) => AllFurniture(
      (json['list'] as List<dynamic>)
          .map((e) => Furniture.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AllFurnitureToJson(AllFurniture instance) =>
    <String, dynamic>{
      'list': instance.list.map((e) => e.toJson()).toList(),
    };

Furniture _$FurnitureFromJson(Map<String, dynamic> json) => Furniture(
      json['id'] as int,
      json['name'] as String,
      json['description'] as String,
      json['img'] as String,
      json['modelUrl'] as String,
      json['catName'] as String,
    );

Map<String, dynamic> _$FurnitureToJson(Furniture instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'img': instance.img,
      'modelUrl': instance.modelUrl,
      'catName': instance.catName,
    };
