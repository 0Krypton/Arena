//importing packages
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

//importing model data & classes
import '../../Model/ExploreScreenClasses/tournoumentDetail.dart';

//import Screen
import './tournoumentDetailPage.dart';

//importing controllers
import '../../Controllers/Proivders/ExploreScreenState/tourListProvider.dart';

//import dart files
import 'dart:math' as math;

class ToursList extends StatefulWidget {
  ToursList({this.height, this.width});

  final height;
  final width;

  @override
  _ToursListState createState() => _ToursListState();
}

class _ToursListState extends State<ToursList> with TickerProviderStateMixin {
  ScrollController _tourController = ScrollController();

  final marginHorizontal = 30.0;
  final marginVertical = 5.0;

  final double heightTourContainer = 150.0;
  TourListProvider provider;

  @override
  void initState() {
    super.initState();
    provider = Provider.of<TourListProvider>(context, listen: false);
    _tourController.addListener(() {
      //in this paticular calculation we calculate the index of container
      //which must be animated
      double value =
          _tourController.offset / ((heightTourContainer * 80) / 100);
      provider.setScale(value);
    });
  }

  @override
  void dispose() {
    _tourController.dispose();
    provider.disposeValues();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      width: widget.width,
      child: _buildList(),
    );
  }

  Widget _buildList() {
    return ListView.builder(
      physics: BouncingScrollPhysics(),
      controller: _tourController,
      itemCount: listTournoument.length,
      padding: EdgeInsets.only(top: 25, bottom: 50),
      itemBuilder: (BuildContext context, int index) {
        return Consumer<TourListProvider>(
          builder: (context, tourProvider, child) {
            double scale = 1.0;

            if (tourProvider.scale > 0.2) {
              // we used 'index + 1' because first item in the list must scale
              // if we use 'index' instead of that, then first item scale to 0 suddenly
              scale = (index + 1) + 0.2 - tourProvider.scale;
              if (scale < 0) {
                scale = 0;
              } else if (scale > 1) {
                scale = 1;
              }
            }
            return Opacity(
              opacity: scale,
              child: Transform(
                transform: Matrix4.identity()..scale(scale, scale),
                alignment: index % 2 == 0
                    ? Alignment.bottomRight
                    : Alignment.bottomLeft,
                child: Align(
                  heightFactor: 0.8,
                  alignment: Alignment.topCenter,
                  child: child,
                ),
              ),
            );
          },
          child: Container(
            height: heightTourContainer,
            margin: EdgeInsets.symmetric(
              horizontal: marginHorizontal,
              vertical: marginVertical,
            ),
            decoration: BoxDecoration(
              color: listTournoument[index].colorBegin,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: listTournoument[index].primaryShadowColor,
                  blurRadius: 20,
                ),
              ],
            ),
            child: Stack(
              overflow: Overflow.visible,
              children: [
                _buildPrize(
                  prize: listTournoument[index].prize,
                  tour: listTournoument[index],
                ),
                _buildBgImage(
                  index: index,
                  imageUrl: listTournoument[index].imageUrl,
                ),
                _getTitle(title: listTournoument[index].title),
                _getPlayers(tour: listTournoument[index]),
                _getGameMode(gameMode: listTournoument[index].gameMode),
                _getToDetailPageButton(
                    context: context, tour: listTournoument[index]),
                _buildGameLogo(
                  index: index,
                  game: listTournoument[index].game,
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildPrize({prize, TournoumentDetail tour}) {
    return Positioned(
      top: 0,
      bottom: 0,
      left: 30.0,
      child: FittedBox(
        fit: BoxFit.fitHeight,
        child: Text(
          '${prize.round()}',
          style: TextStyle(
            fontFamily: 'PtSans',
            // fontSize: 90,
            fontWeight: FontWeight.w900,
            color: tour.colorEnd,
          ),
        ),
      ),
    );
  }

  Widget _buildBgImage({int index, String imageUrl}) {
    return Positioned(
      bottom: 0,
      left: 50,
      child: Container(
        height: heightTourContainer - 10,
        child: Image.asset(
          imageUrl,
          fit: BoxFit.fitHeight,
        ),
      ),
    );
  }

  Widget _getTitle({String title}) {
    return Positioned(
      top: 15,
      left: 120,
      child: Container(
        width: (widget.width - marginHorizontal) / 3,
        child: FittedBox(
          fit: BoxFit.fill,
          child: Text(
            title,
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'Reglo',
              fontSize: 18,
            ),
          ),
        ),
      ),
    );
  }

  Widget _getPlayers({TournoumentDetail tour}) {
    return Positioned(
      right: 15,
      top: 15,
      child: Column(
        children: [
          Container(
            height: 20,
            width: 20,
            child: SvgPicture.asset(
              'assets/players.svg',
              color: Colors.white,
            ),
          ),
          SizedBox(height: 5),
          Text(
            '${tour.enteredPlayers}/${tour.totalPlayers}',
            style: TextStyle(
              fontFamily: 'Reglo',
              fontSize: 12,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  Widget _getGameMode({String gameMode}) {
    return Positioned(
      top: 15 + (18 + 10.0),
      left: 120,
      child: FittedBox(
        child: Container(
          width: (widget.width - marginHorizontal) / 2,
          child: Text(
            gameMode,
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'Reglo',
              fontSize: 15,
            ),
          ),
        ),
      ),
    );
  }

  Widget _getToDetailPageButton({
    BuildContext context,
    TournoumentDetail tour,
  }) {
    return Positioned(
      top: 75,
      right: 25,
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(
            TournoumentDetailPage.comeToPage(
              tourDetail: tour,
            ),
          );
        },
        child: Container(
          width: 35,
          height: 35,
          decoration: BoxDecoration(
            color: tour.colorBegin,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: tour.secondaryShadowColor,
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

  Widget _buildGameLogo({int index, String game}) {
    return Positioned(
      top: 15,
      left: 15,
      child: Container(
        height: 25,
        width: 25,
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: listTournoument[index].colorBegin,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: listTournoument[index].secondaryShadowColor,
              blurRadius: 15,
            ),
          ],
        ),
        child: Image.asset(
          _getGameLogo(gameName: game.toLowerCase()),
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
}
