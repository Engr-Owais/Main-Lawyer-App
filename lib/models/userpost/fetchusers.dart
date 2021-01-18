import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

//fetch user by email
Future<List> FetchReq(BuildContext context) async {
  String email;

  List add = [];
  List<FetchUsers> fetchusers = [];
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  email = sharedPreferences.getString("useremail");

  String url = "http://10xwebsolutions.com/lawyer/api/_fetch_request.php";

  final response =
      await http.post(url, headers: {'content-type': 'application/json'});
  print(response.body.toString());
  final Map<String, dynamic> responseData = json.decode(response.body);
  print(responseData.toString());
  var data1 = responseData['Data'];

  for (int i = 0; i < data1.length ?? 0; i++) {
    if (data1[i]["user_email"] == email) {
      fetchusers.add(FetchUsers(
          title: data1[i]["title"],
          city: data1[i]["city"],
          qualification: data1[i]["qualification"],
          other: data1[i]["other"],
          purpose: data1[i]["purpose"],
          state: data1[i]["state"],
          useremail: data1[i]["user_email"]));
    }
  }

  add = fetchusers;

  return add;
}

//fetch all users request to the lawyer

Future<List> fetchallrequest(BuildContext context) async {
  List<FetchUsers> fetchallusers = [];
  List addallusers = [];

  String url = "http://10xwebsolutions.com/lawyer/api/_fetch_request.php";
  final response =
      await http.post(url, headers: {'content-type': 'application/json'});

  final Map<String, dynamic> responseData = json.decode(response.body);
  print(responseData.toString());
  var data1 = responseData['Data'];
  if (responseData['status'] == "true") {
    for (int i = 0; i < data1.length; i++) {
      fetchallusers.add(FetchUsers(
          title: data1[i]["title"],
          city: data1[i]["city"],
          qualification: data1[i]["qualification"],
          other: data1[i]["other"],
          purpose: data1[i]["purpose"],
          state: data1[i]["state"],
          useremail: data1[i]["user_email"]));

      // if (fetchallusers.length != data1) {

      //}
    }
  }

  addallusers = fetchallusers;

  return addallusers;
}

class FetchUsers {
  String useremail;
  String title;
  String city;
  String state;
  String purpose;
  String qualification;
  String other;

  FetchUsers(
      {this.title,
      this.state,
      this.city,
      this.useremail,
      this.other,
      this.purpose,
      this.qualification});
}
