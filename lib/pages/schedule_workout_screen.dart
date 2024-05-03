import 'package:flutter/material.dart';
import 'package:phone_app/utilities/constants.dart';
import 'package:phone_app/components/main_app_background.dart';
import 'package:phone_app/components/bottom_button.dart';
import 'package:phone_app/components/dropdown_choice.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

class ScheduleWorkoutScreen extends StatefulWidget {
  @override
  _ScheduleWorkoutScreenState createState() => _ScheduleWorkoutScreenState();
}

class _ScheduleWorkoutScreenState extends State<ScheduleWorkoutScreen> {
  DateTime _selectedDate = DateTime.now();
  TimeOfDay _selectedTime = TimeOfDay.now();
  String _reminder = '1 Hour Before';
  List<String> _reminderOptions = ['No Reminder', '24 Hours Before', '1 Hour Before'];

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2020),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: _selectedTime,
    );
    if (picked != null && picked != _selectedTime) {
      setState(() {
        _selectedTime = picked;
      });
    }
  }

  void _submitForm() {
    // Code to handle form submission
    print('Date: ${_selectedDate.toLocal()}');
    print('Time: ${_selectedTime.format(context)}');
    print('Reminder: $_reminder');
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Workout Scheduled!')),
    );
  }

  @override
  void initState() {
    super.initState();
    initializeDateFormatting('en_EN', null).then((_) {
      setState(() {
        DateTime now = DateTime.now();
        _selectedDate = now;
      });
    });
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
        title: Text(
          'Schedule Workout',
          style: kSubSubTitleOfPage,
        ),
        centerTitle: true,
      ),
      body: CustomGradientContainerSoft(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0),
                  child: DropdownChoice<String>(
                    onChange: (String? newValue) {
                      setState(() {
                        _reminder = newValue!;
                      });
                    },
                    items: _reminderOptions.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    selectedValue: _reminder,
                    helperText: 'Choose Reminder',
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(16.0, 0, 16.0, 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      BottomButton(
                        onTap: () => _selectDate(context),
                        buttonText: 'Select Date',
                        //padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                      ),
                      BottomButton(
                        onTap: () => _selectTime(context),
                        buttonText: 'Select Time',
                        //padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 16.0),
                Center(
                  child: Text(
                    'Selected Date: ${DateFormat('yyyy-MM-dd').format(_selectedDate)}',
                    style: kSimpleTextWhite, // Matching the text style from contact.dart
                  ),
                ),
                Center(
                  child: Text(
                    'Selected Time: ${_selectedTime.format(context)}',
                    style: kSimpleTextWhite, // Matching the text style from contact.dart
                  ),
                ),
                SizedBox(height: 32.0),
                BottomButton(
                  onTap: _submitForm,
                  buttonText: 'Schedule',
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
