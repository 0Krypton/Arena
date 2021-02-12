//importing packages
import 'package:flutter/material.dart';

class TourListProvider with ChangeNotifier {
  double _scale=0.0;
  double get scale => _scale;

  void setScale(newScale) {
    _scale = newScale;
    // print(_scale);
    notifyListeners();
  }

  void disposeValues(){
    _scale = 0.0;
  }

}
