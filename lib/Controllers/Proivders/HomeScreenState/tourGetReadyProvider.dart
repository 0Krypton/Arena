//importing packages
import 'package:flutter/material.dart';

class TourGetReadyProvider with ChangeNotifier {
  double _opacity = 0.0;
  double get opacity => _opacity;

  void setOpacity(newOpacity) {
    _opacity = newOpacity;
    notifyListeners();
  }

  void disposeValues() {
    _opacity = 0.0;
  }
}
