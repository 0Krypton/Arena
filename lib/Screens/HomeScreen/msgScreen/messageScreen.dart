//importing packages
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

//importing widgets
import '../../../Widgets/backButton.dart';
import '../../../Widgets/homeScreen/messagesScreen/chatBox.dart';

class MessageScreen extends StatelessWidget {
  static Route comeToPage({Map<String, dynamic> user}) {
    return PageRouteBuilder(
      pageBuilder: (context, animatio1, aniamtion2) =>
          MessageScreen(user: user),
      transitionDuration: const Duration(milliseconds: 300),
      transitionsBuilder: (context, animation1, animation2, child) {
        return Opacity(
          opacity: animation1.value,
          child: child,
        );
      },
    );
  }

  MessageScreen({this.user});

  final Map<String, dynamic> user;

  final List<Map<String, dynamic>> messages = [
    {
      "imageUrl": "images/1Profile.jpg",
      'userName': 'krypton',
      'message': 'Hello 👋'
    },
    {
      "imageUrl": "images/2Profile.jpg",
      'userName': 'arena',
      'message': 'Hi ✋ How r u doin?'
    },
    {
      "imageUrl": "images/1Profile.jpg",
      'userName': 'krypton',
      'message': 'Actually I\'m programming lot'
    },
    {
      "imageUrl": "images/2Profile.jpg",
      'userName': 'arena',
      'message': 'Oh that\'s great congratulation 🎉🎊'
    },
    {
      "imageUrl": "images/1Profile.jpg",
      'userName': 'krypton',
      'message': 'Thanks bro 🌹'
    },
    {
      "imageUrl": "images/2Profile.jpg",
      'userName': 'arena',
      'message': 'Ok bye 👋'
    },
    {
      "imageUrl": "images/1Profile.jpg",
      'userName': 'krypton',
      'message': 'Hello 👋'
    },
    {
      "imageUrl": "images/2Profile.jpg",
      'userName': 'arena',
      'message': 'Hi ✋ How r u doin?'
    },
    {
      "imageUrl": "images/1Profile.jpg",
      'userName': 'krypton',
      'message': 'Actually I\'m programming lot'
    },
    {
      "imageUrl": "images/2Profile.jpg",
      'userName': 'arena',
      'message': 'Oh that\'s great congratulation 🎉🎊'
    },
    {
      "imageUrl": "images/1Profile.jpg",
      'userName': 'krypton',
      'message': 'Thanks bro 🌹'
    },
    {
      "imageUrl": "images/2Profile.jpg",
      'userName': 'arena',
      'message': 'Ok bye 👋'
    },
    {
      "imageUrl": "images/1Profile.jpg",
      'userName': 'krypton',
      'message': 'Hello 👋'
    },
    {
      "imageUrl": "images/2Profile.jpg",
      'userName': 'arena',
      'message': 'Hi ✋ How r u doin?'
    },
    {
      "imageUrl": "images/1Profile.jpg",
      'userName': 'krypton',
      'message': 'Actually I\'m programming lot'
    },
    {
      "imageUrl": "images/2Profile.jpg",
      'userName': 'arena',
      'message': 'Oh that\'s great congratulation 🎉🎊'
    },
    {
      "imageUrl": "images/1Profile.jpg",
      'userName': 'krypton',
      'message': 'Thanks bro 🌹'
    },
    {
      "imageUrl": "images/2Profile.jpg",
      'userName': 'arena',
      'message': 'Ok bye 👋'
    },
    {
      "imageUrl": "images/1Profile.jpg",
      'userName': 'krypton',
      'message': 'Hello 👋'
    },
    {
      "imageUrl": "images/2Profile.jpg",
      'userName': 'arena',
      'message': 'Hi ✋ How r u doin?'
    },
    {
      "imageUrl": "images/1Profile.jpg",
      'userName': 'krypton',
      'message': 'Actually I\'m programming lot'
    },
    {
      "imageUrl": "images/2Profile.jpg",
      'userName': 'arena',
      'message': 'Oh that\'s great congratulation 🎉🎊'
    },
    {
      "imageUrl": "images/1Profile.jpg",
      'userName': 'krypton',
      'message': 'Thanks bro 🌹'
    },
    {
      "imageUrl": "images/2Profile.jpg",
      'userName': 'arena',
      'message': 'Ok bye 👋'
    },
  ];

  final textFieldHeight = 50.0;
  final textFieldMarginBottom = 20.0;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final padding = MediaQuery.of(context).padding.top;
    final width = size.width;
    final height = size.height - padding;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          height: height,
          width: width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              _buildAppBar(
                context: context,
                height: height * .1,
                width: width,
              ),
              _buildBody(
                height: height * .9,
                width: width,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBody({height, width}) {
    return Stack(
      children: [
        Container(
          height: height,
          width: width,
          child: ListView.builder(
            padding: EdgeInsets.only(
              left: 10,
              right: 10,
              bottom: (textFieldHeight + textFieldMarginBottom + 10.0),
            ),
            physics: BouncingScrollPhysics(),
            itemCount: messages.length,
            reverse: true,
            itemBuilder: (context, index) {
              bool isMe = messages[index]['userName'] == 'krypton';
              return ChatBox(
                isMe: isMe,
                message: messages[index],
              );
            },
          ),
        ),
        Positioned(
          bottom: textFieldMarginBottom,
          right: 20,
          left: 20,
          child: Container(
            height: textFieldHeight,
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
              children: [
                Container(
                  height: 35,
                  width: 35,
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  padding: EdgeInsets.symmetric(horizontal: 7),
                  decoration: BoxDecoration(
                    color: Color(0xFF74D7FF),
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    boxShadow: [
                      BoxShadow(
                        color: Color(0xFF74D7FF),
                        blurRadius: 10,
                      ),
                    ],
                  ),
                  child: SvgPicture.asset('assets/send.svg'),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildAppBar({height, width, context}) {
    return Container(
      height: height,
      width: width,
      child: Row(
        children: [
          backButton(
            color: Colors.black,
            onTap: () {
              Navigator.of(context).pop();
            },
          ),
          SizedBox(width: 15),
          Text(
            user['name'],
            style: TextStyle(
              color: Colors.black,
              fontFamily: 'Reglo',
              fontSize: 18,
            ),
          ),
        ],
      ),
    );
  }
}
