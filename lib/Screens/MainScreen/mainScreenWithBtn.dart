//importing packages
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_svg/flutter_svg.dart';

//importing models
import 'package:ArenaScrims/Model/BTNClasses/bottomNavBar.dart';

//importing controllers
import '../../Controllers/Proivders/MainScreenProvider/mainScreenState.dart';

//Main Scaffold Pages
import '../StoreScreen/storeScreen.dart';
import '../TopScreen/topScreen.dart';
import '../HomeScreen/homeScreen.dart';
import '../ExploreScreen/exploreScreen.dart';
import '../ProfileScreen/profileScreen.dart';

class MainScreenWithBtn extends StatefulWidget {
  final paddingTop;
  Function callBack;
  MainScreenWithBtn({this.paddingTop, this.callBack});
  @override
  _MainScreenWithBtnState createState() => _MainScreenWithBtnState();
}

class _MainScreenWithBtnState extends State<MainScreenWithBtn> {
  Size size;

  double allPaddingBTN = 75.0;
  double heightPages, widthPages, paddingTop;
  List<Widget> mainScaffoldPages = [];

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    paddingTop = MediaQuery.of(context).padding.top;
    heightPages = size.height - widget.paddingTop - allPaddingBTN;
    widthPages = size.width;

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
        menuCallBack: widget.callBack,
      ),
    ];

    return Consumer<MainScreenState>(
      builder: (context, provider, child) {
        return Scaffold(
          body: mainScaffoldPages[provider.selectedBtnIndex],
          bottomNavigationBar: child,
        );
      },
      child: _buildBottomNavigationBar(widthPages),
    );
  }

  Container _buildBottomNavigationBar(double width) {
    return Container(
      width: width,
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.only(bottom: 15.0, top: 15, left: 25, right: 25),
        child: Consumer<MainScreenState>(
          builder: (context, provider, child) {
            return Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: provider.btnItems.map(
                (item) {
                  return GestureDetector(
                    onTap: () {
                      provider.setBtnIndex(item.index);
                    },
                    child: AnimatedContainer(
                      padding: EdgeInsets.symmetric(
                        horizontal: 10.0,
                        vertical: 10.0,
                      ),
                      duration: const Duration(milliseconds: 300),
                      decoration: BoxDecoration(
                        color: item.index == provider.selectedBtnIndex
                            ? item.color
                            : Colors.transparent,
                        borderRadius: BorderRadius.all(
                          Radius.circular(15.0),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: item.index == provider.selectedBtnIndex
                                ? item.color
                                : Colors.transparent,
                            blurRadius: 15,
                          ),
                        ],
                      ),
                      child: SvgPicture.asset(
                        item.iconUrl,
                        color: item.index == provider.selectedBtnIndex
                            ? Colors.white
                            : Colors.black,
                        width: 25,
                        height: 25,
                      ),
                    ),
                  );
                },
              ).toList(),
            );
          },
        ),
      ),
    );
  }
}
