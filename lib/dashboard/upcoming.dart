import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:lawyer_app/ChatScreens/chat/chatfirebasescreen.dart';
import 'package:lawyer_app/global.dart';
import 'package:lawyer_app/models/fetchlawyerappointment.dart';
import 'package:lawyer_app/models/lawyer_authmodel/Signup.dart';
import 'package:lawyer_app/global.dart' as globals;

class UpComing extends StatefulWidget {
  String email;
  String appointmentId;
  UpComing(this.email, this.appointmentId);
  @override
  _UpComingState createState() => _UpComingState();
}

class _UpComingState extends State<UpComing> {
  Future<void> createAppointChatRoom(String appointmentID, String email) async {
    print('neweshid $appointmentID');

    globals.lawwwIdd = await FirebaseAuth.instance.currentUser.uid;

    List<String> users = [
      await FirebaseAuth.instance.currentUser.email,
      lawyerid
    ];
    FirebaseFirestore.instance
        .collection('appointchatroom')
        .doc(appointmentID)
        .set({
      "users": users,
      "chatRoomId": appointmentID,
    });

    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => ChatScreen(appointmentID, email)));
  }

  dynamic data;

  Future<dynamic> getData(String email) async {
    final DocumentReference document =
        FirebaseFirestore.instance.collection("users").doc(email);

    await document.get().then<dynamic>((DocumentSnapshot snapshot) async {
      print("$email LAWWdiIDidididid");
      setState(() {
        data = snapshot.data();
        fireID = data['user_id'];
        nameCall = data['username'];
      });
    });
    print("$fireID  userfireID");
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height / 100;
    var width1 = MediaQuery.of(context).size.width / 100;

    return Scaffold(
      body: FutureBuilder(
          future: fetchlawyerupcomingappointment(widget.email),
          builder: (context, AsyncSnapshot snapshot) {
            if (!snapshot.hasData) {
              return SizedBox(
                height: 500,
                child: Center(
                    child: SpinKitFadingCircle(
                  color: Theme.of(context).accentColor,
                  size: 50.0,
                )),
              );
            }
            if (snapshot.data.isEmpty)
              return SizedBox(
                height: 500,
                child: Center(child: Text('No Data Found')),
              );
            else {
              return ListView.builder(
                  reverse: true,
                  shrinkWrap: true,
                  itemCount: snapshot.data.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      padding: EdgeInsets.all(10),
                      color: Colors.white,
                      child: Column(
                        children: <Widget>[
                          Container(
                            height: 24 * height, //180
                            width: 100 * width1, // 200
                            padding: EdgeInsets.all(5),

                            child: InkWell(
                              onTap: () {
                                setState(() {});
                              },
                              child: Card(
                                elevation: 5,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                                color: Colors.white,
                                child: Padding(
                                  padding: const EdgeInsets.all(20),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Text(
                                            '${snapshot.data[index].heading}',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 16,
                                                fontFamily: "Montserrat-Bold",
                                                fontWeight: FontWeight.bold,
                                                letterSpacing: 0.8),
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(left: 80),
                                            child: Text(
                                              '${snapshot.data[index].date}',
                                              style: TextStyle(
                                                  color: Color(0xff6762F1),
                                                  fontSize: 14,
                                                  fontFamily:
                                                      "Montserrat-Regular",
                                                  fontWeight: FontWeight.bold,
                                                  letterSpacing: 1),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 0.7 * height,
                                      ),
                                      Text(
                                        '${snapshot.data[index].cat}',
                                        style: TextStyle(
                                            color: Colors.grey[700],
                                            fontSize: 16,
                                            fontFamily: "Montserrat-Regular",
                                            fontWeight: FontWeight.normal,
                                            letterSpacing: 1),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          setState(() {
                                            globalAppIDUser = snapshot
                                                .data[index].apointmentid;
                                            createAppointChatRoom(
                                              snapshot.data[index].apointmentid,
                                              snapshot.data[index].lawyeremail,
                                            );
                                            getData(
                                              snapshot.data[index].useremail,
                                            );
                                          });
                                        },
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: <Widget>[
                                            Icon(
                                              Icons.arrow_forward_ios,
                                              size: 16,
                                            )
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 10),
                                        child: Text(
                                          '${snapshot.data[index].message}',
                                          style: TextStyle(
                                              fontFamily: "Montserrat-Regular",
                                              fontWeight: FontWeight.normal),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ), //1
                          //4
                        ],
                      ),
                    );
                  });
            }
          }),
    );
  }
}
