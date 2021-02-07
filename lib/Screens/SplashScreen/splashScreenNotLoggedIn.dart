import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Themes/color/colorThemes.dart';
import '../AuthScreen/loginScreen.dart';

import '../../Controllers/Proivders/AuthProvider/auth.dart';

class SplashScreenNotLogedIn extends StatefulWidget {
  @override
  _SplashScreenNotLogedInState createState() => _SplashScreenNotLogedInState();
}

class _SplashScreenNotLogedInState extends State<SplashScreenNotLogedIn> {
  @override
  void initState() {
    super.initState();
    print('Init State Splash Screen Not logged In');
    Future.delayed(Duration(seconds: 2), () {
      Navigator.of(context).pushReplacement(
        LoginScreen.comeToPage(),
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
        Hero(
          tag: 'arenaLogo',
                  child: Container(
            width: 150,
            height: 150,
            child: Image.asset('assets/arenaPng.png'),
          ),
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
