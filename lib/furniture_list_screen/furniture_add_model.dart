import 'package:flutter/material.dart';
import 'package:nir_app/Models/Furniture.dart';
import 'package:nir_app/domain/furniture_service.dart';


class FurnitureAddModel extends ChangeNotifier {

  final _furnitureService = FurnitureService();
  final _Allfurniture = <AllFurniture>[];
  final _furniture = <Furniture>[];

  FurnitureAddModel(){
    loadFurniture();
  }

  List<AllFurniture> get Allfurniture => List.unmodifiable(_Allfurniture);
  List<Furniture> get furniture => List.unmodifiable(_furniture);

  Future<void> loadFurniture() async {
    final furnitureResponse = await _furnitureService.getFurniture();
    _Allfurniture.add(furnitureResponse);

    for (int i = 0;i<_Allfurniture[0].list.length; i++){
      _furniture.add(_Allfurniture[0].list[i]);
    }
    notifyListeners();
  }
}