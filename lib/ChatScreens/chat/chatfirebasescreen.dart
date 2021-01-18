import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:lawyer_app/ChatWithFirebase_WIdgets/messages.dart';
import 'package:lawyer_app/ChatWithFirebase_WIdgets/new_message.dart';
import 'package:lawyer_app/Utilities/call_utilities.dart';
import 'package:lawyer_app/Utilities/permissions.dart';
import 'package:lawyer_app/callscreens/pickup/pickup_layout.dart';
import 'package:lawyer_app/global.dart';

class ChatScreen extends StatefulWidget {
  final appointmentId;
  final lawyerid;

  ChatScreen(this.appointmentId, this.lawyerid);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  Future<void> createAppointCallRoom(String appointmentID) async {
    // SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    // final apnnnt = sharedPreferences.getString('apnt_id');
    print('neweshid $appointmentID');

    List<String> users = [
      await FirebaseAuth.instance.currentUser.email,
      widget.lawyerid
    ];
    FirebaseFirestore.instance
        .collection('appointcallroom')
        .doc(appointmentID)
        .set({
      "users": users,
      "chatRoomId": appointmentID,
    });
  }

  @override
  Widget build(BuildContext context) {
    return PickupLayout(
      scaffold: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(70),
          child: AppBar(
            actions: [
              IconButton(
                icon: Icon(Icons.call),
                onPressed: () async => {
                  await Permissions.microphonePermissionsGranted()
                      ? CallUtils.voiceDial(
                          from: await FirebaseAuth.instance.currentUser.uid,
                          to: fireID,
                          context: context,
                          callis: "audio"
                        )
                      : {},
                },
              ),
              IconButton(
                  icon: Icon(Icons.video_call),
                  onPressed: () async => {
                        await Permissions
                                .cameraandmicrophonePermissionsGranted()
                            ? CallUtils.dial(
                                from:
                                    await FirebaseAuth.instance.currentUser.uid,
                                to: fireID,
                                context: context,
                                callis: "video"
                              )
                            : {},
                      }),
            ],
            title: Container(
                padding: EdgeInsets.only(top: 5, right: 5),
                child: Text("Chat Screen")),
            backgroundColor: Color(0xff6762F1),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(20),
                  bottomLeft: Radius.circular(20)),
            ),
          ),
        ),
        body: Container(
          child: Column(
            children: <Widget>[
              Expanded(
                child: Messages(widget.appointmentId),
              ),
              NewMessage(widget.appointmentId),
            ],
          ),
        ),
      ),
    );
  }
}
