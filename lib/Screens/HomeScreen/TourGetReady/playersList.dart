//importing packages
import 'package:flutter/material.dart';

//importing Widgets
import '../../../Widgets/backButton.dart';
import '../../../Widgets/homeScreen/messagesScreen/playerContainer.dart';

//importing Models
import '../../../Model/ExploreScreenClasses/tournoumentDetail.dart';

class PlayersList extends StatelessWidget {
  static Route comeToPage({tour}) {
    return PageRouteBuilder(
      pageBuilder: (context, animatio1, aniamtion2) => PlayersList(tour: tour),
      transitionDuration: const Duration(milliseconds: 300),
      transitionsBuilder: (context, animation1, animation2, child) {
        return Opacity(
          opacity: animation1.value,
          child: child,
        );
      },
    );
  }

  PlayersList({this.tour});

  final TournoumentDetail tour;

  final List<Map<String, dynamic>> players = [
    {
      "userName": "Bugha",
      "rank": 1,
      "clan": "Sentinels",
      "profileImage": "assets/tourmembers/ply1.png",
      "clanImage": "assets/tourmembers/ply1clan.png",
      "kills": 7,
      "wins": 1,
    },
    {
      "userName": "Mongraal",
      "rank": 2,
      "clan": "FaZe",
      "profileImage": "assets/tourmembers/ply2.png",
      "clanImage": "assets/tourmembers/ply2clan.png",
      "kills": 7,
      "wins": 1,
    },
    {
      "userName": "Clix",
      "rank": 3,
      "clan": "NRG",
      "profileImage": "assets/tourmembers/ply3.png",
      "clanImage": "assets/tourmembers/ply3clan.png",
      "kills": 7,
      "wins": 1,
    },
    {
      "userName": "Mr Savage",
      "rank": 4,
      "clan": "100 Thieves",
      "profileImage": "assets/tourmembers/ply4.png",
      "clanImage": "assets/tourmembers/ply4clan.png",
      "kills": 7,
      "wins": 1,
    },
    {
      "userName": "Bugha",
      "rank": 5,
      "clan": "Sentinels",
      "profileImage": "assets/tourmembers/ply1.png",
      "clanImage": "assets/tourmembers/ply1clan.png",
      "kills": 7,
      "wins": 1,
    },
    {
      "userName": "Mongraal",
      "rank": 6,
      "clan": "FaZe",
      "profileImage": "assets/tourmembers/ply2.png",
      "clanImage": "assets/tourmembers/ply2clan.png",
      "kills": 7,
      "wins": 1,
    },
    {
      "userName": "Clix",
      "rank": 7,
      "clan": "NRG",
      "profileImage": "assets/tourmembers/ply3.png",
      "clanImage": "assets/tourmembers/ply3clan.png",
      "kills": 7,
      "wins": 1,
    },
    {
      "userName": "Mr Savage",
      "rank": 8,
      "clan": "100 Thieves",
      "profileImage": "assets/tourmembers/ply4.png",
      "clanImage": "assets/tourmembers/ply4clan.png",
      "kills": 7,
      "wins": 1,
    },
    {
      "userName": "Bugha",
      "rank": 9,
      "clan": "Sentinels",
      "profileImage": "assets/tourmembers/ply1.png",
      "clanImage": "assets/tourmembers/ply1clan.png",
      "kills": 7,
      "wins": 1,
    },
    {
      "userName": "Mongraal",
      "rank": 10,
      "clan": "FaZe",
      "profileImage": "assets/tourmembers/ply2.png",
      "clanImage": "assets/tourmembers/ply2clan.png",
      "kills": 7,
      "wins": 1,
    },
    {
      "userName": "Clix",
      "rank": 11,
      "clan": "NRG",
      "profileImage": "assets/tourmembers/ply3.png",
      "clanImage": "assets/tourmembers/ply3clan.png",
      "kills": 7,
      "wins": 1,
    },
    {
      "userName": "Mr Savage",
      "rank": 12,
      "clan": "100 Thieves",
      "profileImage": "assets/tourmembers/ply4.png",
      "clanImage": "assets/tourmembers/ply4clan.png",
      "kills": 7,
      "wins": 1,
    },
  ];

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context);
    final height = media.size.height - media.padding.top;
    final width = media.size.width;

    AppBar appBar = AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leading: Padding(
        padding: const EdgeInsets.all(5.0),
        child: backButton(
          color: Colors.black,
          onTap: () {
            Navigator.of(context).pop();
          },
        ),
      ),
    );

    return SafeArea(
      child: Scaffold(
        appBar: appBar,
        body: Container(
          height: height - appBar.preferredSize.height,
          width: width,
          color: Colors.white,
          child: ListView.builder(
            physics: BouncingScrollPhysics(),
            padding: EdgeInsets.only(bottom: 20),
            itemCount: players.length + 1,
            itemBuilder: (context, index) {
              if (index == 0) {
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5),
                  child: Text(
                    'Players',
                    style: TextStyle(fontFamily: 'Reglo', fontSize: 18),
                  ),
                );
              } else {
                return PlayerContainer(
                  width: width,
                  player: players[index - 1],
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
