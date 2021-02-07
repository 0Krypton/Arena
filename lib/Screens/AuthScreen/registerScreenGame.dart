//importing packages
import 'package:ArenaScrims/Widgets/backButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

//importing Controllers
import '../../Controllers/Proivders/AuthProvider/registerScreenState.dart';

//importing Screen
import 'registerScreenRegion.dart';

//importing themes
import '../../Themes/color/colorThemes.dart';

//importing widgets
import '../../Widgets/gameContainer.dart';
import '../../Widgets/submitButton.dart';

class RegisterScreenGame extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = (MediaQuery.of(context).size);

    return Stack(
      children: [
        SingleChildScrollView(
          physics: NeverScrollableScrollPhysics(),
          child: Column(
            children: [
              _buildHeader(height: size.height * .4, width: size.width),
              _buildBody(
                context,
                height: size.height * .6,
                width: size.width,
              ),
            ],
          ),
        ),
        _buildBackButton(context)
      ],
    );
  }

  Widget _buildBackButton(BuildContext context) {
    return Positioned(
      top: 10,
      left: 10,
      child: backButton(
        onTap: () {
          Provider.of<RegisterScreenState>(context, listen: false)
              .previousPage();
        },
      ),
    );
  }

  Widget _buildHeader({width, height}) {
    return Container(
      height: height,
      width: width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: height * .5,
            height: height * .5,
            child: Image.asset(
              'assets/controllerButtonsPng.png',
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 20),
          Text(
            'What type of game\nare you play?',
            style: TextStyle(
              height: 1.2,
              color: colorShade800,
              fontSize: 15,
              fontFamily: 'Reglo',
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildBody(context, {width, height}) {
    final paddingHr = 20.0;

    return Container(
      height: height,
      width: width,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GameContainer(
                name: 'Fortnite',
                width: (width / 2) - paddingHr * 2,
                height: height / 4,
                color: fortniteColor,
                shadowColor: fortniteShadowColor,
                imageUrl: 'assets/game_icons/fortnite/fortniteTitlePng.png',
              ),
              SizedBox(width: 20),
              GameContainer(
                name: 'Valorant',
                width: (width / 2) - paddingHr * 2,
                height: height / 4,
                color: valorantColor,
                shadowColor: valorantShadowColor,
                imageUrl:
                    'assets/game_icons/valorant/valorantLogoWithTitlePng.png',
              ),
            ],
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GameContainer(
                name: 'ApexLegend',
                width: (width / 2) - paddingHr * 2,
                height: height / 4,
                color: apexlegendsColor,
                shadowColor: apexlegendsShadowColor,
                imageUrl: 'assets/game_icons/apex/apexLogoWithTitlePng.png',
              ),
              SizedBox(width: 20),
              GameContainer(
                name: 'Rainbow Six',
                width: (width / 2) - paddingHr * 2,
                height: height / 4,
                color: rainbowsixColor,
                shadowColor: rainbowsixShadowColor,
                imageUrl:
                    'assets/game_icons/rainbowsix/rainbowsixLogoWithTitlePng.png',
              ),
            ],
          ),
          SizedBox(height: 25),
          Container(
            width: width - (paddingHr * 3),
            child: SubmitButton(
              label: 'Next',
              textStyle: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontFamily: 'Lequire',
                fontWeight: FontWeight.bold,
              ),
              color: colorShade700,
              shadowColor: shadowColor900,
              onTap: () {
                Provider.of<RegisterScreenState>(context, listen: false)
                    .nextPage();
              },
            ),
          ),
        ],
      ),
    );
  }
}
