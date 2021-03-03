// importing packages
import 'package:flutter/material.dart';

// importing themes
import '../Themes/color/colorThemes.dart';

class CustomTextField extends StatefulWidget {
  CustomTextField({
    this.controller,
    this.type,
    this.maxLines = 1,
    this.maxLength,
    this.limit = 0,
    @required this.labelText,
    this.prefixIconUrl,
    this.isObscure = false,
    this.isPasswordField = false,
    this.focusNode,
    this.nextFocusNode,
    this.suffixOnPressed,
    this.onChanged,
    this.colorAnimController,
  });

  final int maxLines;
  final int maxLength;
  final int limit;

  final String type;

  final String labelText;
  final String prefixIconUrl;

  final FocusNode focusNode;
  final FocusNode nextFocusNode;

  final bool isObscure;
  final bool isPasswordField;

  final TextEditingController controller;

  final AnimationController colorAnimController;

  final Function suffixOnPressed;
  final Function onChanged;

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  Animation<Color> textFieldFilledColor;
  Animation<Color> textFieldTextColor;
  Animation<Color> iconUnVisibleColor;

  @override
  void initState() {
    super.initState();

    textFieldFilledColor = ColorTween(
      begin: colorShade600.withOpacity(.3),
      end: Colors.red[100],
    ).animate(widget.colorAnimController)
      ..addListener(() {
        setState(() {});
      });
    textFieldTextColor = ColorTween(
      begin: colorShade800,
      end: Colors.red[900],
    ).animate(widget.colorAnimController)
      ..addListener(() {
        setState(() {});
      });
    iconUnVisibleColor = ColorTween(
      begin: colorShade800,
      end: Colors.red[600],
    ).animate(widget.colorAnimController)
      ..addListener(() {
        setState(() {});
      });
  }

  bool validateEmail(String value) {
    return RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(value);
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller ?? null,
      autofocus: false,
      maxLines: 1,
      minLines: 1,
      maxLength: widget.maxLength == null ? null : widget.maxLength,
      textAlign: TextAlign.center,
      obscureText: widget.isObscure,
      cursorColor: textFieldTextColor.value,
      focusNode: widget.focusNode,
      style: TextStyle(
        color: textFieldTextColor.value,
        fontSize: 15,
        fontFamily: 'Reglo',
        letterSpacing: 1,
        wordSpacing: 1,
      ),
      onChanged: (v) {
        if (widget.type == 'email') {
          if (validateEmail(v.trim())) {
            widget.colorAnimController.reverse();
            widget.onChanged(v.trim());
          } else {
            widget.colorAnimController.forward();
            widget.onChanged(v.trim());
          }
        } else {
          if (v.trim().length >= (widget.limit ?? 0)) {
            widget.colorAnimController.reverse();
            widget.onChanged(v.trim());
          } else {
            widget.colorAnimController.forward();
            widget.onChanged(v.trim());
          }
        }
      },
      onSubmitted: (value) {
        if (widget.type == 'email') {
          if (validateEmail(value.trim())) {
            FocusScope.of(context).requestFocus(widget.nextFocusNode);
          }
        } else {
          if ((value.length >= (widget.limit ?? 0))) {
            FocusScope.of(context).requestFocus(widget.nextFocusNode);
          }
        }
      },
      decoration: InputDecoration(
        counterText: '',
        border: InputBorder.none,
        filled: true,
        fillColor: textFieldFilledColor.value,
        labelText: widget.labelText,
        labelStyle: TextStyle(
          color: textFieldTextColor.value,
          fontSize: 12,
          fontFamily: 'Lequire',
        ),
        prefixIcon: widget.prefixIconUrl != null
            ? Container(
                height: 15,
                width: 15,
                padding: const EdgeInsets.all(8),
                child: Image.asset(
                  widget.prefixIconUrl,
                  color: textFieldTextColor.value,
                ),
              )
            : null,
        suffixIcon: widget.isPasswordField
            ? IconButton(
                icon: Icon(
                  widget.isObscure ? Icons.visibility_off : Icons.visibility,
                  color: widget.isObscure
                      ? textFieldTextColor.value
                      : iconUnVisibleColor.value,
                ),
                onPressed: widget.suffixOnPressed,
              )
            : SizedBox(
                height: 0,
                width: 0,
              ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
      ),
    );
  }
}
