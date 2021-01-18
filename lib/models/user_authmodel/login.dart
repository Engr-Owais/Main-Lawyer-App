import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:lawyer_app/global.dart';
import 'package:lawyer_app/homescreen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import '../../lawyerhomescreen.dart';

final _auth = FirebaseAuth.instance;

UserCredential _userCredential;
//function for login screen to login users
Future<Map<String, dynamic>> Appusers(
    BuildContext context, String email, String password) async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  var username;
  var imgurl;
  var userid;
  String url = 'http://10xwebsolutions.com/lawyer/api/_login.php?login_as=user';
  final Map<String, dynamic> responseData = {
    "submit": 1,
    "username": email.trim().toString(),
    "password": password.toString(),
  };
  print(responseData.toString());

  final response = await http.post(url,
      body: jsonEncode(responseData),
      headers: {'content-type': 'application/json'});
  print(response.body);
  var loginData = json.decode(response.body);
  print(loginData.toString());

  if (loginData["status"] == "true") {
    username = loginData['Data']['fullname'];
    imgurl = loginData['Data']['img_url'].toString();
    userid = loginData['Data']['id'].toString();
    await sharedPreferences.setString("useremail", email.trim().toString());
    await sharedPreferences.setString("userfullname", username);
    await sharedPreferences.setString("userimg_url", imgurl);
    await sharedPreferences.setString("id", userid);
    _userCredential = await _auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    var user = FirebaseAuth.instance.currentUser;
    await sharedPreferences.setString("firebaseUserid", user.uid);
    await sharedPreferences.setString("firebaseUserEmail", user.email);

    print(user);
    print(user.email + "EMAILLLLLLLLLLLLLLLL");
    print(imgurl);
    print(username);
    final keys = sharedPreferences.getString('firebaseUserEmail');
    print('$keys KEYSSSSSSSSS');
    Fluttertoast.showToast(
        msg: "login Successfully",
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.black,
        textColor: Colors.white,
        fontSize: 16.0);

    Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (BuildContext context) => HomeScreen()));
  }
  if (loginData["status"] == "false") {
    Fluttertoast.showToast(
        msg: "wrong Email or Password",
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.black,
        textColor: Colors.white,
        fontSize: 16.0);
  }
}
