
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Chat with ChangeNotifier {
  final String msg;
  final String firebaseuserid;
  final String firebaselawyerid;

  Chat({
    this.msg,
    this.firebaselawyerid,this.firebaseuserid
  });

}
