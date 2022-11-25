import 'package:json_annotation/json_annotation.dart';
import 'package:vector_math/vector_math_64.dart';

part 'save.g.dart';

@JsonSerializable(explicitToJson: true)
class SafePlan {
  final int id;
  final List<Description> info;

  SafePlan(this.id, this.info);


  factory SafePlan.fromJson(Map<String, dynamic> json) =>
      _$SafePlanFromJson(json);


  Map<String, dynamic> toJson() => _$SafePlanToJson(this);
}

@JsonSerializable()
class Description {
  final int idFurniture;
  final double positionX;
  final double positionY;
  final double positionZ;
  final double rotation;

  Description(this.idFurniture, this.positionX, this.positionY, this.positionZ, this.rotation);



  factory Description.fromJson(Map<String, dynamic> json) =>
      _$DescriptionFromJson(json);


  Map<String, dynamic> toJson() => _$DescriptionToJson(this);
}
