import 'package:http/http.dart' as http;
import 'dart:convert';

Future<List> privacyPolicy() async {
  List<PrivacyPolicy> privacy = [];
  List addabout = [];
  String url = "http://10xwebsolutions.com/lawyer/api/_privacy_policy.php";
  final response =
      await http.post(url, headers: {'content-type': 'application/json'});
  print(response.body.toString());
  final Map<String, dynamic> responseData = json.decode(response.body);
  print(responseData.toString());
  var data1 = responseData['Data'];

  for (int i = 0; i < data1.length ?? 0; i++) {
    print("checkinloop");
    if (privacy.length != 0) {
      break;
    } else if (responseData['status'] == "true") {
      privacy.add(PrivacyPolicy(
        title: data1[i]["title"],
        description: data1[i]["description"],
        image: data1[i]["image"],
      ));
    }
  }

  addabout = privacy;
  return addabout;
}

class PrivacyPolicy {
  String title;
  String description;
  String image;
  PrivacyPolicy({this.title, this.description, this.image});
}
