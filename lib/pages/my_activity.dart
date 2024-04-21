import 'package:flutter/material.dart';
import 'package:phone_app/components/main_app_background.dart';
import 'package:phone_app/pages/settings.dart';
import 'package:phone_app/utilities/constants.dart';

import '../components/bottom_navigation_bar.dart';
import 'Friends.dart';
import 'home_page.dart';

class MyActivity extends StatefulWidget {
  const MyActivity({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  _MyActivityState createState() => _MyActivityState();
}

class _MyActivityState extends State<MyActivity> {
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
                      "My Activity",
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
