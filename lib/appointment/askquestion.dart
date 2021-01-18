import 'package:flutter/material.dart';

class AskQuestion extends StatefulWidget {
  @override
  _AskQuestionState createState() => _AskQuestionState();
}

class _AskQuestionState extends State<AskQuestion> {
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
        child: Container(
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Image.asset(
                      "assets/user.png",
                      height: 12.5 * height,
                      width: 20 * width1,
                    ),
                    SizedBox(
                      width: 4.8 * width1,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Yuliya Dumanska",
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
                          padding: const EdgeInsets.only(right: 15),
                          child: Text(
                            "Criminal Lawyer",
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
                        Padding(
                          padding: const EdgeInsets.only(right: 30),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Icon(
                                Icons.star,
                                size: 20,
                                color: Colors.yellow,
                              ),
                              Icon(
                                Icons.star,
                                size: 20,
                                color: Colors.yellow,
                              ),
                              Icon(
                                Icons.star,
                                size: 20,
                                color: Colors.yellow,
                              ),
                              Icon(
                                Icons.star,
                                size: 20,
                                color: Colors.yellow,
                              ),
                              Icon(
                                Icons.star,
                                size: 20,
                                color: Colors.grey[300],
                              ),
                            ],
                          ),
                        ),
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
                      "It is a long estsblished fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using.",
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
                height: 18 * height,
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
                    SizedBox(
                      height: 1.47 * height,
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
                          "9876543210",
                          style: TextStyle(
                              color: Colors.grey[700],
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
                        Icon(
                          Icons.mail,
                          size: 20,
                          color: Color(0xff6762F1),
                        ),
                        SizedBox(
                          width: 1.2 * width1,
                        ),
                        Text(
                          "info@yuliadumanska.com",
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
                padding:
                    EdgeInsets.only(left: 30, top: 20, right: 30, bottom: 20),
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
                          "3233",
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
                          "2703",
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
                          "1101",
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
                          "LLM",
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
                          "10 Years",
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
                          "\$500",
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
              Center(
                child: Container(
                  height: 8 * height,
                  width: 82 * width1,
                  child: FlatButton(
                    child: Text(
                      "ASK QUESTION?",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          fontFamily: "Montserrat-Bold"),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                    onPressed: () {},
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
