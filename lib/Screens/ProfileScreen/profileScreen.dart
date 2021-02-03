//import packages
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

//import colors
import '../../Themes/color/colorThemes.dart';

//import Widgets
import '../../Widgets/playedGames.dart';

//import model Classes
import '../../Model/ProfileScreenClasses/gamesPlaying.dart';

class ProfileScreen extends StatefulWidget {
  ProfileScreen({this.heightOfThePage, this.widthOfThePage, this.menuCallBack});

  final heightOfThePage;
  final widthOfThePage;
  final Function menuCallBack;

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        height: widget.heightOfThePage,
        width: widget.widthOfThePage,
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            children: [
              _buildHeader(
                  height: widget.heightOfThePage * .3,
                  width: widget.widthOfThePage),
              _buildBody(
                  height: widget.heightOfThePage * .7,
                  width: widget.widthOfThePage),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader({height, width}) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: bgImageGradients,
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
      ),
      child: Stack(
        overflow: Overflow.visible,
        children: [
          Positioned(
            right: 15,
            top: 15,
            child: GestureDetector(
              onTap: widget.menuCallBack,
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
            //TODO : get ProfileImage if there is else if Show GradientColor
            left: 0,
            right: 0,
            bottom: -(height * .8) / 2,
            child: Container(
              height: height * .8,
              width: height * .8,
              decoration: BoxDecoration(
                color: colorShade500,
                boxShadow: [
                  BoxShadow(
                    color: profileImageShadow,
                    blurRadius: 30,
                  ),
                ],
                shape: BoxShape.circle,
              ),
            ),
          ),
          Positioned(
            //TODO : get clan Image if there is else if Show empty SizedBox
            // (width of the header) - (height/width of the clanImage) - (30 pixel custom)
            left: (width / 2) - (height * .8) / 3 - 30,
            right: 0,
            // (height of the clanImage) / 2
            bottom: -((height * .8) / 3),
            child: Container(
              height: (height * .8) / 3,
              width: (height * .8) / 3,
              decoration: BoxDecoration(
                color: colorShade500,
                boxShadow: [
                  BoxShadow(
                    color: clanImageShadow,
                    blurRadius: 10,
                  ),
                ],
                shape: BoxShape.circle,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBody({height, width}) {
    var widthOfTheBody = width;
    // we want to move widgets bellow so:
    // height of the profileImage which is ' ((heightOfThePage * .3) * .8) '
    // times half of its height which means we move widget below by how much
    // pixels 'profileImage' came to the bottom
    var heightOfTheHeader = widget.heightOfThePage * .3;
    var heightOfTheProfileImage = heightOfTheHeader * .8;

    var heightOfTheBody = (heightOfTheProfileImage / 2) + 20;

    return Container(
      width: width,
      child: Column(
        children: [
          SizedBox(height: heightOfTheBody),
          Container(
            // height: height - heightOfTheBody,
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    //This First SizedBox Just fot centering The UserName
                    SizedBox(width: 5),
                    //User Name
                    //TODO : get Title
                    Text(
                      'Krypton',
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Reglo',
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(width: 5),
                    //Is Verified
                    //TODO : check for verification
                    SvgPicture.asset(
                      'assets/verifiedSVG.svg',
                      width: 15,
                      height: 15,
                    ),
                  ],
                ),
                SizedBox(height: 5),
                //TODO: get the bio if empty just show SizedBox
                Text(
                  'This is the test\n🔥I\'m the Co.Founder Of Arena🔥',
                  style: TextStyle(
                    color: Color(0xFF444444),
                    fontFamily: 'Reglo',
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20),
                //TODO: get the followers and following
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          '40',
                          style: TextStyle(
                            fontFamily: 'Reglo',
                            fontSize: 15,
                            color: followingfollowersNumberColor,
                          ),
                        ),
                        Text(
                          'following',
                          style: TextStyle(
                            fontFamily: 'Reglo',
                            fontSize: 12,
                            color: followingfollowersTextColor,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(width: 15),
                    //TODO: add follow Button
                    Container(
                      height: 30,
                      width: 75,
                      padding: EdgeInsets.only(
                        top: 2.5,
                        bottom: 2.5,
                        left: 10,
                        right: 10,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                        gradient: LinearGradient(
                          colors: followButtonColor,
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: followButtonShadowColor,
                            blurRadius: 15,
                          ),
                        ],
                      ),
                      child: Center(
                        child: Text(
                          'Follow',
                          style: TextStyle(
                            fontFamily: 'Reglo',
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 15),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          '3.6m',
                          style: TextStyle(
                            fontFamily: 'Reglo',
                            fontSize: 15,
                            color: followingfollowersNumberColor,
                          ),
                        ),
                        Text(
                          'followers',
                          style: TextStyle(
                            fontFamily: 'Reglo',
                            fontSize: 12,
                            color: followingfollowersTextColor,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 20),
                //TODO: refactor textStyle of all the app
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: width * .3,
                      height: 1,
                      color: lineSeperaterColor.withOpacity(.3),
                    ),
                    SizedBox(width: 10),
                    Text(
                      'Games',
                      style: TextStyle(
                        fontFamily: 'Reglo',
                        fontSize: 12,
                        color: lineSeperaterColor.withOpacity(.6),
                      ),
                    ),
                    SizedBox(width: 10),
                    Container(
                      width: width * .3,
                      height: 1,
                      color: lineSeperaterColor.withOpacity(.3),
                    ),
                  ],
                ),
                // SizedBox(height: 20),
              ],
            ),
          ),
          SizedBox(height: 15),
          PlayedGamesContainer(
            widthGameContainer: widthOfTheBody,
            heightGameContainer: height,
            listGamesPlayed: listGamesPlayed,
          ),
          SizedBox(height: 30),
        ],
      ),
    );
  }
}
