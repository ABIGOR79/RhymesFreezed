import 'package:flutter/material.dart';

class AuthProvider with ChangeNotifier {
  String? _userEmail;

  String? get userEmail => _userEmail;

  void signIn(String email) {
    _userEmail = email;
    notifyListeners();
  }

  void signOut() {
    _userEmail = null;
    notifyListeners();
  }
}
