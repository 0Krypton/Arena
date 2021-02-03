// importing packages
import 'package:flutter/material.dart';

// importing themes
import '../Themes/color/colorThemes.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField({
    this.maxLines = 1,
    this.maxLength,
    @required this.labelText,
    this.prefixIconUrl,
    this.isObscure = false,
    this.isPasswordField = false,
    this.callBackValidator,
    this.suffixOnPressed,
  });

  final int maxLines;
  final int maxLength;

  final String labelText;
  final String prefixIconUrl;

  final bool isObscure;
  final bool isPasswordField;

  final Function(String input) callBackValidator;
  final Function suffixOnPressed;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: 1,
      maxLength: maxLength == null ? null : maxLength,
      textAlign: TextAlign.center,
      obscureText: isObscure,
      cursorColor: colorShade800,
      validator: callBackValidator,
      style: TextStyle(
        color: colorShade800,
        fontSize: 15,
        fontFamily: 'Reglo',
      ),
      decoration: InputDecoration(
        filled: true,
        fillColor: colorShade600.withOpacity(.3),
        labelText: labelText,
        labelStyle: TextStyle(
          color: colorShade800,
          fontSize: 12,
          fontFamily: 'Lequire',
        ),
        prefixIcon: prefixIconUrl != null
            ? Container(
                height: 15,
                width: 15,
                padding: EdgeInsets.all(8),
                child: Image.asset(prefixIconUrl),
              )
            : null,
        suffixIcon: isPasswordField
            ? IconButton(
                icon: Icon(
                  isObscure ? Icons.visibility_off : Icons.visibility,
                  color: isObscure ? colorShade700 : colorShade800,
                ),
                onPressed: suffixOnPressed,
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
