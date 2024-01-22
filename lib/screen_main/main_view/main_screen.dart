import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/navigation/auto_route.dart';
import 'package:flutter_project/screen_introduction/introduction_view/introduction_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../main_navigation_bar/screen_main_navigation_bar.dart';

@RoutePage()
class MainScreenWidget extends StatefulWidget {
  const MainScreenWidget({Key? key}) : super(key: key);

  @override
  State<MainScreenWidget> createState() => _MainScreenWidgetState();
}

class _MainScreenWidgetState extends State<MainScreenWidget> {
  Future<bool?>? isFirst;

  @override
  void initState() {
    super.initState();
    final preference = SharedPreferences.getInstance();
    isFirst = preference.then((value) => value.getBool('isFirstRun'));
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: isFirst,
      builder: (context, snapshot) {
        if (snapshot.data == false) {
          return const NavTabBar();
        }
        return const IntroductionScreen();
      },
    );
  }
}

