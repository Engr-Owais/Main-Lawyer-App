import 'package:flutter/material.dart';

import 'package:lawyer_app/models/confrim_appointment/confrim_appointment.dart';
import '../userdrawerscreen.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:intl/intl.dart';

class ConfirmAppointment extends StatefulWidget {
  String lawyerid;
  ConfirmAppointment(this.lawyerid);
  @override
  _ConfirmAppointmentState createState() => _ConfirmAppointmentState();
}

class _ConfirmAppointmentState extends State<ConfirmAppointment> {
  @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   StripeService.init();
  // }

  final GlobalKey<FormState> _formKey = GlobalKey();
  TextEditingController _emailController = new TextEditingController();
  TextEditingController _numberController = new TextEditingController();
  TextEditingController _dateController = new TextEditingController();
  TextEditingController _timeController = new TextEditingController();
  TextEditingController _messageController = new TextEditingController();
  TextEditingController _nameController = new TextEditingController();
  TextEditingController _passwordController = new TextEditingController();
  DateTime selectedDate = DateTime.now();
  var formatter = new DateFormat('yyyy-MM-dd');

  Future<void> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate)
      var formatter = new DateFormat('yyyy-MM-dd');
    String formattedDate = formatter.format(picked);
    setState(() {
      selectedDate = picked;
      _dateController.text = formattedDate;
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
            child: Text("Appointment"),
          ),
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
                  height: 85.5 * height,
                  width: 85.3 * width1,
                  color: Colors.transparent,
                  padding: EdgeInsets.all(15),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: <Widget>[
                        // User Name Text Field
                        TextFormField(
                          decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(50))),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(50))),
                              prefixIcon: Icon(Icons.verified_user),
                              hintText: "Full Name",
                              hintStyle: TextStyle(
                                fontFamily: "Montserrat-Regular",
                                fontStyle: FontStyle.normal,
                                fontSize: 16,
                              ),
                              filled: true,
                              fillColor: Colors.white),
                          controller: _nameController,
                          keyboardType: TextInputType.text,
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Please Enter Your Name';
                            }
                            return null;
                          },
                          onSaved: (value) {},
                        ),

                        SizedBox(
                          height: 2 * height,
                        ),

                        //  Email Text Field
                        TextFormField(
                          decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(50))),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(50))),
                              prefixIcon: Icon(Icons.mail),
                              hintText: "Email address",
                              hintStyle: TextStyle(
                                fontFamily: "Montserrat-Regular",
                                fontStyle: FontStyle.normal,
                                fontSize: 16,
                              ),
                              filled: true,
                              fillColor: Colors.white),
                          controller: _emailController,
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

                        // Phone Number Text Field
                        TextFormField(
                          decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(50))),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(50))),
                              prefixIcon: Icon(Icons.phone),
                              hintText: "Mobile Number",
                              hintStyle: TextStyle(
                                fontFamily: "Montserrat-Regular",
                                fontStyle: FontStyle.normal,
                                fontSize: 16,
                              ),
                              filled: true,
                              fillColor: Colors.white),
                          controller: _numberController,
                          keyboardType: TextInputType.number,
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Please Enter Mobile Number';
                            }
                            return null;
                          },
                          onSaved: (value) {},
                        ),

                        SizedBox(
                          height: 2 * height,
                        ),

                        // Date Text Field
                        TextField(
                          onTap: () => _selectDate(context),
                          decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(50))),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(50))),
                              prefixIcon: Icon(Icons.calendar_today),
                              hintText: "Date",
                              hintStyle: TextStyle(
                                fontFamily: "Montserrat-Regular",
                                fontStyle: FontStyle.normal,
                                fontSize: 16,
                              ),
                              filled: true,
                              fillColor: Colors.white),
                          controller: _dateController,
                          keyboardType: TextInputType.datetime,
                        ),

                        SizedBox(
                          height: 2 * height,
                        ),

                        // Time Text Field
                        TextFormField(
                          onTap: () async {
                            TimeOfDay time = TimeOfDay.now();
                            FocusScope.of(context)
                                .requestFocus(new FocusNode());

                            TimeOfDay picked = await showTimePicker(
                              context: context,
                              initialTime: time,
                            );
                            if (picked != null && picked != time) {
                              _timeController.text = picked
                                  .format(context)
                                  .toString(); // add this line.
                              setState(() {
                                time = picked;
                              });
                            }
                          },
                          decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(50))),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(50))),
                              prefixIcon: Icon(Icons.watch_later),
                              hintText: "Time",
                              hintStyle: TextStyle(
                                fontFamily: "Montserrat-Regular",
                                fontStyle: FontStyle.normal,
                                fontSize: 16,
                              ),
                              filled: true,
                              fillColor: Colors.white),
                          controller: _timeController,
                          keyboardType: TextInputType.datetime,
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Please Enter Time';
                            }
                            return null;
                          },
                          onSaved: (value) {},
                        ),

                        SizedBox(
                          height: 2 * height,
                        ),
                        // message Text Field
                        TextFormField(
                          decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(50))),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(50))),
                              prefixIcon: Icon(Icons.message),
                              hintText: "Message",
                              hintStyle: TextStyle(
                                fontFamily: "Montserrat-Regular",
                                fontStyle: FontStyle.normal,
                                fontSize: 16,
                              ),
                              filled: true,
                              fillColor: Colors.white),
                          controller: _messageController,
                          keyboardType: TextInputType.multiline,
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Please Enter Your message';
                            }
                            return null;
                          },
                          onSaved: (value) {},
                        ),

                        //  BOOK NOW Button Code Starts From Here
                        SizedBox(
                          height: 5.5 * height,
                        ),

                        Container(
                          height: 8.8 * height,
                          width: 85.3 * width1,
                          child: FlatButton(
                            child: Text(
                              "BOOK NOW",
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
                              if (_formKey.currentState.validate()) {
                                confrimAppointment(
                                    widget.lawyerid,
                                    _nameController.text,
                                    _emailController.text.toString(),
                                    _numberController.text.toString(),
                                    _dateController.text.toString(),
                                    context,
                                    _timeController.text.toString(),
                                    _messageController.text.toString());
                                // print(_timeController.text.toString());
                                // Navigator.pushReplacement(
                                //     context,
                                //     MaterialPageRoute(
                                //         builder: (context) =>
                                //             AppointmentDetailForm()));
                                // // _formKey.currentState.validate();
                              }
                            },
                            color: Colors.black,
                          ),
                        ),
                        //  Login Button Code Ends Here
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
