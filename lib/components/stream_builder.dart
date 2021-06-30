import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'message_bubble.dart';

class ChatStreamBuilder extends StatelessWidget {
  var stream;
  var _auth = FirebaseAuth.instance;

  ChatStreamBuilder(this.stream);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: stream,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          QuerySnapshot querySnapshot = snapshot.data;

          return Expanded(
            child: ListView(
              reverse: true,
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
              children: querySnapshot.docs.map((doc) {
                // String text =
                //     '${doc.data()['text']} from ${doc.data()['sender']}';
                // return Text(text);

                return MessageBubble(
                  doc.data()['text'],
                  doc.data()['nickname'],
                  doc.data()['sender'] == _auth.currentUser.email,
                );
              }).toList(),
            ),
          );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
