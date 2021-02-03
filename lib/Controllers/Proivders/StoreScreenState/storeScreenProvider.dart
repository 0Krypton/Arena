//importing packages
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

//importing model classes
import '../../../Model/ShopScreenClasses/subscriptionModel.dart';

class ShopScreenProvider extends ChangeNotifier {
  //  This is for test in real app this must be taken
  //  from api
  List<SubscriptionModel> _subs = [
    SubscriptionModel(
      title: 'Arena',
      tiere: 'Tiere 1',
      discription: [
        'x3 time more',
      ],
      lunchUrl: 'https://localhost/',
      imageUrl: 'assets/subs/tierOneImg.png',
      bgImageUrl: 'assets/subs/tierOneBg.png',
      optImageUrl: 'assets/subs/tierOneOpt.png',
      primaryColor: Color(0xFFE4EEFF),
      secondaryColor: Color(0xFF415ABC),
      beginColor: Color(0xFF619FFF),
      endColor: Color(0xFFA157FF),
    ),
    SubscriptionModel(
      title: 'Arena',
      tiere: 'Tiere 2',
      discription: ['x6 time more', 'Create your own tournoument'],
      lunchUrl: 'https://localhost/',
      imageUrl: 'assets/subs/tierTwoImg.png',
      bgImageUrl: 'assets/subs/tierTwoBg.png',
      optImageUrl: 'assets/subs/tierTwoOpt.png',
      primaryColor: Color(0xFF9FFFF8),
      secondaryColor: Color(0xFF145976),
      beginColor: Color(0xFF37DECF),
      endColor: Color(0xFF145976),
    ),
  ];

  List<SubscriptionModel> get subs => _subs;
}
