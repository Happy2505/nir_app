import 'package:hive/hive.dart';

part 'info.g.dart';

@HiveType(typeId: 1)
class Info extends HiveObject {
  @HiveField(0)
  int id;
  @HiveField(1)
  String urlFurniture;
  @HiveField(2)
  double positionX;
  @HiveField(3)
  double positionY;
  @HiveField(4)
  double positionZ;
  @HiveField(5)
  double rotation;

  Info({
    required this.id,
    required this.urlFurniture,
    required this.positionX,
    required this.positionY,
    required this.positionZ,
    required this.rotation,
  });
}
