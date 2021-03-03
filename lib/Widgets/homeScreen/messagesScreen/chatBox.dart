//importing packages
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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

    final boxColor = isMe ? const Color(0xFFd6f4ff) : const Color(0xFFF0F1F9);

    final bRBorder = isMe ? Radius.circular(8) : Radius.circular(0);
    final bLBorder = isMe ? Radius.circular(0) : Radius.circular(8);

    final textColor = isMe ? const Color(0xFF0088BF) : Colors.black;
    final textAlign = TextAlign.left;

    final widthOfImageAndSizedBox = isMe ? 10 : (35.0 + 10);

    return Container(
      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // if message not from me then show the sentTime of user at start
          isMe
              ? const SizedBox()
              : _buildMessageSentTime(time: message['sentTime']),
          isMe ? const SizedBox() : const SizedBox(width: 10),
          Expanded(
            child: LayoutBuilder(
              builder: (context, constraints) {
                return Row(
                  mainAxisAlignment: alignment,
                  children: [
                    Container(
                      constraints: BoxConstraints(
                        minWidth: 50,
                        maxWidth: constraints.smallest.width -
                            widthOfImageAndSizedBox,
                      ),
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                      decoration: BoxDecoration(
                        color: boxColor,
                        borderRadius: BorderRadius.only(
                          bottomLeft: bLBorder,
                          topLeft: Radius.circular(8),
                          bottomRight: bRBorder,
                          topRight: Radius.circular(8),
                        ),
                      ),
                      child: Text(
                        message['message'],
                        softWrap: true,
                        textAlign: textAlign,
                        style: GoogleFonts.nunito(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: textColor,
                          letterSpacing: 1,
                          wordSpacing: 0.5,
                        ),
                      ),
                    ),
                    isMe ? const SizedBox() : SizedBox(width: 10),
                    isMe
                        ? const SizedBox()
                        : _buildProfileImage(imageUrl: message['imageUrl']),
                  ],
                );
              },
            ),
          ),

          // if message from me then show the sentTime at the end
          isMe ? const SizedBox(width: 10) : const SizedBox(),
          isMe
              ? _buildMessageSentTime(time: message['sentTime'])
              : const SizedBox(),
        ],
      ),
    );
  }

  Widget _buildMessageSentTime({time}) {
    DateTime date = new DateTime.fromMillisecondsSinceEpoch(time);

    return FittedBox(
      child: Text(
        '${date.hour}:${date.minute}',
        style: GoogleFonts.nunito(
          fontSize: 8,
          fontWeight: FontWeight.w600,
          color: Colors.grey,
          letterSpacing: 0.5,
          wordSpacing: 0.5,
        ),
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
