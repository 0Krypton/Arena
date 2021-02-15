//importing packages
import 'package:flutter/material.dart';

class ChatBox extends StatelessWidget {
  ChatBox({
    @required this.isMe,
    @required this.message,
  });

  final bool isMe;
  final Map<String, dynamic> message;

  @override
  Widget build(BuildContext context) {
    final alignment = isMe ? MainAxisAlignment.start : MainAxisAlignment.end;

    final boxColor = isMe ? Colors.cyan[500] : Colors.grey[300];

    final bRBorder = isMe ? Radius.circular(5) : Radius.circular(0);
    final bLBorder = isMe ? Radius.circular(0) : Radius.circular(5);

    final textColor = isMe ? Colors.white : Colors.black;
    final textAlign = TextAlign.left;

    return Container(
      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
      child: Row(
        mainAxisAlignment: alignment,
        children: [
          // isMe
          //     ? _buildProfileImage(
          //         imageUrl: message['imageUrl'],
          //       )
          //     : SizedBox(),
          // SizedBox(
          //   width: 5,
          // ),
          Container(
            constraints: BoxConstraints(
              minWidth: 50,
              maxWidth: 250,
            ),
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            decoration: BoxDecoration(
              color: boxColor,
              borderRadius: BorderRadius.only(
                bottomLeft: bLBorder,
                topLeft: Radius.circular(5),
                bottomRight: bRBorder,
                topRight: Radius.circular(5),
              ),
            ),
            child: Text(
              message['message'],
              softWrap: true,
              textAlign: textAlign,
              style: TextStyle(
                fontSize: 15,
                fontFamily: 'Reglo',
                color: textColor,
                letterSpacing: 0.5,
                wordSpacing: 1,
              ),
            ),
          ),
          SizedBox(
            width: 5,
          ),
          isMe
              ? SizedBox()
              : _buildProfileImage(
                  imageUrl: message['imageUrl'],
                ),
        ],
      ),
    );
  }

  Widget _buildProfileImage({String imageUrl}) {
    return Container(
      height: 35,
      width: 35,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(50),
        child: Image.asset(imageUrl),
      ),
    );
  }
}
