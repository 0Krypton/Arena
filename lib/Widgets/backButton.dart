//importing packages
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

Widget backButton({Function onTap, Color color}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      height: 45,
      width: 45,
      padding: EdgeInsets.all(10),
      child: SvgPicture.asset(
        'assets/back_button.svg',
        color: color == null ? null : color,
      ),
    ),
  );
}
