import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future getDonationCards() async {
  List donationData = [];
  await FirebaseFirestore.instance
      .collection('PendingDonation')
      .where("Status", isNotEqualTo: "Active")
      .get()
      .then((value) {
    for (var doc in value.docs) {
      donationData.add(doc.data());
    }
  });
  // donationData.sort((a, b) => {});
  return donationData;
}

Future getHotelList() async {
  List hotelListData = [];
  await FirebaseFirestore.instance
      .collection('Rider/${FirebaseAuth.instance.currentUser!.uid}/Hotel')
      .get()
      .then((value) {
    for (var doc in value.docs) {
      hotelListData.add(doc.data());
    }
  });
  // hotelListData.sort((a, b) => {});
  return hotelListData;
}
