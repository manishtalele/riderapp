import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:riderapp/data/userdata.dart';
import 'package:riderapp/homescreen.dart';

class UserDetails {
  createUser({required BuildContext context}) async {
    String uid = FirebaseAuth.instance.currentUser!.uid;
    fcmToken = (await FirebaseMessaging.instance.getToken())!;
    await FirebaseFirestore.instance.collection("Rider").doc(uid).set({
      "userId": uid,
      "username": username,
      "phoneNo": phoneNum,
      "email": email,
      "vehicleType": vehicleType,
      "Active": "",
      "token": fcmToken,
    });
    await FirebaseFirestore.instance
        .collection("Rider/$uid/License")
        .doc(uid)
        .set({
      "Driving License": drivingLicenseNo,
      "VehicleType": vehicleType,
      "ExpiryDate": expiryDate
    }).whenComplete(() => Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => const HomeScreen()),
            (route) => false));
  }
}
