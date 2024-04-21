import 'package:flutter/material.dart';
import 'package:phone_app/components/bottom_button.dart';
import 'package:phone_app/components/bottom_navigation_bar.dart';
import 'package:phone_app/pages/vr_workout.dart';
import 'package:phone_app/utilities/constants.dart';
import '../components/dropdown_choice.dart';
import '../components/input_text_field.dart';
import '../components/main_app_background.dart';

class SetWorkout extends StatefulWidget {
  const SetWorkout({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<SetWorkout> createState() => _SetWorkoutState();
}

class _SetWorkoutState extends State<SetWorkout> {
  int _currentIndex = 0;

  String _field1 = '';
  String _field3 = '';
  String _field4 = '';
  String? selectedValue = null;

  // list of topics for workout (provide options)
  List<DropdownMenuItem<String>> get dropdownItems {
    List<DropdownMenuItem<String>> menuItems = [
      DropdownMenuItem(
        child: Text(
          'choice1',
          style: kSimpleTextPurple,
        ),
        value: 'choice1',
      ),
      DropdownMenuItem(
          child: Text(
            'choice2',
            style: kSimpleTextPurple,
          ),
          value: 'choice2'),
      DropdownMenuItem(
          child: Text(
            'choice3',
            style: kSimpleTextPurple,
          ),
          value: 'choice3'),
      DropdownMenuItem(
          child: Text(
            'choice4',
            style: kSimpleTextPurple,
          ),
          value: 'choice4'),
    ];
    return menuItems;
  }

  // validate fields
  bool validateFields() {
    List<String> errorMessages = [];
    // separate error msg for each field so that the user would know what to amend
    if (_field1.isEmpty) {
      errorMessages.add('Please provide field 1.');
    }
    if (_field3.isEmpty) {
      errorMessages.add('Please provide field 3.');
    }
    if (selectedValue == null) {
      errorMessages.add('Please make a selection from dropdown menu');
    }
    if (_field4.isEmpty) {
      errorMessages.add('Please provide field 4.');
    }

    // if any errors are present, combine the final error msg
    if (errorMessages.isNotEmpty) {
      String errorMessage = errorMessages.join('\n');

      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Missing Information'),
          content: Text(errorMessage),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('OK'),
            ),
          ],
        ),
      );
      return false; // Validation failed
    }
    return true; // Validation passed
  }

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
      body: Stack(
        children: [
          CustomGradientContainerSoft(
            child: Container(), // Empty container to fill the background
          ),
          SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    height: 200, // Adjust this height as needed
                    color: kLoginRegisterBtnColour.withOpacity(0.2),
                    padding: EdgeInsets.all(10),
                    child: Text(
                      'workout IMAGE here',
                      style: kSubTitleOfPage,
                    ),
                  ),
                  SizedBox(
                      height:
                          30), // Add some spacing between the colored container and the input fields
                  InputTextField(
                    buttonText: 'Category1',
                    onChangedDo: (value) {
                      setState(() {
                        _field1 = value!;
                      });
                    },
                  ),
                  SizedBox(height: 10),
                  DropdownChoice(
                    onChange: (String? newValue) {
                      setState(() {
                        selectedValue = newValue!;
                      });
                    },
                    items: dropdownItems,
                    selectedValue: selectedValue,
                    helperText: 'Choose some options',
                  ),
                  SizedBox(height: 10),
                  InputTextField(
                    buttonText: 'Category3',
                    onChangedDo: (value) {
                      setState(() {
                        _field3 = value!;
                      });
                    },
                  ),
                  SizedBox(height: 10),
                  InputTextField(
                    buttonText: 'Category4',
                    onChangedDo: (value) {
                      setState(() {
                        _field4 = value!;
                      });
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  BottomButton(
                      onTap: () {
                        if (validateFields()) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Workout(title: 'Workout'),
                            ),
                          );
                        }
                      },
                      buttonText: 'START'),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
