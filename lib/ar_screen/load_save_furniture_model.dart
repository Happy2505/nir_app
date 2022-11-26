import 'package:flutter/material.dart';

class LoadSaveFurnitureModel extends ChangeNotifier{
  LoadSaveFurnitureModel(int planeKey){
    indexx = planeKey;
  }
  int indexx = 0;
}