import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:lawyer_app/models/privacy_policy.dart';
import '../userdrawerscreen.dart';

class PrivacyPolicy extends StatefulWidget {
  @override
  _PrivacyPolicyState createState() => _PrivacyPolicyState();
}

class _PrivacyPolicyState extends State<PrivacyPolicy> {
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
              child: Text("Privacy Policy")),
          backgroundColor: Color(0xff6762F1),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(20),
                bottomLeft: Radius.circular(20)),
          ),
        ),
      ),
      body: FutureBuilder(
          future: privacyPolicy(),
          builder: (context, AsyncSnapshot snapshot) {
            if (!snapshot.hasData) {
              return Center(child: CircularProgressIndicator());
            } else {
              print(snapshot.data.toString());
              return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      width: double.infinity,
                      color: Colors.white,
                      child: Column(
                        // crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            width: 100 * width1, // 380
                            height: 40 * height, // 155
                            child: FadeInImage.assetNetwork(
                              placeholder: 'assets/256x256.gif',
                              image: snapshot.data[index].image.toString(),
                            ),
                          ),
                          SizedBox(
                            height: 1.4 * height,
                          ),
                          Container(
                            padding: EdgeInsets.all(10),
                            // width: 100 * width1, // 380
                            // height: 38 * height, // 155
                            child: Row(
                              children: [
                                Text(
                                  '${snapshot.data[index].title}',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w700,
                                      fontFamily: "Montserrat-Bold"),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(10),
                            // width: 100 * width1, // 380
                            // height: 38 * height, // 155
                            child: Column(
                              children: [
                                Text(
                                  '${snapshot.data[index].description}',
                                  style: TextStyle(
                                      color: Colors.grey[600],
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700,
                                      fontFamily: "Montserrat-Regular"),
                                ),
                              ],
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
