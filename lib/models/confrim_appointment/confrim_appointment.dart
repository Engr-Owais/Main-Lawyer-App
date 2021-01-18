import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:lawyer_app/appointment/appointmentdetailform.dart';
import 'package:shared_preferences/shared_preferences.dart';

DocumentSnapshot snapshot;

Future<Map<String, dynamic>> confrimAppointment(
    String lawyerid,
    String name,
    String email,
    String phone,
    String date,
    BuildContext context,
    String time,
    String message) async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  String url =
      "http://10xwebsolutions.com/lawyer/api/_booking_appointment.php?lawyer_id=$lawyerid";
  final Map<String, dynamic> appointmentResponse = {
    'submit': 1,
    'fullname': name,
    'email': email,
    "phone": phone,
    "date": date,
    "time": time,
    "message": message
  };

  final response = await http.post(url,
      body: jsonEncode(appointmentResponse),
      headers: {'content-type': 'application/json'});
  final Map<String, dynamic> responseData = json.decode(response.body);
  if (responseData['status'] == "true") {
    print(json.decode(response.body));
    Fluttertoast.showToast(
        msg: "Booking Successfully",
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.black,
        textColor: Colors.white,
        fontSize: 16.0);

    final data = await FirebaseFirestore.instance
        .collection("lawyer")
        .doc(lawyerid)
        .get();
    snapshot = data;
    sharedPreferences.setString(
      "lawwwid",
      snapshot.data()['lawyer_id'],
    );
    final lawid = sharedPreferences.get('id');
    print("${snapshot.data()['lawyer_id']} SNAPSHOT LAWYER IDDD");
    print("$lawid LAWWWWWWWWWWW IDDDDDDDDDDDDDD");
    print("${snapshot.data()} DATA OF FIREBASE LAWYERRRR");

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (BuildContext context) => AppointmentDetailForm(
          name,
          email,
          phone,
          date,
          time,
          message,
          lawyerid,
        ),
      ),
    );
  }

  if (responseData['status'] == "false") {
    Fluttertoast.showToast(
        msg: "Error..!!! Try again",
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.black,
        textColor: Colors.white,
        fontSize: 16.0);
  }
}
