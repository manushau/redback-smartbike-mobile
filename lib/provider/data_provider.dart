import 'package:flutter/material.dart';
import 'package:phone_app/models/user_details.dart';

// provide user details throughout the app

class UserDataProvider extends ChangeNotifier {
  UserDetails? _userDetails;

  UserDetails? get userDetails => _userDetails;

  void setUserDetails(UserDetails userDetails) {
    _userDetails = userDetails;
    notifyListeners();
  }
}
