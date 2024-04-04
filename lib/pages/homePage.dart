import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:phone_app/pages/login.dart';
import 'package:phone_app/utilities/constants.dart';
import 'package:provider/provider.dart';
import 'dart:convert';
import '../components/bottom_navigation_bar.dart';
import '../components/main_app_background.dart';
import '../components/stats_container.dart';
import '../models/user_details.dart';
import '../provider/data_provider.dart';
import 'Friends.dart';
import 'MyActivity.dart';
import 'package:phone_app/pages/settings.dart';
import 'my_account.dart';
import '../models/user_details.dart';
import '../services/get_current_user_details.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(title: "Home Page"),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.title, this.initialIndex = 0})
      : super(key: key);
  final String title;
  final int initialIndex;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  @override
  int avgPace = 32;
  int totalKilometer = 100;
  int heartRate = 5;
  int totalSteps = 7;
  int avgTime = 10;

  void initState() {
    super.initState();
    // TODO: it needs to be passed here to initState
    UserDetailsFetcher.fetchUserDetails(context, 'john');
    _currentIndex = widget.initialIndex;
  }

  Future<void> fetchData() async {
    // Load the .env file
    await dotenv.load(fileName: ".env");

    // Retrieve the base URL from the environment variables
    String? baseURL = dotenv.env['BASE_URL'];

    // Check if the base URL is defined
    if (baseURL != null) {
      try {
        // Construct the complete URL by concatenating with the endpoint
        String apiUrl = '$baseURL/api/data';

        // Send the GET request
        final response = await http.get(Uri.parse(apiUrl));

        // Handle the response
        if (response.statusCode == 200) {
          final data = json.decode(response.body);
          setState(() {
            avgPace = data['avgPace'];
            totalKilometer = data['totalKilometer'];
            heartRate = data['heartRate'];
            totalSteps = data['totalSteps'];
            avgTime = data['avgTime'];
          });
        } else {
          // Handle HTTP error responses
          print('Failed to fetch data: ${response.statusCode}');
        }
      } catch (e) {
        // Handle network errors
        print('Error fetching data: $e');
      }
    } else {
      // Print a message if BASE_URL is not defined in .env
      print('BASE_URL is not defined in .env file');
    }
  }

  Widget build(BuildContext context) {
    return CustomGradientContainerSoft(
      child: DefaultTabController(
        length: 3,
        initialIndex: widget.initialIndex,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: kLoginRegisterBtnColour.withOpacity(0.9),
            automaticallyImplyLeading: false,
            flexibleSpace: const Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TabBar(
                  tabs: [
                    Tab(
                      text: 'Home',
                    ),
                    Tab(
                      text: 'Activities',
                    ),
                    Tab(
                      text: 'Account',
                    ),
                  ],
                  unselectedLabelColor: Colors.white54,
                  labelColor: Colors.white,
                ),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              HomeTab(
                totalKilometer: totalKilometer,
                heartRate: heartRate,
                totalSteps: totalSteps,
                avgTime: avgTime,
                avgPace: avgPace,
              ),
              MyActivity(
                title: '',
              ),
              MyAccount(title: ''),
            ],
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
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Setting(title: "Settings"),
                      ),
                    );
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
        ),
      ),
    );
  }
}

class HomeTab extends StatelessWidget {
  final int totalKilometer;
  final int heartRate;
  final int totalSteps;
  final int avgTime;
  final int avgPace;

  HomeTab({
    required this.totalKilometer,
    required this.heartRate,
    required this.totalSteps,
    required this.avgTime,
    required this.avgPace,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: CustomGradientContainerSoft(
        child: Stack(
          children: [
            Column(
              children: [
                SizedBox(height: 40),
                SizedBox(height: 20),
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 500),
                        child: Container(
                          width: 300,
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              primary: Colors.black,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                            child: const Text(
                              "START",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Center(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
                child: SizedBox(
                  height: 450,
                  child: Container(
                    color: kLoginRegisterBtnColour.withOpacity(0.2),
                    padding: EdgeInsets.all(20),
                    child: Column(
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(width: 10),
                            Padding(
                              padding: EdgeInsets.all(10.0),
                              child: Text(
                                '${totalKilometer.toStringAsFixed(2)}',
                                style: kSubTitleOfPage,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(bottom: 20.0),
                              child: Text(
                                'Total Kilometers',
                                style: kSubSubTitleOfPage,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                StatContainerBox(
                                  fieldName: 'Speed',
                                  valueToText: '$heartRate.0',
                                ),
                                SizedBox(height: 10),
                                StatContainerBox(
                                  fieldName: 'RPM',
                                  valueToText: '$totalSteps.0',
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                StatContainerBox(
                                  fieldName: 'Incline',
                                  valueToText: '${avgTime.toStringAsFixed(2)}%',
                                ),
                                SizedBox(height: 10),
                                StatContainerBox(
                                  fieldName: 'Avg Pace',
                                  valueToText: '${avgPace.toStringAsFixed(2)}',
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Profile Content'),
    );
  }
}
