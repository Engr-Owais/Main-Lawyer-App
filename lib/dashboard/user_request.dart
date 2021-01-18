import 'package:flutter/material.dart';
import 'package:lawyer_app/Request/request_screen.dart';
import '../models/userpost/userpost.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../userdrawerscreen.dart';

class User_Request extends StatefulWidget {
  @override
  _User_RequestState createState() => _User_RequestState();
}

class _User_RequestState extends State<User_Request> {
  final List<String> states = [
    "State",
    "America",
    "England",
    "Pakistan",
    "India"
  ];
  final List<String> cities = [
    "City",
    "Newyork",
    "Karachi",
    "Mumbai",
    "Chitagong"
  ];
  final List<String> purpose = [
    "Criminal Lawyer",
    "Family Lawyer",
    "Private Lawyer",
    "Devorce Lawyer",
    "HumanRight Lawyer",
    "Laybour Lawyer"
  ];
  final List<String> categories = [
    "Category",
    "Criminal Lawyer",
    "Judge",
    "H.R Lawyer",
    "Labour Lawyer"
  ];
  final List<String> qualifications = [
    "Qualification",
    "LLM",
    "LLB",
    "MLA",
    "MBA"
  ];
  String state;
  String cat;
  String qualification;
  String pur;
  String city;
  String email;

  final GlobalKey<FormState> _formKey = GlobalKey();
  TextEditingController _titleController = new TextEditingController();
  TextEditingController _otherController = new TextEditingController();
  void initState() {
    // TODO: implement initState
    super.initState();
    getPreference();
  }

  void getPreference() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      email = sharedPreferences.getString("useremail");
    });
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height / 100;
    var width1 = MediaQuery.of(context).size.width / 100;
    return Scaffold(
      drawer: DrawerScreen(),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70),
        child: AppBar(
          title: Container(
              padding: EdgeInsets.only(top: 5, right: 5),
              child: Text("Post a Request")),
          backgroundColor: Color(0xff6762F1),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(20),
                bottomLeft: Radius.circular(20)),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.all(25),
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Center(
                child: Container(
                  height: 82 * height,
                  width: 85.3 * width1,
                  color: Colors.transparent,
                  padding: EdgeInsets.all(15),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: <Widget>[
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: 'Title',
                            labelStyle: TextStyle(
                              color: Color(0xff6762F1),
                              fontSize: 14,
                              fontFamily: "Montserrat-Regular",
                              fontStyle: FontStyle.normal,
                            ),
                          ),
                          controller: _titleController,
                          keyboardType: TextInputType.text,
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Please Enter Your Title';
                            }
                            return null;
                          },
                          onSaved: (value) {},
                        ),
                        SizedBox(
                          height: 3 * height,
                        ),
                        Container(
                          child: DropdownButton(
                            hint: Text(
                              "State",
                              style: TextStyle(
                                color: Color(0xff6762F1),
                                fontSize: 14,
                                fontFamily: "Montserrat-Regular",
                                fontStyle: FontStyle.normal,
                              ),
                            ),
                            dropdownColor: Colors.white,
                            icon: Icon(Icons.arrow_drop_down),
                            iconSize: 36,
                            isExpanded: true,
                            value: state,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontFamily: "Montserrat-Regular"),
                            items: states.map((value) {
                              return DropdownMenuItem(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                            onChanged: (value) {
                              setState(() {
                                state = value;
                              });
                            },
                          ),
                        ),
                        SizedBox(
                          height: 3 * height,
                        ),
                        Container(
                          child: DropdownButton(
                            hint: Text(
                              "City",
                              style: TextStyle(
                                color: Color(0xff6762F1),
                                fontSize: 14,
                                fontFamily: "Montserrat-Regular",
                                fontStyle: FontStyle.normal,
                              ),
                            ),
                            dropdownColor: Colors.white,
                            icon: Icon(Icons.arrow_drop_down),
                            iconSize: 36,
                            isExpanded: true,
                            value: city,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontFamily: "Montserrat-Regular"),
                            items: cities.map((value) {
                              return DropdownMenuItem(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                            onChanged: (value) {
                              setState(() {
                                city = value;
                              });
                            },
                          ),
                        ),
                        SizedBox(
                          height: 3 * height,
                        ),
                        Container(
                          child: DropdownButton(
                            hint: Text(
                              "Purpose",
                              style: TextStyle(
                                color: Color(0xff6762F1),
                                fontSize: 14,
                                fontFamily: "Montserrat-Regular",
                                fontStyle: FontStyle.normal,
                              ),
                            ),
                            dropdownColor: Colors.white,
                            icon: Icon(Icons.arrow_drop_down),
                            iconSize: 36,
                            isExpanded: true,
                            value: pur,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontFamily: "Montserrat-Regular"),
                            items: purpose.map((value) {
                              return DropdownMenuItem(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                            onChanged: (value) {
                              setState(() {
                                pur = value;
                              });
                            },
                          ),
                        ),
                        SizedBox(
                          height: 3 * height,
                        ),
                        Container(
                          child: DropdownButton(
                            hint: Text(
                              "Qualification",
                              style: TextStyle(
                                color: Color(0xff6762F1),
                                fontSize: 14,
                                fontFamily: "Montserrat-Regular",
                                fontStyle: FontStyle.normal,
                              ),
                            ),
                            dropdownColor: Colors.white,
                            icon: Icon(Icons.arrow_drop_down),
                            iconSize: 36,
                            isExpanded: true,
                            value: qualification,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontFamily: "Montserrat-Regular"),
                            items: qualifications.map((value) {
                              return DropdownMenuItem(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                            onChanged: (value) {
                              setState(() {
                                qualification = value;
                              });
                            },
                          ),
                        ),
                        SizedBox(
                          height: 3 * height,
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: 'Other',
                            labelStyle: TextStyle(
                              color: Color(0xff6762F1),
                              fontSize: 14,
                              fontFamily: "Montserrat-Regular",
                              fontStyle: FontStyle.normal,
                            ),
                          ),
                          controller: _otherController,
                          keyboardType: TextInputType.text,
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Please Enter Your Title';
                            }
                            return null;
                          },
                          onSaved: (value) {},
                        ),
                        SizedBox(
                          height: 8 * height,
                        ),
                        Container(
                          height: 8 * height,
                          width: 82 * width1,
                          child: FlatButton(
                            child: Text(
                              "SUBMIT",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                  fontFamily: "Montserrat-Bold"),
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50),
                            ),
                            onPressed: () async {
                              await PostReq(
                                context,
                                _titleController.text,
                                state.toString(),
                                city.toString(),
                                pur.toString(),
                                qualification.toString(),
                                _otherController.text,
                                email.toString(),
                              );
                            },
                            color: Colors.black,
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
    );
  }
}
