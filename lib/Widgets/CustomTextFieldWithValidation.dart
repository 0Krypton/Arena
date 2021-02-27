//importing packages
import 'package:flutter/material.dart';

//importing themes
import '../Themes/color/colorThemes.dart';

class TextFieldWithValidation extends StatefulWidget {
  TextFieldWithValidation({
    this.hintText,
    this.controller,
    this.colorAnimController,
    this.focusNode,
    this.nextFocusNode,
    this.onChanged,
    this.minLines = 1,
    this.maxLines = 1,
    this.maxLenght = 100,
    this.hasBorder = true,
    this.isFilled = true,
    this.fillColor = profileScrTxtFieldFilledColor,
    this.textColor = Colors.black,
    this.hintColor,
    this.errorTextColor = Colors.white,
    this.errorColor,
    this.limit,
  });
  final TextEditingController controller;
  final AnimationController colorAnimController;

  final String hintText;

  final FocusNode focusNode;
  final FocusNode nextFocusNode;

  final Function onChanged;

  final int minLines;
  final int maxLines;
  final int maxLenght;
  final int limit;

  final bool hasBorder;
  final bool isFilled;

  final Color fillColor;
  final Color errorColor;
  final Color textColor;
  final Color hintColor;
  final Color errorTextColor;

  @override
  _TextFieldWithValidationState createState() =>
      _TextFieldWithValidationState();
}

class _TextFieldWithValidationState extends State<TextFieldWithValidation> {
  Animation<Color> textFieldFilledColor;
  Animation<Color> textFieldTextColor;

  @override
  void initState() {
    super.initState();

    textFieldFilledColor = ColorTween(
      begin: widget.fillColor,
      end: widget.errorColor ?? Colors.red[200],
    ).animate(widget.colorAnimController)
      ..addListener(() {
        setState(() {});
      });
    textFieldTextColor = ColorTween(
      begin: widget.textColor,
      end: widget.errorTextColor,
    ).animate(widget.colorAnimController)
      ..addListener(() {
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      scrollPhysics: BouncingScrollPhysics(),
      controller: widget.controller,
      cursorColor: Colors.black,
      autofocus: false,
      minLines: widget.minLines ?? 1,
      maxLines: widget.maxLines ?? 1,
      style: TextStyle(
        color: textFieldTextColor.value,
        fontSize: 15,
        fontFamily: 'Reglo',
        letterSpacing: 0.8,
        wordSpacing: 1,
      ),
      onChanged: (v) {
        if (v.trim().length >= (widget.limit ?? 0)) {
          widget.colorAnimController.reverse();
          widget.onChanged(v.trim());
        } else {
          widget.onChanged(v.trim());
          widget.colorAnimController.forward();
        }
      },
      focusNode: widget.focusNode,
      onSubmitted: (_) {
        if ((widget.controller.text.length >= (widget.limit ?? 0)) &&
            (widget.controller.text.length <= widget.maxLenght)) {
          FocusScope.of(context).requestFocus(widget.nextFocusNode);
        }
      },
      decoration: InputDecoration(
        counterText: '',
        border: InputBorder.none,
        filled: widget.isFilled,
        fillColor: textFieldFilledColor.value,
        hintText: widget.hintText,
        hintStyle: TextStyle(
          color: widget.hintColor ??
              profileScrTxtFieldTxtColor.withOpacity(
                0.5,
              ),
          fontSize: 12,
          fontFamily: 'Lequire',
        ),
        enabledBorder: widget.hasBorder
            ? OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              )
            : InputBorder.none,
        focusedBorder: widget.hasBorder
            ? OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              )
            : InputBorder.none,
      ),
    );
  }
}
