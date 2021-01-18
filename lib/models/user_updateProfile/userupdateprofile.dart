import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<Map<String, dynamic>> userUpdate(
    String oldemail, String newemail, String phone, String oldpassword) async {
  String url = 'http://10xwebsolutions.com/lawyer/api/_update_user_profile.php';
  final Map<String, dynamic> responsedata = {
    'old_email': oldemail,
    'email': newemail,
    'phone': phone,
    'old_password': oldpassword,
  };
  final response = await http.post(url,
      body: jsonEncode(responsedata),
      headers: {'content-type': 'application/json'});

  final Map<String, dynamic> responseData = json.decode(response.body);

  if (responseData["status"] == "true") {
    Fluttertoast.showToast(
        msg: "Updated Sucessful",
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.black,
        textColor: Colors.white,
        fontSize: 16.0);
  } else if ((responseData["status"] == "false")) {
    Fluttertoast.showToast(
        msg: "Email not exist!",
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.black,
        textColor: Colors.white,
        fontSize: 16.0);
  }
}
