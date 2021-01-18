import 'package:flutter/material.dart';
import 'package:lawyer_app/ChatScreens/chat/chatscreen.dart';
import 'package:lawyer_app/models/userpost/fetchusers.dart';
import '../userdrawerscreen.dart';

class RequestScreen extends StatefulWidget {
  @override
  _RequestScreenState createState() => _RequestScreenState();
}

class _RequestScreenState extends State<RequestScreen> {
  String email;
  Future myFuture;

  @override
  void initState() {
    myFuture = FetchReq(context);
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
              child: Text("Request")),
          backgroundColor: Color(0xff6762F1),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(20),
                bottomLeft: Radius.circular(20)),
          ),
        ),
      ),
      body: FutureBuilder(
          future: myFuture,
          builder: (context, AsyncSnapshot snapshot) {
            if (!snapshot.hasData) {
              return Center(child: CircularProgressIndicator());
            } else {
              print(snapshot.data.toString());
              return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      padding: EdgeInsets.all(10),
                      color: Colors.white,
                      child: Column(
                        children: <Widget>[
                          Container(
                            height: 28 * height, //180
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
                                      Text(
                                        '${snapshot.data[index].title}',
                                        // add[index].title,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 16,
                                            fontFamily: "Montserrat-Bold",
                                            fontWeight: FontWeight.bold,
                                            letterSpacing: 0.8),
                                      ),
                                      SizedBox(
                                        height: 0.7 * height,
                                      ),
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text(
                                            "City",
                                            style: TextStyle(
                                                color: Color(0xff6762F1),
                                                fontSize: 14,
                                                fontFamily:
                                                    "Montserrat-Regular",
                                                fontWeight: FontWeight.bold,
                                                letterSpacing: 0.8),
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(left: 5),
                                            child: Text(
                                              '${snapshot.data[index].city}',
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 14,
                                                  fontFamily: "Montserrat-Bold",
                                                  fontWeight: FontWeight.bold,
                                                  letterSpacing: 1),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 0.7 * height,
                                      ),
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text(
                                            "Purpose",
                                            style: TextStyle(
                                                color: Color(0xff6762F1),
                                                fontSize: 14,
                                                fontFamily:
                                                    "Montserrat-Regular",
                                                fontWeight: FontWeight.bold,
                                                letterSpacing: 0.8),
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(left: 5),
                                            child: Text(
                                              '${snapshot.data[index].purpose}',
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 14,
                                                  fontFamily: "Montserrat-Bold",
                                                  fontWeight: FontWeight.bold,
                                                  letterSpacing: 1),
                                            ),
                                          ),
                                        ],
                                      ),
                                      InkWell(
                                        onTap: () {
                                          setState(() {});
                                        },
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: <Widget>[
                                            Icon(
                                              Icons.arrow_forward_ios,
                                              size: 18,
                                            )
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 0.7 * height,
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 5),
                                        child: Text(
                                          '${snapshot.data[index].other}',
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
                          ),
                        ],
                      ),
                    );
                  });
            }
          }),
    );
  }
}
