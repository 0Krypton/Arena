//importing packages
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AddMessageTextField extends StatelessWidget {
  @required
  final double height;
  @required
  final Function callBack;

  AddMessageTextField({this.height, this.callBack});

  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(20)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
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
              style: const TextStyle(
                fontFamily: 'Reglo',
                fontSize: 18,
              ),
              controller: controller,
              inputFormatters: [
                LengthLimitingTextInputFormatter(300),
              ],
              cursorColor: const Color(0xFF74D7FF),
              decoration: InputDecoration(
                counterText: '',
                border: InputBorder.none,
                hintText: 'Type message ...',
                hintStyle: const TextStyle(
                  fontFamily: 'Reglo',
                  fontSize: 15,
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              if (controller.text == '') {
                return;
              }
              callBack(controller.text);
              controller.clear();
            },
            child: Container(
              height: 35,
              width: 35,
              padding: const EdgeInsets.symmetric(horizontal: 7),
              decoration: BoxDecoration(
                color: const Color(0xFF74D7FF),
                borderRadius: const BorderRadius.all(Radius.circular(15)),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFF74D7FF),
                    blurRadius: 10,
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
