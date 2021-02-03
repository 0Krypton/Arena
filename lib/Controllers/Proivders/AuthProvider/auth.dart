import 'package:flutter/foundation.dart';

class Auth extends ChangeNotifier {
  bool _isLoggedIn = false;

  void logOut() {
    _isLoggedIn = false;
    notifyListeners();
    print(_isLoggedIn);
  }

  bool get isLoggedIn => _isLoggedIn;
}
