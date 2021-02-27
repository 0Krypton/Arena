//importing packages
import 'package:flutter/material.dart';

//importing theme
import '../../../Themes/color/colorThemes.dart';

//importing Utils
import '../../../Utils/getTimeDiffInString.dart';

class UserWidget extends StatelessWidget with TimeDiffInString {
  UserWidget({
    @required this.user,
    @required this.widthItem,
    @required this.animation,
    @required this.callBack,
  });

  final Map<String, dynamic> user;

  final double widthItem;

  final Animation<double> animation;

  final Function callBack;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: callBack,
      child: ScaleTransition(
        scale: TweenSequence(
          <TweenSequenceItem<double>>[
            TweenSequenceItem<double>(
              tween: Tween<double>(begin: 0, end: 1.1).chain(
                CurveTween(curve: Curves.ease),
              ),
              weight: 40.0,
            ),
            TweenSequenceItem<double>(
              tween: Tween<double>(begin: 1.1, end: 0.9),
              weight: 20.0,
            ),
            TweenSequenceItem<double>(
              tween: Tween<double>(begin: 0.9, end: 1).chain(
                CurveTween(curve: Curves.ease),
              ),
              weight: 40.0,
            ),
          ],
        ).animate(animation),
        child: Container(
          height: 80,
          width: widthItem,
          margin: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
          decoration: BoxDecoration(
            color: Color(0xFFF7F6F9),
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.25),
                blurRadius: 15,
              ),
            ],
          ),
          child: Stack(
            children: [
              _buildBgImage(),
              Container(
                height: 80,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    _buildProfileImage(),
                    _buildBody(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBgImage() {
    return Positioned(
      left: 0,
      top: 0,
      child: Container(
        width: widthItem,
        height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          ),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          ),
          child: Image.asset(
            user['bgImage'],
            fit: BoxFit.fitWidth,
          ),
        ),
      ),
    );
  }

  Widget _buildProfileImage() {
    return Container(
      width: 50,
      height: 50,
      margin: EdgeInsets.only(left: 25, right: 15),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: Colors.white, width: 2),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.6),
            blurRadius: 15,
          ),
        ],
        image: DecorationImage(
          image: AssetImage(
            user['profileImage'],
          ),
          fit: BoxFit.cover,
        ),
      ),
      child:
          user['unreadMessages'] == null ? SizedBox() : _buildUnreadMessages(),
    );
  }

  Widget _buildUnreadMessages() {
    Color bgContainerColor = colorShade700;
    if (user['unreadMessages'] >= 50) {
      bgContainerColor = const Color(0xFFC00000);
    } else if (user['unreadMessages'] >= 10 && user['unreadMessages'] < 50) {
      bgContainerColor = const Color(0xFF0097D2);
    }
    return Stack(
      overflow: Overflow.visible,
      children: [
        Positioned(
          right: -5,
          bottom: -5,
          child: Container(
            height: 20,
            width: 20,
            padding: EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: bgContainerColor,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: FittedBox(
                child: Text(
                  '${user['unreadMessages']}',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Reglo',
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildBody() {
    return Expanded(
      child: Container(
        margin: EdgeInsets.only(top: 15, bottom: 15, right: 30),
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        decoration: BoxDecoration(
          color: Color(0xFFF2F2F2),
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.25),
              blurRadius: 15,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _buildText(
                  text: '${user['name']}',
                  fontSize: 12.0,
                  color: colorShade900,
                ),
                _buildText(
                  text: getTime(user['lastMessageSent']),
                  fontSize: 10.0,
                  color: Colors.grey,
                ),
              ],
            ),
            SizedBox(height: 5),
            Row(
              children: [
                FittedBox(
                  fit: BoxFit.fitWidth,
                  child: _buildText(
                    text:
                        'Neque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit...'
                                .trim()
                                .substring(0, 30)
                                .toString() +
                            '...',
                    color: Colors.black,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Text _buildText({String text, double fontSize, Color color}) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontFamily: 'Reglo',
        fontSize: fontSize,
      ),
    );
  }
}
