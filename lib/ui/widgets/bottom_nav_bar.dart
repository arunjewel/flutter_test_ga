import 'package:flutter/material.dart';
import 'package:flutter_test_ga/core/constants.dart';

ValueNotifier<int> indexChangeNotifier = ValueNotifier(0);

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: indexChangeNotifier,
        builder: (context, int newIndex, _) {
          return BottomNavigationBar(
              currentIndex: newIndex,
              onTap: (index) {
                indexChangeNotifier.value = index;
              },
              backgroundColor: kSubThemeColor,
              selectedItemColor: kMainThemeColor,
              unselectedItemColor: kMainThemeColor,
              selectedIconTheme: IconThemeData(
                color: kMainThemeColor,
              ),
              unselectedIconTheme: const IconThemeData(color: Colors.grey),
              items: const [
                BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.search), label: "Search"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.person), label: "Profile"),
              ]);
        });
  }
}
