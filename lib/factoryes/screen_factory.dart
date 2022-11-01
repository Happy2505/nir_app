import 'package:flutter/material.dart';
import 'package:nir_app/ar_screen/ar_screen_widget.dart';
import 'package:provider/provider.dart';

import '../ar_screen/ar_screen_model.dart';

class ScreenFactory {
  Widget ARScreen(int index) {
    return ChangeNotifierProvider(
      create: (_) => ARScreenModel(index),
      child: ARScreenidget(),
    );
  }
}