//importing external packages
import 'package:flutter/material.dart';
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
      duration: const Duration(milliseconds: 300),
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
    provider.setAnimationController(
      _animationController,
      maxSlide,
      media.size.height,
    );

    navBarPages = [
      MainScreenWithBtn(paddingTop: media.padding.top, callBack: runAnimation),
      EditProfileScreen(menuCallBack: runAnimation),
      ActivityScreen(menuCallBack: runAnimation),
      PaymentScreen(menuCallBack: runAnimation),
      SettingsScreen(menuCallBack: runAnimation),
    ];

    return SafeArea(
      child: Consumer<MainScreenState>(
        builder: (context, homeState, child) {
          return AnimatedBuilder(
            animation: _animationController.drive(
              CurveTween(curve: Curves.ease),
            ),
            builder: (context, _) {
              return Container(
                child: Stack(
                  children: [
                    SlideMenu(
                      width: media.size.width,
                      height: media.size.height,
                      callBack: runAnimation,
                    ),
                    Transform(
                      transform: Matrix4.identity()
                        ..translate(
                          homeState.translateSlideX,
                          homeState.translateSlideY,
                        )
                        ..scale(homeState.scale),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: mainScaffoldsShadowColor
                                  .withOpacity(_animationController.value),
                              blurRadius: 30,
                              spreadRadius: 15,
                            ),
                          ],
                        ),
                        child: navBarPages[homeState.selectedPageIndex],
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
