import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../userdrawerscreen.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class CompletedAppointment extends StatefulWidget {
  String appointmentid;
  CompletedAppointment(this.appointmentid);
  @override
  _CompletedAppointmentState createState() => _CompletedAppointmentState();
}

class _CompletedAppointmentState extends State<CompletedAppointment> {
  int likeval;

  int suggestval;
  bool loading = false;
  String username;
  String date;
  String message;
  String lawyername;
  String averagerating;
  String cat;
  String area;
  String imgurl;
  String phone;
  String email;
  String userid;
  String lawyerid;
  Future<String> fetchbyappointment(String appointmentid) async {
    loading = true;

    String url =
        "http://10xwebsolutions.com/lawyer/api/_fetch_appointment_detail.php?apnt_id=$appointmentid";
    final response =
        await http.get(url, headers: {'content-type': 'application/json'});
    setState(() {
      loading = false;
    });
    final Map<String, dynamic> responseBody = json.decode(response.body);

    if (responseBody["status"] == "true") {
      username = responseBody['Data'][0]['user_name'];
      date = responseBody['Data'][0]['date'].toString();
      message = responseBody['Data'][0]['apnt_message'].toString();
      lawyername = responseBody['Data'][0]['lawyer_name'];
      cat = responseBody['Data'][0]['category'].toString();
      area = responseBody['Data'][0]['lawyer_address'].toString();
      imgurl = responseBody['Data'][0]['lawyer_img_url'].toString();
      phone = responseBody['Data'][0]['lawyer_phone'].toString();
      email = responseBody['Data'][0]['lawyer_email'].toString();
      lawyerid = responseBody['Data'][0]["lawyer_id"].toString();
      averagerating = responseBody['Data'][0]["average_rating"].toString();
    }
  }

