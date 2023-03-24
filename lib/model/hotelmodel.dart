import 'package:cloud_firestore/cloud_firestore.dart';

class HotelModel {
  String? name, address, image;
  DateTime time = DateTime.now();
  int weight = 1;

  HotelModel(this.image, this.address, this.name, this.time, this.weight);

  HotelModel.fromMap(Map<String, dynamic> map) {
    name = map["restroName"];
    time = (map['pickupTime'] as Timestamp).toDate();
    image = map["image"];
    address = map["address"];
    weight = map["wasteAnalysis"];
  }
  Map<String, dynamic> toMap() {
    return {
      "name": name,
      "address": address,
      "weight": weight,
      "image": image,
      "time": time
    };
  }
}
