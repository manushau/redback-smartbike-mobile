import 'package:flutter/material.dart';
import 'package:phone_app/components/main_app_background.dart';
import 'package:phone_app/pages/settings.dart';
import 'package:phone_app/utilities/constants.dart';

import '../components/bottom_navigation_bar.dart';
import 'Friends.dart';
import 'home_page.dart';

class MyStats extends StatefulWidget {
  const MyStats({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  _MyStatsState createState() => _MyStatsState();
}

class _MyStatsState extends State<MyStats> {
  int _currentIndex = 3;
  @override
  Widget build(BuildContext context) {
    return CustomGradientContainerSoft(
        child: Scaffold(
      body: CustomGradientContainerSoft(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.fromLTRB(16.0, 16.0, 30.0, 0),
                  child: const Center(
                    child: Text(
                      "My Stats",
                      style: kSubTitleOfPage,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
