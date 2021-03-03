//importing packages
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

//importing widgets
import '../../../Widgets/backButton.dart';
import '../../../Widgets/homeScreen/messagesScreen/chatBox.dart';
import '../../../Widgets/homeScreen/messagesScreen/addMessageTextField.dart';

class MessageScreen extends StatefulWidget {
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

  @override
  _MessageScreenState createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  final List<Map<String, dynamic>> messages = [
    {
      "imageUrl": "images/1Profile.jpg",
      'userName': 'krypton',
      'message': 'Actually I\'m programming lot',
      'sentTime': DateTime.now().millisecondsSinceEpoch,
    },
    {
      "imageUrl": "images/2Profile.jpg",
      'userName': 'arena',
      'message': 'Oh that\'s great congratulation 🎉🎊',
      'sentTime': DateTime.now().millisecondsSinceEpoch,
    },
    {
      "imageUrl": "images/1Profile.jpg",
      'userName': 'krypton',
      'message': 'Thanks bro 🌹',
      'sentTime': DateTime.now().millisecondsSinceEpoch,
    },
    {
      "imageUrl": "images/2Profile.jpg",
      'userName': 'arena',
      'message': 'Ok bye 👋',
      'sentTime': DateTime.now().millisecondsSinceEpoch,
    },
    {
      "imageUrl": "images/2Profile.jpg",
      'userName': 'arena',
      'message': 'Ok bye 👋',
      'sentTime': DateTime.now().millisecondsSinceEpoch,
    },
    {
      "imageUrl": "images/2Profile.jpg",
      'userName': 'arena',
      'message': 'Ok bye 👋',
      'sentTime': DateTime.now().millisecondsSinceEpoch,
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

    //App bar
    AppBar appBar = AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      centerTitle: true,
      leading: Padding(
        padding: const EdgeInsets.all(5.0),
        child: backButton(
          color: Colors.black,
          onTap: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      title: Text(
        '${widget.user['name']}',
        style: GoogleFonts.nunito(
          fontSize: 18,
          fontWeight: FontWeight.w800,
          color: Colors.black,
          letterSpacing: 0.5,
          wordSpacing: 0.5,
        ),
      ),
    );

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: appBar,
        body: Container(
          height: height,
          width: width,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                _buildBody(
                  height: height - appBar.preferredSize.height,
                  width: width,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBody({height, width}) {
    return Stack(
      children: [
        _buildChatList(height: height, width: width, messagesList: messages),
        _buildBottomHighlight(),
        _buildTextField(),
      ],
    );
  }

  Widget _buildTextField() {
    return Positioned(
      bottom: textFieldMarginBottom,
      right: 20,
      left: 20,
      child: AddMessageTextField(
        height: textFieldHeight,
        callBack: (text, line) {
          setState(() {
            messages.add(
              {
                "imageUrl": "images/1Profile.jpg",
                'userName': 'krypton',
                'message': text.trim(),
                'sentTime': DateTime.now().millisecondsSinceEpoch,
              },
            );
          });
        },
      ),
    );
  }

  Widget _buildChatList(
      {double height, double width, List<Map<String, dynamic>> messagesList}) {
    return Container(
      height: height,
      width: width,
      child: ListView.builder(
        padding: EdgeInsets.only(
          left: 10,
          right: 10,
          bottom: (textFieldHeight + textFieldMarginBottom + 10.0),
        ),
        physics: BouncingScrollPhysics(),
        itemCount: messagesList.length,
        itemBuilder: (context, index) {
          bool isMe = messagesList[index]['userName'] == 'krypton';
          return ChatBox(
            isMe: isMe,
            message: messagesList[index],
          );
        },
      ),
    );
  }

  Widget _buildBottomHighlight() {
    return Positioned(
      bottom: 0,
      right: 0,
      left: 0,
      child: Container(
        height: 70,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.white, Colors.white.withOpacity(0.1)],
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
          ),
        ),
      ),
    );
  }
}
