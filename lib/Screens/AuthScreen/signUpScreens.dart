//importing packages
import 'package:ArenaScrims/Screens/AuthScreen/loginScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

//importing themes
import '../../Themes/color/colorThemes.dart';

//importing controllers
import '../../Controllers/Proivders/AuthProvider/registerScreenState.dart';

//importing Screens
import 'registerScreen.dart';
import 'registerScreenImage.dart';
import 'registerScreenGame.dart';
import 'registerScreenRegion.dart';
import 'registerScreenClan.dart';

class SignUpScreen extends StatefulWidget {
  static const id = 'SignUpScreen';

  static Route comeToPage() {
    return PageRouteBuilder(
      pageBuilder: (context, animatio1, aniamtion2) => SignUpScreen(),
      transitionDuration: const Duration(milliseconds: 300),
      transitionsBuilder: (context, animation1, animation2, child) {
        return Opacity(
          opacity: animation1.value,
          child: child,
        );
      },
    );
  }

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    final size = (MediaQuery.of(context).size);
    final padding = MediaQuery.of(context).padding.top;

    final height = size.height - padding;
    final rgProvider = Provider.of<RegisterScreenState>(context, listen: false);
    return WillPopScope(
      onWillPop: () async {
        if (rgProvider.currentPage == 0) {
          Navigator.of(context).pushReplacement(LoginScreen.comeToPage());
          return ;
        }
        rgProvider.previousPage();
        return;
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              height: height,
              width: size.width,
              child: Consumer<RegisterScreenState>(
                builder: (context, provider, child) {
                  return PageView(
                    physics: NeverScrollableScrollPhysics(),
                    controller: provider.pageController,
                    children: provider.registerScreens,
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
