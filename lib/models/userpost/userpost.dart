import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:lawyer_app/Request/request_screen.dart';

Future<Map<String, dynamic>> PostReq(
  BuildContext context,
  String title,
  String state,
  String city,
  String purpose,
  String qualification,
  String other,
  String email,
) async {
  String url = "http://10xwebsolutions.com/lawyer/api/_post_request.php";
  final Map<String, dynamic> postreq = {
    "title": title,
    "state": state,
    "city": city,
    "purpose": purpose,
    "qualification": qualification,
    "other": other,
    "user_email": email.toString(),
  };
  final response = await http.post(url,
      body: jsonEncode(postreq), headers: {'content-type': 'application/json'});
  print(response.body.toString());
  final Map<String, dynamic> responseData = json.decode(response.body);
  print(responseData.toString());
  if (responseData['status'] == "true") {
    Fluttertoast.showToast(
        msg: "Post Sucess",
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.black,
        textColor: Colors.white,
        fontSize: 16.0);
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (BuildContext context) => RequestScreen()));
  }

  if (responseData['status'] == "false") {
    Fluttertoast.showToast(
        msg: "Error",
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.black,
        textColor: Colors.white,
        fontSize: 16.0);
  }
}
