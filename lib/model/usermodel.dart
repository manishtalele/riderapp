import 'package:firebase_auth/firebase_auth.dart';

class UserModel {
  String? userId;
  String? username;
  String? email;
  String? phoneNo;
  String? vehicleType;
  String? order;

  UserModel(this.order, this.vehicleType, this.phoneNo, this.userId,
      this.username, this.email);

  UserModel.fromMap(Map<String, dynamic> map) {
    userId = FirebaseAuth.instance.currentUser!.uid;
    username = map["userName"];
    email = map["email"];
    vehicleType = map["vehicleType"];
    phoneNo = map["phoneNo"];
    order = map["Active"];
  }

  Map<String, dynamic> toMap() {
    return {
      "userId": userId,
      "userName": username,
      "email": email,
      "phoneNo": phoneNo,
      "vehicleType": vehicleType,
      "order": order,
    };
  }
}
