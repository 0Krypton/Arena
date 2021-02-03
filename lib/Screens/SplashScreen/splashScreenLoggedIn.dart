import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Themes/color/colorThemes.dart';

import '../MainScreen/mainScreen.dart';

import '../../Controllers/Proivders/AuthProvider/auth.dart';

class SplashScreenLogedIn extends StatefulWidget {
  @override
  _SplashScreenLogedInState createState() => _SplashScreenLogedInState();
}

class _SplashScreenLogedInState extends State<SplashScreenLogedIn> {
  @override
  void initState() {
    super.initState();
    print('Init State Splash Screen Loged In');
    Future.delayed(Duration(seconds: 2), () {
      Navigator.of(context).pushReplacement(
        MainScreen.comeToPage(),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: size.width,
        height: size.height,
        child: _buildLogoWithTitle(),
      ),
    );
  }

  Widget _buildLogoWithTitle() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: 150,
          height: 150,
          child: Image.asset('assets/arenaPng.png'),
        ),
        Text(
          'Arena',
          style: TextStyle(
            color: colorShade800,
            fontFamily: 'Noir',
            fontSize: 20,
          ),
        ),
      ],
    );
  }
}
