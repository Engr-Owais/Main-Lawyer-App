import 'package:flutter/material.dart';
import 'package:lawyer_app/Request/alluserrequest.dart';
import 'package:lawyer_app/callscreens/pickup/pickup_layout.dart';
import 'package:lawyer_app/dashboard/appointmentscreen.dart';
import 'package:lawyer_app/drawerscreens/profilescreen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import './lawyerdrawer.dart';

class LawyerHomeScreen extends StatefulWidget {
  @override
  _LawyerHomeScreenState createState() => _LawyerHomeScreenState();
}

class _LawyerHomeScreenState extends State<LawyerHomeScreen> {
  String email;
  @override
  void initState() {
    super.initState();

    getPreference();
  }

  void getPreference() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      email = sharedPreferences.getString("email");
    });
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height / 100;
    var width1 = MediaQuery.of(context).size.width / 100;

    return PickupLayout(
      scaffold: Scaffold(
        drawer: LawyerDrawer(),
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(70),
          child: AppBar(
            title: Container(
                padding: EdgeInsets.only(top: 5, right: 5),
                child: Text("Home")),
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
            padding: EdgeInsets.all(8),
            color: Colors.white,
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: 90 * width1, // 380
                  height: 20 * height, // 155
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
                        height: 23 * height, //180
                        width: 46 * width1, // 200
                        padding: EdgeInsets.all(5),

                        child: InkWell(
                          onTap: () {
                            setState(() {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          AppointmentScreen()));
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
                                Icon(
                                  Icons.work,
                                  size: 60,
                                  color: Color(0xff6762F1),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Text(
                                  "Appointments",
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
                        height: 23 * height, //180
                        width: 46 * width1, // 200
                        padding: EdgeInsets.all(5),

                        child: InkWell(
                          onTap: () {
                            setState(() {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ProfileScreen()));
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
                                Icon(
                                  Icons.person,
                                  size: 60,
                                  color: Color(0xff6762F1),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Text(
                                  "Profile",
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
                      // Container(
                      //   height: 23 * height, //180
                      //   width: 46 * width1, // 200
                      //   padding: EdgeInsets.all(5),

                      //   child: InkWell(
                      //     onTap: () {
                      //       setState(() {
                      //         Navigator.push(
                      //             context,
                      //             MaterialPageRoute(
                      //                 builder: (context) => AllRequestFetch()));
                      //       });
                      //     },
                      //     child: Card(
                      //       elevation: 5,
                      //       shape: RoundedRectangleBorder(
                      //         borderRadius: BorderRadius.circular(15.0),
                      //       ),
                      //       color: Colors.white,
                      //       child: Column(
                      //         mainAxisAlignment: MainAxisAlignment.center,
                      //         children: <Widget>[
                      //           Icon(
                      //             Icons.record_voice_over,
                      //             size: 60,
                      //             color: Color(0xff6762F1),
                      //           ),
                      //           SizedBox(
                      //             height: 15,
                      //           ),
                      //           Text(
                      //             "Client Request",
                      //             style: TextStyle(
                      //                 fontSize: 16,
                      //                 fontFamily: "Montserrat-Regular"),
                      //           )
                      //         ],
                      //       ),
                      //     ),
                      //   ),
                      // ),
                      //   Container(
                      //     height: 23 * height, //180
                      //     width: 46 * width1, // 200
                      //     padding: EdgeInsets.all(5),

                      //     child: InkWell(
                      //       onTap: () {
                      //         setState(() {});
                      //       },
                      //       child: Card(
                      //         elevation: 5,
                      //         shape: RoundedRectangleBorder(
                      //           borderRadius: BorderRadius.circular(15.0),
                      //         ),
                      //         color: Colors.white,
                      //         child: Column(
                      //           mainAxisAlignment: MainAxisAlignment.center,
                      //           children: <Widget>[
                      //             Icon(
                      //               Icons.image,
                      //               size: 60,
                      //               color: Color(0xff6762F1),
                      //             ),
                      //             SizedBox(
                      //               height: 15,
                      //             ),
                      //             Text(
                      //               "Heading Here",
                      //               style: TextStyle(
                      //                   fontSize: 16,
                      //                   fontFamily: "Montserrat-Regular"),
                      //             )
                      //           ],
                      //         ),
                      //       ),
                      //     ),
                      //   ),
                    ],
                  ),
                ),
                //   Padding(
                //     padding: EdgeInsets.only(left: 12),
                //     child: Row(
                //       children: <Widget>[
                //         Container(
                //           height: 23 * height, //180
                //           width: 46 * width1, // 200
                //           padding: EdgeInsets.all(5),

                //           child: InkWell(
                //             onTap: () {
                //               setState(() {});
                //             },
                //             child: Card(
                //               elevation: 5,
                //               shape: RoundedRectangleBorder(
                //                 borderRadius: BorderRadius.circular(15.0),
                //               ),
                //               color: Colors.white,
                //               child: Column(
                //                 mainAxisAlignment: MainAxisAlignment.center,
                //                 children: <Widget>[
                //                   Icon(
                //                     Icons.image,
                //                     size: 60,
                //                     color: Color(0xff6762F1),
                //                   ),
                //                   SizedBox(
                //                     height: 15,
                //                   ),
                //                   Text(
                //                     "Heading Here",
                //                     style: TextStyle(
                //                         fontSize: 16,
                //                         fontFamily: "Montserrat-Regular"),
                //                   )
                //                 ],
                //               ),
                //             ),
                //           ),
                //         ),
                //         Container(
                //           height: 23 * height, //180
                //           width: 46 * width1, // 200
                //           padding: EdgeInsets.all(5),

                //           child: InkWell(
                //             onTap: () {
                //               setState(() {});
                //             },
                //             child: Card(
                //               elevation: 5,
                //               shape: RoundedRectangleBorder(
                //                 borderRadius: BorderRadius.circular(15.0),
                //               ),
                //               color: Colors.white,
                //               child: Column(
                //                 mainAxisAlignment: MainAxisAlignment.center,
                //                 children: <Widget>[
                //                   Icon(
                //                     Icons.image,
                //                     size: 60,
                //                     color: Color(0xff6762F1),
                //                   ),
                //                   SizedBox(
                //                     height: 15,
                //                   ),
                //                   Text(
                //                     "Heading Here",
                //                     style: TextStyle(
                //                         fontSize: 16,
                //                         fontFamily: "Montserrat-Regular"),
                //                   )
                //                 ],
                //               ),
                //             ),
                //           ),
                //         ),
                //       ],
                //     ),
                //   ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
