//importing packages
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

//importing modelClasses
import '../../Model/MainScreenClasses/slideMenuItem.dart';

//importing Controllers
import '../../Controllers/Proivders/MainScreenProvider/mainScreenState.dart';
import '../../Controllers/Proivders/AuthProvider/auth.dart';

//importing Themes
import '../../Themes/color/colorThemes.dart';

class SlideMenu extends StatelessWidget {
  SlideMenu({
    this.height,
    this.width,
    this.callBack,
  });

  final double width, height;
  final Function callBack;

  @override
  Widget build(BuildContext context) {
    final mainScrStateProvider =
        Provider.of<MainScreenState>(context, listen: true);
    return Scaffold(
      body: Opacity(
        opacity: mainScrStateProvider.animationValue * 1,
        child: Container(
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
                            mainScrStateProvider.selectPageIndex(0);
                            callBack();
                          } else {
                            mainScrStateProvider.selectPageIndex(item.index);
                            callBack();
                          }
                        },
                        child: _buildMenuItems(
                          name: item.title,
                          iconUrl: item.imageUrl,
                          isSelected: item.index ==
                              mainScrStateProvider.selectedPageIndex,
                        ),
                      ),
                    ],
                  ),
                )
                .toList(),
          ),
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
}
