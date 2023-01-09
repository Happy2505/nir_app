import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import '../database/hive_names.dart';
import '../database/info.dart';

class FurnitureListModel extends ChangeNotifier {
  FurnitureListModel(int index){
    index = index;
  }
  var index;
  void addFavorite() async{
    if (!Hive.isAdapterRegistered(0)) {
      Hive.registerAdapter(FavoriteAdapter());
    }
    final box =  await Hive.openBox<Favorite>(HiveBoxes.favorite);
    await box.add(Favorite(id: index));
  }
}