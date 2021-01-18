import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:lawyer_app/models/fetchuserappointment.dart';

class CancelledScreen extends StatefulWidget {
  String email;
  CancelledScreen(this.email);
  @override
  _CancelledScreenState createState() => _CancelledScreenState();
}

class _CancelledScreenState extends State<CancelledScreen> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height / 100;
    var width1 = MediaQuery.of(context).size.width / 100;

    return Scaffold(
      body: FutureBuilder(
          future: fetchcancelAppointmentByemail(widget.email),
          builder: (context, AsyncSnapshot snapshot) {
            if (!snapshot.hasData) {
              return SizedBox(
                height: 500,
                child: Center(
                    child: SpinKitFadingCircle(
                  color: Theme.of(context).accentColor,
                  size: 50.0,
                )),
              );
            }
            if (snapshot.data.isEmpty)
              return SizedBox(
                height: 500,
                child: Center(child: Text('No Data Found')),
              );
            else {
              return ListView.builder(
                  shrinkWrap: true,
                  itemCount: snapshot.data.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      padding: EdgeInsets.all(10),
                      color: Colors.white,
                      child: Column(
                        children: <Widget>[
                          Container(
                            height: 24 * height, //180
                            width: 100 * width1, // 200
                            padding: EdgeInsets.all(5),

                            child: InkWell(
                              onTap: () {
                                setState(() {});
                              },
                              child: Card(
                                elevation: 5,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                                color: Colors.white,
                                child: Padding(
                                  padding: const EdgeInsets.all(20),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Text(
                                            '${snapshot.data[index].heading}',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 16,
                                                fontFamily: "Montserrat-Bold",
                                                fontWeight: FontWeight.bold,
                                                letterSpacing: 0.8),
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(left: 80),
                                            child: Text(
                                              '${snapshot.data[index].date}',
                                              style: TextStyle(
                                                  color: Color(0xff6762F1),
                                                  fontSize: 14,
                                                  fontFamily:
                                                      "Montserrat-Regular",
                                                  fontWeight: FontWeight.bold,
                                                  letterSpacing: 1),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 0.7 * height,
                                      ),
                                      Text(
                                        '${snapshot.data[index].cat}',
                                        style: TextStyle(
                                            color: Colors.grey[700],
                                            fontSize: 16,
                                            fontFamily: "Montserrat-Regular",
                                            fontWeight: FontWeight.normal,
                                            letterSpacing: 1),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 10),
                                        child: Text(
                                          '${snapshot.data[index].message}',
                                          style: TextStyle(
                                              fontFamily: "Montserrat-Regular",
                                              fontWeight: FontWeight.normal),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ), //1
                          //4
                        ],
                      ),
                    );
                  });
            }
          }),
    );
  }
}
