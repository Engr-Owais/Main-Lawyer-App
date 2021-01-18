import 'package:flutter/material.dart';
import 'package:lawyer_app/authscreen/userlogin.dart';
import 'package:lawyer_app/dashboard/appointmentscreen1.dart';
import 'package:lawyer_app/dashboard/faqscreen.dart';
import 'package:lawyer_app/drawerscreens/aboutus.dart';
import 'package:lawyer_app/drawerscreens/privacypolicy.dart';
import 'package:lawyer_app/drawerscreens/userprofile.dart';
import 'package:lawyer_app/homescreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DrawerScreen extends StatefulWidget {
  @override
  _DrawerScreenState createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  String email;
  String username;
  String imgurl;
  @override
  void initState() {
    super.initState();
    getPreference();
  }

  void getPreference() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      email = sharedPreferences.getString("useremail");
      username = sharedPreferences.getString("userfullname");
      imgurl = sharedPreferences.getString("userimg_url");
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
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(right: 160),
                  child: Container(
                    height: 12 * height,
                    width: 23 * width1,
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
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 190),
                  child: Text(
                    username,
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
                  MaterialPageRoute(builder: (context) => HomeScreen()));
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
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => AboutUs()));
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
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => AppointmentScreenOne(email)));
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
                  MaterialPageRoute(builder: (context) => UserProfile()));
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
          ListTile(
            leading: Icon(
              Icons.sms_failed,
              size: 30,
            ),
            title: Text(
              "Faq's",
              style: TextStyle(
                  color: Colors.grey[700],
                  fontSize: 16,
                  fontFamily: "Montserrat-Regular"),
            ),
            onTap: () {
              setState(() {
                Navigator.push(context, MaterialPageRoute(builder: (context) => FaqScreen()));
              });
            },
          ),
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
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => PrivacyPolicy()));
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
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => UserLogin()));
            },
          ),
        ],
      ),
    );
  }
}
