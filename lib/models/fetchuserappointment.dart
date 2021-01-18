import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

Future<List> fetchupappointmentByemail(String email) async {
  List add = [];
  List<FetchUpCommingApt> fetchupcommingappointment = [];
  print(email);
  String url =
      'http://10xwebsolutions.com/lawyer/api/_user_appointments.php?email=$email';
  final response =
      await http.get(url, headers: {'content-type': 'application/json'});
  print(response.toString());
  final Map<String, dynamic> responseBody = json.decode(response.body);
  print(responseBody.toString());
  var data1 = responseBody['Data'];
  if (responseBody["status"] == "true") {
    for (int i = 0; i < data1.length ?? 0; i++) {
      if (data1[i]["apnt_status"] == "Upcoming") {
        fetchupcommingappointment.add(FetchUpCommingApt(
          cat: data1[i]["category"],
          date: data1[i]["date"].toString(),
          message: data1[i]["message"],
          heading: data1[i]["lawyer_name"],
          email: data1[i]["lawyer_email"].toString(),
          apointmentid: data1[i]["apnt_id"].toString(),
          lawyerid: data1[i]["lawyer_id"].toString(),
        ));
      }
    }

    add = fetchupcommingappointment;

    return add;
  }
}

Future<List> fetchcompletedAppointmentByemail(String email) async {
  List addList = [];
  List<FetchCompleteApt> fetchupcompleteAappointment = [];
  print(email);
  String url =
      'http://10xwebsolutions.com/lawyer/api/_user_appointments.php?email=$email';
  final response =
      await http.get(url, headers: {'content-type': 'application/json'});
  print(response.toString());
  final Map<String, dynamic> responseBody = json.decode(response.body);
  print(responseBody.toString());
  var data1 = responseBody['Data'];
  if (responseBody["status"] == "true") {
    for (int i = 0; i < data1.length ?? 0; i++) {
      if (data1[i]["apnt_status"] == "Completed") {
        fetchupcompleteAappointment.add(FetchCompleteApt(
          cat: data1[i]["category"],
          date: data1[i]["date"].toString(),
          message: data1[i]["message"],
          heading: data1[i]["lawyer_name"],
          apointmentid: data1[i]["apnt_id"].toString(),
        ));
      }
    }

    addList = fetchupcompleteAappointment;

    return addList;
  }
}

Future<List> fetchcancelAppointmentByemail(String email) async {
  List addList = [];
  List<FetchCancelApt> fetchcancelAappointment = [];
  print(email);
  String url =
      'http://10xwebsolutions.com/lawyer/api/_user_appointments.php?email=$email';
  final response =
      await http.get(url, headers: {'content-type': 'application/json'});
  print(response.toString());
  final Map<String, dynamic> responseBody = json.decode(response.body);
  print(responseBody.toString());
  var data1 = responseBody['Data'];
  if (responseBody["status"] == "true") {
    for (int i = 0; i < data1.length ?? 0; i++) {
      if (data1[i]["apnt_status"] == "Cancelled") {
        fetchcancelAappointment.add(FetchCancelApt(
          cat: data1[i]["category"],
          date: data1[i]["date"].toString(),
          message: data1[i]["message"],
          heading: data1[i]["lawyer_name"],
        ));
      }
    }

    addList = fetchcancelAappointment;

    return addList;
  }
}

class FetchUpCommingApt {
  String cat;
  String heading;
  String date;
  String message;
  String email;
  String apointmentid;
  String lawyerid;
  FetchUpCommingApt(
      {this.cat,
      this.date,
      this.heading,
      this.message,
      this.email,
      this.apointmentid,
      this.lawyerid});
}

class FetchCompleteApt {
  String cat;
  String heading;
  String date;
  String message;
  String apointmentid;
  FetchCompleteApt(
      {this.cat, this.date, this.heading, this.message, this.apointmentid});
}

class FetchCancelApt {
  String cat;
  String heading;
  String date;
  String message;
  FetchCancelApt({this.cat, this.date, this.heading, this.message});
}
