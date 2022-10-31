import 'package:flutter/material.dart';
import 'package:nir_app/navigation/tab.dart';
import 'bottom_navigation.dart';
import 'tab_navigator.dart';

// Наша главная страница будет содержать состояние
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  // GlobalKey будет хранить уникальный ключ,
  // по которому мы сможем получить доступ
  // к виджетам, которые уже находяться в иерархии
  // NavigatorState - состояние Navigator виджета
  final _navigatorKeys = {
    TabItem.Katalog1: GlobalKey<NavigatorState>(),
    TabItem.Katalog2: GlobalKey<NavigatorState>(),
  };

  // текущий выбранный элемент
  var _currentTab = TabItem.Katalog1;

  // выбор элемента меню
  void _selectTab(TabItem tabItem) {
    if (tabItem == _currentTab) {
      // pop to first route
      _navigatorKeys[tabItem]!.currentState!.popUntil((route) => route.isFirst);
    } else {
      setState(() => _currentTab = tabItem);
    }
  }
  @override

  Widget build(BuildContext context) {
    return WillPopScope(
      // логика обработки кнопки back может быть разной
      // здесь реализована следующая логика:
      // когда мы находимся на первом пункте меню (посты)
      // и нажимаем кнопку Back, то сразу выходим из приложения
      // в противном случае выбранный элемент меню переключается
      // на предыдущий: c заданий на альбомы, с альбомов на посты,
      // и после этого только выходим из приложения
      onWillPop: () async {
        final isFirstRouteInCurrentTab =
        !await _navigatorKeys[_currentTab]!.currentState!.maybePop();
        if (isFirstRouteInCurrentTab) {
          // if not on the 'main' tab
          if (_currentTab != TabItem.Katalog1) {
            // select 'main' tab
            _selectTab(TabItem.Katalog1);
            // back button handled by app
            return false;
          }
        }
        // let system handle back button if we're on the first route
        return isFirstRouteInCurrentTab;
      },
      child: Scaffold(
        // Stack размещает один элемент над другим
        // Проще говоря, каждый экран будет находится
        // поверх другого, мы будем только переключаться между ними
        body: Stack(children: <Widget>[
          _buildOffstageNavigator(TabItem.Katalog1),
          _buildOffstageNavigator(TabItem.Katalog2),
        ]),
        // MyBottomNavigation мы создадим позже
        bottomNavigationBar: MyBottomNavigation(
          currentTab: _currentTab,
          onSelectTab: _selectTab,
        ),
      ),);
  }

  // Создание одного из экранов - посты, альбомы или задания
  Widget _buildOffstageNavigator(TabItem tabItem) {
    return Offstage(
      // Offstage работает следующим образом:
      // если это не текущий выбранный элемент
      // в нижнем меню, то мы его скрываем
      offstage: _currentTab != tabItem,
      // TabNavigator мы создадим позже
      child: TabNavigator(
        navigatorKey: _navigatorKeys[tabItem]!,
        tabItem: tabItem,
      ),
    );
  }

}