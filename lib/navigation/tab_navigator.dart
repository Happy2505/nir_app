import 'package:flutter/material.dart';
import 'package:nir_app/catalog_furniture_screen/catalog_furniture.dart';
import 'package:nir_app/navigation/tab.dart';
import 'package:nir_app/profile_screen/proile_widget.dart';

import '../auth_widget/auth_widget.dart';

class TabNavigator extends StatelessWidget {
  TabNavigator({super.key, required this.navigatorKey, required this.tabItem});

  final GlobalKey<NavigatorState> navigatorKey;
  final TabItem tabItem;

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      onGenerateRoute: (routeSettings) {
        Widget currentPage;
        if (tabItem == TabItem.Katalog1) {
          currentPage = CatalogFurniture();
        } else if (tabItem == TabItem.Katalog2) {
          currentPage = ProfileWidget();
        } else {
          currentPage = CatalogFurniture();
        }

        return MaterialPageRoute(builder: (context) => currentPage);
      },
    );
  }
}
