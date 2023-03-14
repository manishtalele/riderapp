import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future getReviewData() async {
  List reviewData = [];
  await FirebaseFirestore.instance
      .collection("Rider/${FirebaseAuth.instance.currentUser!.uid}/Review")
      .get()
      .then((value) {
    for (var doc in value.docs) {
      reviewData.add(doc.data());
    }
  });
  return reviewData;
}
