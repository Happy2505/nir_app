// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'save.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SafePlan _$SafePlanFromJson(Map<String, dynamic> json) => SafePlan(
      json['id'] as int,
      (json['info'] as List<dynamic>)
          .map((e) => Description.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SafePlanToJson(SafePlan instance) => <String, dynamic>{
      'id': instance.id,
      'info': instance.info.map((e) => e.toJson()).toList(),
    };

Description _$DescriptionFromJson(Map<String, dynamic> json) => Description(
      json['urlFurniture'] as String,
      (json['positionX'] as num).toDouble(),
      (json['positionY'] as num).toDouble(),
      (json['positionZ'] as num).toDouble(),
      (json['rotation'] as num).toDouble(),
    );

Map<String, dynamic> _$DescriptionToJson(Description instance) =>
    <String, dynamic>{
      'urlFurniture': instance.urlFurniture,
      'positionX': instance.positionX,
      'positionY': instance.positionY,
      'positionZ': instance.positionZ,
      'rotation': instance.rotation,
    };
