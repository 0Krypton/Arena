//importing packages
import 'package:flutter/material.dart';

//importing Themes
import '../../Themes/color/colorThemes.dart';

//importing Screen
import 'registerScreen.dart';

//importing Widgets
import '../../Widgets/arenaLogo.dart';
import '../../Widgets/submitButton.dart';
import '../../Widgets/textField.dart';

class LoginScreen extends StatefulWidget {
  static const id = 'LoginScreen';

  static Route comeToPage() {
    return PageRouteBuilder(
      pageBuilder: (context, animatio1, aniamtion2) => LoginScreen(),
      transitionDuration: const Duration(milliseconds: 500),
      transitionsBuilder: (context, animation1, animation2, child) {
        return Opacity(
          opacity: animation1.value,
          child: child,
        );
      },
    );
  }

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
            child: Column(
              children: [
                SizedBox(height: 30),
                _buildHeader(height: height * .25, width: size.width),
                SizedBox(height: 20),
                _buildBody(width: size.width),
                Spacer(),
                _buildFooter(width: size.width),
              ],
            ),
          ),
        ),
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
      child: Padding(
        padding: EdgeInsets.all(paddingTopBottom),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
            boxShadow: [
              BoxShadow(color: shadowColor800, blurRadius: 30),
            ],
          ),
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 25),
          child: Column(
            children: [
              Text(
                'Login',
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
                      label: 'Login',
                      textStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontFamily: 'Noir',
                        fontWeight: FontWeight.bold,
                      ),
                      color: colorShade700,
                      shadowColor: shadowColor900,
                      onTap: () {
                        print('Loging');
                      },
                    ),
                    SizedBox(height: 20),
                    Row(
                      children: [
                        Text(
                          'Don\'t remember your password?',
                          style: TextStyle(
                            fontFamily: 'Reglo',
                            fontSize: 12,
                            color: colorShade800,
                          ),
                        ),
                        SizedBox(width: 5),
                        GestureDetector(
                          onTap: () {
                            print('Get help reset password');
                          },
                          child: Text(
                            'Get Help',
                            style: TextStyle(
                              fontFamily: 'Reglo',
                              fontSize: 15,
                              color: colorShade900,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFooter({width}) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).pushReplacement(
            RegisterScreen.comeToPage(),
          );
        },
        child: Container(
          width: width,
          margin: EdgeInsets.only(bottom: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Don\'t have an Account?',
                style: TextStyle(
                  fontFamily: 'Reglo',
                  fontSize: 12,
                  color: colorShade800,
                ),
              ),
              SizedBox(width: 5),
              Text(
                'Register',
                style: TextStyle(
                  fontFamily: 'Reglo',
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: colorShade900,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
