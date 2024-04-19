import 'package:flutter/material.dart';
import 'package:phone_app/pages/settings.dart';
import 'package:phone_app/utilities/constants.dart';
import '../components/bottom_navigation_bar.dart';
import '../components/main_app_background.dart';
import 'Friends.dart';
import 'home_page.dart';
import 'my_stats.dart';

class Terminate extends StatefulWidget {
  const Terminate({Key? key}) : super(key: key);

  @override
  TerminateState createState() => TerminateState();
}

// TODO: terminate account : select a reason from drop down (give like 4-5 options, inc option 'other'
// TODO: inclusde a message field to give a reason
// TODO: include a terminate button, upon clicking on it a alert dialog comes up asking the used to retype the password
// TODO: is the password is correct (check with backend) then delete account and go back to login/signup page

class TerminateState extends State<Terminate> {
  int _currentIndex = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: kLoginRegisterBtnColour.withOpacity(0.9),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            color: Colors.white,
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        body: CustomGradientContainerSoft(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
            ),
          ),
        ),
        bottomNavigationBar: BottomNavBar(initialIndex: _currentIndex));
  }
}
