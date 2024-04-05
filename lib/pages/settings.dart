import 'package:flutter/material.dart';
import 'package:phone_app/pages/login.dart';
import 'package:phone_app/pages/privacy.dart';
import 'package:phone_app/pages/terminate_account.dart';
import 'package:phone_app/utilities/constants.dart';
import '../components/account_containers.dart';
import '../components/bottom_navigation_bar.dart';
import '../components/main_app_background.dart';
import 'email.dart';
import 'my_account.dart';

import 'Friends.dart';
import 'homePage.dart';
import 'contact.dart';
import 'information.dart';

class Setting extends StatefulWidget {
  const Setting({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<Setting> createState() => _Setting();
}

class _Setting extends State<Setting> {
  int _currentIndex = 2; // Set the current index to 2 for Settings page

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kLoginRegisterBtnColour
            .withOpacity(0.9), // Set the background color
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.white,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => HomePage(title: 'Home Page'),
              ),
            );
          },
        ),
      ),
      body: CustomGradientContainerSoft(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 50),
              Text(
                "Settings",
                style: kSubTitleOfPage,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 30),
              SizedBox(height: 10),
              AccountContainer(
                fieldName: 'Account',
                typeIcon: Icons.account_circle,
                onPressed: () {
                  Navigator.of(context).popUntil((route) => route.isFirst);
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) =>
                        HomePage(title: "Home Page", initialIndex: 2),
                  ));
                },
                arrowOptional: Icons.arrow_forward,
              ),
              SizedBox(height: 10),
              AccountContainer(
                fieldName: 'Information',
                typeIcon: Icons.info,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => InformationScreen(),
                    ),
                  );
                },
                arrowOptional: Icons.arrow_forward,
              ),
              SizedBox(height: 10),
              AccountContainer(
                fieldName: 'Help',
                typeIcon: Icons.contact_support,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ContactUsScreen(),
                    ),
                  );
                },
                arrowOptional: Icons.arrow_forward,
              ),
              SizedBox(height: 10),
              AccountContainer(
                fieldName: 'Logout',
                typeIcon: Icons.exit_to_app,
                onPressed: () {
                  // Perform logout actions here, such as clearing authentication tokens.
                  // Navigate to the login screen or any other desired screen.
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => LoginPage()),
                    (route) =>
                        false, // Clear all routes except the new login page.
                  );
                },
                arrowOptional: Icons.arrow_forward,
              ),
              SizedBox(height: 60),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavBar(
        onTap: (index) {
          setState(() {
            _currentIndex = index;
            switch (_currentIndex) {
              case 0:
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomePage(title: "Home Page"),
                  ),
                );
                break;
              case 1:
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MyFriendScreen(title: ''),
                  ),
                );
                break;
              case 2:
                // Do nothing as the user is already on the Settings page
                break;
            }
          });
        },
        label1: 'Home',
        label2: 'Friends',
        label3: 'Settings',
        icon1: Icons.home,
        icon2: Icons.group,
        icon3: Icons.settings,
        currentIndex: _currentIndex,
      ),
    );
  }
}
