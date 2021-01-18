import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lawyer_app/appointment/askquestion.dart';

class ChatDetailPageAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: Size.fromHeight(70),
      child: AppBar(
        leading: InkWell(
          onTap: () {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => AskQuestion()));
          },
          child: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        title: Row(
          children: <Widget>[
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: AssetImage("assets/user.png"), fit: BoxFit.cover)),
            ),
            SizedBox(
              width: 4.8 * MediaQuery.of(context).size.width / 100,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Yuliya Dumanska",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontFamily: "Montserrat-Regular",
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 0.7 * MediaQuery.of(context).size.height / 100,
                ),
                Text(
                  "Active now",
                  style: TextStyle(
                    fontSize: 14,
                    fontFamily: "Montserrat-Regular",
                    color: Colors.grey[200],
                  ),
                ),
              ],
            ),
          ],
        ),
        actions: <Widget>[
          InkWell(
              onTap: () {},
              child: Icon(
                Icons.phone,
                color: Colors.white,
                size: 30,
              )),
          SizedBox(
            width: 2.4 * MediaQuery.of(context).size.width / 100,
          ),
          InkWell(
              onTap: () {},
              child: Icon(
                Icons.videocam,
                color: Colors.white,
                size: 30,
              )),
          SizedBox(
            width: 2.4 * MediaQuery.of(context).size.width / 100,
          ),
          InkWell(
              onTap: () {},
              child: Icon(
                Icons.more_vert,
                color: Colors.white,
                size: 30,
              )),
          SizedBox(
            width: 2.4 * MediaQuery.of(context).size.width / 100,
          ),
        ],
        elevation: 0,
        backgroundColor: Color(0xff6762F1),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(20),
              bottomLeft: Radius.circular(20)),
        ),
      ),
    );
    // return AppBar(
    //   elevation: 0,
    //   automaticallyImplyLeading: false,
    //   backgroundColor: Colors.white,
    //   flexibleSpace: SafeArea(
    //     child: Container(
    //       padding: EdgeInsets.only(right: 16),
    //       child: Row(
    //         children: <Widget>[
    //           IconButton(
    //             onPressed: () {
    //               Navigator.pop(context);
    //             },
    //             icon: Icon(
    //               Icons.arrow_back,
    //               color: Colors.black,
    //             ),
    //           ),
    //           SizedBox(
    //             width: 2,
    //           ),
    //           CircleAvatar(
    //             backgroundImage: AssetImage("assets/user.png"),
    //             maxRadius: 20,
    //           ),
    //           SizedBox(
    //             width: 12,
    //           ),
    //           Expanded(
    //             child: Column(
    //               crossAxisAlignment: CrossAxisAlignment.start,
    //               mainAxisAlignment: MainAxisAlignment.center,
    //               children: <Widget>[
    //                 Text(
    //                   "Yuliya Dumanska",
    //                   style: TextStyle(fontWeight: FontWeight.w600),
    //                 ),
    //                 SizedBox(
    //                   height: 6,
    //                 ),
    //                 Text(
    //                   "Online",
    //                   style: TextStyle(color: Colors.green, fontSize: 12),
    //                 ),
    //               ],
    //             ),
    //           ),
    //           Icon(
    //             Icons.more_vert,
    //             color: Colors.grey.shade700,
    //           ),
    //         ],
    //       ),
    //     ),
    //   ),
    // );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
