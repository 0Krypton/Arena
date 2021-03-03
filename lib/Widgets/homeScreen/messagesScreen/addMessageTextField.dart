//importing packages
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class AddMessageTextField extends StatefulWidget {
  AddMessageTextField({this.height, this.callBack});

  final double height;
  final Function callBack;

  @override
  _AddMessageTextFieldState createState() => _AddMessageTextFieldState();
}

class _AddMessageTextFieldState extends State<AddMessageTextField>
    with SingleTickerProviderStateMixin {
  TextEditingController _controller;

  AnimationController colorAnimController;

  Animation<Color> textFieldFilledColor;
  Animation<Color> textFieldTextColor;

  Animation<Color> textFieldShadowColor;

  Animation<Color> sendBtnBeginGradientColor;
  Animation<Color> sendBtnEndGradientColor;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();

    colorAnimController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );

    textFieldFilledColor = ColorTween(
      begin: Colors.white,
      end: Colors.red[100],
    ).animate(colorAnimController)
      ..addListener(() {
        // setState(() {});
      });

    textFieldShadowColor = ColorTween(
      begin: Colors.grey.withOpacity(0.3),
      end: const Color(0xFFFF4343),
    ).animate(colorAnimController)
      ..addListener(() {
        setState(() {});
      });

    textFieldTextColor = ColorTween(
      begin: Colors.black,
      end: Colors.red[900],
    ).animate(colorAnimController)
      ..addListener(() {
        setState(() {});
      });

    sendBtnBeginGradientColor = ColorTween(
      begin: const Color(0xFF74D7FF),
      end: const Color(0xFFFF4343),
    ).animate(colorAnimController)
      ..addListener(() {
        setState(() {});
      });

    sendBtnEndGradientColor = ColorTween(
      begin: const Color(0xFF0088BF),
      end: const Color(0xFF570000),
    ).animate(colorAnimController)
      ..addListener(() {
        setState(() {});
      });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();

    colorAnimController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: textFieldFilledColor.value,
        borderRadius: BorderRadius.all(Radius.circular(20)),
        boxShadow: [
          BoxShadow(
            color: textFieldShadowColor.value,
            blurRadius: 15,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: TextField(
              maxLines: 5,
              minLines: 1,
              style: GoogleFonts.nunito(
                fontSize: 13,
                fontWeight: FontWeight.w800,
                color: textFieldTextColor.value,
                letterSpacing: 1,
              ),
              controller: _controller,
              inputFormatters: [
                LengthLimitingTextInputFormatter(300),
              ],
              cursorColor: textFieldTextColor.value,
              decoration: InputDecoration(
                counterText: '',
                border: InputBorder.none,
                hintText: 'Type message ...',
                hintStyle: GoogleFonts.nunito(
                  fontSize: 13,
                  fontWeight: FontWeight.w800,
                  color: textFieldTextColor.value,
                  letterSpacing: 1,
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              if (_controller.text == '') {
                colorAnimController.forward();
                Future.delayed(const Duration(milliseconds: 300), () {
                  colorAnimController.reverse();
                });
                return;
              }
              print(_controller.text.contains('\n'));
              var totalLines = (_controller.text.trim().length / 23.0).floor();

              widget.callBack(_controller.text, totalLines);
              _controller.clear();
            },
            child: Container(
              height: 35,
              width: 35,
              padding: const EdgeInsets.symmetric(horizontal: 7),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    sendBtnBeginGradientColor.value,
                    sendBtnEndGradientColor.value,
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: const BorderRadius.all(Radius.circular(15)),
                boxShadow: [
                  BoxShadow(
                    // color: const Color(0xFF0088BF),
                    color: sendBtnEndGradientColor.value,
                    blurRadius: 10,
                    spreadRadius: 1,
                  ),
                ],
              ),
              child: SvgPicture.asset('assets/send.svg'),
            ),
          ),
        ],
      ),
    );
  }
}
