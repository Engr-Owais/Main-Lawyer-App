import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NewMessage extends StatefulWidget {
  final String appointmentid;
  NewMessage(this.appointmentid);
  @override
  _NewMessageState createState() => _NewMessageState();
}

class _NewMessageState extends State<NewMessage> {
  final _controller = new TextEditingController();
  var _enteredMessage = '';

  SharedPreferences sharedPreferences;
  void _sendMessage() async {
    FocusScope.of(context).unfocus();

    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    FirebaseFirestore.instance
        .collection("appointchatroom")
        .doc(widget.appointmentid)
        .collection("chat")
        .add({
      'message': _enteredMessage,
      'createdAt': Timestamp.now(),
      'sendBy': FirebaseAuth.instance.currentUser.uid,
      // 'recievedBy': sharedPreferences.getString('lawwwid'),
    }).catchError((e) {
      print(e.toString());
    });

    _controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 8),
      padding: EdgeInsets.all(8),
      child: Row(
        children: <Widget>[
          Expanded(
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(labelText: 'Send a message...'),
              onChanged: (value) {
                setState(() {
                  _enteredMessage = value;
                });
              },
            ),
          ),
          IconButton(
            color: Theme.of(context).primaryColor,
            icon: Icon(
              Icons.send,
            ),
            onPressed: _enteredMessage.isEmpty ? null : _sendMessage,
          )
        ],
      ),
    );
  }
}
