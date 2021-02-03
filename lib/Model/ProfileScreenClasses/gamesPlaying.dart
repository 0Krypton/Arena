//importing packages
import 'package:flutter/material.dart';

//importing Color class
import '../../Themes/color/colorThemes.dart';

class GameItemData {
  final String imageUrl;
  final Color color;

  GameItemData({this.color, this.imageUrl});
}

final List<GameItemData> listGamesPlayed = [
  GameItemData(
    color: fortniteColor,
    imageUrl: 'assets/game_icons/fortnite/fortniteTitlePng.png',
  ),
  GameItemData(
    color: valorantColor,
    imageUrl: 'assets/game_icons/valorant/valorantTitlePng.png',
  ),
  GameItemData(
    color: rainbowsixColor,
    imageUrl: 'assets/game_icons/rainbowsix/rainbowsixTitlePng.png',
  ),
  GameItemData(
    color: apexlegendsColor,
    imageUrl: 'assets/game_icons/apex/apexTitlePng.png',
  ),
];
