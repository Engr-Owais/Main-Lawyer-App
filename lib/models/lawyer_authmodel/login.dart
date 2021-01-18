import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import '../../lawyerhomescreen.dart';

final _auth = FirebaseAuth.instance;
UserCredential _userCredential;
//function for login screen to login users
Future<Map<String, dynamic>> Login(
    BuildContext context, String email, String password) async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  var login = false;
  var username;
  var imgurl;
  String lawyerToken;
  String url =
      'http://10xwebsolutions.com/lawyer/api/_login.php?login_as=lawyer';
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
    lawyerToken = loginData['Data']['token'].toString();
    await sharedPreferences.setString("token", lawyerToken);
    await sharedPreferences.setString("email", email.trim().toString());
    await sharedPreferences.setString("fullname", username);
    await sharedPreferences.setString("img_url", imgurl);
    // await sharedPreferences.setString(
    //     loginData['fullname'], fullname.toString());
    print(username);
    Fluttertoast.showToast(
        msg: "login Successfully",
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.black,
        textColor: Colors.white,
        fontSize: 16.0);
    _userCredential = await _auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    var lawyer = FirebaseAuth.instance.currentUser;

    await sharedPreferences.setString("firebaseLawyerEmail", lawyer.email);
    await sharedPreferences.setString("firebaseLawyerid", lawyer.uid);
    final keys = sharedPreferences.getString('firebaseUserEmail');
    print("$keys Keys Lawyer");
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (BuildContext context) => LawyerHomeScreen()));
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
