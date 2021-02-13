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
    final textAlign = isMe ? TextAlign.left : TextAlign.right;

    return Row(
      mainAxisAlignment: alignment,
      children: [
        isMe
            ? _buildProfileImage(
                imageUrl: message['imageUrl'],
              )
            : SizedBox(),
        Container(
          constraints: BoxConstraints(minWidth: 50, maxWidth: 200),
          margin: EdgeInsets.all(5),
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
            textAlign: textAlign,
            style: TextStyle(
              fontSize: 15,
              fontFamily: 'Reglo',
              color: textColor,
            ),
          ),
        ),
        isMe
            ? SizedBox()
            : _buildProfileImage(
                imageUrl: message['imageUrl'],
              ),
      ],
    );
  }

  Widget _buildProfileImage({String imageUrl}) {
    return Container(
      height: 40,
      width: 40,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(50),
        child: Image.asset(imageUrl),
      ),
    );
  }
}
