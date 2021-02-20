//importing packages
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

//importing widgets
import '../../../Widgets/homeScreen/messagesScreen/userWidget.dart';

//importing screens
import './messageScreen.dart';

//importing dart
import 'dart:math' as math;

class ContactsScreen extends StatefulWidget {
  static Route comeToPage() {
    return PageRouteBuilder(
      pageBuilder: (context, animatio1, aniamtion2) => ContactsScreen(),
      transitionDuration: const Duration(milliseconds: 300),
      transitionsBuilder: (context, animation1, animation2, child) {
        return Opacity(
          opacity: animation1.value,
          child: child,
        );
      },
    );
  }

  @override
  _ContactsScreenState createState() => _ContactsScreenState();
}

class _ContactsScreenState extends State<ContactsScreen> {
  GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();
  List<Map<String, dynamic>> fakeData = [];
  List<Map<String, dynamic>> data = [];

  @override
  void initState() {
    super.initState();

    data = [
      {
        'name': 'User1',
        'profileImage': 'images/1Profile.jpg',
        'bgImage': 'images/1Bg.jpg',
        "message": ['hello', 'how are you? do u wanna play game?!'],
        "lastMessageSent": DateTime.now().millisecondsSinceEpoch,
      },
      {
        'name': 'User2',
        'profileImage': 'images/2Profile.jpg',
        'bgImage': 'images/2Bg.jpg',
        "message": ['hello', 'how are you? do u wanna play game?!'],
        "lastMessageSent": DateTime.now().millisecondsSinceEpoch,
        "unreadMessages": 1,
      },
      {
        'name': 'User3',
        'profileImage': 'images/3Profile.jpg',
        'bgImage': 'images/3Bg.jpg',
        "message": ['hello', 'how are you? do u wanna play game?!'],
        "lastMessageSent": DateTime.now().millisecondsSinceEpoch,
        "unreadMessages": 11,
      },
      {
        'name': 'User4',
        'profileImage': 'images/4Profile.jpg',
        'bgImage': 'images/4Bg.jpg',
        "message": ['hello', 'how are you? do u wanna play game?!'],
        "lastMessageSent": DateTime.now().millisecondsSinceEpoch,
        "unreadMessages": 99,
      },
      {
        'name': 'User5',
        'profileImage': 'images/5Profile.jpg',
        'bgImage': 'images/5Bg.jpg',
        "message": ['hello', 'how are you? do u wanna play game?!'],
        "lastMessageSent": DateTime.now().millisecondsSinceEpoch,
      },
      {
        'name': 'User2',
        'profileImage': 'images/2Profile.jpg',
        'bgImage': 'images/2Bg.jpg',
        "message": ['hello', 'how are you? do u wanna play game?!'],
        "lastMessageSent": DateTime.now().millisecondsSinceEpoch,
      },
      {
        'name': 'User3',
        'profileImage': 'images/3Profile.jpg',
        'bgImage': 'images/3Bg.jpg',
        "message": ['hello', 'how are you? do u wanna play game?!'],
        "lastMessageSent": DateTime.now().millisecondsSinceEpoch,
      },
    ];
    Future.delayed(
      Duration(milliseconds: 500),
      () {
        data.forEach(
          (element) {
            _listKey.currentState.insertItem(
              fakeData.length + 1,
              duration: Duration(milliseconds: ((fakeData.length + 1) * 150)),
            );
            fakeData.add(element);
          },
        );
        // print(fakeData.length);
      },
    );
  }

  @override
  void dispose() {
    fakeData = [];
    data = [];
    _listKey = null;
    super.dispose();
  }

  void fetchItems() {
    data.forEach((element) {
      _listKey.currentState.insertItem(
        fakeData.length + 1,
        duration: Duration(milliseconds: (fakeData.length * 150)),
      );
      fakeData.add(element);
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: _buildBackButton(context: context),
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: Container(
          color: Colors.white,
          height: size.height,
          width: size.width,
          child: AnimatedList(
            key: _listKey,
            physics: BouncingScrollPhysics(),
            initialItemCount: fakeData.length + 2,
            itemBuilder: (context, index, animation) {
              if (index == 0) {
                return Column(
                  children: [
                    SizedBox(height: 20),
                    _buildSearchTextField(width: size.width - 50),
                    SizedBox(height: 10),
                    _buildLineBreaker(width: size.width / 2),
                    SizedBox(height: 5),
                  ],
                );
              } else if (fakeData.isNotEmpty && index <= (fakeData.length)) {
                return UserWidget(
                  widthItem: size.width - 50,
                  user: fakeData[index - 1],
                  animation: animation,
                  callBack: () {
                    Navigator.of(context).push(
                      MessageScreen.comeToPage(user: fakeData[index - 1]),
                    );
                  },
                );
              } else if (index == (fakeData.length + 1)) {
                return SizedBox(height: 25);
              }
              return SizedBox();
            },
          ),
        ),
      ),
    );
  }

  Widget _buildLineBreaker({width}) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        width: width,
        height: 2,
        color: Colors.black.withOpacity(0.5),
      ),
    );
  }

  Widget _buildSearchTextField({width}) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        width: width,
        height: 50,
        child: TextField(
          onChanged: (val) {
            if (val.isEmpty) {
              print('The value is incorrect');
            } else {
              print(val);
            }
            return;
          },
          maxLines: 1,
          textAlign: TextAlign.center,
          cursorColor: Colors.black,
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontFamily: 'Reglo',
          ),
          decoration: InputDecoration(
            filled: true,
            fillColor: const Color(0xFFF7F6F9),
            hintText: 'Enter to Search',
            hintStyle: TextStyle(
              color: Colors.grey,
              fontSize: 12,
              fontFamily: 'Lequire',
            ),
            suffixIcon: IconButton(
              icon: Transform.rotate(
                angle: math.pi / 2,
                child: SvgPicture.asset(
                  'assets/searchIcon.svg',
                  color: Colors.black,
                ),
              ),
              onPressed: () {},
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
        ),
      ),
    );
  }

  Widget _buildBackButton({context}) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pop();
      },
      child: Padding(
        padding: EdgeInsets.all(15),
        child: SvgPicture.asset(
          'assets/back_button.svg',
          color: Colors.black,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
