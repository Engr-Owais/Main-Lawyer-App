class AllUser {
  String uid;
  String name;
  String email;

  AllUser({
    this.uid,
    this.name,
    this.email,
  });

  Map toMap(AllUser user) {
    var data = Map<String, dynamic>();
    data['uid'] = user.uid;
    data['name'] = user.name;
    data['email'] = user.email;

    return data;
  }

  // Named constructor
  AllUser.fromMap(Map<String, dynamic> mapData) {
    this.uid = mapData['uid'];
    this.name = mapData['name'];
    this.email = mapData['email'];
  }
}
