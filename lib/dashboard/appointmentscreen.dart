import 'package:flutter/material.dart';
import 'package:lawyer_app/dashboard/cancelled.dart';
import 'package:lawyer_app/dashboard/completed.dart';
import 'package:lawyer_app/dashboard/upcoming.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../lawyerdrawer.dart';

class AppointmentScreen extends StatefulWidget {
  @override
  _AppointmentScreenState createState() => _AppointmentScreenState();
}

class _AppointmentScreenState extends State<AppointmentScreen> {
  String email;
  String appointmentId;

  @override
  void initState() {
    super.initState();
    getPreference();
  }

  void getPreference() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    setState(
      () {
        email = sharedPreferences.getString("email");
        appointmentId = sharedPreferences.getString("apnt_id");
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height / 100;
    var width1 = MediaQuery.of(context).size.width / 100;

    return DefaultTabController(
      child: Scaffold(
        drawer: LawyerDrawer(),
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(100),
          child: AppBar(
            title: Container(
                padding: EdgeInsets.only(top: 5, right: 5),
                child: Text("Appointments")),
            elevation: 0,
            backgroundColor: Color(0xff6762F1),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(20),
                  bottomLeft: Radius.circular(20)),
            ),
            bottom: TabBar(
              labelColor: Colors.white,
              labelStyle: TextStyle(
                fontSize: 15,
                fontFamily: "Montserrat-Regular",
              ),
              indicatorWeight: 3,
              indicatorColor: Colors.white,
              indicatorSize: TabBarIndicatorSize.label,
              unselectedLabelColor: Colors.grey[100],
              tabs: <Widget>[
                Tab(
                  text: "Upcoming",
                ),
                Tab(
                  text: "Completed",
                ),
                Tab(
                  text: "Cancelled",
                ),
              ],
            ),
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            UpComing(email, appointmentId),
            Completed(email),
            Cancelled(email)
          ],
        ),
      ),
      length: 3, // it defines how many pages you want
      initialIndex: 0,
    );
  }
}
