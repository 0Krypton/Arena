//importing packages
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//importing themes
import '../../Themes/color/colorThemes.dart';

//importing widgets
import '../../Widgets/arenaLogo.dart';
import '../../Widgets/textField.dart';
import '../../Widgets/backButton.dart';
import '../../Widgets/submitButton.dart';

//importing Screens
import '../AuthScreen/loginScreen.dart';
import 'registerScreenImage.dart';

class RegisterScreen extends StatefulWidget {
  static const id = 'RegisterScreen';

  static Route comeToPage() {
    return PageRouteBuilder(
      pageBuilder: (context, animatio1, aniamtion2) => RegisterScreen(),
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
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen>
    with TickerProviderStateMixin {
  bool _isVisible = true;

  AnimationController emailColorController;
  AnimationController passwordColorController;
  AnimationController userNameColorController;

  FocusNode emailFocusNode;
  FocusNode passwordFocusNode;
  FocusNode userNameFocusNode;

  @override
  void initState() {
    super.initState();

    emailFocusNode = new FocusNode();
    passwordFocusNode = new FocusNode();
    userNameFocusNode = new FocusNode();

    emailColorController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    passwordColorController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    userNameColorController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
  }

  @override
  void dispose() {
    super.dispose();
    emailColorController.dispose();
    passwordColorController.dispose();
    userNameColorController.dispose();

    emailFocusNode.dispose();
    passwordFocusNode.dispose();
    userNameFocusNode.dispose();
  }

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
          color: Colors.white,
          child: Stack(
            children: [
              SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: 30),
                    _buildHeader(
                        height: (size.height) * .25, width: size.width),
                    _buildBody(width: size.width),
                  ],
                ),
              ),
              _buildBackButton(),
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
          Navigator.of(context).pushReplacement(
            LoginScreen.comeToPage(),
          );
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
                        focusNode: emailFocusNode,
                        type: 'email',
                        nextFocusNode: userNameFocusNode,
                        prefixIconUrl: 'assets/form/emailPng.png',
                        colorAnimController: emailColorController,
                        callBackValidator: (String value) {},
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      height: 50,
                      child: CustomTextField(
                        labelText: 'User Name',
                        focusNode: userNameFocusNode,
                        nextFocusNode: passwordFocusNode,
                        prefixIconUrl: 'assets/form/userPng.png',
                        colorAnimController: userNameColorController,
                        limit: 4,
                        callBackValidator: (String value) {},
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      height: 50,
                      child: CustomTextField(
                        labelText: 'Password',
                        focusNode: passwordFocusNode,
                        nextFocusNode: passwordFocusNode,
                        prefixIconUrl: 'assets/form/securePng.png',
                        colorAnimController: passwordColorController,
                        limit: 8,
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
