//importing packages
import 'package:ArenaScrims/Model/ExploreScreenClasses/tournoumentDetail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

//importing Screens
import './playersList.dart';

//importing widgets
import '../../../Widgets/backButton.dart';
import '../../../Widgets/homeScreen/messagesScreen/chatBox.dart';
import '../../../Widgets/homeScreen/messagesScreen/addMessageTextField.dart';

class TourChatRoom extends StatefulWidget {
  static Route comeToPage({tour}) {
    return PageRouteBuilder(
      pageBuilder: (context, animatio1, aniamtion2) => TourChatRoom(tour: tour),
      transitionDuration: const Duration(milliseconds: 300),
      transitionsBuilder: (context, animation1, animation2, child) {
        return Opacity(
          opacity: animation1.value,
          child: child,
        );
      },
    );
  }

  TourChatRoom({this.tour});

  final TournoumentDetail tour;

  @override
  _MessageScreenState createState() => _MessageScreenState();
}

class _MessageScreenState extends State<TourChatRoom> {
  final List<Map<String, dynamic>> messages = [
    {
      "imageUrl": "images/1Profile.jpg",
      'userName': 'krypton',
      'message': 'Hello 🌹💖'
    },
    {
      "imageUrl": "images/2Profile.jpg",
      'userName': 'clix',
      'message': 'Hi there✋'
    },
    {
      "imageUrl": "images/5Profile.jpg",
      'userName': 'hitman',
      'message': 'Hi guys'
    },
    {
      "imageUrl": "images/2Profile.jpg",
      'userName': 'clix',
      'message':
          'Neque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit...'
    },
    {
      "imageUrl": "images/2Profile.jpg",
      'userName': 'clix',
      'message':
          'Mauris non luctus dolor. Vestibulum commodo iaculis justo sed fringilla😂. Donec in risus sit amet nisl ultrices auctor. '
    },
    {
      "imageUrl": "images/4Profile.jpg",
      'userName': 'scorpion',
      'message': 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. A'
    },
    {
      "imageUrl": "images/2Profile.jpg",
      'userName': 'krypton',
      'message':
          'Mauris non luctus dolor. Vestibulum commodo iaculis justo risus sit amet nisl ultrices auctor. '
    },
    {
      "imageUrl": "images/4Profile.jpg",
      'userName': 'scorpion',
      'message': 'Lorem ipsum dolor, adipiscing elit.'
    },
  ];

  final textFieldHeight = 50.0;
  final textFieldMarginBottom = 20.0;

  ScrollController _chatListController;

  @override
  initState() {
    super.initState();
    _chatListController = ScrollController();
  }

  @override
  void dispose() {
    _chatListController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final padding = MediaQuery.of(context).padding.top;
    final width = size.width;
    final height = size.height - padding;

    AppBar appBar = AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leading: Padding(
        padding: const EdgeInsets.all(5.0),
        child: backButton(
          color: Colors.black,
          onTap: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      actions: [
        _buildActionIconButton(
          iconUrl: 'assets/settings.svg',
          onTap: () {
            print('Settings');
          },
        ),
        SizedBox(width: 10),
        _buildActionIconButton(
          iconUrl: 'assets/players.svg',
          onTap: () {
            Navigator.of(context).push(
              PlayersList.comeToPage(tour: widget.tour),
            );
          },
        ),
        SizedBox(width: 10),
      ],
      centerTitle: true,
      title: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildAppBarTitle(
            text: widget.tour.title,
            fontSize: 15,
            color: Colors.black,
          ),
          SizedBox(height: 2),
          _buildAppBarTitle(
            text: widget.tour.description,
            fontSize: 12,
            color: Colors.black.withOpacity(0.5),
          ),
        ],
      ),
    );

    return SafeArea(
      child: Scaffold(
        appBar: appBar,
        backgroundColor: Colors.white,
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

  Widget _buildAppBarTitle({String text, Color color, double fontSize}) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontFamily: 'Reglo',
        fontSize: fontSize,
      ),
    );
  }

  Widget _buildActionIconButton({String iconUrl, onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 25,
        width: 25,
        child: SvgPicture.asset(
          iconUrl,
          fit: BoxFit.contain,
        ),
      ),
    );
  }

  Widget _buildTextField() {
    return Positioned(
      bottom: textFieldMarginBottom,
      right: 20,
      left: 20,
      child: AddMessageTextField(
        height: textFieldHeight,
        callBack: (text) {
          setState(() {
            messages.add(
              {
                "imageUrl": "images/1Profile.jpg",
                'userName': 'krypton',
                'message': text.trim(),
              },
            );
            _chatListController.animateTo(
              _chatListController.position.maxScrollExtent + 30,
              duration: const Duration(microseconds: 300),
              curve: Curves.ease,
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
        controller: _chatListController,
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
