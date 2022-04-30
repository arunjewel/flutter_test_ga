import 'package:flutter/material.dart';
import 'package:flutter_test_ga/core/constants.dart';

import '../../../widgets/bottom_nav_bar.dart';
import '../../home_page/screens/home_page.dart';
import '../../home_page/screens/profile_page.dart';

class MainPage extends StatelessWidget {
  MainPage({Key? key}) : super(key: key);
  final _pages = [
    HomePage(),
    HomePage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        backgroundColor: kMainThemeColor,
            title: const Text("Test App"),
          ),
      body: SafeArea(
        child: ValueListenableBuilder(
            valueListenable: indexChangeNotifier,
            builder: (context, int newIndex, _) {
              return _pages[newIndex];
            }),
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
