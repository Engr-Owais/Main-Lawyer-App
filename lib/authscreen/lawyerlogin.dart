import 'package:flutter/material.dart';
import 'package:lawyer_app/authscreen/lawyersignup.dart';
import 'package:lawyer_app/models/lawyer_authmodel/login.dart';
import 'package:progress_indicator_button/progress_button.dart';

class LawyerLogin extends StatefulWidget {
  @override
  _LawyerLoginState createState() => _LawyerLoginState();
}

class _LawyerLoginState extends State<LawyerLogin> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  TextEditingController passwordController = new TextEditingController();
  TextEditingController emailController = new TextEditingController();
  Future httpJob(AnimationController controller) async {
    controller.forward();
    print("delay start");
    Login(context, emailController.text, passwordController.text);
    await Future.delayed(Duration(seconds: 3), () {});
    print("delay stop");
    controller.reset();
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
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: 14.7 * height,
                  ),
                  Container(
                    child: Text(
                      "Lawyer Login",
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
                                controller: emailController,
                                keyboardType: TextInputType.emailAddress,
                                validator: (value) {
                                  if (value.isEmpty || !value.contains('@')) {
                                    return 'invalid email';
                                  }
                                  return null;
                                },
                                onSaved: (value) {},
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
                                controller: passwordController,
                                obscureText: true,
                                validator: (value) {
                                  if (value.isEmpty || value.length <= 5) {
                                    return 'invalid Password';
                                  }
                                  return null;
                                },
                                onSaved: (value) {},
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
                                      // loginup();
                                      await httpJob(controller);
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
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      LawyerSignup()));
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
          )
        ],
      ),
    );
  }
}
