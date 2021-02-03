import 'package:flutter/material.dart';

class ActivityScreen extends StatelessWidget {
  ActivityScreen({this.menuCallBack});

  final Function menuCallBack;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          children: [
            Positioned(
              right: 15,
              top: 15,
              child: GestureDetector(
                onTap: () {
                  menuCallBack();
                },
                child: Container(
                  height: 30,
                  width: 30,
                  child: Icon(
                    Icons.menu,
                  ),
                ),
              ),
            ),
            Positioned(
              top: 100,
              right: 0,
              child: Text('Activity'),
            ),
          ],
        ),
      ),
    );
  }
}
