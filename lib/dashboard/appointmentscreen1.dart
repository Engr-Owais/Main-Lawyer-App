import 'package:flutter/material.dart';
import 'package:lawyer_app/dashboard/cancelledscreen.dart';
import 'package:lawyer_app/dashboard/completedscreen.dart';
import 'package:lawyer_app/dashboard/upcomingscreen.dart';
import '../userdrawerscreen.dart';

class AppointmentScreenOne extends StatefulWidget {
  String email;
  AppointmentScreenOne(this.email);
  @override
  _AppointmentScreenOneState createState() => _AppointmentScreenOneState();
}

class _AppointmentScreenOneState extends State<AppointmentScreenOne> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height / 100;
    var width1 = MediaQuery.of(context).size.width / 100;

    return DefaultTabController(
      child: Scaffold(
        drawer: DrawerScreen(),
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
            UpComingScreen(widget.email),
            CompletedScreen(widget.email),
            CancelledScreen(widget.email),
          ],
        ),
      ),
      length: 3, // it defines how many pages you want
      initialIndex: 0,
    );
  }
}
