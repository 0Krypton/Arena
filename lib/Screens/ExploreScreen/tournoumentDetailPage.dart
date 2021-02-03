//importing packages
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

//importing model classes & data
import '../../Model/ExploreScreenClasses/tournoumentDetail.dart';

//import dart files
import 'dart:math' as math;

class TournoumentDetailPage extends StatelessWidget {
  TournoumentDetailPage({@required this.tour});

  static const id = 'LoginScreen';

  static Route comeToPage({TournoumentDetail tourDetail}) {
    return PageRouteBuilder(
      pageBuilder: (context, animatio1, aniamtion2) =>
          TournoumentDetailPage(tour: tourDetail),
      transitionDuration: const Duration(milliseconds: 300),
      transitionsBuilder: (context, animation1, animation2, child) {
        return Opacity(
          opacity: animation1.value,
          child: child,
        );
      },
    );
  }

  final TournoumentDetail tour;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final media = MediaQuery.of(context);

    return Scaffold(
      body: SafeArea(
        child: Container(
          height: size.height,
          width: size.width,
          color: Colors.white,
          child: Stack(
            children: [
              _buildHeader(
                  width: size.width,
                  height: (size.height - media.padding.top) * .35),
              _buildBody(
                width: size.width,
                height: (size.height - media.padding.top) * .65,
              ),
              _buildEnterButton(),
              _buildBackButton(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildEnterButton() {
    return Positioned(
      bottom: 15,
      left: 25,
      right: 25,
      child: GestureDetector(
        child: Container(
          height: 60,
          decoration: BoxDecoration(
            color: tour.colorBegin,
            borderRadius: BorderRadius.all(Radius.circular(15)),
            boxShadow: [
              BoxShadow(
                color: tour.colorEnd,
                blurRadius: 30,
              ),
            ],
          ),
          child: Center(
            child: Text(
              'Enter Now',
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'Reglo',
                fontSize: 20,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBody({width, height}) {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        width: width,
        height: height + 15,
        padding: EdgeInsets.only(top: 20, bottom: 100),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(20),
            topRight: const Radius.circular(20),
          ),
        ),
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 25),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  tour.title,
                  style: TextStyle(
                    fontFamily: 'Reglo',
                    fontSize: 18,
                    color: tour.colorBegin,
                  ),
                ),
                SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    _buildProfileImage(),
                    SizedBox(width: 20),
                    Text(
                      tour.creator,
                      style: TextStyle(
                        color: tour.colorBegin,
                        fontFamily: 'Reglo',
                        fontSize: 18,
                      ),
                    ),
                    Spacer(),
                    Text(
                      '${tour.enteredPlayers}/${tour.totalPlayers}',
                      style: TextStyle(
                        color: tour.colorBegin,
                        fontFamily: 'Reglo',
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 15),
                Text(
                  'Description',
                  style: TextStyle(
                    color: tour.colorBegin,
                    fontFamily: 'Reglo',
                    fontSize: 15,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildProfileImage() {
    return Container(
      height: 40,
      width: 40,
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: tour.primaryShadowColor,
            blurRadius: 15,
          ),
        ],
      ),
      child: Image.asset(
        tour.creatorImageUrl,
        fit: BoxFit.contain,
      ),
    );
  }

  Widget _buildHeader({width, height}) {
    return Positioned(
      top: 0,
      right: 0,
      left: 0,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [tour.colorBegin, tour.colorEnd],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Stack(
          children: [
            Positioned(
              left: 50,
              bottom: -30,
              child: Container(
                height: height,
                child: Image.asset(
                  tour.imageUrl,
                  fit: BoxFit.fitHeight,
                ),
              ),
            ),
            Positioned(
              right: 20,
              top: 15,
              bottom: 25,
              child: Container(
                width: height - 50,
                child: RotatedBox(
                  quarterTurns: 1,
                  child: FittedBox(
                    fit: BoxFit.contain,
                    child: Text(
                      '${tour.prize}',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Luckiest',
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBackButton(BuildContext context) {
    return Positioned(
      top: 15,
      left: 15,
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).pop();
        },
        child: SvgPicture.asset(
          'assets/back_button.svg',
          color: Colors.white,
        ),
      ),
    );
  }
}
