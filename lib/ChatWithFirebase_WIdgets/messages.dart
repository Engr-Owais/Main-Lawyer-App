import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'message_bubble.dart';

class Messages extends StatefulWidget {
  final String appointmentId;
  Messages(this.appointmentId);
  @override
  _MessagesState createState() => _MessagesState();
}

class _MessagesState extends State<Messages> {
  Future<String> getLawid() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString('lawwwid');
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      builder: (ctx, futureSnapshot) {
        if (futureSnapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }

        return StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection('appointchatroom')
                .doc(widget.appointmentId)
                .collection('chat')
                .orderBy(
                  'createdAt',
                  descending: true,
                )
                .snapshots(),
            builder: (ctx, chatSnapshot) {
              if (chatSnapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }

              final chatDocs = chatSnapshot.data.documents;
              return chatSnapshot.hasData
                  ? ListView.builder(
                      reverse: true,
                      itemCount: chatDocs.length,
                      itemBuilder: (ctx, index) => MessageBubble(
                        chatDocs[index]['message'],
                        chatDocs[index]['sendBy'] ==
                            futureSnapshot.data.uid,
                      ),
                    )
                  : Center(
                      child: Text(
                      "No Messages",
                      style: TextStyle(color: Colors.black),
                    ));
            });
      },
      initialData: FirebaseAuth.instance.currentUser,
    );
  }
}
