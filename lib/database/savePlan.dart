// import 'package:hive/hive.dart';
// import 'package:nir_app/database/info.dart';
//
// part 'savePlan.g.dart';
//
// @HiveType(typeId: 0)
// class SavePlan extends HiveObject {
//   @HiveField(0)
//   int id;
//   @HiveField(1)
//   DateTime data;
//   @HiveField(2)
//   String name;
//   @HiveField(3)
//   HiveList<Info>? furniture;
//
//   SavePlan({
//     required this.id,
//     required this.data,
//     required this.name,
//   });
//
//   void addFurnitureInfo(Box<Info> box, Info info){
//     furniture ??= HiveList(box);
//     furniture?.add(info);
//   }
// }
