import 'package:hive/hive.dart';

part 'savePlan.g.dart';

@HiveType(typeId: 0)
class SavePlan extends HiveObject {
  @HiveField(0)
  int id;
  @HiveField(1)
  int idFurniture;
  @HiveField(2)
  double positionX;
  @HiveField(3)
  double positionY;
  @HiveField(4)
  double positionZ;
  @HiveField(5)
  double rotation;
  @HiveField(6)
  DateTime data;
  @HiveField(7)
  String name;

  SavePlan({
    required this.id,
    required this.idFurniture,
    required this.positionX,
    required this.positionY,
    required this.positionZ,
    required this.rotation,
    required this.data,
    required this.name,
  });
}
