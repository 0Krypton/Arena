import 'package:flutter/material.dart';

import '../Themes/color/colorThemes.dart';

class ArenaLogo extends StatelessWidget {
  final height;

  ArenaLogo({@required this.height});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Hero(
          tag: 'arenaLogo',
          child: Container(
            height: height * .7,
            width: height * .7,
            child: Image.asset('assets/arenaPng.png'),
          ),
        ),
        Text(
          'Arena',
          style: TextStyle(
            color: colorShade800,
            fontFamily: 'Noir',
            fontWeight: FontWeight.w900,
            fontSize: 20,
          ),
        ),
      ],
    );
  }
}
