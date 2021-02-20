import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

//importing Model Class
import '../../../Model/ExploreScreenClasses/regionsModel.dart';
import '../../../Model/ExploreScreenClasses/tournoumentDetail.dart';

//importing Themes
import '../../../Themes/color/colorThemes.dart';

class ExploreScreenProvider extends ChangeNotifier {
  //OrderBy
  List<String> _orderByRegion = [];
  List<String> _orderByGame = ['Fortnite'];
  //Variable Decleration
  List<Map<String, dynamic>> _regionServers = [
    <String, dynamic>{
      'name': 'Na-East',
      'color': Color(0xFF00D749),
      'isSelected': false,
    },
    <String, dynamic>{
      'name': 'Na-West',
      'color': Color(0xFF60B5FF),
      'isSelected': false,
    },
    <String, dynamic>{
      'name': 'Europe',
      'color': Color(0xFFCE0000),
      'isSelected': false,
    },
    <String, dynamic>{
      'name': 'Middle-East',
      'color': Color(0xFF0057FF),
      'isSelected': false,
    },
    <String, dynamic>{
      'name': 'Asia',
      'color': Color(0xFFFF7A00),
      'isSelected': false,
    },
    <String, dynamic>{
      'name': 'Africa',
      'color': Colors.pink,
      'isSelected': false,
    },
    <String, dynamic>{
      'name': 'Oceania',
      'color': Colors.redAccent,
      'isSelected': false,
    },
  ];
  List<Map<String, dynamic>> _availableGames = [
    <String, dynamic>{
      'name': 'Fortnite',
      'image-url': 'assets/game_icons/fortnite/fortniteLogoPng.png',
      'isSelected': true,
      'color': fortniteColor,
      'color-begin': Color(0xFF0096D9),
      'color-end': Color(0xFF014564),
      'shadow-begin': Color(0xFF0085c1),
      'shadow-end': Color(0xFF0096d5),
    },
    <String, dynamic>{
      'name': 'Apex',
      'image-url': 'assets/game_icons/apex/apexPng.png',
      'isSelected': false,
      'color': apexlegendsColor,
      'color-begin': Color(0xFFC00000),
      'color-end': Color(0xFF250000),
      'shadow-begin': Color(0xFF7f0000),
      'shadow-end': Color(0xFF8d0000),
    },
    <String, dynamic>{
      'name': 'Valorant',
      'image-url': 'assets/game_icons/valorant/valorantLogoPng.png',
      'isSelected': false,
      'color': valorantColor,
      'color-begin': Color(0xFFFF4454),
      'color-end': Color(0xFF7A000A),
      'shadow-begin': Color(0xFFf24150),
      'shadow-end': Color(0xFFff4758),
    },
    <String, dynamic>{
      'name': 'RainbowSix',
      'image-url': 'assets/game_icons/rainbowsix/rainbowsixLogoPng.png',
      'isSelected': false,
      'color': rainbowsixColor,
      'color-begin': Color(0xFF898989),
      'color-end': Color(0xFF000000),
      'shadow-begin': Color(0xFF424242),
      'shadow-end': Color(0xFF484848),
    },
  ];
  //Getters
  List<Map<String, dynamic>> get regionServers => _regionServers;
  List<Map<String, dynamic>> get availableGames => _availableGames;

  List<TournoumentDetail> get tournouments => listTournoument;

  List<String> get orderByRegion => _orderByRegion;
  List<String> get orderByGame => _orderByGame;

  //Function Decleration

  // Region Order Changing
  void changeRegionOrder(int index) {
    Map<String, dynamic> region = _regionServers[index];
    _regionServers.forEach((reg) {
      reg['isSelected'] = false;
    });
    _orderByRegion = [];

    if (!_orderByRegion.contains(region['name'])) {
      _orderByRegion.add(region['name']);
      region['isSelected'] = !region['isSelected'];
    } else {
      _orderByRegion.removeWhere((regionName) => regionName == region['name']);
    }
    print('The orderByRegion List:\n $_orderByRegion');

    notifyListeners();
  }

  // Games Order Changing
  void changeGameOrder(int index) {
    Map<String, dynamic> game = _availableGames[index];
    _availableGames.forEach((g) => g['isSelected'] = false);
    _orderByGame = [];

    if (!_orderByGame.contains(game['name'])) {
      _orderByGame.add(game['name']);
      game['isSelected'] = !game['isSelected'];
    } else {
      _orderByGame.removeWhere((gameName) => gameName == game['name']);
    }
    print('The orderByGame List:\n $_orderByGame');

    notifyListeners();
  }
}
