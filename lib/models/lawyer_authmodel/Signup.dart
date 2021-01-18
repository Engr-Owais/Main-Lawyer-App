import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:lawyer_app/authscreen/lawyerlogin.dart';

final _auth = FirebaseAuth.instance;
UserCredential userCredential;
String lawyerid;
Future<Map<String, dynamic>> Signup(
  BuildContext context,
  String name,
  String email,
  String qualification,
  String password,
  String exp,
  String fee,
  String casesolved,
  String catlawyer,
  
) async {
  String url = 'http://10xwebsolutions.com/lawyer/api/_lawyer_signup.php';
  final Map<String, dynamic> registrationData = {
    'submit': 1,
    'fullname': name,
    'email': email,
    'qualification': qualification,
    'password': password,
    'experience': exp,
    'fees': fee,
    'case_solved': casesolved,
    'category': catlawyer,
  };

  print(registrationData.toString());
  final response = await http.post(url,
      body: jsonEncode(registrationData),
      headers: {'content-type': 'application/json'});
  print(response.body.toString());
  final Map<String, dynamic> responseData = json.decode(response.body);
  print(responseData.toString());
  lawyerid = responseData['Data']['id'];
  print("lawyeidddddd $lawyerid");
  if (responseData['status'] == "true") {
    userCredential = await _auth.createUserWithEmailAndPassword(
        email: email, password: password);
    Fluttertoast.showToast(
        msg: "Signup Successfully",
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.black,
        textColor: Colors.white,
        fontSize: 16.0);

    await FirebaseFirestore.instance
        .collection('lawyer')
        .doc(lawyerid)
        .set({
      'submit': 1,
      'lawyername': name,
      'email': email,
      'qualification': qualification,
      'password': password,
      'experience': exp,
      'fees': fee,
      'case_solved': casesolved,
      'category': catlawyer,
      'lawyer_id': await FirebaseAuth.instance.currentUser.uid
    });
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (BuildContext context) => LawyerLogin()));
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
