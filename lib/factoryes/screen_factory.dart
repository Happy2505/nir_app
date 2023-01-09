import 'package:flutter/material.dart';
import 'package:nir_app/ar_screen/ar_screen_widget.dart';
import 'package:nir_app/profile_screen/save_plane.dart';
import 'package:nir_app/profile_screen/save_plane_model.dart';
import 'package:provider/provider.dart';

import '../ar_screen/ar_screen_model.dart';
import '../ar_screen/load_save_furniture_model.dart';
import '../furniture_list_screen/furniture_list_model.dart';
import '../furniture_list_screen/furniture_list_widget.dart';

class ScreenFactory {
  Widget ARScreen(int index) {
    return ChangeNotifierProvider(
      create: (_) => ARScreenModel(index),
      child: const ARScreenWidget(),
    );
  }

  Widget SavePlanWidget() {
    return ChangeNotifierProvider(
      create: (_) => AddFavorite(),
      child: const SavePlanPage(),
    );
  }

  Widget FurniturePage(int index) {
    return ChangeNotifierProvider(
      create: (_) => FurnitureListModel(index),
      child: FurnitureListWidget(),
    );
  }
}

Widget ARScreen(int planeKey) {
  return ChangeNotifierProvider(
    create: (_) => LoadSaveFurnitureModel(planeKey),
    child: const ARScreenWidget(),
  );
}

