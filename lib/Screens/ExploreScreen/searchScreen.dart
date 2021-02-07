//importing packages
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

//importing Controllers
import '../../Controllers/Proivders/ExploreScreenState/searchScreenProvider.dart';

//importing Themes
import '../../Themes/color/colorThemes.dart';

//importing Widgets
import '../../Widgets/backButton.dart';

//impoering dart files
import 'dart:math' as math;

class SearchScreen extends StatefulWidget {
  static const id = 'SearchScreen';

  static Route comeToPage() => PageRouteBuilder(
        pageBuilder: (context, animation1, animation2) => SearchScreen(),
        transitionDuration: const Duration(milliseconds: 300),
        transitionsBuilder: (context, animation1, animation2, child) {
          return Opacity(
            opacity: animation1.value,
            child: child,
          );
        },
      );

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen>
    with TickerProviderStateMixin {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _textEditingController;
  bool _isValidInput = false;

  AnimationController _animationController;

  bool _showSearchResult = false;

  FocusNode _focusNode;

  @override
  void initState() {
    super.initState();

    _textEditingController = TextEditingController();
    _focusNode = FocusNode();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
      value: 1,
    );

    _animationController.addListener(() {});
  }

  // @override
  // void dispose() {
  //   _textEditingController.dispose();
  //   _focusNode.dispose();
  //   _animationController.dispose();
  //   super.dispose();
  // }

  void _stateChanged() {
    // FocusScope.of(context).requestFocus(new FocusNode());
    if (_focusNode.hasFocus) _focusNode.unfocus();
    setState(() {
      _animationController.status == AnimationStatus.completed
          ? _animationController.reverse()
          : _animationController.forward();
      _showSearchResult = !_showSearchResult;
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final padding = 40.0;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          height: size.height,
          width: size.width,
          child: Stack(
            children: [
              _buildSearchResultScreen(
                width: size.width,
                height: size.height,
                padding: padding,
              ),
              _buildSearchTextField(
                width: size.width - (padding * 2),
                padding: padding,
              ),
              _buildBackButton(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSearchResultScreen({height, width, padding}) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (BuildContext buildContext, Widget child) {
        return AnimatedPositioned(
          duration: Duration(milliseconds: 350),
          curve: Curves.ease,
          left: _showSearchResult ? 0 : (width / 2) - ((width / 2) * .7),
          top: _animationController.value * (height * .4),
          child: Transform(
              transform: Matrix4.identity()
                ..scale(
                  1 - (_animationController.value * 0.3),
                ),
              child: child),
        );
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 350),
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: _showSearchResult ? Colors.transparent : colorShade900,
              blurRadius: 20,
            ),
          ],
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 10),
              GestureDetector(
                onTap: () {
                  print('Hello');
                },
                onPanUpdate: _showSearchResult
                    ? (details) {
                        print(details.delta.dy);
                        if (details.delta.dy > 0) {
                          _stateChanged();
                        }
                      }
                    : (details) {},
                child: Container(
                  height: 7,
                  width: width * .3,
                  decoration: BoxDecoration(
                    color: colorShade900.withOpacity(0.7),
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSearchTextField({width, padding}) {
    return Positioned(
      left: padding,
      top: 15 + 45.0 + 5,
      child: AnimatedBuilder(
        animation: _animationController,
        builder: (context, child) => AnimatedOpacity(
          duration: const Duration(milliseconds: 200),
          opacity: _animationController.value,
          child: child,
        ),
        child: Container(
          width: width,
          height: 70,
          child: Form(
            key: _formKey,
            child: TextFormField(
              focusNode: _focusNode,
              controller: _textEditingController,
              validator: (val) {
                if (val.isEmpty) {
                  setState(() {
                    _isValidInput = false;
                  });
                } else {
                  setState(() {
                    _isValidInput = true;
                  });
                }
                return;
              },
              maxLines: 1,
              textAlign: TextAlign.center,
              cursorColor: colorShade800,
              style: TextStyle(
                color: colorShade800,
                fontSize: 18,
                fontFamily: 'Reglo',
              ),
              decoration: InputDecoration(
                filled: true,
                fillColor: colorShade600.withOpacity(.3),
                hintText: 'Enter to Search',
                hintStyle: TextStyle(
                  color: colorShade800,
                  fontSize: 12,
                  fontFamily: 'Lequire',
                ),
                suffixIcon: IconButton(
                  icon: Transform.rotate(
                    angle: math.pi / 2,
                    child: SvgPicture.asset(
                      'assets/searchIcon.svg',
                      color: colorShade900,
                    ),
                  ),
                  onPressed: () {
                    _formKey.currentState.validate();

                    if (_isValidInput) _stateChanged();
                  },
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBackButton(BuildContext context) {
    return Positioned(
      top: 15,
      left: 15,
      child: AnimatedBuilder(
        animation: _animationController,
        builder: (context, child) => AnimatedOpacity(
          duration: const Duration(milliseconds: 200),
          opacity: _animationController.value,
          child: Row(
            children: [
              backButton(
                onTap: () {
                  _focusNode.unfocus();
                  Navigator.of(context).pop();
                },
              ),
              Text(
                'Search Screen',
                style: TextStyle(
                  fontFamily: 'Reglo',
                  fontSize: 18,
                  color: colorShade900,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
