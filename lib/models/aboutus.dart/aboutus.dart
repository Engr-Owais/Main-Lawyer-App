import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

//fetch all data from aboutus
List<Aboutus> aboutus = [];
List addabout = [];
Future<List> infocompany() async {
  String url = "http://10xwebsolutions.com/lawyer/api/_about_us.php";

  final response =
      await http.post(url, headers: {'content-type': 'application/json'});
  print(response.body.toString());
  final Map<String, dynamic> responseData = json.decode(response.body);
  print(responseData.toString());
  var data1 = responseData['Data'];

  for (int i = 0; i < data1.length ?? 0; i++) {
    print("checkinloop");
    if (aboutus.length != 0) {
      break;
    } else if (responseData['status'] == "true") {
      aboutus.add(Aboutus(
        title: data1[i]["title"],
        description: data1[i]["description"],
        image: data1[i]["image"],
      ));
    }
  }

  addabout = aboutus;
  return addabout;
}

class Aboutus {
  String title;
  String description;
  String image;
  Aboutus({this.title, this.description, this.image});
}
