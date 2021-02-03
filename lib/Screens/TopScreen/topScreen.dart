import 'package:flutter/material.dart';

class TopScreen extends StatelessWidget {
  TopScreen({this.height, this.width});

  final height;
  final width;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      color: Color(0xFFFF11A0).withOpacity(.5),
    );
  }
}
