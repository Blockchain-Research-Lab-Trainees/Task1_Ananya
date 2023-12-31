class UserModel {
  String? uid;
  String? email;
  String? password;

  UserModel({this.uid, this.email, this.password});

  UserModel.fromMap(Map<String, dynamic>map) {
    uid = map["uid"];
    email = map["email"];
    password = map["password"];
  }

  Map<String, dynamic> toMap() {
    return {
    "uid":uid,
    "email":email,
    "password":password,
    };
  }
}