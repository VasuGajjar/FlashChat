import 'package:flutter/material.dart';

class MessageBubble extends StatelessWidget {
  String sender;
  String text;
  bool isMe;
  BorderRadius border;
  CrossAxisAlignment alignment;
  Color color;

  MessageBubble(this.text, this.sender, this.isMe) {
    if (isMe) {
      alignment = CrossAxisAlignment.end;
      color = Colors.blueAccent;
      border = BorderRadius.only(
        topLeft: Radius.circular(24),
        topRight: Radius.zero,
        bottomLeft: Radius.circular(24),
        bottomRight: Radius.circular(24),
      );
    } else {
      alignment = CrossAxisAlignment.start;
      color = Colors.green;
      border = BorderRadius.only(
        topLeft: Radius.zero,
        topRight: Radius.circular(24),
        bottomLeft: Radius.circular(24),
        bottomRight: Radius.circular(24),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Column(
        crossAxisAlignment: alignment,
        children: [
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Text(
              sender,
              style: TextStyle(fontSize: 10, color: Colors.black45),
            ),
          ),
          Material(
            color: color,
            borderRadius: border,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Text(text, style: TextStyle(color: Colors.white)),
            ),
          )
        ],
      ),
    );
  }
}
