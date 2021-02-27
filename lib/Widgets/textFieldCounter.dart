//importing packages
import 'package:flutter/material.dart';

class TextFieldCounter extends StatelessWidget {
  TextFieldCounter({
    @required this.count,
    @required this.isValid,
    @required this.height,
    @required this.verticalPadding,
    @required this.scaleAnimationController,
    @required this.bgColor,
    @required this.bgErrorColor,
    @required this.textColor,
    @required this.errorTextColor,
  });
  final bool isValid;

  final int count;

  final double height;
  final double verticalPadding;

  final Color bgColor;
  final Color bgErrorColor;
  final Color textColor;
  final Color errorTextColor;

  final AnimationController scaleAnimationController;

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: TweenSequence(
        <TweenSequenceItem<double>>[
          TweenSequenceItem<double>(
            tween: Tween<double>(begin: 0, end: 1.3),
            weight: 40.0,
          ),
          TweenSequenceItem<double>(
            tween: Tween<double>(begin: 1.3, end: 0.7),
            weight: 20.0,
          ),
          TweenSequenceItem<double>(
            tween: Tween<double>(begin: 0.7, end: 1),
            weight: 40.0,
          ),
        ],
      ).animate(scaleAnimationController),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        height: height,
        decoration: BoxDecoration(
          color: isValid ? bgColor : bgErrorColor,
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 8,
            vertical: verticalPadding,
          ),
          child: FittedBox(
            fit: BoxFit.contain,
            child: Text(
              '$count',
              style: TextStyle(
                fontFamily: 'Reglo',
                color: isValid ? textColor : errorTextColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
