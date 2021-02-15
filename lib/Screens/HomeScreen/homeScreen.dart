//importing packages
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

//importing models
import '../../Model/ProfileScreenClasses/gamesPlaying.dart';

//importing Screens
import 'TourGetReady/tournoumentsGetReady.dart';
import 'msgScreen/contactsScreen.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({this.height, this.width});

  final height;
  final width;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      color: Colors.white,
      child: Column(
        children: [
          _buildAppBar(context),
          SizedBox(height: 5),
          _buildStats(width: width * .4),
          SizedBox(height: 20),
          _buildGetReady(
            height: height - (123 + (5) + 60 + (20)),
          ),
        ],
      ),
    );
  }

  Widget _buildGetReady({height}) {
    return Container(
      height: height,
      width: width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 35),
            child: Text(
              'Get Ready',
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontFamily: 'Reglo',
              ),
            ),
          ),
          SizedBox(height: 10),
          GetReadyTournoumentsList(
            height: height - ((18) + (10)),
            width: width,
            marginLeft: 35.0,
          ),
        ],
      ),
    );
  }

  Widget _buildStats({width}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 30.0),
          child: Text(
            'Stats',
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontFamily: 'Reglo',
            ),
          ),
        ),
        SizedBox(height: 5),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          physics: BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.only(left: 30, right: 30),
            child: Row(
              children: List.generate(
                listGamesPlayed.length,
                (index) => GestureDetector(
                  onTap: () {
                    print(index);
                  },
                  child: Container(
                    width: width,
                    height: 100,
                    margin: EdgeInsets.symmetric(horizontal: 5),
                    decoration: BoxDecoration(
                      color: listGamesPlayed[index].color,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(25),
                      child: Image.asset(
                        listGamesPlayed[index].imageUrl,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildAppBar(BuildContext context) {
    return Container(
      height: 50,
      width: width,
      margin: EdgeInsets.only(top: 10, left: 20, right: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Home',
            style: TextStyle(
              fontFamily: 'Reglo',
              fontSize: 20,
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(ContactsScreen.comeToPage());
            },
            child: Container(
              height: 25,
              width: 25,
              decoration: BoxDecoration(
                // color: Colors.orange,
                shape: BoxShape.circle,
              ),
              child: SvgPicture.asset(
                'assets/send.svg',
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
