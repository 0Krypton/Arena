import 'package:flutter/foundation.dart';

import '../AuthProvider/auth.dart';

class UserState extends ChangeNotifier{

  bool _logginStateIsLogedIn = false;

  Auth _auth;

  UserState({Auth auth}):this._auth = auth;

  bool get logginState => _logginStateIsLogedIn;

  set logginState(bool state) {
    _logginStateIsLogedIn = state;
    notifyListeners();
  }

}