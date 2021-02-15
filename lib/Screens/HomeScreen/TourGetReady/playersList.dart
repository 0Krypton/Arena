//importing packages
import 'package:flutter/material.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Players for ${tour.title}'),
      ),
    );
  }
}
