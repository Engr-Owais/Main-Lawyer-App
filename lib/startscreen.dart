import 'dart:async';

import 'package:flutter/material.dart';

import 'authscreen/loginscreen.dart';

class StartScreen extends StatefulWidget {
  @override
  _StartScreenState createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  @override
  Widget build(BuildContext context) {
    Timer(
        Duration(seconds: 10),
            () => {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => LoginScreen()))
        });
    var height = MediaQuery.of(context).size.height / 100;
    var width1 = MediaQuery.of(context).size.width / 100;
    print(width1.toString() + " " + height.toString());
    return Scaffold(
      body: Center(
        child: Container(
          height: double.infinity,
          width: double.infinity,
          // Back Ground Image
          constraints: BoxConstraints.expand(),
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/back1.jpeg'),
                fit: BoxFit.cover
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("Lawyer App", style: TextStyle(color: Colors.white, fontSize: 36, fontWeight: FontWeight.w700, fontFamily: "Fonarto"),)
            ],
          ),
        ),
      ),
    );
  }
}

