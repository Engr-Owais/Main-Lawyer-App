import 'package:flutter/material.dart';
import 'package:lawyer_app/Methods%20Call/CallMethods.dart';
import 'package:lawyer_app/Utilities/permissions.dart';
import 'package:lawyer_app/callscreens/call_screen.dart';
import 'package:lawyer_app/callscreens/voicecall.dart';
import 'package:lawyer_app/global.dart';
import 'package:lawyer_app/models/CallMOdel/call.dart';

class PickupScreen extends StatelessWidget {
  final Call call;
  final CallMethods callMethods = CallMethods();

  PickupScreen({
    @required this.call,
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        // Back Ground Image
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/back1.jpeg'), fit: BoxFit.cover),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              height: 50,
            ),
            Image.asset(
              "assets/user.png",
              height: 150,
              width: 150,
            ),
            // _viewRows(),
            Container(
              margin: EdgeInsets.symmetric(vertical: 20),
              constraints: BoxConstraints(maxHeight: 150, maxWidth: 150),
              child: Text(
                nameCall,
                style: TextStyle(
                    fontSize: 25,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ),
            // _panel(),
            Expanded(child: Column()),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                RawMaterialButton(
                    fillColor: Colors.redAccent,
                    elevation: 2.0,
                    child: Icon(
                      Icons.call_end,
                      color: Colors.white,
                    ),
                    onPressed: () async => call.isCall == "video"
                        ? await callMethods.endCall(call: call)
                        : await callMethods.endVoiceCall(call: call)),
                SizedBox(width: 25),
                RawMaterialButton(
                  onPressed: () async => call.isCall == "video"
                      ? await Permissions
                              .cameraandmicrophonePermissionsGranted()
                          ? Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => CallScreen(call: call),
                              ),
                            )
                          : {}
                      : await Permissions.microphonePermissionsGranted()
                          ? Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    VoiceCallScreen(call: call),
                              ),
                            )
                          : {},
                  child: Icon(
                    Icons.call,
                    color: Colors.white,
                  ),
                  elevation: 2.0,
                  fillColor: Colors.greenAccent,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
