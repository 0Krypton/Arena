//importing packages
import 'package:flutter/material.dart';

//importing theme
import '../../../Themes/color/colorThemes.dart';

class UserWidget extends StatelessWidget {
  UserWidget({
    @required this.user,
    @required this.widthItem,
    @required this.animation,
  });

  final Map<String, dynamic> user;

  final double widthItem;

  final Animation<double> animation;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print(user['name']);
      },
      child: ScaleTransition(
        scale: TweenSequence(
          <TweenSequenceItem<double>>[
            TweenSequenceItem<double>(
              tween: Tween<double>(begin: 0, end: 1.1)
                  .chain(CurveTween(curve: Curves.ease)),
              weight: 40.0,
            ),
            TweenSequenceItem<double>(
              tween: Tween<double>(begin: 1.1, end: 0.9),
              weight: 20.0,
            ),
            TweenSequenceItem<double>(
              tween: Tween<double>(begin: 0.9, end: 1)
                  .chain(CurveTween(curve: Curves.ease)),
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
              _buildProfileImage(),
              _buildBody(),
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
    return Positioned(
      top: 40,
      left: 40,
      child: Transform.translate(
        offset: Offset(0, -25.0),
        child: Container(
          width: 50,
          height: 50,
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
        ),
      ),
    );
  }

  Widget _buildBody() {
    return Positioned(
      top: 40,
      left: widthItem * .6,
      child: Transform.translate(
        offset: Offset(-((widthItem * .4) / 2), -((80 - 30.0) / 2)),
        child: Container(
          height: (80 - (30.0)),
          width: widthItem * .4,
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
              FittedBox(
                child: _buildTextField(
                  text: '@${user['name']}',
                  fontSize: 12.0,
                  color: colorShade900,
                ),
              ),
              SizedBox(height: 5),
              Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: FittedBox(
                  child: _buildTextField(
                    text: user['name'],
                    fontSize: 15.0,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Text _buildTextField({String text, double fontSize, Color color}) {
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
