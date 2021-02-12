//importing packages
import 'package:ArenaScrims/Widgets/textField.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

//importing themes
import '../../Themes/color/colorThemes.dart';

//importing Screen
import '../MainScreen/mainScreen.dart';

//importing providers
import '../../Controllers/Proivders/AuthProvider/registerScreenState.dart';

//importing Widgets
import '../../Widgets/backButton.dart';
import '../../Widgets/submitButton.dart';

class RegisterScreenClan extends StatefulWidget {
  static const id = 'RegisterScreenClan';

  static Route comeToPage() {
    return PageRouteBuilder(
      pageBuilder: (context, animatio1, aniamtion2) => RegisterScreenClan(),
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
  _RegisterScreenClanState createState() => _RegisterScreenClanState();
}

class _RegisterScreenClanState extends State<RegisterScreenClan> {
  @override
  Widget build(BuildContext context) {
    final size = (MediaQuery.of(context).size);
    final padding = MediaQuery.of(context).padding.top;

    final height = size.height - padding;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Container(
                height: height,
                width: size.width,
                child: Column(
                  children: [
                    SizedBox(height: 50),
                    _buildHeader(
                      height: height * .3,
                    ),
                    _buildBody(
                      width: size.width,
                      // (heightOfTheImage)
                      paddingfromImage: ((height * .3) * 0.8) / 2,
                    ),
                  ],
                ),
              ),
              _buildBackButton()
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBackButton() {
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

  Widget _buildHeader({height}) {
    return Container(
      child: Stack(
        overflow: Overflow.visible,
        children: [
          GestureDetector(
            onTap: () {
              print('Image tapped');
            },
            child: Stack(
              children: [
                Container(
                  width: height,
                  height: height,
                  child: Image.asset(
                    'assets/form/iconSafteyPng.png',
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  right: 35,
                  bottom: height / 5,
                  child: Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      color: colorShade600,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: shadowColor900,
                          blurRadius: 30,
                        ),
                      ],
                    ),
                    child: Center(
                      child: SvgPicture.asset(
                        'assets/form/camera.svg',
                        color: Colors.white,
                        height: 30,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBody({width, paddingfromImage}) {
    final paddingTopBottom = 40.0;
    return Container(
      width: width,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: paddingTopBottom,
        ),
        child: Column(
          children: [
            Text(
              'If you have joined to ESport Team or Clan\nplease fill below',
              style: TextStyle(
                height: 1.2,
                color: colorShade800,
                fontSize: 15,
                fontFamily: 'Reglo',
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 15),
            Form(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 90,
                    child: CustomTextField(
                      labelText: 'Clan/Team Name',
                      maxLength: 25,
                      callBackValidator: (String value) {},
                    ),
                  ),
                  SizedBox(height: 15),
                  SubmitButton(
                    label: 'Complete',
                    textStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontFamily: 'Noir',
                      fontWeight: FontWeight.bold,
                    ),
                    color: colorShade700,
                    shadowColor: shadowColor900,
                    onTap: () {
                      Navigator.of(context).pushReplacement(
                        MainScreen.comeToPage(),
                      );
                      Provider.of<RegisterScreenState>(context,listen: false).setTheDefaultPage();
                    },
                  ),
                  SizedBox(height: 30),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
