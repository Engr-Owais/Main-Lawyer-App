import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

Future<List> fetchlawyerupcomingappointment(String email) async {
  List addListLaywer = [];
  List<FetchUpComminglawyerApt> fetchlawyerupcommingappointment = [];
  print(email);
  String url =
      'http://10xwebsolutions.com/lawyer/api/_lawyer_appointments.php?email=$email';
  final response =
      await http.get(url, headers: {'content-type': 'application/json'});
  print(response.toString());
  final Map<String, dynamic> responseBody = json.decode(response.body);
  print(responseBody.toString());
  var data1 = responseBody['Data'];
  if (responseBody["status"] == "true") {
    for (int i = 0; i < data1.length ?? 0; i++) {
      if (data1[i]["apnt_status"] == "Upcoming") {
        fetchlawyerupcommingappointment.add(FetchUpComminglawyerApt(
          cat: data1[i]["category"],
          date: data1[i]["date"].toString(),
          message: data1[i]["message"],
          heading: data1[i]["user_name"],
          apointmentid: data1[i]["apnt_id"],
          lawyeremail:  data1[i]["lawyer_email"],
          lawid: data1[i]["lawyer_id"],
          useremail:data1[i]["user_email"]
        ));
      }
    }
    if (responseBody["status"] == "false") {
      Fluttertoast.showToast(msg: "No Data Found");
    }

    addListLaywer = fetchlawyerupcommingappointment;

    return addListLaywer;
  }
}

Future<List> fetchcompletedlawyerAppointment(String email) async {
  List addListcompeleted = [];
  List<FetchLawyerCompleteApt> fetchcompletelawyerAappointment = [];
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
        fetchcompletelawyerAappointment.add(FetchLawyerCompleteApt(
          cat: data1[i]["category"],
          date: data1[i]["date"].toString(),
          message: data1[i]["message"],
          heading: data1[i]["user_name"],
        ));
      }
    }

    addListcompeleted = fetchcompletelawyerAappointment;

    return addListcompeleted;
  }
}

Future<List> fetchcancellawyerAppointmentByemail(String email) async {
  List addListcancelAppointment = [];
  List<FetchCancelLawyerApt> fetchcancellawyerAappointment = [];
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
        fetchcancellawyerAappointment.add(FetchCancelLawyerApt(
          cat: data1[i]["category"],
          date: data1[i]["date"].toString(),
          message: data1[i]["message"],
          heading: data1[i]["user_name"],
        ));
      }
    }

    addListcancelAppointment = fetchcancellawyerAappointment;

    return addListcancelAppointment;
  }
}

class FetchUpComminglawyerApt {
  String cat;
  String heading;
  String date;
  String message;
  String apointmentid;
  String lawyeremail;
  String lawid;
  String useremail;
  FetchUpComminglawyerApt({this.cat, this.date, this.heading, this.message , this.apointmentid , this.lawyeremail,this.lawid , this.useremail});
}

class FetchLawyerCompleteApt {
  String cat;
  String heading;
  String date;
  String message;
  FetchLawyerCompleteApt({this.cat, this.date, this.heading, this.message});
}

class FetchCancelLawyerApt {
  String cat;
  String heading;
  String date;
  String message;
  FetchCancelLawyerApt({this.cat, this.date, this.heading, this.message});
}
