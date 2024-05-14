import 'package:analog_clock/analog_clock.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:phone_app/components/main_app_background.dart';
import 'package:phone_app/pages/settings.dart';
import 'package:phone_app/utilities/constants.dart';
import 'package:provider/provider.dart';

import '../components/home_page_containers.dart';
import '../models/user_details.dart';
import '../provider/user_data_provider.dart';
import 'schedule_workout_screen.dart'; // Import the schedule workout screen

class MyActivity extends StatefulWidget {
  const MyActivity({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyActivityState createState() => _MyActivityState();
}

class _MyActivityState extends State<MyActivity> {
  int _currentIndex = 3;
  String _formattedDate = "";

  @override
  void initState() {
    super.initState();

    // Initialize locale data
    initializeDateFormatting('en_EN', "").then((_) {
      setState(() {
        DateTime now = DateTime.now();
        _formattedDate = DateFormat('d MMMM yyyy', 'en_EN').format(now);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    UserDetails? userDetails =
        Provider.of<UserDataProvider>(context, listen: false).userDetails;
    String currentUsername = userDetails?.username ?? "User";

    return CustomGradientContainerSoft(
      child: Scaffold(
        body: CustomGradientContainerSoft(
          child: Stack(
            children: [
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                      const EdgeInsets.symmetric(vertical: 30, horizontal: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RoundedGreyContainer(
                            width: 180,
                            height: 300,
                            children: [
                              Text("Hi, $currentUsername", style: kSubSubTitleOfPage),
                              Text(
                                'Let\'s check your activity',
                                style: kSimpleTextWhite,
                              ),
                            ],
                          ),
                          SizedBox(width: 10.0),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              RoundedGreyContainer(
                                width: 140,
                                height: 140,
                                imagePath: userDetails?.imagePath?.isNotEmpty == true
                                    ? '${dotenv.env['API_URL_BASE']}${userDetails!.imagePath}'
                                    : '${dotenv.env['API_URL_BASE']}/media/images/default.jpeg',
                                defaultImagePath:
                                '${dotenv.env['API_URL_BASE']}/media/images/default.jpeg',
                                children: [
                                  Text('two', style: kSimpleTextWhite),
                                ],
                              ),
                              SizedBox(height: 10.0),
                              RoundedGreyContainer(
                                width: 140,
                                height: 140,
                                children: [
                                  Text(_formattedDate, style: kSimpleTextWhite),
                                  SizedBox(height: 10.0),
                                  SizedBox(
                                    width: 80,
                                    height: 80,
                                    child: AnalogClock(
                                      decoration: BoxDecoration(
                                        border: Border.all(width: 2.0, color: Colors.black),
                                        color: kLoginRegisterBtnColour,
                                        shape: BoxShape.circle,
                                      ),
                                      width: 40.0,
                                      isLive: true,
                                      hourHandColor: Colors.white,
                                      minuteHandColor: Colors.white,
                                      showSecondHand: true,
                                      numberColor: Colors.white,
                                      showNumbers: true,
                                      textScaleFactor: 1.5,
                                      showTicks: true,
                                      showDigitalClock: true,
                                      digitalClockColor: Colors.white,
                                      datetime: DateTime(2020, 8, 4, 9, 11, 0),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                bottom: 30,
                left: 20,
                right: 20,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ScheduleWorkoutScreen()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: kLoginRegisterBtnColour,
                    padding: EdgeInsets.symmetric(vertical: 20),
                    textStyle: TextStyle(fontSize: 20),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                  child: Text(
                    'Schedule Workout',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
