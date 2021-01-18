import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lawyer_app/Methods%20Call/CallMethods.dart';
import 'package:lawyer_app/callscreens/pickup/pickup_screen.dart';
import 'package:lawyer_app/models/CallMOdel/call.dart';
import 'package:lawyer_app/global.dart' as globals;

class PickupLayout extends StatelessWidget {
  final Widget scaffold;
  final CallMethods callMethods = CallMethods();

  PickupLayout({
    @required this.scaffold,
  });

  @override
  Widget build(BuildContext context) {
    final _user = FirebaseAuth.instance.currentUser;
    Call call = Call();

    return (_user.uid != null && globals.lawwwIdd != "")
        ? StreamBuilder<DocumentSnapshot>(
            stream: callMethods.callStream(uid: _user.uid),
            builder: (context, snapshot) {
              if (snapshot.hasData && snapshot.data.data() != null) {
                Call call = Call.fromMap(snapshot.data.data());

                if (!call.hasDialled) {
                  return PickupScreen(call: call);
                }
              }
              return scaffold;
            },
          )
        : Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
  }
}
