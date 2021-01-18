import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:lawyer_app/authscreen/userlogin.dart';
import 'package:lawyer_app/models/user_authmodel/signup.dart';
import 'package:progress_indicator_button/progress_button.dart';

class UserSignUp extends StatefulWidget {
  @override
  _UserSignUpState createState() => _UserSignUpState();
}

class _UserSignUpState extends State<UserSignUp> {
  var _userEmail;
  var _userName;
  var _userPhone;
  var _userPassword;
 String Name;
  void usersignup(AnimationController controller) async {
    controller.forward();
    print("delay start");
    Usersignup(
      context,
      _nameController.text,
      _emailController.text,
      _numberController.text.toString(),
      _passwordController.text.toString(),
    );
    await Future.delayed(Duration(seconds: 3), () {});
    print("delay stop");
    controller.reset();
  }

  final GlobalKey<FormState> _formKey = GlobalKey();
  TextEditingController _emailController = new TextEditingController();
  TextEditingController _numberController = new TextEditingController();
  TextEditingController _nameController = new TextEditingController();
  TextEditingController _passwordController = new TextEditingController();

  // final _auth = FirebaseAuth.instance;

  // void submitFormAuth() async {
  //   UserCredential _authResult;

  //   final isValid = _formKey.currentState.validate();

  //   try {
  //     if (isValid) {
  //       _authResult = await _auth.createUserWithEmailAndPassword(
  //           email: _emailController.text, password: _passwordController.text);
  //     }
  //   } on PlatformException catch (e) {
  //     var message = 'An Error Occured';

  //     if (e.message != null) {
  //       message = e.message;
  //     }
  //   } catch (err) {
  //     print(err);
  //   }
  // }

  // void _submitAuthForm() {
  //   final isValid = _formKey.currentState.validate();
  //   FocusScope.of(context).unfocus();
  //   if (isValid) {
  //     _formKey.currentState.save();
  //     print(_userName);
  //     print(_userEmail);
  //     print(_userPassword);
  //     print(_userPhone);
  //   }
  // }

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

            // Back Ground Image Starts Here
            constraints: BoxConstraints.expand(),
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/back1.jpeg'), fit: BoxFit.cover),
            ),
            //  Background Image Ends Here

            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: 10 * height,
                  ),
                  Container(
                    height: 7.3 * height,
                    child: Text(
                      "User Signup",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 36,
                          fontWeight: FontWeight.w500,
                          fontFamily: "Fonarto"),
                    ),
                  ),
                  SizedBox(
                    height: 4.4 * height,
                  ),
                  Container(
                    height: 70.5 * height,
                    width: 85.3 * width1,
                    child: Form(
                      key: _formKey,
                      child: SingleChildScrollView(
                        child: Column(
                          children: <Widget>[
                            // User Name Text Field
                            TextFormField(
                              decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.white),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(50))),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.white),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(50))),
                                  prefixIcon: Icon(Icons.verified_user),
                                  hintText: "Full Name",
                                  hintStyle: TextStyle(
                                    fontFamily: "Montserrat-Regular",
                                    fontStyle: FontStyle.normal,
                                    fontSize: 16,
                                  ),
                                  filled: true,
                                  fillColor: Colors.grey[200]),
                              controller: _nameController,
                              keyboardType: TextInputType.text,
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'Please Enter Your Name';
                                }
                                return null;
                              },
                              onSaved: (value) {
                                _userName = value;
                              },
                            ),

                            SizedBox(
                              height: 2 * height,
                            ),

                            //  Email Text Field
                            TextFormField(
                              decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.transparent),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(50))),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.transparent),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(50))),
                                  prefixIcon: Icon(Icons.mail),
                                  hintText: "Email address",
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
                              height: 2 * height,
                            ),

                            // Phone Number Text Field
                            TextFormField(
                              decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.white),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(50))),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.white),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(50))),
                                  prefixIcon: Icon(Icons.phone),
                                  hintText: "Phone Number",
                                  hintStyle: TextStyle(
                                    fontFamily: "Montserrat-Regular",
                                    fontStyle: FontStyle.normal,
                                    fontSize: 16,
                                  ),
                                  filled: true,
                                  fillColor: Colors.grey[200]),
                              controller: _numberController,
                              keyboardType: TextInputType.number,
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'Please Enter Phone Number';
                                }
                                return null;
                              },
                              onSaved: (value) {
                                _userPhone = value;
                              },
                            ),

                            SizedBox(
                              height: 2 * height,
                            ),

                            //  Password Field Code Starts Here

                            TextFormField(
                              decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.transparent),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(50))),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.transparent),
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
                              height: 10 * height,
                            ),

                            Container(
                              height: 8.8 * height,
                              width: 85.3 * width1,
                              child: ProgressButton(
                                child: Text(
                                  "REGISTER",
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
                                    await usersignup(controller);
                                  }
                                },
                                color: Colors.black,
                              ),
                            ),
                            //  Login Button Code Ends Here

                            SizedBox(
                              height: 4.4 * height,
                            ),

                            Container(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    "Already have an account? ",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontFamily: "Montserrat-Regular"),
                                  ),
                                  InkWell(
                                    child: Text(
                                      "Signin",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                          fontFamily: "Montserrat-Regular"),
                                    ),
                                    onTap: () {
                                      setState(() {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    UserLogin()));
                                      });
                                    },
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
