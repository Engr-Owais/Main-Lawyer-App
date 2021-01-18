import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:lawyer_app/authscreen/usersignup.dart';
import 'package:lawyer_app/models/user_authmodel/login.dart';
import 'package:progress_indicator_button/progress_button.dart';

import '../homescreen.dart';

class UserLogin extends StatefulWidget {
  @override
  _UserLoginState createState() => _UserLoginState();
}

class _UserLoginState extends State<UserLogin> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  var _controller;
  var _userEmail;

  var _userPassword;
  TextEditingController _emailController = new TextEditingController();
  TextEditingController _passwordController = new TextEditingController();
  var _timer;
  void userloginfunction(AnimationController controller) async {
    Appusers(context, _emailController.text, _passwordController.text);
    controller.forward();
    _timer = await Future.delayed(Duration(seconds: 3), () {});

    print("delay stop");
    controller.reset();
  }

  final _auth = FirebaseAuth.instance;

  void loginFormAuth() async {
    UserCredential _authResult;

    final isValid = _formKey.currentState.validate();

    try {
      if (isValid) {
        _authResult = await _auth.signInWithEmailAndPassword(
            email: _emailController.text, password: _passwordController.text);

        Fluttertoast.showToast(
            msg: "login Successfully",
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.black,
            textColor: Colors.white,
            fontSize: 16.0);
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (BuildContext context) => HomeScreen()));
      }
    } on PlatformException catch (e) {
      var message = 'An Error Occured';

      if (e.message != null) {
        message = e.message;
      }
    } catch (err) {
      Fluttertoast.showToast(
          msg: "wrong Email or Password",
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.black,
          textColor: Colors.white,
          fontSize: 16.0);

      print(err);
    }
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
    _timer?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height / 100;
    var width1 = MediaQuery.of(context).size.width / 100;
    return Scaffold(
      // resizeToAvoidBottomPadding: false,
      body: Stack(
        children: <Widget>[
          Container(
            width: double.infinity,
            // Back Ground Image
            constraints: BoxConstraints.expand(),
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/back1.jpeg'), fit: BoxFit.cover),
            ),

            child: SingleChildScrollView(
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: 14.7 * height,
                  ),
                  Container(
                    child: Text(
                      "User Login",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 36,
                          fontWeight: FontWeight.w700,
                          fontFamily: "Fonarto"),
                    ),
                  ),
                  SizedBox(
                    height: 11.7 * height,
                  ),
                  Container(
                      height: 59.9 * height,
                      width: 85.3 * width1,
                      padding: EdgeInsets.all(5),
                      child: Form(
                        key: _formKey,
                        child: SingleChildScrollView(
                          child: Column(
                            children: <Widget>[
                              //  Email Text Field
                              TextFormField(
                                decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.transparent),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(50))),
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.transparent),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(50))),
                                    prefixIcon: Icon(Icons.mail),
                                    hintText: "Email",
                                    hintStyle: TextStyle(
                                      fontFamily: "Montserrat-Regular",
                                      fontStyle: FontStyle.normal,
                                      fontSize: 16,
                                    ),
                                    filled: true,
                                    fillColor: Colors.grey[200]),
                                controller: _emailController,
                                keyboardType: TextInputType.emailAddress,
                                validator: (value) {
                                  if (value.isEmpty || !value.contains('@')) {
                                    return 'invalid email';
                                  }
                                  return null;
                                },
                                onSaved: (value) {
                                  _userEmail = value;
                                },
                              ),
                              SizedBox(
                                height: 3 * height,
                              ),

                              //  Password Field Code Starts Here

                              TextFormField(
                                decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.transparent),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(50))),
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.transparent),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(50))),
                                    prefixIcon: Icon(Icons.lock),
                                    hintText: "Password",
                                    hintStyle: TextStyle(
                                      fontFamily: "Montserrat-Regular",
                                      fontStyle: FontStyle.normal,
                                      fontSize: 16,
                                    ),
                                    filled: true,
                                    fillColor: Colors.grey[200]),
                                obscureText: true,
                                controller: _passwordController,
                                validator: (value) {
                                  if (value.isEmpty || value.length <= 5) {
                                    return 'invalid Password';
                                  }
                                  return null;
                                },
                                onSaved: (value) {
                                  _userPassword = value;
                                },
                              ),

                              //  Login Button Code Starts From Here
                              SizedBox(
                                height: 4.4 * height,
                              ),

                              Container(
                                height: 8.8 * height,
                                width: 85.3 * width1,
                                child: ProgressButton(
                                  child: Text(
                                    "LOGIN",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14,
                                        fontFamily: "Montserrat-Bold"),
                                  ),
                                  borderRadius: BorderRadius.circular(50),
                                  onPressed:
                                      (AnimationController controller) async {
                                    if (_formKey.currentState.validate()) {
                                    await userloginfunction(controller);
                                  }
                                  },
                                  color: Colors.black,
                                ),
                              ),
                              //  Login Button Code Ends Here
                              SizedBox(
                                height: 4.4 * height,
                              ),

                              SizedBox(
                                height: 12.3 * height,
                              ),

                              Container(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text(
                                      "Don't have an account? ",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                          fontFamily: "Montserrat-Regular"),
                                    ),
                                    InkWell(
                                      child: Text(
                                        "Signup",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 16,
                                            fontFamily: "Montserrat-Regular"),
                                      ),
                                      onTap: () {
                                        setState(() {
                                          Navigator.pushReplacement(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      UserSignUp()));
                                        });
                                      },
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      )),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
