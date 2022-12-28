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
  var infoBox = <Info>[];
  late var length = 0;



  void lalala() async{
    if (!Hive.isAdapterRegistered(0)) {
      Hive.registerAdapter(SavePlanAdapter());
    }
    if (!Hive.isAdapterRegistered(1)) {
      Hive.registerAdapter(InfoAdapter());
    }
    final box = await Hive.openBox<SavePlan>(HiveBoxes.savePlan);
    print('object');
    final info = await Hive.openBox<Info>(HiveBoxes.info);
    length = box.values.length;
    for(int i = 0; i < length; i++){
      listBox.add(box.getAt(i)!) ;
    }
    // listBox = box.values.toList();
    // info.listenable().addListener(() {
    //   listBox = box.values.toList();
    //   notifyListeners();
    // });
    // box.add(SavePlan(id: 5, idFurniture: 4, positionX: 1, positionY: 1,positionZ: 1,rotation: 1,name: "name", data: DateTime.now()));
    // listBox = box.values.toList();
    // box.listenable().addListener(() {
    //   listBox = box.values.toList();
    //   notifyListeners();
    // });
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

  // void _loadPlane() async {
  //   final box = await _listBox;
  //   _listBox = box.get(groupKey);
  //   notifyListeners();
  // }
}

// class SavePlaneModel extends ChangeNotifier {
//   int groupKey;
//   late final Future<Box<SavePlan>> _savePlaneBox;
//   var _info = <Info>[];
//
//   List<Info> get info => _info.toList();
//
//   SavePlan? _plane;
//   SavePlan? get plane => _plane;
//
//   SavePlaneModel({required this.groupKey}) {
//     _setup();
//   }
//
//   void showForm(BuildContext context) {
//     Navigator.of(context).pushNamed('/groups/tasks/form', arguments: groupKey);
//   }
//
//   void _loadGroup() async {
//     final box = await _savePlaneBox;
//     _plane = box.get(groupKey);
//     notifyListeners();
//   }
//
//   void _readTasks() {
//     _info = _plane?.furniture ?? <Info>[];
//     notifyListeners();
//   }
//
//   void _setupListenTasks() async {
//     final box = await _savePlaneBox;
//     _readTasks();
//     box.listenable(keys: <dynamic>[groupKey]).addListener(_readTasks);
//   }
//
//   // void deleteTask(int groupIndex) async {
//   //   await _plane?.furniture?.deleteFromHive(groupIndex);
//   //   await _plane?.save();
//   // }
//
//   // void doneToggle(int groupIndex) async {
//   //   final task = group?.tasks?[groupIndex];
//   //   final currentState = task?.isDone ?? false;
//   //   task?.isDone = !currentState;
//   //   await task?.save();
//   //   notifyListeners();
//   // }
//
//   void _setup() {
//     if (!Hive.isAdapterRegistered(0)) {
//       Hive.registerAdapter(SavePlanAdapter());
//     }
//     _savePlaneBox = Hive.openBox<SavePlan>(HiveBoxes.savePlan);
//     if (!Hive.isAdapterRegistered(1)) {
//       Hive.registerAdapter(InfoAdapter());
//     }
//     Hive.openBox<Info>(HiveBoxes.info);
//     _loadGroup();
//     _setupListenTasks();
//   }
// }