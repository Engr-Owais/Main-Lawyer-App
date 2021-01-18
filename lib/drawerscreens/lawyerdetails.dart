import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:lawyer_app/appointment/confirmappointment.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

import 'package:smooth_star_rating/smooth_star_rating.dart';

class LawyerDetail extends StatefulWidget {
  String email;
  String cat;
  LawyerDetail(this.email, this.cat);
  @override
  _LawyerDetailState createState() => _LawyerDetailState();
}

class _LawyerDetailState extends State<LawyerDetail> {
  bool loading = false;
  String services;
  String likes;
  String suggest;
  String qualification;
  String exp;
  String fullname;
  String lawyerid;
  String fees;
  String rating;
  String imageUrl;
  @override
  Future<String> getlawyer(String email) async {
    loading = true;
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String url =
        "http://10xwebsolutions.com/lawyer/api/_lawyer_details.php?email=$email";
    final response =
        await http.get(url, headers: {'content-type': 'application/json'});
    setState(() {
      loading = false;
    });
    final Map<String, dynamic> responseBody = json.decode(response.body);

    print(responseBody.toString());
    if (responseBody["status"] == "true") {
      services = responseBody['Data'][0]['service_area'];
      suggest = responseBody['Data'][0]['suggested'].toString();
      likes = responseBody['Data'][0]['likes'].toString();
      qualification = responseBody['Data'][0]['qualification'];
      exp = responseBody['Data'][0]['experience'].toString();
      fullname = responseBody['Data'][0]['fullname'];
      fees = responseBody['Data'][0]['fees'].toString();
      rating = responseBody['Data'][0]['average_rating'].toString();
      imageUrl = responseBody['Data'][0]['img_url'].toString();
      lawyerid = responseBody['Data'][0]['lawyer_id'].toString();
      await sharedPreferences.setString("fees", fees);
    }
  }

