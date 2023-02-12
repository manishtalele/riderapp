class PendingDonationModel{
  int? level;
  int? sizeofgood;
  String? status;
  String? typeOfDonation;
  String? address;
  String? donationid;
  DateTime? datetime;
  String? foodname;
  List? images;
  String? name;
  String? userid;

  PendingDonationModel();
  Map<String, dynamic> toMap(){
    return {
      'level':level,
      'sizeofgood':sizeofgood,
      'status':status,
      'TypeOfDonation':typeOfDonation,
      'address':address,
      'donationid':donationid,
      'foodname':foodname,
      'images':images,
      'datetime':datetime,
      'name':name,
      'userid':userid
    };
  }

  PendingDonationModel.fromSnapshot(snapshot)
  :level = snapshot.data()['level'],
   sizeofgood = snapshot.data()['sizeofgood'],
   status = snapshot.data()['status'],
   typeOfDonation =snapshot.data()['typeOfDonation'],
   address = snapshot.data()['address'],
   donationid = snapshot.data()['donationId'],
   foodname = snapshot.data()['foodName'],
   images = snapshot.data()['images'],
   datetime =  snapshot.data()['Time'].toDate(),
   name = snapshot.data()['name'],
   userid=snapshot.data()['userid'];


   PendingDonationModel.from(data)
   :level = data['level'],
   sizeofgood = data['sizeofgood'],
   status = data['status'],
   typeOfDonation =data['typeOfDonation'],
   address = data['address'],
   donationid = data['donationid'],
   foodname =data['foodName'],
   images = data['images'],
   datetime = data['Time'].toDate(),
   name = data['name'],
   userid=data['userid'];
}