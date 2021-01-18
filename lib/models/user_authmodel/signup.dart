import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:lawyer_app/authscreen/userlogin.dart';

final _auth = FirebaseAuth.instance;
UserCredential userCredential;
Future<Map<String, dynamic>> Usersignup(
  BuildContext context,
  String name,
  String email,
  String phone,
  String password,
) async {
  String url = 'http://10xwebsolutions.com/lawyer/api/_signup.php';
  final Map<String, dynamic> registrationData = {
    'fullname': name,
    'email': email,
    'phone': phone,
    'password': password,
  };
  final response = await http.post(url,
      body: jsonEncode(registrationData),
      headers: {'content-type': 'application/json'});

  final Map<String, dynamic> responseData = json.decode(response.body);
  print(responseData.toString());
  if (responseData['status'] == "true") {
    userCredential = await _auth.createUserWithEmailAndPassword(
        email: email, password: password);

    await FirebaseFirestore.instance
        .collection('users')
        .doc(email)
        .set({
      'username': name,
      'email': email,
      'phone': phone,
      'password': password,
      'user_id': userCredential.user.uid
    });

    // AllUser allUser =
    //     AllUser(email: email, name: name, uid: userCredential.user.uid);
    // await FirebaseFirestore.instance
    //     .collection("All Users")
    //     .doc(userCredential.user.uid)
    //     .set(AllUser().toMap(allUser));

    Fluttertoast.showToast(
        msg: "Signup Successfully",
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.black,
        textColor: Colors.white,
        fontSize: 16.0);
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (BuildContext context) => UserLogin()));
  }

  if (responseData['status'] == "false" ||
      responseData['message'] ==
          "Email is Already Associate with another account!") {
    Fluttertoast.showToast(
        msg: "Email Already Registered",
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.black,
        textColor: Colors.white,
        fontSize: 16.0);
  }
}
