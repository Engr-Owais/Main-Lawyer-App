import 'package:flutter/material.dart';
import 'package:lawyer_app/drawerscreens/lawyerdetails.dart';
import '../models/search_model/searchlawyer.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class DetailSearch extends StatefulWidget {
  String cat;
  String qual;
  var selectindex;
  DetailSearch(this.cat, this.qual);
  @override
  _DetailSearchState createState() => _DetailSearchState();
}

class _DetailSearchState extends State<DetailSearch> {
  Future fetchcatByLawyer;
  @override
  void initState() {
    super.initState();

    fetchcatByLawyer = fetchLawyerbyCat(widget.cat, widget.qual);
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height / 100;
    var width1 = MediaQuery.of(context).size.width / 100;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70),
        child: AppBar(
          title: Container(
              padding: EdgeInsets.only(top: 5, right: 5),
              child: Text("Lawyers")),
          backgroundColor: Color(0xff6762F1),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(20),
                bottomLeft: Radius.circular(20)),
          ),
        ),
      ),
      body: FutureBuilder(
          future: fetchcatByLawyer,
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
                      height: 22 * height, //180
                      width: 100 * width1, // 200
                      padding: EdgeInsets.all(5),

                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LawyerDetail(
                                      snapshot.data[index].email,
                                      snapshot.data[index].cat)));
                        },
                        child: Card(
                          elevation: 5,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          color: Colors.white,
                          child: Padding(
                            padding: const EdgeInsets.all(20),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.only(top: 10),
                                  child: Image.network(
                                    '${snapshot.data[index].profileimages}',
                                    height: 55,
                                    width: 55,
                                  ),
                                ),
                                SizedBox(
                                  width: 4.8 * width1,
                                ),
                                Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '${snapshot.data[index].fullname}',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: "Montserrat-Regular"),
                                    ),
                                    SizedBox(
                                      height: 1.4 * height,
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          '${snapshot.data[index].cat}',
                                          style: TextStyle(
                                              color: Colors.grey[600],
                                              fontSize: 16,
                                              fontWeight: FontWeight.normal,
                                              fontFamily: "Montserrat-Regular"),
                                        ),
                                        // SizedBox(
                                        //   width: 12 * width1,
                                        // ),
                                        // Icon(
                                        //   Icons.star,
                                        //   size: 18,
                                        //   color: Colors.yellow,
                                        // ),
                                        // Icon(
                                        //   Icons.star,
                                        //   size: 18,
                                        //   color: Colors.yellow,
                                        // ),
                                        // Icon(
                                        //   Icons.star,
                                        //   size: 18,
                                        //   color: Colors.yellow,
                                        // ),
                                        // Icon(
                                        //   Icons.star,
                                        //   size: 18,
                                        //   color: Colors.yellow,
                                        // ),
                                        // Icon(
                                        //   Icons.star,
                                        //   size: 18,
                                        //   color: Colors.yellow,
                                        // ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 1.6 * height,
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Icon(
                                          Icons.location_on,
                                          size: 20,
                                          color: Color(0xff6762F1),
                                        ),
                                        SizedBox(
                                          width: 1 * width1,
                                        ),
                                        Text(
                                          '${snapshot.data[index].address == null ? "None" : snapshot.data[index].address}',
                                          style: TextStyle(
                                              color: Colors.grey[600],
                                              fontSize: 14,
                                              fontWeight: FontWeight.normal,
                                              fontFamily: "Montserrat-Regular"),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  }); //1

            }
          }),
    );
  }
}
