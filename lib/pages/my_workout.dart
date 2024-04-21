import 'package:flutter/material.dart';
import 'package:phone_app/pages/set_workout_page.dart';
import 'package:phone_app/utilities/constants.dart';
import '../components/main_app_background.dart';
import '../services/timer.dart';
import '../components/activity_buttons.dart';
import 'vr_workout.dart';

class MyWorkout extends StatefulWidget {
  const MyWorkout({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyWorkout> createState() => _MyWorkoutState();
}

class _MyWorkoutState extends State<MyWorkout> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomGradientContainerSoft(
        child: Stack(
          children: [
            SingleChildScrollView(
              // scroll the screen with finger - up & down
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(height: 40),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ActivityButton(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SetWorkout(
                                        title: '',
                                      )),
                            );
                          },
                          buttonText: 'VR Game',
                          width: 300,
                        ),
                        SizedBox(height: 10),
                        ActivityButton(
                          onTap: () {},
                          buttonText: 'Walking',
                          width: 300,
                        ),
                        SizedBox(height: 10),
                        ActivityButton(
                          onTap: () {},
                          buttonText: 'Running',
                          width: 300,
                        ),
                        SizedBox(height: 10), // Yoga button
                        ActivityButton(
                          onTap: () {},
                          buttonText: 'Yoga',
                          width: 300,
                        ),
                        SizedBox(height: 10), // Sports button
                        ActivityButton(
                          onTap: () {},
                          buttonText: 'Sports',
                          width: 300,
                        ),
                        SizedBox(height: 10), // Aerobic button
                        ActivityButton(
                          onTap: () {},
                          buttonText: 'Aerobic',
                          width: 300,
                        ),
                        SizedBox(height: 10), // Jumba button
                        ActivityButton(
                          onTap: () {},
                          buttonText: 'Jumba',
                          width: 300,
                        ),
                        SizedBox(height: 60),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
