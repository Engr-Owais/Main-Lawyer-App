import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lawyer_app/callscreens/pickup/pickup_layout.dart';
import 'package:lawyer_app/dashboard/dash_request.dart';
import 'package:lawyer_app/dashboard/user_request.dart';
import './userdrawerscreen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
              padding: EdgeInsets.only(top: 5, right: 5), child: Text("Home")),
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
          padding: EdgeInsets.all(5),
          color: Colors.white,
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                width: 92.6 * width1, // 380
                height: 22.7 * height, // 155
                child: Image.asset(
                  'assets/home.jpeg',
                  fit: BoxFit.contain,
                ),
              ),
              SizedBox(
                height: 1.4 * height,
              ),
              Padding(
                padding: EdgeInsets.only(left: 12),
                child: Row(
                  children: <Widget>[
                    Container(
                      height: 25 * height, //180
                      width: 46 * width1, // 200
                      padding: EdgeInsets.all(5),

                      child: InkWell(
                        onTap: () {
                          setState(() {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Dash_Request()));
                          });
                        },
                        child: Card(
                          elevation: 5,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          color: Colors.white,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Image.asset("assets/family.png"),
                              SizedBox(
                                height: 15,
                              ),
                              Text(
                                "Family",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontFamily: "Montserrat-Regular"),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: 25 * height, //180
                      width: 46 * width1, // 200
                      padding: EdgeInsets.all(5),

                      child: InkWell(
                        onTap: () {
                          setState(() {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Dash_Request()));
                          });
                        },
                        child: Card(
                          elevation: 5,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          color: Colors.white,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Image.asset("assets/handcuff.png"),
                              SizedBox(
                                height: 15,
                              ),
                              Text(
                                "Criminal",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontFamily: "Montserrat-Regular"),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 12),
                child: Row(
                  children: <Widget>[
                    Container(
                      height: 25 * height, //180
                      width: 46 * width1, // 200
                      padding: EdgeInsets.all(5),

                      child: InkWell(
                        onTap: () {
                          setState(() {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Dash_Request()));
                          });
                        },
                        child: Card(
                          elevation: 5,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          color: Colors.white,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Image.asset("assets/surface1.png"),
                              SizedBox(
                                height: 15,
                              ),
                              Text(
                                "Private",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontFamily: "Montserrat-Regular"),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: 25 * height, //180
                      width: 46 * width1, // 200
                      padding: EdgeInsets.all(5),

                      child: InkWell(
                        onTap: () {
                          setState(() {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Dash_Request()));
                          });
                        },
                        child: Card(
                          elevation: 5,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          color: Colors.white,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Image.asset("assets/broken-heart.png"),
                              SizedBox(
                                height: 15,
                              ),
                              Text(
                                "Divorce",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontFamily: "Montserrat-Regular"),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 12),
                child: Row(
                  children: <Widget>[
                    Container(
                      height: 25 * height, //180
                      width: 46 * width1, // 200
                      padding: EdgeInsets.all(5),

                      child: InkWell(
                        onTap: () {
                          setState(() {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Dash_Request()));
                          });
                        },
                        child: Card(
                          elevation: 5,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          color: Colors.white,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Image.asset("assets/hand.png"),
                              SizedBox(
                                height: 15,
                              ),
                              Text(
                                "Human Rights",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontFamily: "Montserrat-Regular"),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: 25 * height, //180
                      width: 46 * width1, // 200
                      padding: EdgeInsets.all(5),

                      child: InkWell(
                        onTap: () {
                          setState(() {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Dash_Request()));
                          });
                        },
                        child: Card(
                          elevation: 5,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          color: Colors.white,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Image.asset("assets/Path.png"),
                              SizedBox(
                                height: 15,
                              ),
                              Text(
                                "Labour Lawyers",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontFamily: "Montserrat-Regular"),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 1.4 * height,
              ),
              // Column(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: <Widget>[
              //     Container(
              //       height: 8.8 * height,
              //       width: 75 * width1,
              //       padding: EdgeInsets.all(5),
              //       child: FlatButton(
              //         child: Text(
              //           "POST A REQUEST",
              //           style: TextStyle(
              //               color: Colors.white,
              //               fontWeight: FontWeight.bold,
              //               fontSize: 14,
              //               fontFamily: "Montserrat-Bold"),
              //         ),
              //         shape: RoundedRectangleBorder(
              //           borderRadius: BorderRadius.circular(50),
              //         ),
              //         onPressed: () {
              //           Navigator.push(
              //               context,
              //               MaterialPageRoute(
              //                   builder: (context) => User_Request()));
              //         },
              //         color: Colors.black,
              //       ),
              //     ),
              //   ],
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
