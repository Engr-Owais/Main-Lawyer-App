import 'package:flutter/material.dart';
import 'package:lawyer_app/models/user_updateProfile/userupdateprofile.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../userdrawerscreen.dart';

class UserProfile extends StatefulWidget {
  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  String email;
  String username;
  String imgurl;
  TextEditingController _oldpasswordController = new TextEditingController();
  TextEditingController _emailcontroller = TextEditingController();
  TextEditingController _oldemailcontroller = TextEditingController();
  TextEditingController _phoneNumber = TextEditingController();
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

    return Scaffold(
      drawer: DrawerScreen(),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70),
        child: AppBar(
          title: Container(
              padding: EdgeInsets.only(top: 5, right: 5),
              child: Text("Profile")),
          elevation: 0,
          backgroundColor: Color(0xff6762F1),
          shape: RoundedRectangleBorder(
              // borderRadius: BorderRadius.only(bottomRight:, bottomLeft: Radius.circular(20)),
              ),
        ),
      ),
      body: Stack(children: [
        Container(
          height: 7.3 * height,
          // color: Colors.red,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20)),
            color: Color(0xff6762F1),
          ),
          // decoration:
        ),
        Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    setState(() {});
                  },
                  child: Container(
                    width: 26.3 * width1,
                    height: 15.7 * height,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      image: new DecorationImage(
                        image: NetworkImage(imgurl),
                        fit: BoxFit.cover,
                      ),
                      borderRadius:
                          new BorderRadius.all(new Radius.circular(100.0)),
                      border: new Border.all(
                        color: Colors.transparent,
                        // Color(0xff6762F1),
                        width: 0.4 * width1,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 0.7 * height,
            ),
            Text(
              username,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontFamily: "Montserrat-Regular"),
            ),
            SizedBox(
              height: 0.2 * height,
            ),
            Text(
              email,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontFamily: "Montserrat-Regular"),
            ),
          ],
        ),
        SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 22.0 * height,
              ),
              Container(
                padding: EdgeInsets.all(20),
                width: double.infinity,
                height: 64 * height,
                color: Colors.white,
                child: Form(
                  key: _formKey,
                  child: SingleChildScrollView(
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: 3 * height,
                        ),
                        TextFormField(
                          controller: _oldemailcontroller,
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
                              hintText: "Old Email address",
                              hintStyle: TextStyle(
                                fontFamily: "Montserrat-Regular",
                                fontStyle: FontStyle.normal,
                                fontSize: 16,
                              ),
                              filled: true,
                              fillColor: Colors.white),
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
                        TextFormField(
                          controller: _emailcontroller,
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
                              hintText: " New Email address",
                              hintStyle: TextStyle(
                                fontFamily: "Montserrat-Regular",
                                fontStyle: FontStyle.normal,
                                fontSize: 16,
                              ),
                              filled: true,
                              fillColor: Colors.white),
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
                        TextFormField(
                          controller: _phoneNumber,
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
                              hintText: "Phone Number",
                              hintStyle: TextStyle(
                                fontFamily: "Montserrat-Regular",
                                fontStyle: FontStyle.normal,
                                fontSize: 16,
                              ),
                              filled: true,
                              fillColor: Colors.white),
                          keyboardType: TextInputType.number,
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Please Enter Phone Number';
                            }
                            return null;
                          },
                          onSaved: (value) {},
                        ),
                        SizedBox(
                          height: 3 * height,
                        ),
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
                              prefixIcon: Icon(Icons.lock),
                              hintText: "Old Password",
                              hintStyle: TextStyle(
                                fontFamily: "Montserrat-Regular",
                                fontStyle: FontStyle.normal,
                                fontSize: 16,
                              ),
                              filled: true,
                              fillColor: Colors.white),
                          obscureText: true,
                          controller: _oldpasswordController,
                          validator: (value) {
                            if (value.isEmpty || value.length <= 5) {
                              return 'invalid Old Password';
                            }
                            return null;
                          },
                          onSaved: (value) {},
                        ),
                        SizedBox(
                          height: 8 * height,
                        ),
                        Container(
                          child: InkWell(
                            child: Text(
                              "Change Password?",
                              style: TextStyle(
                                  color: Color(0xff6762F1),
                                  fontSize: 14,
                                  fontFamily: "Montserrat-Regular"),
                            ),
                            onTap: () {
                              setState(() {});
                            },
                          ),
                        ),
                        SizedBox(
                          height: 3 * height,
                        ),
                        Container(
                          height: 8 * height,
                          width: 85.3 * width1,
                          child: FlatButton(
                            child: Text(
                              "UPDATE",
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
                              userUpdate(
                                  _oldemailcontroller.text.toString(),
                                  _emailcontroller.text.toString(),
                                  _phoneNumber.text.toString(),
                                  _oldpasswordController.text.toString());
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
      ]),
    );
  }
}
