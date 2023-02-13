import 'package:cloud_firestore/cloud_firestore.dart';

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
