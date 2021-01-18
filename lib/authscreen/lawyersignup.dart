import 'package:flutter/material.dart';
import 'package:lawyer_app/models/lawyer_authmodel/Signup.dart';
import 'lawyerlogin.dart';
import 'package:progress_indicator_button/progress_button.dart';

class LawyerSignup extends StatefulWidget {
  @override
  _LawyerSignupState createState() => _LawyerSignupState();
}

class _LawyerSignupState extends State<LawyerSignup> {
  String selectedCase = "Total case solved";
  String selectLaywer = "Criminal";
  final List<String> cases = ["Total case solved", "1", "2", "3", "4"];
  final List<String> cat = [
    "Criminal",
    "labour",
    "family",
    "Human right",
    "Devorce",
    "Private"
  ];
  String Name;
  void signup(AnimationController controller) async {
    controller.forward();
    print("delay start");
    Signup(
      context,
      nameController.text,
      emailController.text,
      qualificationController.text,
      passwordController.text.toString(),
      experienceController.text.toString(),
      feeController.text.toString(),
      selectedCase.toString(),
      selectLaywer.toString(),
    );
    await Future.delayed(Duration(seconds: 3), () {});
    print("delay stop");
    controller.reset();
  }

  final GlobalKey<FormState> _formKey = GlobalKey();
  TextEditingController emailController = new TextEditingController();
  TextEditingController nameController = new TextEditingController();
  TextEditingController qualificationController = new TextEditingController();
  TextEditingController experienceController = new TextEditingController();
  TextEditingController feeController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();

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
                    height: 8 * height,
                  ),
                  Container(
                    height: 7.3 * height,
                    child: Text(
                      "Lawyer Signup",
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
                              controller: nameController,
                              keyboardType: TextInputType.text,
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'Please Enter Your Name';
                                }
                                return null;
                              },
                              onSaved: (value) {
                                Name = value;
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
                              height: 2 * height,
                            ),

                            // Qualification Text Field
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
                                  prefixIcon: Icon(Icons.book),
                                  hintText: "Qualification",
                                  hintStyle: TextStyle(
                                    fontFamily: "Montserrat-Regular",
                                    fontStyle: FontStyle.normal,
                                    fontSize: 16,
                                  ),
                                  filled: true,
                                  fillColor: Colors.grey[200]),
                              controller: qualificationController,
                              keyboardType: TextInputType.text,
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'Please Enter Your Qualification';
                                }
                                return null;
                              },
                              onSaved: (value) {
                                Name = value;
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
                              controller: passwordController,
                              validator: (value) {
                                if (value.isEmpty || value.length <= 5) {
                                  return 'invalid Password';
                                }
                                return null;
                              },
                              onSaved: (value) {},
                            ),

                            SizedBox(
                              height: 2 * height,
                            ),

                            // Experience Text Field
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
                                  prefixIcon: Icon(Icons.work),
                                  hintText: "Experience",
                                  hintStyle: TextStyle(
                                    fontFamily: "Montserrat-Regular",
                                    fontStyle: FontStyle.normal,
                                    fontSize: 16,
                                  ),
                                  filled: true,
                                  fillColor: Colors.grey[200]),
                              controller: experienceController,
                              keyboardType: TextInputType.text,
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'Please Enter Your Experience';
                                }
                                return null;
                              },
                              onSaved: (value) {
                                Name = value;
                              },
                            ),

                            SizedBox(
                              height: 2 * height,
                            ),

                            // Fees Text Field
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
                                  prefixIcon: Icon(Icons.attach_money),
                                  hintText: "Fee",
                                  hintStyle: TextStyle(
                                    fontFamily: "Montserrat-Regular",
                                    fontStyle: FontStyle.normal,
                                    fontSize: 16,
                                  ),
                                  filled: true,
                                  fillColor: Colors.grey[200]),
                              controller: feeController,
                              keyboardType: TextInputType.number,
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'Please Enter Your Fee';
                                }
                                return null;
                              },
                              onSaved: (value) {
                                Name = value;
                              },
                            ),

                            SizedBox(
                              height: 2 * height,
                            ),

                            Container(
                              height: 8.8 * height,
                              width: 85.3 * width1,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: Colors.grey[200],
                              ),
                              padding:
                                  EdgeInsets.only(left: 20, right: 20, top: 6),
                              child: DropdownButton<String>(
                                dropdownColor: Colors.grey[200],
                                icon: Icon(Icons.arrow_drop_down),
                                iconSize: 36,
                                // elevation: 50,
                                isExpanded: true,
                                // focusColor: Colors.grey[200],
                                value: selectedCase,
                                onChanged: (value) {
                                  setState(() {
                                    selectedCase = value;
                                  });
                                },
                                items: cases
                                    .map<DropdownMenuItem<String>>((value) {
                                  return DropdownMenuItem(
                                    child: Text(
                                      value,
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.grey[600],
                                          fontFamily: "Montserrat-Regular"),
                                    ),
                                    value: value,
                                  );
                                }).toList(),
                              ),
                            ),
                            SizedBox(
                              height: 2 * height,
                            ),

                            Container(
                              height: 8.8 * height,
                              width: 85.3 * width1,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: Colors.grey[200],
                              ),
                              padding:
                                  EdgeInsets.only(left: 20, right: 20, top: 6),
                              child: DropdownButton<String>(
                                dropdownColor: Colors.grey[200],
                                icon: Icon(Icons.arrow_drop_down),
                                iconSize: 36,
                                // elevation: 50,
                                isExpanded: true,
                                // focusColor: Colors.grey[200],
                                value: selectLaywer,
                                onChanged: (value) {
                                  setState(() {
                                    selectLaywer = value;
                                  });
                                },
                                items:
                                    cat.map<DropdownMenuItem<String>>((value) {
                                  return DropdownMenuItem(
                                    child: Text(
                                      value,
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.grey[600],
                                          fontFamily: "Montserrat-Regular"),
                                    ),
                                    value: value,
                                  );
                                }).toList(),
                              ),
                            ),
                            //  Login Button Code Starts From Here
                            SizedBox(
                              height: 8 * height,
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
                                    await signup(controller);
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
                                                    LawyerLogin()));
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

  // Future<Map<String, dynamic>> Sign_up() async {
  //   String url = 'http://10xwebsolutions.com/lawyer/api/_lawyer_signup.php';
  //   final Map<String, dynamic> registrationData = {
  //     'submit': 1,
  //     'fullname': nameController.text,
  //     'email': emailController.text,
  //     'qualification': qualificationController.text,
  //     'password': passwordController.text.toString(),
  //     'experience': experienceController.text.toString(),
  //     'fees': feeController.text.toString(),
  //     'case_solved': selectedCase.toString(),
  //   };

  //   print(registrationData.toString());
  //   final response = await http.post(url,
  //       body: jsonEncode(registrationData),
  //       headers: {'content-type': 'application/json'});
  //   print(response.body.toString());
  //   final Map<String, dynamic> responseData = json.decode(response.body);
  //   print(responseData.toString());
  //   if (responseData['status'] == "true") {
  //     Fluttertoast.showToast(
  //         msg: "Signup Successfully",
  //         timeInSecForIosWeb: 1,
  //         backgroundColor: Colors.black,
  //         textColor: Colors.white,
  //         fontSize: 16.0);
  //     Navigator.of(context).pushReplacement(
  //         MaterialPageRoute(builder: (BuildContext context) => LawyerLogin()));
  //   }

  //   if (responseData['status'] == "false" ||
  //       responseData['message'] ==
  //           "Email is Already Associate with another account!") {
  //     Fluttertoast.showToast(
  //         msg: "Email Already Registered",
  //         timeInSecForIosWeb: 1,
  //         backgroundColor: Colors.black,
  //         textColor: Colors.white,
  //         fontSize: 16.0);
  //   }
  // }
}
