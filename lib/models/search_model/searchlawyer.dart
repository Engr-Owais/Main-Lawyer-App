import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

Future<List> fetchLawyerbyCat(String cat, String qualification) async {
  List addlawyer = [];
  List<LawyerCat> lawyercat = [];
  String url = "http://10xwebsolutions.com/lawyer/api/_search_lawyer.php";
  String lawyertoken;
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  lawyertoken = sharedPreferences.getString("token");
  final Map<String, dynamic> responseData = {
    "submit": 1,
    "Category": cat,
    "Qualification": qualification,
  };

  final response = await http.post(url,
      body: jsonEncode(responseData),
      headers: {'content-type': 'application/json'});
  final Map<String, dynamic> data = json.decode(response.body);

  var data1 = data['Data'];
  print(data1.toString());
  if (data['status'] == "true") {
    for (int i = 0; i < data1.length; i++) {
      if (cat == data1[i]['Category']) {
        lawyercat.add(LawyerCat(
          fullname: data1[i]["Fullname"],
          address: data1[i]["address"],
          cat: data1[i]["Category"],
          profileimages: data1[i]["profile-images"],
          email: data1[i]["Email"],
        ));
      }
    }

    addlawyer = lawyercat;
    return addlawyer;
  }
}

class LawyerCat {
  String fullname;
  String cat;
  String address;
  String rating;
  String lawyerid;
  String profileimages;
  String email;
  LawyerCat({
    this.fullname,
    this.address,
    this.cat,
    this.rating,
    this.profileimages,
    this.lawyerid,
    this.email,
  });
}
