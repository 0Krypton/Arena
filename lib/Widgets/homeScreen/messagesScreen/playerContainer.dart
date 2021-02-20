//importing packages
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

//importing themes
import '../../../Themes/color/colorThemes.dart';

class PlayerContainer extends StatelessWidget {
  PlayerContainer({
    this.player,
    this.width,
  });

  final Map<String, dynamic> player;
  final double width;

  @override
  Widget build(BuildContext context) {
    Color containerBgColor = Colors.white;
    Color containerShadowColor = const Color(0xFFECECEC);
    List<Color> linearGradientColors = [
      const Color(0xFFD5D5D5),
      const Color(0xFFD5D5D5),
    ];

    Shader linearTextGradient = LinearGradient(
      colors: linearGradientColors,
    ).createShader(
      Rect.fromLTWH(0, 0, 30, 50),
    );

    if (player['rank'] == 1) {
      linearGradientColors = [
        const Color(0xFFCDA857),
        const Color(0xFFF7EA9B),
      ];
      linearTextGradient = LinearGradient(
        colors: linearGradientColors,
        begin: Alignment.topLeft,
      ).createShader(
        const Rect.fromLTWH(20, 0, 80, 100),
      );
    } else if (player['rank'] == 2) {
      linearGradientColors = [
        const Color(0xFF979797),
        const Color(0xFFD9D9D9),
      ];
      linearTextGradient = LinearGradient(
        colors: linearGradientColors,
        begin: Alignment.topLeft,
      ).createShader(
        const Rect.fromLTWH(20, 0, 80, 100),
      );
    } else if (player['rank'] == 3) {
      linearGradientColors = [
        const Color(0xFF91533E),
        const Color(0xFFEDD0B0),
      ];
      linearTextGradient = LinearGradient(
        colors: linearGradientColors,
        begin: Alignment.topLeft,
      ).createShader(
        const Rect.fromLTWH(20, 0, 80, 100),
      );
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: FittedBox(
              fit: BoxFit.fitWidth,
              child: Text(
                '#${player["rank"]}',
                style: TextStyle(
                  fontSize: 50,
                  fontFamily: 'Luckiest',
                  foreground: Paint()..shader = linearTextGradient,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 6,
            child: Container(
              margin: EdgeInsets.only(left: 25, top: 15, bottom: 15, right: 15),
              height: 100,
              decoration: BoxDecoration(
                color: containerBgColor,
                borderRadius: BorderRadius.all(Radius.circular(10)),
                boxShadow: [
                  BoxShadow(color: containerShadowColor, blurRadius: 20),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(width: 25),
                  _buildImages(
                    profileImg: player['profileImage'],
                    clanImg: player['clanImage'],
                  ),
                  SizedBox(width: 20),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        player['userName'],
                        style: TextStyle(
                          fontFamily: 'Reglo',
                          fontSize: 15,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        player['clan'],
                        style: TextStyle(
                          fontFamily: 'Reglo',
                          fontSize: 12,
                          color: const Color(0xFF939191),
                        ),
                      ),
                    ],
                  ),
                  Spacer(),
                  Row(
                    children: [
                      _buildStatColumn(
                        color: const Color(0xFFB87E00),
                        title: 'Wins',
                        value: '${player['wins']}',
                        iconUrl: 'assets/crown.svg',
                      ),
                      SizedBox(width: 15),
                      _buildStatColumn(
                        color: const Color(0xFF8C0000),
                        title: 'Kills',
                        value: '${player['kills']}',
                        iconUrl: 'assets/skull.svg',
                      ),
                    ],
                  ),
                  SizedBox(width: 20),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildImages({profileImg, clanImg}) {
    return Stack(
      overflow: Overflow.visible,
      children: [
        _buildProfileImage(profileImg: profileImg),
        (clanImg != '') ? _buildClanImage(clanImg: clanImg) : SizedBox(),
      ],
    );
  }

  Widget _buildStatColumn({
    Color color,
    String iconUrl,
    String title,
    String value,
  }) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(
          iconUrl,
          height: 25,
          width: 25,
          color: color,
        ),
        const SizedBox(height: 5),
        Text(
          title,
          style: TextStyle(
            color: color,
            fontFamily: 'Reglo',
            fontSize: 15,
          ),
        ),
        const SizedBox(height: 3),
        Text(
          value,
          style: TextStyle(
            color: color,
            fontFamily: 'Reglo',
            fontSize: 15,
          ),
        ),
      ],
    );
  }

  Widget _buildClanImage({String clanImg}) {
    return Positioned(
      bottom: -(20 / 4),
      right: 0,
      child: Container(
        height: 25,
        width: 25,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 10,
            ),
          ],
        ),
        child: ClipRRect(
          child: Image.asset(
            clanImg,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }

  Widget _buildProfileImage({String profileImg}) {
    return Container(
      height: 55,
      width: 55,
      padding: EdgeInsets.all(3),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
        color: Colors.grey,
      ),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
        ),
        child: Image.asset(
          profileImg,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
