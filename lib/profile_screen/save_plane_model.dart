import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:nir_app/database/hive_names.dart';
import 'package:nir_app/database/info.dart';
import 'package:nir_app/database/savePlan.dart';

class SavePlaneModel extends ChangeNotifier{
  SavePlaneModel() {
    lalala();
  }
  var listBox = <SavePlan>[];
  late var length = 0;

  void lalala() async{
    if (!Hive.isAdapterRegistered(0)) {
      Hive.registerAdapter(SavePlanAdapter());
    }
    final box = await Hive.openBox<SavePlan>(HiveBoxes.savePlan);
    if (!Hive.isAdapterRegistered(1)) {
      Hive.registerAdapter(InfoAdapter());
    }
    await Hive.openBox<Info>(HiveBoxes.info);
    // box.add(SavePlan(id: 5, idFurniture: 4, positionX: 1, positionY: 1,positionZ: 1,rotation: 1,name: "name", data: DateTime.now()));
    listBox = box.values.toList();
    box.listenable().addListener(() {
      listBox = box.values.toList();
      notifyListeners();
    });
    // box.add(SavePlan(id: 5, idFurniture: 4, positionX: 1, positionY: 1,positionZ: 1,rotation: 1,name: "name", data: DateTime.now()));
  }

  void deletedPlane(int planeIndex) async{
    if (!Hive.isAdapterRegistered(0)) {
      Hive.registerAdapter(SavePlanAdapter());
    }
    final box =  await Hive.openBox<SavePlan>(HiveBoxes.savePlan);
    await box.getAt(planeIndex)?.furniture?.deleteAllFromHive();
    await box.deleteAt(planeIndex);
  }

  void showSavePlane(BuildContext context, int planeIndex) async{
    if (!Hive.isAdapterRegistered(0)) {
      Hive.registerAdapter(SavePlanAdapter());
    }
    final box = await Hive.openBox<SavePlan>(HiveBoxes.savePlan);
    final planeKey = box.keyAt(planeIndex) as int;

    Navigator.of(context).pushNamed('/groups/tasks', arguments: planeKey);
  }
}