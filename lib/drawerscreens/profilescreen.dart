import 'package:flutter/material.dart';
import 'package:lawyer_app/lawyerdrawer.dart';


class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool isSwitched = false;
  final GlobalKey<FormState> _formKey = GlobalKey();
  TextEditingController _passwordController = new TextEditingController();
  TextEditingController _nameController = new TextEditingController();
  TextEditingController _qualificationController = new TextEditingController();
  TextEditingController _experienceController = new TextEditingController();
  TextEditingController _feeController = new TextEditingController();


  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height / 100;
    var width1 = MediaQuery.of(context).size.width / 100;

    return Scaffold(
      drawer: LawyerDrawer(),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70),

        child: AppBar(

          title: Container(
              padding: EdgeInsets.only(top: 5, right: 5),
              child: Text("Profile")
          ),
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
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20)),
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
                  onTap: (){
                    setState(() {

                    });
                  },
                  child: Container(
                    width: 100,
                    height: 100,

                    decoration: BoxDecoration(
                      color: Colors.white,
                      image: new DecorationImage(
                        image: AssetImage('assets/user1.png'),
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
            Text("Yuliya Dumanska", style: TextStyle(color: Colors.black, fontSize: 16, fontFamily: "Montserrat-Regular"),),
            Text("yuliya@example.com", style: TextStyle(color: Colors.black, fontSize: 14, fontFamily: "Montserrat-Regular"),),
          ],
        ),
        SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 22.0 * height,
              ),
              Container(
                padding: EdgeInsets.all(25),
                width: double.infinity,
                height: 66.1 * height,
                color: Colors.white,
                child: Form(
                  key: _formKey,
                  child: SingleChildScrollView(
                    child: Column(

                      children: <Widget>[

                        TextFormField(
                          decoration: InputDecoration(
                              labelText: 'User name',
                            labelStyle: TextStyle(
                              color: Color(0xff6762F1),
                              fontSize: 14,
                              fontFamily: "Montserrat-Regular",
                              fontStyle: FontStyle.normal,
                            ),
                          ),
                          controller: _nameController,
                          keyboardType: TextInputType.text,

                          validator: (value){
                            if (value.isEmpty)
                            {
                              return 'Please Enter Your Name';
                            }
                            return null;
                          },
                          onSaved: (value){
                          },
                        ),
                        SizedBox(height: 1.4 * height,),
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: 'Qualification',
                            labelStyle: TextStyle(
                              color: Color(0xff6762F1),
                              fontSize: 14,
                              fontFamily: "Montserrat-Regular",
                              fontStyle: FontStyle.normal,
                            ),
                          ),
                          controller: _qualificationController,
                          keyboardType: TextInputType.text,

                          validator: (value){
                            if (value.isEmpty)
                            {
                              return 'Please Enter Your Qualification';
                            }
                            return null;
                          },
                          onSaved: (value){
                          },
                        ),
                        SizedBox(height: 1.4 * height,),
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: 'Experience',
                            labelStyle: TextStyle(
                              color: Color(0xff6762F1),
                              fontSize: 14,
                              fontFamily: "Montserrat-Regular",
                              fontStyle: FontStyle.normal,
                            ),
                          ),
                          keyboardType: TextInputType.text,
                          controller: _experienceController,

                          validator: (value){
                            if (value.isEmpty)
                            {
                              return 'Please Enter Your Experience';
                            }
                            return null;
                          },
                          onSaved: (value){
                          },
                        ),
                        SizedBox(height: 1.4 * height,),
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: 'Fee',
                            hintText: ("(Per Appointment)"),
                            hintStyle: TextStyle(
                              color: Colors.grey,
                              fontFamily: "Montserrat-Regular",
                            ),
                            labelStyle: TextStyle(
                              color: Color(0xff6762F1),
                              fontSize: 14,
                              fontFamily: "Montserrat-Regular",
                              fontStyle: FontStyle.normal,
                            ),
                          ),
                          keyboardType: TextInputType.number,
                          controller: _feeController,

                          validator: (value){
                            if (value.isEmpty)
                            {
                              return 'Please Enter Your Fee';
                            }
                            return null;
                          },
                          onSaved: (value){
                          },
                        ),
                        SizedBox(height: 1.4 * height,),
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: 'Reset Password',
                            labelStyle: TextStyle(
                              color: Color(0xff6762F1),
                              fontSize: 14,
                              fontFamily: "Montserrat-Regular",
                              fontStyle: FontStyle.normal,
                            ),
                          ),
                          obscureText: true,
                          controller: _passwordController,

                          validator: (value){
                            if(value.isEmpty || value.length <= 5){
                              return 'invalid Password';
                            }
                            return null;
                          },
                          onSaved: (value){
                          },
                        ),
                        SizedBox(height: 2.2 * height,),
                        Row(
                          children: <Widget>[
                            Text("Notification", style: TextStyle(color: Colors.black, fontFamily: "Montserrat-Regular", fontSize: 16),),
                            Padding(
                              padding: const EdgeInsets.only(left: 170),

                              child: Container(
                                height: 5.8 * height,
                                width: 14.6 * width1,
                                child: Switch(
                                    value: isSwitched,
                                    onChanged: (value){
                                      setState(() {
                                        isSwitched=value;
                                        print(isSwitched);
                                      });
                                    },
                                  focusColor: Color(0xff6762F1),
                                  activeTrackColor: Color(0xff6762F1),
                                  activeColor: Colors.white,
                                ),
                              ),
                            ),


                          ],
                        ),
                        SizedBox(
                          height: 5.8 * height,
                        ),
                        Container(
                          height: 7 * height,
                          width: 70 * width1,
                          child: FlatButton(
                            child: Text("UPDATE", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14, fontFamily: "Montserrat-Bold"),),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50),
                            ),
                            onPressed: (){
                              _formKey.currentState.validate();
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


