//importing external packages
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

//import external Screen
import '../AuthScreen/loginScreen.dart';

//importing controller
import '../../Controllers/Proivders/AuthProvider/auth.dart';

//importing external ModelClass
import '../../Model/btnClasses/bottomNavBar.dart';
import '../../Model/BTNClasses/slideMenuItem.dart';

//importing theme
import '../../Themes/color/colorThemes.dart';

//Main Scaffold Pages
import '../StoreScreen/storeScreen.dart';
import '../TopScreen/topScreen.dart';
import '../HomeScreen/homeScreen.dart';
import '../ExploreScreen/exploreScreen.dart';
import '../ProfileScreen/profileScreen.dart';

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
  List<Widget> mainPages = [];
  List<Widget> mainScaffoldPages = [];

  List<BottomNavBar> btnItems = [];

  // The 2 index for HomeScreen
  int selectedBarIndex = 2;

  // The 0 index for Main Scaffold
  int selectedPageIndex = 0;

  //declaring animations
  AnimationController _animationController;

  void toggle() {
    setState(
      () {
        _animationController.forward();
        _animationController.isCompleted
            ? _animationController.reverse()
            : _animationController.forward();
      },
    );
  }

  @override
  void initState() {
    super.initState();
    btnItems = [
      BottomNavBar(
        color: Color(0xFF9E00FF),
        iconUrl: 'assets/BottomNavigationBarIcons/shopping-bag.svg',
        index: 0,
      ),
      BottomNavBar(
        color: Color(0xFFFF11A0),
        iconUrl: 'assets/BottomNavigationBarIcons/barchart.svg',
        index: 1,
      ),
      BottomNavBar(
        color: Color(0xFFFF4D00),
        iconUrl: 'assets/BottomNavigationBarIcons/home.svg',
        index: 2,
      ),
      BottomNavBar(
        color: Color(0xFF00D1FF),
        iconUrl: 'assets/BottomNavigationBarIcons/search.svg',
        index: 3,
      ),
      BottomNavBar(
        color: Color(0xFF33019F),
        iconUrl: 'assets/BottomNavigationBarIcons/profile.svg',
        index: 4,
      ),
    ];
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    _animationController.addListener(() {});
    print('the initState() method of the mainScreen.dart is called');
  }

  @override
  void dispose() {
    print('the Dispose() method of the mainScreen.dart is called');
    btnItems = [];
    mainScaffoldPages = [];
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context);
    final allPaddingBTN = 75.0;

    final heightPages = media.size.height - media.padding.top - allPaddingBTN;
    final widthPages = media.size.width;

    final double maxSlide = -(media.size.width) * .4;

    Widget _buildMainScaffold() => Scaffold(
          body: mainScaffoldPages[selectedBarIndex],
          bottomNavigationBar: _buildBottomNavigationBar(media),
        );

    //Initializing the mainScaffoldPages & mainPages

    mainScaffoldPages = [
      StoreScreen(
        height: heightPages,
        width: widthPages,
      ),
      TopScreen(
        height: heightPages,
        width: widthPages,
      ),
      HomeScreen(
        height: heightPages,
        width: widthPages,
      ),
      ExploreScreen(
        height: heightPages,
        width: widthPages,
      ),
      ProfileScreen(
        heightOfThePage: heightPages,
        widthOfThePage: widthPages,
        menuCallBack: toggle,
      ),
    ];

    mainPages = [
      _buildMainScaffold(),
      EditProfileScreen(menuCallBack: toggle),
      ActivityScreen(menuCallBack: toggle),
      PaymentScreen(menuCallBack: toggle),
      SettingsScreen(menuCallBack: toggle),
    ];

    return SafeArea(
      child: AnimatedBuilder(
        animation: _animationController,
        builder: (context, _) {
          double translateSlideX = maxSlide * _animationController.value;
          // double translateSlideY = (media.size.height / 5) * _animationController.value;
          double translateSlideY =
              ((media.size.height - (media.size.height * .7)) / 2) *
                  _animationController.value;
          double scale = 1 - (_animationController.value * 0.3);

          return Container(
            child: Stack(
              children: [
                _buildSlideMenuBar(
                  width: media.size.width,
                  height: media.size.height,
                ),
                Transform(
                  transform: Matrix4.identity()
                    ..translate(
                      translateSlideX,
                      translateSlideY,
                    )
                    ..scale(
                      scale,
                    ),
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
                    child: mainPages[selectedPageIndex],
                  ),
                ),
              ],
            ),
          );
        },
        // child: mainPages[selectedPageIndex],
      ),
    );
  }

  Scaffold _buildSlideMenuBar({height, width}) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        width: width,
        height: height,
        padding: EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.center,
          children: slideMenuItems
              .map(
                (item) => Column(
                  children: [
                    SizedBox(height: item.index == 5 ? 50 : 20),
                    GestureDetector(
                      onTap: () {
                        if (item.index == 5) {
                          Provider.of<Auth>(context, listen: false).logOut();
                        } else if (item.index == 0) {
                          setState(() {
                            selectedPageIndex = 0;
                          });
                          toggle();
                        } else {
                          setState(() {
                            selectedPageIndex = item.index;
                          });
                          toggle();
                        }
                      },
                      child: _buildMenuItems(
                        name: item.title,
                        iconUrl: item.imageUrl,
                        isSelected: item.index == selectedPageIndex,
                      ),
                    ),
                  ],
                ),
              )
              .toList(),
        ),
      ),
    );
  }

  Widget _buildMenuItems({String name, String iconUrl, bool isSelected}) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      decoration: BoxDecoration(
        color: isSelected ? buttonColor : Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: isSelected ? buttonColor : Colors.white,
            blurRadius: isSelected ? 20 : 0,
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 24,
            width: 24,
            child: SvgPicture.asset(
              iconUrl,
              fit: BoxFit.cover,
              color: isSelected ? Colors.white : null,
            ),
          ),
          SizedBox(width: 10),
          Text(
            name,
            style: TextStyle(
              color: isSelected ? Colors.white : menuItemColors,
              fontFamily: 'Reglo',
              fontSize: 15,
            ),
          ),
        ],
      ),
    );
  }

  Container _buildBottomNavigationBar(MediaQueryData media) {
    return Container(
      width: media.size.width,
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.only(bottom: 15.0, top: 15, left: 25, right: 25),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: btnItems.map(
            (item) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    selectedBarIndex = item.index;
                  });
                },
                child: AnimatedContainer(
                  padding: EdgeInsets.symmetric(
                    horizontal: 10.0,
                    vertical: 10.0,
                  ),
                  duration: const Duration(milliseconds: 300),
                  decoration: BoxDecoration(
                    color: item.index == selectedBarIndex
                        ? item.color
                        : Colors.transparent,
                    borderRadius: BorderRadius.all(
                      Radius.circular(15.0),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: item.index == selectedBarIndex
                            ? item.color
                            : Colors.transparent,
                        blurRadius: 15,
                      ),
                    ],
                  ),
                  child: SvgPicture.asset(
                    item.iconUrl,
                    color: item.index == selectedBarIndex
                        ? Colors.white
                        : Colors.black,
                    width: 25,
                    height: 25,
                  ),
                ),
              );
            },
          ).toList(),
        ),
      ),
    );
  }
}
