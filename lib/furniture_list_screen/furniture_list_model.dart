import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import '../database/hive_names.dart';
import '../database/info.dart';

class FurnitureListModel extends ChangeNotifier {
  FurnitureListModel(String index){
    indexx = index;
  }
  String indexx='';
}