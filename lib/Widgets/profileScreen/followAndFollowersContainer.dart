//importing packages
import 'package:flutter/material.dart';

//importing themes
import '../../Themes/color/colorThemes.dart';

class FollowAndFollowersContainer extends StatelessWidget {
  FollowAndFollowersContainer({@required this.count, @required this.name});

  final String count;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          count,
          style: TextStyle(
            fontFamily: 'Reglo',
            fontSize: 15,
            color: followingfollowersNumberColor,
          ),
        ),
        Text(
          name,
          style: TextStyle(
            fontFamily: 'Reglo',
            fontSize: 12,
            color: followingfollowersTextColor,
          ),
        ),
      ],
    );
  }
}
