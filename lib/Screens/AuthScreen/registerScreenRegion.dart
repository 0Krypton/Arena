//importing packages
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

//importing themes
import '../../Themes/color/colorThemes.dart';

//importing controllers
import '../../Controllers/Proivders/earthFlareState.dart';

//importing screens
import 'registerScreenClan.dart';

//importing widgets
import '../../Widgets/backButton.dart';
import '../../Widgets/submitButton.dart';

//importing dart files
import 'dart:math' as math;

class RegisterScreenRegion extends StatefulWidget {
  static const id = 'RegisterScreenRegion';

  static Route comeToPage() {
    return PageRouteBuilder(
      pageBuilder: (context, animatio1, aniamtion2) => RegisterScreenRegion(),
      transitionDuration: const Duration(milliseconds: 300),
      transitionsBuilder: (context, animation1, animation2, child) {
        return Opacity(
          opacity: animation1.value,
          child: child,
        );
      },
    );
  }

  static const List<String> regions = <String>[
    'NA - North America',
    'SA - South America',
    'EU - Europe',
    'AS - Asia',
    'ME - Middle-East',
    'AF - Africa',
    'OC - Oceania',
  ];

  @override
  _RegisterScreenRegionState createState() => _RegisterScreenRegionState();
}

class _RegisterScreenRegionState extends State<RegisterScreenRegion> {
  String _dropDownValue = 'EU - Europe';

  @override
  Widget build(BuildContext context) {
    final size = (MediaQuery.of(context).size);
    final padding = MediaQuery.of(context).padding.top;

    final height = size.height - padding;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          height: height,
          width: size.width,
          child: Stack(
            children: [
              Column(
                children: [
                  SizedBox(height: 50),
                  _buildHeader(height: (size.height - padding) * .3),
                  _buildBody(width: size.width),
                ],
              ),
              _buildBackButton(context)
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBackButton(BuildContext context) {
    return Positioned(
      top: 10,
      left: 10,
      child: backButton(
        context: context,
        onTap: () {
          Navigator.of(context).pop();
        },
      ),
    );
  }

  Widget _buildHeader({height, width}) {
    final providerFlareAnim = Provider.of<FlareState>(context).animation;

    return Container(
      height: height,
      width: height,
      padding: EdgeInsets.all(10),
      child: providerFlareAnim.isEmpty
          ? SizedBox()
          : Consumer<FlareState>(
              builder: (context, provider, child) {
                return provider.animation[0];
              },
            ),
    );
  }

  Widget _buildBody({height, width}) {
    final padding = 2 * 20.0;

    return Container(
      width: width,
      color: Colors.white,
      padding: EdgeInsets.symmetric(
        horizontal: padding / 2,
        vertical: padding / 2,
      ),
      child: Column(
        children: [
          Text(
            'Select your region',
            style: TextStyle(
              fontSize: 18,
              fontFamily: 'Reglo',
              color: colorShade800,
            ),
          ),
          SizedBox(height: 15),
          Container(
            height: 50,
            width: width - padding,
            padding: EdgeInsets.symmetric(horizontal: 15),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
            child: Container(
              padding: const EdgeInsets.only(left: 10.0, right: 10.0),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                border: Border.all(
                  color: buttonColor,
                  width: 1,
                ),
              ),
              child: DropdownButton<String>(
                underline: SizedBox(),
                icon: Transform.rotate(
                  angle: -math.pi / 2,
                  child: SvgPicture.asset(
                    'assets/back_button.svg',
                  ),
                ),
                dropdownColor: Colors.white,
                isExpanded: true,
                value: _dropDownValue,
                onChanged: (value) {
                  Provider.of<FlareState>(context, listen: false)
                      .addAnimation(value);
                  setState(() {
                    _dropDownValue = value;
                  });
                },
                items:
                    RegisterScreenRegion.regions.map<DropdownMenuItem<String>>(
                  (String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                        style: TextStyle(
                          fontFamily: 'Reglo',
                          fontSize: 15,
                          color: colorShade800,
                        ),
                      ),
                    );
                  },
                ).toList(),
              ),
            ),
          ),
          SizedBox(height: 15),
          Container(
            width: width - padding - 30,
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
                Navigator.of(context).push(
                  RegisterScreenClan.comeToPage(),
                );

                Provider.of<FlareState>(context, listen: false).disposeClass();
              },
            ),
          ),
        ],
      ),
    );
  }
}
