import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:nir_app/database/hive_names.dart';
import 'package:nir_app/database/info.dart';

class AddFavorite extends ChangeNotifier{
  AddFavorite() {
    lalala();
  }
  var infoBox = <Favorite>[];
  late var length = 0;



  void lalala() async{
    if (!Hive.isAdapterRegistered(0)) {
      Hive.registerAdapter(FavoriteAdapter());
    }
    final box = await Hive.openBox<Favorite>(HiveBoxes.favorite);
    length = box.values.length;
    for(int i = 0; i < length; i++){
      infoBox.add(box.getAt(i)!) ;
    }
    box.listenable().addListener(() {
      infoBox = <Favorite>[];
      length = box.values.length;
      for(int i = 0; i < length; i++){
        infoBox.add(box.getAt(i)!) ;
      }
      notifyListeners();
    });
    notifyListeners();
    box.add(Favorite(id: 5));
  }

  void deletedPlane(int planeIndex) async{
    if (!Hive.isAdapterRegistered(0)) {
      Hive.registerAdapter(FavoriteAdapter());
    }
    final box =  await Hive.openBox<Favorite>(HiveBoxes.favorite);
    await box.deleteAt(planeIndex);
  }
}
