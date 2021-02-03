// importing packages
import 'package:flutter/material.dart';

// importing themes
import '../Themes/color/colorThemes.dart';

class SubmitButton extends StatelessWidget {
  final double height;

  final String label;
  final TextStyle textStyle;

  final Color color;
  final Color shadowColor;

  final Function onTap;

  SubmitButton({
    this.height = 50,
    @required this.label,
    this.textStyle,
    this.color = colorShade700,
    this.shadowColor = shadowColor900,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.all(
            Radius.circular(15),
          ),
          boxShadow: [
            BoxShadow(
              color: shadowColor,
              blurRadius: 20,
            ),
          ],
        ),
        child: Center(
          child: Text(
            label,
            style: textStyle,
          ),
        ),
      ),
    );
  }
}
