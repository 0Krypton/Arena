//importing pakages
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

//importing themes
import '../../Themes/color/colorThemes.dart';

//importing screens
import 'registerScreenGame.dart';

//importing widgets
import '../../Widgets/backButton.dart';
import '../../Widgets/textField.dart';
import '../../Widgets/submitButton.dart';

class RegisterScreenImage extends StatefulWidget {
  static const id = 'RegisterScreenImage';

  static Route comeToPage() {
    return PageRouteBuilder(
      pageBuilder: (context, animatio1, aniamtion2) => RegisterScreenImage(),
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
  _RegisterScreenImageState createState() => _RegisterScreenImageState();
}

class _RegisterScreenImageState extends State<RegisterScreenImage> {
  @override
  Widget build(BuildContext context) {
    final size = (MediaQuery.of(context).size);

    final height = size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          height: height,
          width: size.width,
          child: Stack(
            children: [
              Container(
                height: height,
                width: size.width,
                child: Column(
                  children: [
                    _buildHeader(
                      height: height * .5,
                      width: size.width,
                    ),
                    _buildBody(
                      height: height * .6,
                      width: size.width,
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
          Navigator.of(context).pop();
        },
        color: Colors.white,
      ),
    );
  }

  Widget _buildHeader({height, width}) {
    return Container(
      height: height * .8,
      width: width,
      child: Stack(
        overflow: Overflow.visible,
        children: [
          GestureDetector(
            onTap: () {
              print('ImageBg tapped');
            },
            child: Container(
              height: height * .4,
              width: width,
              color: buttonColor,
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: GestureDetector(
              onTap: () {
                print('Image tapped');
              },
              child: Container(
                height: height * .5,
                width: height * .5,
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
                    height: 60,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBody({height, width, paddingfromImage}) {
    final paddingTopBottom = 40.0;
    return Container(
      width: width,
      // margin: EdgeInsets.only(top: paddingFromImage / 2),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: paddingTopBottom,
        ),
        child: Column(
          children: [
            Text(
              'Tap to select\nProfile & BackGround Image\nof your profile',
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
                  CustomTextField(
                    labelText: 'First Name',
                    callBackValidator: (String value) {},
                  ),
                  SizedBox(height: 10),
                  CustomTextField(
                    labelText: 'Last Name',
                    callBackValidator: (String value) {},
                  ),
                  SizedBox(height: 15),
                  SubmitButton(
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
                      Navigator.of(context).push(
                        RegisterScreenGame.comeToPage(),
                      );
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
