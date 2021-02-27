//importing external packages
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

//import external Screen
import './mainScreenWithBtn.dart';
import './slideMenu.dart';

//importing controller
import '../../Controllers/Proivders/MainScreenProvider/mainScreenState.dart';

//importing theme
import '../../Themes/color/colorThemes.dart';

//Main Pages
import '../EditProfileScreen/editProfileScreen.dart';
import '../ActivityScreen/activityScreen.dart';
import '../PaymentScreen/paymentScreen.dart';
import '../SettingsScreen/settingsScreen.dart';

//dart
import 'dart:math' as math;

class MainScreen extends StatefulWidget {
  static const id = 'MainScreen';

  static Route comeToPage() {
    return PageRouteBuilder(
      pageBuilder: (context, animatio1, aniamtion2) => MainScreen(),
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
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen>
    with SingleTickerProviderStateMixin {
  List<Widget> navBarPages = [];

  // The 0 index for Main Scaffold
  int selectedPageIndex = 0;

  //declaring animations
  AnimationController _animationController;
  double maxSlide = 0.0;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    print('the initState() method of the mainScreen.dart is called');
  }

  @override
  void dispose() {
    print('the Dispose() method of the mainScreen.dart is called');
    _animationController.dispose();
    super.dispose();
  }

  void runAnimation() {
    _animationController.forward();
    _animationController.isCompleted
        ? _animationController.reverse()
        : _animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    print('build');
    final media = MediaQuery.of(context);
    maxSlide = -(media.size.width) * .4;

    final provider = Provider.of<MainScreenState>(context, listen: false);

    provider.setHeight(media.size.height);

    provider.setAnimationController(
      _animationController,
      maxSlide,
    );

    navBarPages = [
      MainScreenWithBtn(paddingTop: media.padding.top, callBack: runAnimation),
      EditProfileScreen(menuCallBack: runAnimation),
      ActivityScreen(menuCallBack: runAnimation),
      PaymentScreen(menuCallBack: runAnimation),
      SettingsScreen(menuCallBack: runAnimation),
    ];

    return WillPopScope(
      onWillPop: () async {
        if (_animationController.isCompleted) {
          _animationController.reverse();
        } else if (provider.selectedBtnIndex != 2) {
          provider.setBtnIndex(2);
        } else {
          await SystemChannels.platform.invokeMethod('SystemNavigator.pop');
        }
        return;
      },
      child: SafeArea(
        child: Container(
          child: Stack(
            children: [
              SlideMenu(
                width: media.size.width,
                height: media.size.height,
                callBack: runAnimation,
              ),
              Consumer<MainScreenState>(
                builder: (context, homeState, child) {
                  return Transform(
                    transform: Matrix4.identity()
                      ..translate(
                        homeState.translateSlideX,
                        homeState.translateSlideY,
                      )
                      ..scale(homeState.scale),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      decoration: BoxDecoration(
                        borderRadius: _animationController.isCompleted
                            ? BorderRadius.circular(15)
                            : BorderRadius.circular(0),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: mainScaffoldsShadowColor
                                .withOpacity(_animationController.value),
                            blurRadius: 50,
                          ),
                        ],
                      ),
                      child: navBarPages[homeState.selectedPageIndex],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
