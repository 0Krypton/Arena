//importing packages
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

//importing themes
import '../../Themes/color/colorThemes.dart';

//importing Screens
import 'registerScreenImage.dart';

//importing widgets
import '../../Widgets/arenaLogo.dart';
import '../../Widgets/submitButton.dart';
import '../../Widgets/textField.dart';
import '../../Widgets/backButton.dart';

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
  bool _isVisible = true;

  @override
  Widget build(BuildContext context) {
    final size = (MediaQuery.of(context).size);
    final padding = MediaQuery.of(context).padding.top;

    final height = size.height - padding;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            height: height,
            width: size.width,
            child: Stack(
              children: [
                Column(
                  children: [
                    SizedBox(height: 30),
                    _buildHeader(
                        height: (size.height - padding) * .25,
                        width: size.width),
                    _buildBody(width: size.width),
                  ],
                ),
                _buildBackButton(),
              ],
            ),
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
        context: context,
        onTap: () {
          Navigator.of(context).pop();
        },
        color: null,
      ),
    );
  }

  Widget _buildHeader({height, width}) {
    return ArenaLogo(
      height: height,
    );
  }

  Widget _buildBody({height, width}) {
    final paddingTopBottom = 40.0;

    return Container(
      width: width,
      // color: Colors.black,
      child: Padding(
        padding: EdgeInsets.all(paddingTopBottom),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(20)),
            boxShadow: [
              BoxShadow(color: shadowColor800, blurRadius: 30),
            ],
          ),
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 25),
          child: Column(
            children: [
              Text(
                'Register',
                style: TextStyle(
                  color: colorShade800,
                  fontSize: 15,
                  fontFamily: 'Noir',
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 10),
              Form(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 50,
                      child: CustomTextField(
                        labelText: 'Email',
                        prefixIconUrl: 'assets/form/emailPng.png',
                        callBackValidator: (String value) {},
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      height: 50,
                      child: CustomTextField(
                        labelText: 'User Name',
                        prefixIconUrl: 'assets/form/userPng.png',
                        callBackValidator: (String value) {},
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      height: 50,
                      child: CustomTextField(
                        labelText: 'Password',
                        prefixIconUrl: 'assets/form/securePng.png',
                        callBackValidator: (String value) {},
                        isObscure: _isVisible,
                        isPasswordField: true,
                        suffixOnPressed: () {
                          setState(() {
                            _isVisible = !_isVisible;
                          });
                        },
                      ),
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
                          RegisterScreenImage.comeToPage(),
                        );
                      },
                    ),
                    SizedBox(height: 10),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
