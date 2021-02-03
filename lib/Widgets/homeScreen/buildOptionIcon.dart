//importing packages
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BuildOptionIcon extends StatelessWidget {
  BuildOptionIcon({
    this.height,
    this.width,
    this.color,
    this.shadowColor,
    this.iconUrl,
    this.onTapCallBack,
  });

  final double height, width;

  final Color color;
  final Color shadowColor;

  final String iconUrl;

  final Function onTapCallBack;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTapCallBack,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(5),
          boxShadow: [
            BoxShadow(
              color: shadowColor,
              blurRadius: 15,
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SvgPicture.asset(iconUrl),
        ),
      ),
    );
  }
}
