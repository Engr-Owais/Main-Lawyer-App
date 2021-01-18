import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:lawyer_app/models/payement.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../homescreen.dart';
import '../userdrawerscreen.dart';
import 'package:http/http.dart' as http;

class AppointmentDetailForm extends StatefulWidget {
  String name;
  String email;
  String phone;
  String date;
  String time;
  String message;
  String lawyerid;
  AppointmentDetailForm(this.name, this.email, this.date, this.phone, this.time,
      this.message, this.lawyerid);
  @override
  _AppointmentDetailFormState createState() => _AppointmentDetailFormState();
}

class _AppointmentDetailFormState extends State<AppointmentDetailForm> {
  String fees;
  bool loader = false;

  var scret_key;
  var paymentConfirmId;

  Future<String> addPaymentdetailMethod(
    String secretkey,
    String publickey,
    String name,
    String email,
    String phone,
    String date,
    String time,
    String message,
    String fees,
    String lawyerid,
  ) async {
    String url = 'http://10xwebsolutions.com/lawyer/api/_complete_payment.php';

    final Map<String, dynamic> appointmentResponse = {
      'submit': 1,
      'secret_key': secretkey,
      'payment_confirm': publickey,
      'name': name,
      'email': email,
      "phone": phone,
      "date": date,
      "time": time,
      "message": message,
      "lawyer_id": lawyerid,
    };
    print(secretkey);
    print(publickey);
    print(name);
    print(email);
    print(phone);
    print(date);
    print(time);
    print(message);
    print(lawyerid);
    setState(() {
      loader = true;
    });

    final response = await http.post(url,
        body: jsonEncode(appointmentResponse),
        headers: {'content-type': 'application/json'});
    final Map<String, dynamic> responseData = json.decode(response.body);
    if (responseData['status'] == "true") {
      Fluttertoast.showToast(
          msg: "Booking Successfully",
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.black,
          textColor: Colors.white,
          fontSize: 16.0);
      setState(() {
        loader = false;
      });
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => HomeScreen()));
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

  @override
  void initState() {
    super.initState();
    setState(() {
      StripeService.init();
    });

    getPreference();
  }

  void getPreference() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      fees = sharedPreferences.getString("fees");
    });
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height / 100;
    var width1 = MediaQuery.of(context).size.width / 100;
    return Scaffold(
      drawer: DrawerScreen(),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70),
        child: AppBar(
          title: Container(
              padding: EdgeInsets.only(top: 5, right: 5),
              child: Text("Appointment Details")),
          backgroundColor: Color(0xff6762F1),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(20),
                bottomLeft: Radius.circular(20)),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.all(30),
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: double.infinity,
                height: 79.4 * height,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Full Name",
                      style: TextStyle(
                          color: Color(0xff6762F1),
                          fontSize: 14,
                          fontFamily: "Montserrat-Regular"),
                    ),
                    SizedBox(
                      height: 0.7 * height,
                    ),
                    Text(
                      widget.name,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontFamily: "Montserrat-Regular"),
                    ),
                    Divider(
                      color: Colors.black,
                      height: 2.9 * height,
                    ),
                    Text(
                      "Email Address",
                      style: TextStyle(
                          color: Color(0xff6762F1),
                          fontSize: 14,
                          fontFamily: "Montserrat-Regular"),
                    ),
                    SizedBox(
                      height: 0.7 * height,
                    ),
                    Text(
                      widget.email,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontFamily: "Montserrat-Regular"),
                    ),
                    Divider(
                      color: Colors.black,
                      height: 2.9 * height,
                    ),
                    Text(
                      "Mobile Number",
                      style: TextStyle(
                          color: Color(0xff6762F1),
                          fontSize: 14,
                          fontFamily: "Montserrat-Regular"),
                    ),
                    SizedBox(
                      height: 0.7 * height,
                    ),
                    Text(
                      widget.phone,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontFamily: "Montserrat-Regular"),
                    ),
                    Divider(
                      color: Colors.black,
                      height: 2.9 * height,
                    ),
                    Text(
                      "Date",
                      style: TextStyle(
                          color: Color(0xff6762F1),
                          fontSize: 14,
                          fontFamily: "Montserrat-Regular"),
                    ),
                    SizedBox(
                      height: 0.7 * height,
                    ),
                    Text(
                      widget.date,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontFamily: "Montserrat-Regular"),
                    ),
                    Divider(
                      color: Colors.black,
                      height: 2.9 * height,
                    ),
                    Text(
                      "Time",
                      style: TextStyle(
                          color: Color(0xff6762F1),
                          fontSize: 14,
                          fontFamily: "Montserrat-Regular"),
                    ),
                    SizedBox(
                      height: 0.7 * height,
                    ),
                    Text(
                      widget.time,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontFamily: "Montserrat-Regular"),
                    ),
                    Divider(
                      color: Colors.black,
                      height: 2.9 * height,
                    ),
                    Text(
                      "Message",
                      style: TextStyle(
                          color: Color(0xff6762F1),
                          fontSize: 14,
                          fontFamily: "Montserrat-Regular"),
                    ),
                    SizedBox(
                      height: 0.7 * height,
                    ),
                    Text(
                      widget.message,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontFamily: "Montserrat-Regular"),
                    ),
                    Divider(
                      color: Colors.black,
                      height: 2.9 * height,
                    ),
                    Center(
                      child: Column(
                        children: <Widget>[
                          SizedBox(
                            height: 5.8 * height,
                          ),
                          Text(
                            fees,
                            style: TextStyle(
                                color: Color(0xff6762F1),
                                fontSize: 26,
                                fontFamily: "Fonarto"),
                          ),
                          SizedBox(
                            height: 2.9 * height,
                          ),
                          Visibility(
                            visible: loader ?? true,
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 2,
                                ),
                                SpinKitCubeGrid(
                                  color: Color(0xff6762F1),
                                  size: 30,
                                ),
                                Text(
                                  "Please wait...",
                                  style: TextStyle(
                                      fontSize: 20, color: Color(0xff6762F1)),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 4 * height,
                          ),
                          Container(
                            height: 7 * height,
                            width: 82 * width1,
                            child: FlatButton(
                              child: Text(
                                "MAKE PAYMENT",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                    fontFamily: "Montserrat-Bold"),
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50),
                              ),
                              onPressed: () async {
                                var response =
                                    await StripeService.payWithNewCard(
                                  2.0,
                                  "USD",
                                );
                                Fluttertoast.showToast(msg: "payement Sucess");
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => HomeScreen()));
                                // addPaymentdetailMethod(
                                //     "ASdsadqew12312312312312321sadasdad",
                                //     "sadasdasd2ewqrwqwrwefsfsdfdsfgdsffsfds",
                                //     widget.name,
                                //     widget.email,
                                //     widget.phone,
                                //     widget.date,
                                //     widget.time,
                                //     widget.message,
                                //     fees,
                                //     widget.lawyerid);
                              },
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class LawyerDetailAndCancel {}
