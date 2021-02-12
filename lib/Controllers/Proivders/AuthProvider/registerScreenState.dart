//importing packages
import 'package:flutter/material.dart';

//importing Screens
import '../../../Screens/AuthScreen/registerScreen.dart';
import '../../../Screens/AuthScreen/registerScreenImage.dart';
import '../../../Screens/AuthScreen/registerScreenGame.dart';
import '../../../Screens/AuthScreen/registerScreenRegion.dart';
import '../../../Screens/AuthScreen/registerScreenClan.dart';

//importing dart files
import 'dart:math' as math;

class RegisterScreenState with ChangeNotifier {
  int _currentPage = 0;
  int get currentPage => _currentPage;

  final List<Widget> _registerScreens = [
    RegisterScreen(),
    RegisterScreenImage(),
    RegisterScreenGame(),
    RegisterScreenRegion(),
    RegisterScreenClan(),
  ];
  List<Widget> get registerScreens => _registerScreens;

  PageController _pageController = PageController(initialPage: 0);
  PageController get pageController => _pageController;

  void setTheDefaultPage(){
    _currentPage = 0;
    notifyListeners();
  }

  void nextPage() {
    if (_currentPage < _registerScreens.length - 1) {
      _currentPage++;
      _pageController.animateToPage(_currentPage,
          duration: const Duration(milliseconds: 150), curve: Curves.easeIn);
    } else {
      _currentPage = (_registerScreens.length - 1);
    }
    print(currentPage);
    notifyListeners();
  }


  void previousPage() {
    if (_currentPage > 0) {
      _currentPage--;
      _pageController.animateToPage(_currentPage,
          duration: const Duration(milliseconds: 150), curve: Curves.easeIn);
    }
    print(currentPage);
    notifyListeners();
  }
}
