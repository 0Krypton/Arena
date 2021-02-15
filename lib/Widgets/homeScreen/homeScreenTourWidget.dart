//importing packages
import 'package:flutter/material.dart';

//importing Screens
import '../../Screens/HomeScreen/TourGetReady/tourChatRoom.dart';

//importing ModelFiles
import '../../Model/ExploreScreenClasses/tournoumentDetail.dart';

//importing Widgets
import './buildOptionIcon.dart';

//importing dart files
import 'dart:math' as math;

class BuildHomeTourContainer extends StatefulWidget {
  BuildHomeTourContainer({
    this.heightOfContainer,
    this.widthOfMotherContainer,
    this.widthOfChildContainer,
    this.tour,
  });

  final heightOfContainer;
  final widthOfMotherContainer;
  final widthOfChildContainer;
  final TournoumentDetail tour;

  @override
  _BuildHomeTourContainerState createState() => _BuildHomeTourContainerState();
}

class _BuildHomeTourContainerState extends State<BuildHomeTourContainer> {
  double positionedDragged = 0.0;
  bool _isDragged = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.heightOfContainer,
      width: widget.widthOfMotherContainer,
      margin: EdgeInsets.only(top: 25, bottom: 10, right: 25),
      child: Stack(
        overflow: Overflow.visible,
        children: [
          _getTourBeginTime(),
          _buildOptions(),
          _buildChildContainer(),
        ],
      ),
    );
  }

  Widget _getTourBeginTime() {
    return Positioned(
      top: 0,
      bottom: 0,
      child: RotatedBox(
        quarterTurns: 3,
        child: Container(
          height: 25,
          child: FittedBox(
            child: Text(
              '4 FEB',
              style: TextStyle(
                fontFamily: 'Reglo',
                color: widget.tour.secondaryShadowColor,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildOptions() {
    return Positioned(
      left: ((25) + 25.0),
      top: ((widget.heightOfContainer / 2) - (45.0 / 2)),
      child: AnimatedOpacity(
        duration: const Duration(milliseconds: 150),
        opacity: _isDragged ? 1 : 0,
        child: Row(
          children: [
            BuildOptionIcon(
              height: 45.0,
              width: 45.0,
              color: const Color(0xFF0079BD),
              shadowColor: const Color(0xFF0079BD),
              iconUrl: 'assets/timeRemainSvg.svg',
              onTapCallBack: () {
                print('Time Remained');
              },
            ),
            SizedBox(width: 15),
            BuildOptionIcon(
              height: 45.0,
              width: 45.0,
              color: const Color(0xFFBD0000),
              shadowColor: const Color(0xFFFF0000),
              iconUrl: 'assets/delIconSvg.svg',
              onTapCallBack: () {
                print('Deleted');
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildChildContainer() {
    return AnimatedPositioned(
      duration: const Duration(milliseconds: 500),
      curve: Curves.ease,
      right: positionedDragged,
      child: GestureDetector(
        onHorizontalDragUpdate: onHorizontalDragUpdate,
        child: Container(
          width: widget.widthOfChildContainer,
          height: widget.heightOfContainer,
          decoration: BoxDecoration(
            color: widget.tour.colorBegin,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: _isDragged
                    ? widget.tour.primaryShadowColor.withOpacity(0.7)
                    : widget.tour.primaryShadowColor,
                blurRadius: _isDragged ? 20 : 15,
              ),
            ],
          ),
          child: Stack(
            overflow: Overflow.visible,
            children: [
              _buildGameLogo(),
              _buildTourImage(),
              _buildTourTitle(),
              _buildTourGameMode(),
              _buildTourGetRoomButton(),
            ],
          ),
        ),
      ),
    );
  }

  void onHorizontalDragUpdate(DragUpdateDetails details) {
    print(details.primaryDelta);
    positionedDragged =
        details.primaryDelta > 0 ? -(widget.widthOfChildContainer / 2) : 0.0;

    setState(() {
      _isDragged = details.primaryDelta > 0 ||
              (positionedDragged == widget.widthOfChildContainer / 2)
          ? true
          : false;
    });
  }

  Widget _buildTourGetRoomButton() {
    return Positioned(
      top: widget.heightOfContainer / 2,
      right: 25,
      child: GestureDetector(
        onTap: () {
          Navigator.of(context)
              .push(TourChatRoom.comeToPage(tour: widget.tour));
        },
        child: Container(
          width: 35,
          height: 35,
          decoration: BoxDecoration(
            color: widget.tour.colorBegin,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: widget.tour.secondaryShadowColor,
                blurRadius: 15,
              ),
            ],
          ),
          child: Transform.rotate(
            angle: math.pi,
            child: Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
              size: 20,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTourGameMode() {
    return Positioned(
      top: ((20) + (15)) + 15.0,
      left: widget.widthOfChildContainer * .4,
      child: Text(
        widget.tour.gameMode,
        style: TextStyle(
          color: Colors.white,
          fontFamily: 'Reglo',
          fontSize: 15,
        ),
      ),
    );
  }

  Widget _buildTourTitle() {
    return Positioned(
      top: 20,
      left: widget.widthOfChildContainer * .4,
      child: Text(
        widget.tour.title,
        style: TextStyle(
          color: Colors.white,
          fontFamily: 'Reglo',
          fontSize: 15,
        ),
      ),
    );
  }

  Widget _buildGameLogo() {
    return Positioned(
      top: 15,
      left: 15,
      child: Container(
        height: 25,
        width: 25,
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: widget.tour.colorBegin,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: widget.tour.secondaryShadowColor,
              blurRadius: 15,
            ),
          ],
        ),
        child: Image.asset(
          _getGameLogo(gameName: widget.tour.game.toLowerCase()),
        ),
      ),
    );
  }

  String _getGameLogo({String gameName}) {
    switch (gameName) {
      case 'fortnite':
        return 'assets/game_icons/fortnite/fortniteLogoPng.png';
        break;
      case 'valorant':
        return 'assets/game_icons/valorant/valorantLogoPng.png';
        break;
      case 'apex-legends':
        return 'assets/game_icons/apex/apexPng.png';
        break;
      case 'rainbow-six':
        return 'assets/game_icons/rainbowsix/rainbowsixLogoPng.png';
        break;
      default:
    }
    return '';
  }

  Widget _buildTourImage() {
    return Positioned(
      bottom: 0,
      left: 40,
      child: Container(
        height: widget.heightOfContainer + 20,
        // width: 100,
        child: Image.asset(
          widget.tour.imageUrl,
          fit: BoxFit.fitHeight,
        ),
      ),
    );
  }
}