  void initState() {
    setState(() {
      getlawyer(widget.email);
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height / 100;
    var width1 = MediaQuery.of(context).size.width / 100;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70),
        child: AppBar(
          title: Container(
            child: Text("Details"),
          ),
          elevation: 0,
          backgroundColor: Color(0xff6762F1),
          shape: RoundedRectangleBorder(),
        ),
      ),
      body: SingleChildScrollView(
        child: loading
            ? Center(
                child: Container(
                    child: SizedBox(
                height: 500,
                child: Center(
                    child: SpinKitFadingCircle(
                  color: Theme.of(context).accentColor,
                  size: 50.0,
                )),
              )))
            : Container(
                height: 110 * height,
                width: double.infinity,
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.all(20),
                      height: 19.1 * height,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20)),
                        color: Color(0xff6762F1),
                      ),
                      child: Row(
                        children: <Widget>[
                          Image.network(
                            imageUrl,
                            height: 12.5 * height,
                          ),
                          SizedBox(
                            width: 2.5 * width1,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                fullname,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: "Montserrat-Bold",
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 1),
                              ),
                              SizedBox(
                                height: 1.4 * height,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 50),
                                child: Text(
                                  widget.cat,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: "Montserrat-Bold",
                                      fontSize: 18,
                                      fontWeight: FontWeight.normal,
                                      letterSpacing: 0.8),
                                ),
                              ),
                              SizedBox(
                                height: 1.4 * height,
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                children: List.generate(5, (index) {
                                  return Icon(
                                      index < rating.length.toDouble()
                                          ? Icons.star
                                          : Icons.star_border,
                                      color: Colors.yellow);
                                }),
                              ),
                              // SmoothStarRating(
                              //   starCount: 5,
                              //   rating: rating.toDouble() == null
                              //       ? 3
                              //       : rating.toDouble(),
                              //   isReadOnly: false,
                              //   size: 20,
                              //   borderColor: Colors.yellowAccent,
                              //   color: Colors.yellow,
                              // )
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(20),
                      height: 25.0 * height,
                      width: double.infinity,
                      color: Colors.white,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "About Me",
                            style: TextStyle(
                                color: Color(0xff6762F1),
                                fontSize: 14,
                                fontFamily: "Montserrat-Regular",
                                fontWeight: FontWeight.bold,
                                letterSpacing: 0.5),
                          ),
                          SizedBox(
                            height: 0.7 * height,
                          ),
                          Text(
                            "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using.",
                            style: TextStyle(
                                color: Colors.grey[700],
                                fontSize: 14,
                                fontFamily: "Montserrat-Regular",
                                fontWeight: FontWeight.bold,
                                letterSpacing: 0.5),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 20),
                      height: 10.2 * height,
                      width: double.infinity,
                      color: Colors.white,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "Contact Details",
                            style: TextStyle(
                                color: Color(0xff6762F1),
                                fontSize: 14,
                                fontFamily: "Montserrat-Regular",
                                fontWeight: FontWeight.bold,
                                letterSpacing: 0.5),
                          ),
                          SizedBox(
                            height: 1.47 * height,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Icon(
                                Icons.location_on,
                                size: 20,
                                color: Color(0xff6762F1),
                              ),
                              SizedBox(
                                width: 1.2 * width1,
                              ),
                              Text(
                                "Lorem Ipsum is Simply Dummy",
                                style: TextStyle(
                                    color: Colors.grey[700],
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal,
                                    fontFamily: "Montserrat-Regular"),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(
                          left: 30, top: 20, right: 30, bottom: 20),
                      height: 13.23 * height,
                      width: double.infinity,
                      color: Colors.grey[200],
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Column(
                            children: <Widget>[
                              Text(
                                "Likes",
                                style: TextStyle(
                                    color: Colors.grey[800],
                                    fontSize: 16,
                                    fontFamily: "Montserrat-Regular",
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 0.5),
                              ),
                              SizedBox(
                                height: 1.47 * height,
                              ),
                              Text(
                                likes,
                                style: TextStyle(
                                    color: Color(0xff6762F1),
                                    fontSize: 16,
                                    fontFamily: "Montserrat-Regular",
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 0.5),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 7.31 * width1,
                          ),
                          VerticalDivider(
                            color: Colors.grey[400],
                            thickness: 2,
                            width: 3.6 * width1,
                            endIndent: 16,
                            indent: 12,
                          ),
                          SizedBox(
                            width: 5 * width1,
                          ),
                          Column(
                            children: <Widget>[
                              Text(
                                "Appoints",
                                style: TextStyle(
                                    color: Colors.grey[800],
                                    fontSize: 16,
                                    fontFamily: "Montserrat-Regular",
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 0.5),
                              ),
                              SizedBox(
                                height: 1.47 * height,
                              ),
                              Text(
                                "0",
                                style: TextStyle(
                                    color: Color(0xff6762F1),
                                    fontSize: 16,
                                    fontFamily: "Montserrat-Regular",
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 0.5),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 4.87 * width1,
                          ),
                          VerticalDivider(
                            color: Colors.grey[400],
                            thickness: 2,
                            width: 3.65 * width1,
                            endIndent: 16,
                            indent: 12,
                          ),
                          SizedBox(
                            width: 4.87 * width1,
                          ),
                          Column(
                            children: <Widget>[
                              Text(
                                "Suggested",
                                style: TextStyle(
                                    color: Colors.grey[800],
                                    fontSize: 16,
                                    fontFamily: "Montserrat-Regular",
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 0.5),
                              ),
                              SizedBox(
                                height: 1.47 * height,
                              ),
                              Text(
                                suggest,
                                style: TextStyle(
                                    color: Color(0xff6762F1),
                                    fontSize: 16,
                                    fontFamily: "Montserrat-Regular",
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 0.5),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 2.94 * height,
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 20),
                      height: 10.29 * height,
                      width: double.infinity,
                      color: Colors.white,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                "Qualification",
                                style: TextStyle(
                                    color: Color(0xff6762F1),
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal,
                                    fontFamily: "Montserrat-Regular"),
                              ),
                              SizedBox(
                                width: 36.58 * width1,
                              ),
                              Text(
                                "Experience",
                                style: TextStyle(
                                    color: Color(0xff6762F1),
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal,
                                    fontFamily: "Montserrat-Regular"),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 1.47 * height,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                qualification,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.normal,
                                    fontFamily: "Montserrat-Regular"),
                              ),
                              SizedBox(
                                width: 48.78 * width1,
                              ),
                              Text(
                                exp,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.normal,
                                    fontFamily: "Montserrat-Regular"),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 20),
                      height: 10.29 * height,
                      width: double.infinity,
                      color: Colors.white,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "Fee",
                            style: TextStyle(
                                color: Color(0xff6762F1),
                                fontSize: 14,
                                fontWeight: FontWeight.normal,
                                fontFamily: "Montserrat-Regular"),
                          ),
                          SizedBox(
                            height: 1.47 * height,
                          ),
                          Row(
                            children: <Widget>[
                              Text(
                                fees,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.normal,
                                    fontFamily: "Montserrat-Regular"),
                              ),
                              SizedBox(
                                width: 1.21 * width1,
                              ),
                              Text(
                                "(Per Appointment)",
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 16,
                                    fontWeight: FontWeight.normal,
                                    fontFamily: "Montserrat-Regular"),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 20),
                      height: 10.29 * height,
                      width: double.infinity,
                      color: Colors.white,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "Service/Practice area",
                            style: TextStyle(
                                color: Color(0xff6762F1),
                                fontSize: 14,
                                fontWeight: FontWeight.normal,
                                fontFamily: "Montserrat-Regular"),
                          ),
                          SizedBox(
                            height: 1.47 * height,
                          ),
                          Text(
                            services == null ? "None" : services,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.normal,
                                fontFamily: "Montserrat-Regular",
                                letterSpacing: 0.5),
                          ),
                        ],
                      ),
                    ),
                    Center(
                      child: Container(
                        height: 8 * height,
                        width: 82 * width1,
                        child: FlatButton(
                          child: Text(
                            "BOOK AN APPOINTMENT",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                                fontFamily: "Montserrat-Bold"),
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),
                          ),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        ConfirmAppointment(lawyerid)));
                          },
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
