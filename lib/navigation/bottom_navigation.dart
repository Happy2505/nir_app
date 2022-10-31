import 'package:flutter/material.dart';
import 'package:nir_app/Theme/app_color.dart';
import 'package:nir_app/navigation/tab.dart';

const Map<TabItem, MyTab> tabs = {
  TabItem.Katalog1: MyTab(name: "Главная", icon: Icons.home_filled),
  TabItem.Katalog2: MyTab(name: "Профиль", icon: Icons.account_circle_rounded),
};

class MyBottomNavigation extends StatelessWidget {
  const MyBottomNavigation(
      {super.key, required this.currentTab, required this.onSelectTab});

  final TabItem currentTab;

  final ValueChanged<TabItem> onSelectTab;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      selectedItemColor: AppColors.mainDark,
        backgroundColor: const Color.fromARGB(255, 232, 232, 232),
        selectedFontSize: 15,
        iconSize: 25,
        type: BottomNavigationBarType.fixed,
        currentIndex: currentTab.index,
        items: [
          _buildItem(TabItem.Katalog1),
          _buildItem(TabItem.Katalog2),
        ],
        onTap: (index) => onSelectTab(TabItem.values[index]));
  }

  BottomNavigationBarItem _buildItem(TabItem item) {
    return BottomNavigationBarItem(
      icon: Icon(
        _iconTabMatching(item),
      ),
      label: tabs[item]!.name,
    );
  }

  // получаем иконку элемента
  IconData _iconTabMatching(TabItem item) => tabs[item]!.icon;
}
