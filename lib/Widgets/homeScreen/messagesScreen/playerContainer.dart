//importing packages
import 'package:flutter/material.dart';

class PlayerContainer extends StatelessWidget {
  PlayerContainer({
    this.player,
    this.width,
  });

  final Map<String, dynamic> player;
  final double width;

  @override
  Widget build(BuildContext context) {
    final rectLeft = width - (130.0 + 20);
    final rectTop = 0.0;
    final rectWidth = 130.0;
    final rectHeight = 100.0;

    Color containerBgColor = const Color(0xFFF5F5F5);
    Color containerShadowColor = Colors.black.withOpacity(.25);
    Color textColor = Colors.black;
    List<Color> linearGradientColors = [
      const Color(0xFFD5D5D5),
      const Color(0xFFD5D5D5),
    ];

    Shader linearTextGradient = LinearGradient(
      colors: linearGradientColors,
    ).createShader(
      Rect.fromLTWH(rectLeft, rectTop, rectWidth - 30, rectHeight),
    );

    if (player['rank'] == 1) {
      containerBgColor = const Color(0xFFFFFAD9);
      containerShadowColor = const Color(0xFFEACEBE);
      textColor = const Color(0xFFCDA857);
      linearGradientColors = [
        const Color(0xFFCDA857),
        const Color(0xFFF7EA9B),
      ];
      linearTextGradient = LinearGradient(
        colors: linearGradientColors,
        begin: Alignment.topLeft,
      ).createShader(
        Rect.fromLTWH(rectLeft, rectTop, rectWidth - 30, rectHeight),
      );
    } else if (player['rank'] == 2) {
      containerBgColor = const Color(0xFFECECEC);
      containerShadowColor = const Color(0xFFC2C2C2);
      textColor = const Color(0xFF989898);
      linearGradientColors = [
        const Color(0xFF979797),
        const Color(0xFFD9D9D9),
      ];
      linearTextGradient = LinearGradient(
        colors: linearGradientColors,
        begin: Alignment.topLeft,
      ).createShader(
        Rect.fromLTWH(rectLeft, rectTop, rectWidth - 20, rectHeight),
      );
    } else if (player['rank'] == 3) {
      containerBgColor = const Color(0xFFEAD4CC);
      containerShadowColor = const Color(0xFFD3BFB7);
      textColor = const Color(0xFF92553F);
      linearGradientColors = [
        const Color(0xFF91533E),
        const Color(0xFFEDD0B0),
      ];
      linearTextGradient = LinearGradient(
        colors: linearGradientColors,
        begin: Alignment.topLeft,
      ).createShader(
        Rect.fromLTWH(rectLeft, rectTop, rectWidth, rectHeight),
      );
    }

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      height: 100,
      width: width,
      decoration: BoxDecoration(
        color: containerBgColor,
        borderRadius: BorderRadius.all(Radius.circular(10)),
        boxShadow: [
          BoxShadow(color: containerShadowColor, blurRadius: 20),
        ],
      ),
      child: Stack(
        overflow: Overflow.visible,
        children: [
          Positioned(
            top: 0,
            bottom: 0,
            left: 20,
            child: Row(
              children: [
                Stack(
                  overflow: Overflow.visible,
                  children: [
                    _buildProfileImage(),
                    (player['clanImage'] != '')
                        ? _buildClanImage()
                        : SizedBox(),
                  ],
                ),
                SizedBox(width: 15),
                Text(
                  player['userName'],
                  style: TextStyle(
                    color: textColor,
                    fontSize: 18,
                    fontFamily: 'Reglo',
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            right: 20,
            top: 15,
            child: Container(
              height: 100,
              child: Text(
                '#${player["rank"]}',
                style: TextStyle(
                  fontSize: 100,
                  fontFamily: 'Luckiest',
                  foreground: Paint()..shader = linearTextGradient,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildClanImage() {
    return Positioned(
      bottom: -(20 / 4),
      right: 0,
      child: Container(
        height: 20,
        width: 20,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black,
              blurRadius: 15,
            ),
          ],
        ),
        child: ClipRRect(
          child: Image.asset(
            player['clanImage'],
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }

  Widget _buildProfileImage() {
    return Container(
      height: 50,
      width: 50,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
      ),
      child: ClipRRect(
        child: Image.asset(
          player['profileImage'],
        ),
      ),
    );
  }
}
