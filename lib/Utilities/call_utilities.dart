

import 'package:flutter/material.dart';
import 'package:lawyer_app/Methods%20Call/CallMethods.dart';
import 'package:lawyer_app/callscreens/call_screen.dart';
import 'package:lawyer_app/callscreens/voicecall.dart';
import 'package:lawyer_app/models/CallMOdel/call.dart';
import 'package:lawyer_app/global.dart' as global;

class CallUtils {
  static final CallMethods callMethods = CallMethods();

  static dial({String from, String to, context , String callis}) async {
    Call call = Call(
      callerId: from,
      receiverId: to,
      channelId: global.globalAppIDUser,
      callerName: global.nameCall,
      receiverName: global.nameCall,
      
    );

    bool callMade = await callMethods.makeCall(call: call);

    call.hasDialled = true;

    if (callMade) {
      // enter log

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => CallScreen(call: call),
        ),
      );
    }
  }

  static voiceDial({String from, String to, context , String callis}) async {
    Call call = Call(
      callerId: from,
      receiverId: to,
      channelId: global.globalAppIDUser,
      callerName: global.nameCall,
      receiverName: global.nameCall,
    );

// print("${global.nameCall} GLOBAL NAME");
// print("${global.nameCall} GLOBAL NAME");
    bool callMade = await callMethods.makeVoiceCall(call: call);

    call.hasDialled = true;

    if (callMade) {
      // enter log

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => VoiceCallScreen(call: call),
        ),
      );
    }
  }
}