  void getPreference() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      email = sharedPreferences.getString("useremail");
      userid = sharedPreferences.get("id");
      print("Call shared" + imgurl);
    });
  }

  double rating = 0.0;

  createAlertDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Container(
              height: 230,
              width: 300,
              color: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Share Your Experience",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 22,
                        fontFamily: "Montserrat-Bold",
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 3 * MediaQuery.of(context).size.height / 100,
                  ),
                  SmoothStarRating(
                    starCount: 5,
                    isReadOnly: false,
                    size: 40,
                    rating: rating,
                    spacing: 3,
                    color: Colors.yellow,
                    borderColor: Colors.yellowAccent,
                    allowHalfRating: false,
                    onRated: (value) {
                      setState(() {
                        rating = value;
                        print("Rating is : $rating");
                      });
                    },
                  ),
                  SizedBox(
                    height: 3 * MediaQuery.of(context).size.height / 100,
                  ),
                  Container(
                    height: 50,
                    width: 250,
                    child: FlatButton(
                      child: Text(
                        "RATE",
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
                        print(averagerating);
                        lawyerrating(lawyerid, userid, rating.toString());
                        Navigator.pop(context);
                      },
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  @override
  void initState() {
    print("id" + widget.appointmentid);
    fetchbyappointment(widget.appointmentid);
    getPreference();
    super.initState();
  }

  Future<Map<String, dynamic>> lawyerlike(String lawid, String usrid) async {
    String url = "http://10xwebsolutions.com/lawyer/api/_like_lawyer.php";

    final Map<String, dynamic> postreq = {
      "user_id": usrid,
      "lawyer_id": lawid,
    };
    final response = await http.post(url,
        body: jsonEncode(postreq),
        headers: {'content-type': 'application/json'});

    final Map<String, dynamic> responseData = json.decode(response.body);
    print(responseData.toString());

    if (responseData["status"] == "true") {
      Fluttertoast.showToast(
          msg: "Thanks for Like",
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.black,
          textColor: Colors.white,
          fontSize: 16.0);
    }
    if (responseData["Data"][0]["total_like"] == 0) {
      Fluttertoast.showToast(
          msg: "Dislike",
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.black,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }

  Future<Map<String, dynamic>> lawyersugeest(String lawid, String usrid) async {
    String url = "http://10xwebsolutions.com/lawyer/api/_suggest_lawyer.php";

    final Map<String, dynamic> postreq = {
      "user_id": usrid,
      "lawyer_id": lawid,
    };
    final response = await http.post(url,
        body: jsonEncode(postreq),
        headers: {'content-type': 'application/json'});

    final Map<String, dynamic> responseData = json.decode(response.body);
    print(responseData.toString());

    if (responseData["status"] == "true") {
      Fluttertoast.showToast(
          msg: "Thanks for Suggest",
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.black,
          textColor: Colors.white,
          fontSize: 16.0);
    }
    if (responseData["Data"][0]["total_suggest"] == 0) {
      Fluttertoast.showToast(
          msg: "UnSuggested",
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.black,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }

  Future<Map<String, dynamic>> lawyerrating(
      String lawid, String usrid, String rating) async {
    String url = "http://10xwebsolutions.com/lawyer/api/_suggest_lawyer.php";
    print("rating something" + rating);

    final Map<String, dynamic> postreq = {
      "user_id": usrid,
      "lawyer_id": lawid,
      "rating": rating,
      "description": ""
    };
    final response = await http.post(url,
        body: jsonEncode(postreq),
        headers: {'content-type': 'application/json'});

    final Map<String, dynamic> responseData = json.decode(response.body);
    print(responseData.toString());

    if (responseData["status"] == "true") {
      Fluttertoast.showToast(
          msg: "Thanks for Rating",
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.black,
          textColor: Colors.white,
          fontSize: 16.0);
    }
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
              child: Text("Appointment Completed")),
          backgroundColor: Color(0xff6762F1),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(20),
                bottomLeft: Radius.circular(20)),
          ),
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
                width: double.infinity,
                padding: EdgeInsets.all(10),
                height: 88 * height,
                color: Colors.white,
                child: Column(
                  children: <Widget>[
                    Container(
                      height: 24 * height, //180
                      width: 100 * width1, // 200
                      padding: EdgeInsets.all(10),
                      color: Colors.white,

                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                username,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15,
                                    fontFamily: "Montserrat-Bold",
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 0.8),
                              ),
                              Text(
                                date,
                                style: TextStyle(
                                    color: Color(0xff6762F1),
                                    fontSize: 13,
                                    fontFamily: "Montserrat-Regular",
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 1),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 1 * height,
                          ),
                          Text(
                            cat,
                            style: TextStyle(
                                color: Colors.grey[700],
                                fontSize: 16,
                                fontFamily: "Montserrat-Regular",
                                fontWeight: FontWeight.normal,
                                letterSpacing: 1),
                          ),
                          SizedBox(
                            height: 1 * height,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 5),
                            child: Text(
                              message,
                              style: TextStyle(
                                  fontFamily: "Montserrat-Regular",
                                  fontWeight: FontWeight.normal),
                            ),
                          ),
                          SizedBox(
                            height: 4 * height,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                "Lawyer Details",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontFamily: "Montserrat-Bold",
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 0.8),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(20),
                      height: 19.1 * height,
                      decoration: BoxDecoration(
                        color: Colors.white,
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            height: 12 * height,
                            width: 23 * width1,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  image: NetworkImage(imgurl),
                                  fit: BoxFit.cover),
                            ),
                          ),
                          SizedBox(
                            width: 4.8 * width1,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                lawyername,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: "Montserrat-Bold",
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 1),
                              ),
                              SizedBox(
                                height: 1.4 * height,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 15),
                                child: Text(
                                  cat,
                                  style: TextStyle(
                                      color: Colors.grey[600],
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
                                      index < averagerating.length.toDouble()
                                          ? Icons.star
                                          : Icons.star_border,
                                      color: Colors.yellow);
                                }),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 20),
                      height: 20 * height,
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
                            height: 2 * height,
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
                                area == null ? "None" : area,
                                style: TextStyle(
                                    color: Colors.grey[700],
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal,
                                    fontFamily: "Montserrat-Regular"),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 2 * height,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Icon(
                                Icons.phone,
                                size: 20,
                                color: Color(0xff6762F1),
                              ),
                              SizedBox(
                                width: 1.2 * width1,
                              ),
                              Text(
                                phone,
                                style: TextStyle(
                                    color: Colors.grey[700],
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal,
                                    fontFamily: "Montserrat-Regular"),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 2 * height,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Icon(
                                Icons.mail,
                                size: 20,
                                color: Color(0xff6762F1),
                              ),
                              SizedBox(
                                width: 1.2 * width1,
                              ),
                              Text(
                                email,
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

                    Padding(
                      padding: const EdgeInsets.all(25),
                      child: Container(
                        padding: EdgeInsets.only(left: 20),
                        height: 5 * height,
                        width: double.infinity,
                        color: Colors.white,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                InkWell(
                                  onTap: () {
                                    lawyerlike(lawyerid, userid);
                                    setState(() {
                                      likeval = 1;
                                    });
                                  },
                                  child: Icon(
                                    Icons.thumb_up,
                                    size: 20,
                                    color: likeval == 1
                                        ? Color(0xff6762F1)
                                        : Colors.grey,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 5),
                                  child: Text(
                                    "Like",
                                    style: TextStyle(
                                        color: likeval == 1
                                            ? Color(0xff6762F1)
                                            : Colors.grey,
                                        fontSize: 16,
                                        fontFamily: "Montserrat-Regular"),
                                  ),
                                ),
                                SizedBox(
                                  width: 36.58 * width1,
                                ),
                                InkWell(
                                  onTap: () {
                                    lawyersugeest(lawyerid, userid);
                                    setState(() {
                                      suggestval = 1;
                                    });
                                  },
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.check_circle,
                                        size: 20,
                                        color: suggestval == 1
                                            ? Color(0xff6762F1)
                                            : Colors.grey,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 5),
                                        child: Text(
                                          "Suggest",
                                          style: TextStyle(
                                              color: suggestval == 1
                                                  ? Color(0xff6762F1)
                                                  : Colors.grey,
                                              fontSize: 16,
                                              fontWeight: FontWeight.normal,
                                              fontFamily: "Montserrat-Regular"),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),

                    // Rating Button Code
                    Center(
                      child: Container(
                        height: 8 * height,
                        width: 82 * width1,
                        child: FlatButton(
                          child: Text(
                            "RATING",
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
                            createAlertDialog(context);
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
