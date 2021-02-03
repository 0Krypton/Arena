import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:flare_flutter/flare_actor.dart';

class FlareState extends ChangeNotifier {
  List<Widget> animation = [];

  List<Widget> _anims = [
    FlareActor(
      'assets/rive/earth.flr',
      animation: 'Amn',
      alignment: Alignment.center,
      fit: BoxFit.contain,
    ),
    FlareActor(
      'assets/rive/earth.flr',
      animation: 'Ams',
      alignment: Alignment.center,
      fit: BoxFit.contain,
    ),
    FlareActor(
      'assets/rive/earth.flr',
      animation: 'Eu',
      alignment: Alignment.center,
      fit: BoxFit.contain,
    ),
    FlareActor(
      'assets/rive/earth.flr',
      animation: 'As',
      alignment: Alignment.center,
      fit: BoxFit.contain,
    ),
    FlareActor(
      'assets/rive/earth.flr',
      animation: 'Me',
      alignment: Alignment.center,
      fit: BoxFit.contain,
    ),
    FlareActor(
      'assets/rive/earth.flr',
      animation: 'Af',
      alignment: Alignment.center,
      fit: BoxFit.contain,
    ),
    FlareActor(
      'assets/rive/earth.flr',
      animation: 'Au',
      alignment: Alignment.center,
      fit: BoxFit.contain,
    ),
  ];

  void addAnimation(String animationType) {
    switch (animationType) {
      case 'NA - North America':
        _addToList(0);
        break;
      case 'SA - South America':
        _addToList(1);
        break;
      case 'EU - Europe':
        _addToList(2);
        break;
      case 'AS - Asia':
        _addToList(3);
        break;
      case 'ME - Middle-East':
        _addToList(4);
        break;
      case 'AF - Africa':
        _addToList(5);
        break;
      case 'OC - Oceania':
        _addToList(6);
        break;
    }
  }

  void _addToList(int number) {
    animation.isEmpty ? print(number) : animation.removeLast();
    animation.add(_anims[number]);
    notifyListeners();

    // _anims.add(
    //   _addFlareWidget(animationName),
    // );
  }

  // Widget _addFlareWidget(String animationName) {
  //   return new FlareActor(
  //     'assets/rive/earth.flr',
  //     animation: animationName,
  //     alignment: Alignment.center,
  //     fit: BoxFit.contain,
  //   );
  // }

  void disposeClass() {
    animation = [];
    notifyListeners();
    print('Dispose Called');
  }
}
