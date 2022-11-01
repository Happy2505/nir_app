import 'package:flutter/material.dart';
import 'package:nir_app/ar_screen/ar_screen_widget.dart';
import 'package:nir_app/navigation/home_page.dart';
import 'package:nir_app/start_screen/start_screen_widget.dart';
import 'package:nir_app/welcome_screen/welcome_screen_widget.dart';

import 'catalog_furniture_screen/catalog_furniture.dart';
import 'furniture_list_screen/furniture_list_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => const StartScreenWidget(),
        '/welcome': (context) => const WelcomeScreenWidget(),
        '/home': (context) => const HomePage(),
        '/catalog': (context) => const CatalogFurniture(),
        '/catalog/furnitureList': (context) => FurnitureListWidget(),
        '/catalog/furnitureList/arFurniture': (context) => ARScreenidget(),
      },
      theme: ThemeData(
        fontFamily: 'Jost',
        appBarTheme: const AppBarTheme(
          backgroundColor: Color.fromARGB(255, 244, 244, 244),
          elevation: 0
        ),
      ),
      title: 'Lorem',
      // home: const Main(),
    );
  }
}

class Main extends StatefulWidget {
  const Main({Key? key}) : super(key: key);

  @override
  State<Main> createState() => _MainState();
}

class _MainState extends State<Main> {

  @override
  Widget build(BuildContext context) {
    return const StartScreenWidget();
  }
}
