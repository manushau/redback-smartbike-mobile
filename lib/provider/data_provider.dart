import 'package:flutter/material.dart';
import 'package:phone_app/models/user_details.dart';

class UserDataProvider extends ChangeNotifier {
  UserDetails? _userDetails;

  UserDetails? get userDetails => _userDetails;

  // Sets the entire UserDetails object and notifies listeners
  void setUserDetails(UserDetails userDetails) {
    _userDetails = userDetails;
    notifyListeners();
  }

  // Updates just the email of the user in the UserDetails object and notifies listeners
  void setUserEmail(String userEmail) {
    if (_userDetails == null) {
      _userDetails = UserDetails(email: userEmail, name: '', surname: '', username: '', dob: '', phoneNumber: '', imagePath: '', id: ''); // Assuming UserDetails has an email field
    } else {
      _userDetails!.email = userEmail;
    }
    notifyListeners();
  }

  void setUserId(String userId) { // Ensure parameter is a String
    if (_userDetails == null) {
      _userDetails = UserDetails(id: userId, name: '', surname: '', username: '', dob: '', phoneNumber: '', imagePath: '',  email: '');
    } else {
      _userDetails!.id = userId;
    }
    notifyListeners();
  }
}
