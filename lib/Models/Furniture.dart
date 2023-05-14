import 'package:json_annotation/json_annotation.dart';

part 'Furniture.g.dart';

@JsonSerializable(explicitToJson: true)
class AllFurniture {
  final List<Furniture> list;

  factory AllFurniture.fromJson(List<dynamic> json) => AllFurniture(json.map((e) => Furniture.fromJson(e)).toList());


  AllFurniture(this.list);

  Map<String, dynamic> toJson() => _$AllFurnitureToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Furniture {
  final int id;
  final String name;
  final String description;
  final String img;
  final String modelUrl;
  final String catName;

  Furniture(this.id, this.name, this.description, this.img, this.modelUrl,
      this.catName);

  factory Furniture.fromJson(Map<String, dynamic> json) =>
      _$FurnitureFromJson(json);

  Map<String, dynamic> toJson() => _$FurnitureToJson(this);
}
