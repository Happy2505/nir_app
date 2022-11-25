import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:nir_app/database/hive_names.dart';
import 'package:nir_app/database/savePlan.dart';

class SavePlaneModel extends ChangeNotifier{
  SavePlaneModel() {
    lalala();
  }
  var listBox = <SavePlan>[];
  late var length = 0;

  void lalala() async{
    Box<SavePlan> box = Hive.box<SavePlan>(HiveBoxes.savePlan);
    box.add(SavePlan(id: 5, idFurniture: 4, positionX: 1, positionY: 1,positionZ: 1,rotation: 1,name: "name", data: DateTime.now()));
    length = box.values.length;
    for(int i = 0; i < length; i++){
      listBox.add(box.getAt(i)!) ;
    }
    box.listenable().addListener(() {
      listBox = <SavePlan>[];
      length = box.values.length;
      for(int i = 0; i < length; i++){
        listBox.add(box.getAt(i)!) ;
      }
      notifyListeners();
    });
    notifyListeners();
    // box.add(SavePlan(id: 5, idFurniture: 4, positionX: 1, positionY: 1,positionZ: 1,rotation: 1,name: "name", data: DateTime.now()));
  }

  void deletedPlane(int planeIndex) async{
    Box<SavePlan> box = Hive.box<SavePlan>(HiveBoxes.savePlan);
    await box.deleteAt(planeIndex);
  }
}