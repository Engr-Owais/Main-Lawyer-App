import 'package:flutter/material.dart';
import 'package:lawyer_app/authscreen/lawyerlogin.dart';
import 'package:lawyer_app/dashboard/appointmentscreen.dart';
import 'package:lawyer_app/dashboard/faqscreen.dart';
import 'package:lawyer_app/drawerscreens/lawyeraboutus.dart';
import 'package:lawyer_app/drawerscreens/lawyerprivacypolicy.dart';
import 'package:lawyer_app/drawerscreens/profilescreen.dart';
import 'lawyerhomescreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LawyerDrawer extends StatefulWidget {
  @override
  _LawyerDrawerState createState() => _LawyerDrawerState();
}

class _LawyerDrawerState extends State<LawyerDrawer> {
  String imgurl;
  String lawyername;
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
      lawyername = sharedPreferences.getString("fullname");
      imgurl = sharedPreferences.getString("img_url");
      print("Call shared" + imgurl);
    });
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height / 100;
    var width1 = MediaQuery.of(context).size.width / 100;

    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(15),
            color: Color(0xff6762F1),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  height: 70,
                  width: 70,
                  margin: EdgeInsets.only(
                    top: 30,
                    bottom: 10,
                  ),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: NetworkImage(imgurl), fit: BoxFit.fill),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 190),
                  child: Text(
                    lawyername,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontFamily: "Montserrat-Regular"),
                  ),
                ),
                SizedBox(
                  height: 0.5 * height,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 130),
                  child: Text(
                    email,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontFamily: "Montserrat-Regular"),
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.home,
              size: 30,
            ),
            title: Text(
              "Home",
              style: TextStyle(
                  color: Colors.grey[700],
                  fontSize: 16,
                  fontFamily: "Montserrat-Regular"),
            ),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => LawyerHomeScreen()));
            },
          ),
          ListTile(
            leading: Icon(
              Icons.group,
              size: 30,
            ),
            title: Text(
              "About Us",
              style: TextStyle(
                  color: Colors.grey[700],
                  fontSize: 16,
                  fontFamily: "Montserrat-Regular"),
            ),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => LawyerAboutUs()));
            },
          ),
          ListTile(
            leading: Icon(
              Icons.work,
              size: 30,
            ),
            title: Text(
              "Appointment",
              style: TextStyle(
                  color: Colors.grey[700],
                  fontSize: 16,
                  fontFamily: "Montserrat-Regular"),
            ),
            onTap: () {
              setState(() {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AppointmentScreen(),
                    ));
              });
            },
          ),
          ListTile(
            leading: Icon(
              Icons.person,
              size: 30,
            ),
            title: Text(
              "Profile",
              style: TextStyle(
                  color: Colors.grey[700],
                  fontSize: 16,
                  fontFamily: "Montserrat-Regular"),
            ),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ProfileScreen()));
            },
          ),
          // ListTile(
          //   leading: Icon(
          //     Icons.settings,
          //     size: 30,
          //   ),
          //   title: Text(
          //     "Settings",
          //     style: TextStyle(
          //         color: Colors.grey[700],
          //         fontSize: 16,
          //         fontFamily: "Montserrat-Regular"),
          //   ),
          //   onTap: () {},
          // ),
          // ListTile(
          //   leading: Icon(
          //     Icons.sms_failed,
          //     size: 30,
          //   ),
          //   title: Text(
          //     "Faq's",
          //     style: TextStyle(
          //         color: Colors.grey[700],
          //         fontSize: 16,
          //         fontFamily: "Montserrat-Regular"),
          //   ),
          //   onTap: () {
          //     setState(() {
          //       Navigator.push(context, MaterialPageRoute(builder: (context) => FaqScreen()));
          //     });
          //   },
          // ),
          ListTile(
            leading: Icon(
              Icons.image,
              size: 30,
            ),
            title: Text(
              "Privacy Policy",
              style: TextStyle(
                  color: Colors.grey[700],
                  fontSize: 16,
                  fontFamily: "Montserrat-Regular"),
            ),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => LawyerPrivacyPolicy()));
            },
          ),
          ListTile(
            leading: Icon(
              Icons.arrow_back,
              size: 30,
            ),
            title: Text(
              "Log Out",
              style: TextStyle(
                  color: Colors.grey[700],
                  fontSize: 16,
                  fontFamily: "Montserrat-Regular"),
            ),
            onTap: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => LawyerLogin()));
            },
          ),
        ],
      ),
    );
  }
}
