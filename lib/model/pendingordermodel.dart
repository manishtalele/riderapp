class PendingDonationModel {
  int? level;
  int? sizeofgood;
  int? serves;
  String? status;
  String? typeOfDonation;
  String? address;
  String? donationid;
  DateTime? datetime;
  String? foodname;
  List? images;
  String? name;
  String? userid;
  PendingDonationModel(
      this.serves,
      this.address,
      this.datetime,
      this.donationid,
      this.foodname,
      this.images,
      this.level,
      this.name,
      this.sizeofgood,
      this.status,
      this.typeOfDonation,
      this.userid);

  PendingDonationModel.from(data)
      : level = data['Level'],
        serves = data['Serves'],
        sizeofgood = data['SizeOfGood'],
        status = data['Status'],
        typeOfDonation = data['TypeOfDonation'],
        address = data['address'],
        donationid = data['donationId'],
        foodname = data['foodName'],
        images = data['images'],
        datetime = data['Time'].toDate(),
        name = data['name'],
        userid = data['userId'];

  Map<String, dynamic> toMap() {
    return {
      'level': level,
      'sizeofgood': sizeofgood,
      'status': status,
      'TypeOfDonation': typeOfDonation,
      'address': address,
      'donationid': donationid,
      'foodname': foodname,
      'images': images,
      'datetime': datetime,
      'name': name,
      'userid': userid
    };
  }
}
