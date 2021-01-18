import 'package:flutter/material.dart';
import 'package:lawyer_app/authscreen/userlogin.dart';
import 'lawyerlogin.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height / 100;
    var width1 = MediaQuery.of(context).size.width / 100;

    return Scaffold(
      body: Container(
        width: double.infinity,
        // Back Ground Image
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/back1.jpeg'), fit: BoxFit.cover),
        ),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              child: Text(
                "Lawyer App",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 36,
                    fontWeight: FontWeight.w700,
                    fontFamily: "Fonarto"),
              ),
              padding: EdgeInsets.all(32),
            ),

            SizedBox(
              height: 11.7 * height,
            ),

            //Button One Code
            Container(
              height: 8.0 * height,
              width: 73.1 * width1,
              child: FlatButton(
                child: Text(
                  "USER LOGIN",
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
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => UserLogin()));
                },
                color: Colors.black,
              ),
            ),
            // End Code

            SizedBox(
              height: 3 * height,
            ),

            //Button Two Code
            Container(
              height: 8.0 * height,
              width: 73.1 * width1,
              child: FlatButton(
                child: Text(
                  "LAWYER LOGIN",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      fontFamily: "Montserrat-Bold"),
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LawyerLogin()));
                },
                color: Colors.white,
              ),
            ),
            //  End Code
          ],
        ),
      ),
    );
  }
}
