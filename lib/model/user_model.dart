class UserModel {
  String? uid;
  String? name;
  String? email;
  String? mobile;

  UserModel({this.uid, this.name, this.email, this.mobile});

  Map<String, dynamic> toMap() {
    return {"uid": uid, "name": name, "email": email, "number": mobile};
  }
}
