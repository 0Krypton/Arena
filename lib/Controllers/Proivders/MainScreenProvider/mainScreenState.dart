// importing packages
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

//importing model classes
import '../../../Model/BTNClasses/bottomNavBar.dart';

class MainScreenState extends ChangeNotifier {
  List<BottomNavBar> _btnItems = [
    BottomNavBar(
      color: Color(0xFF9E00FF),
      iconUrl: 'assets/BottomNavigationBarIcons/shopping-bag.svg',
      index: 0,
    ),
    BottomNavBar(
      color: Color(0xFFFF11A0),
      iconUrl: 'assets/BottomNavigationBarIcons/barchart.svg',
      index: 1,
    ),
    BottomNavBar(
      color: Color(0xFFFF4D00),
      iconUrl: 'assets/BottomNavigationBarIcons/home.svg',
      index: 2,
    ),
    BottomNavBar(
      color: Color(0xFF00D1FF),
      iconUrl: 'assets/BottomNavigationBarIcons/search.svg',
      index: 3,
    ),
    BottomNavBar(
      color: Color(0xFF33019F),
      iconUrl: 'assets/BottomNavigationBarIcons/profile.svg',
      index: 4,
    ),
  ];

  List<BottomNavBar> get btnItems => _btnItems;

  // The 2 index for HomeScreen
  int _selectedBtnIndex = 2;
  // The 0 index for Main Scaffold
  int _selectedPageIndex = 0;

  int get selectedBtnIndex => _selectedBtnIndex;
  int get selectedPageIndex => _selectedPageIndex;

  void setBtnIndex(int index) {
    _selectedBtnIndex = index;
    notifyListeners();
  }

  void selectPageIndex(int selectedI) {
    _selectedPageIndex = selectedI;
    notifyListeners();
  }

  //
  ////////////////////////////////////////////////////////
  // Animation

  double _translateSlideX = 0.0;
  double _translateSlideY = 0.0;
  double _scale = 1.0;
  double _animationValue = 1.0;
  double _opacity = 1.0;
  double _height;

  double get translateSlideX => _translateSlideX;
  double get translateSlideY => _translateSlideY;
  double get scale => _scale;
  double get animationValue => _animationValue;
  double get opacity => _opacity;

  void setHeight(double height) {
    _height = ((height - (height * .8)) / 2);
  }

  void setAnimationController(
    AnimationController controller,
    maxSlide,
  ) {
    controller.addListener(() {
      _translateSlideX = maxSlide * controller.value;
      _translateSlideY = _height * controller.value;
      _scale = 1 - (controller.value * 0.2);
      _animationValue = controller.value;
      _opacity = 1 - (controller.value);
      notifyListeners();
    });

    print('animationController');
  }
}
