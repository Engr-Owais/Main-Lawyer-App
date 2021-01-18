import 'package:flutter/material.dart';
import '../userdrawerscreen.dart';
import 'package:lawyer_app/search/detailsearch.dart';

class Dash_Request extends StatefulWidget {
  @override
  _Dash_RequestState createState() => _Dash_RequestState();
}

class _Dash_RequestState extends State<Dash_Request> {
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
  final List<String> categories = [
    "Categories",
    "Criminal",
    "labour",
    "family",
    "Human right",
    "Devorce",
    "Private"
  ];
  final List<String> qualifications = [
    "Qualification",
    "LLM",
    "LLB",
    "MLA",
    "MBA"
  ];
  final List<String> practices = ["kolkata", "Mumbai", "Delhi", "karachi"];

  String state = "State";
  String city = "City";
  String near = "Nearby";
  String cat = "Categories";
  String qualification = "Qualification";
  String other = "Other";
  String practice = "kolkata";

  final GlobalKey<FormState> _formKey = GlobalKey();
  TextEditingController _nearbyController = new TextEditingController();
  TextEditingController _otherController = new TextEditingController();

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
              child: Text("Enter Your Requirement")),
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
                  height: 92 * height,
                  width: 85.3 * width1,
                  color: Colors.transparent,
                  padding: EdgeInsets.all(15),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: <Widget>[
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
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: 'Nearby',
                            labelStyle: TextStyle(
                              color: Color(0xff6762F1),
                              fontSize: 14,
                              fontFamily: "Montserrat-Regular",
                              fontStyle: FontStyle.normal,
                            ),
                          ),
                          controller: _nearbyController,
                          keyboardType: TextInputType.text,
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Please Enter Your Nearby Location';
                            }
                            return null;
                          },
                          onSaved: (value) {},
                        ), // Nearby
                        SizedBox(
                          height: 3 * height,
                        ),
                        Container(
                          child: DropdownButton(
                            hint: Text(
                              "",
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
                            value: cat,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontFamily: "Montserrat-Regular"),
                            items: categories.map((value) {
                              return DropdownMenuItem(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                            onChanged: (value) {
                              setState(() {
                                cat = value;
                              });
                            },
                          ),
                        ), //category
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
                        ), //qualification
                        SizedBox(
                          height: 3 * height,
                        ),
                        Container(
                          child: DropdownButton(
                            hint: Text(
                              "Service/Practice area",
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
                            value: practice,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontFamily: "Montserrat-Regular"),
                            items: practices.map((value) {
                              return DropdownMenuItem(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                            onChanged: (value) {
                              setState(() {
                                practice = value;
                              });
                            },
                          ),
                        ), //service
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
                              "SEARCH",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                  fontFamily: "Montserrat-Bold",
                                  letterSpacing: 1),
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50),
                            ),
                            onPressed: () {
                              if (_formKey.currentState.validate()) {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            DetailSearch(cat, qualification)));
                              }
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
