import 'package:flutter/material.dart';

class RegionServer {
  final String name;
  final Color color;
  bool isSelected = false;

  RegionServer({this.name, this.color, this.isSelected});

  @override
  String toString() {
    print(name);
    return super.toString();
  }
}
