import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:riderapp/api/getdonationdata.dart';
import 'package:riderapp/api/getreviewapi.dart';
import 'package:riderapp/model/hotelmodel.dart';
import 'package:riderapp/model/pendingordermodel.dart';
import 'package:riderapp/widget/activecard.dart';
import 'package:riderapp/screens/settings.dart';
import 'package:riderapp/widget/hotelcard.dart';
import 'package:riderapp/widget/reviewcard.dart';
import 'package:riderapp/widget/upcomingcar.dart';

ValueNotifier<List> pendingDonation = ValueNotifier<List>([]);
ValueNotifier<List> hotelsList = ValueNotifier<List>([]);
ValueNotifier<String> activedonation = ValueNotifier<String>("");

Future getActiveDonation() async {
  activedonation.value = await FirebaseFirestore.instance
      .collection('Rider')
      .doc(FirebaseAuth.instance.currentUser!.uid)
      .get()
      .then((value) => value.data()!["Active"]);
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool loader = true, reviewloader = true, hotelLoader = true;
  List reviewData = [];
  Future callApi() async {
    setState(() {
      loader = true;
      reviewloader = true;
    });
    pendingDonation.value = List.from(pendingDonation.value)..clear();
    pendingDonation.value = List.from(pendingDonation.value)
      ..addAll(await getDonationCards());
    hotelsList.value = List.from(hotelsList.value)..clear();
    hotelsList.value = List.from(hotelsList.value)
      ..addAll(await getHotelList());
    await getActiveDonation();
    reviewData = await getReviewData();
    setState(() {
      if (pendingDonation.value.isNotEmpty) {
        loader = false;
      }
      if (hotelsList.value.isNotEmpty) {
        hotelLoader = false;
      }
      if (reviewData.isNotEmpty) {
        reviewloader = false;
      }
    });
  }

  @override
  void initState() {
    callApi();
    // activdonation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return RefreshIndicator(
      onRefresh: (() async {
        await callApi();
      }),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          toolbarHeight: 80,
          title: Image.asset(
            "assets/rider_logo.png",
            height: 60,
          ),
          actions: [
            // Icon(
            //   Icons.notifications_none_outlined,
            //   color: primaryColor,
            //   size: 30,
            // ),
            SvgPicture.asset(
              "assets/notifications.svg",
              height: 30,
              width: 30,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 0, 22, 0),
              child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SettingsPage()));
                  },
                  child: const Icon(
                    Icons.settings,
                    size: 30,
                  )
                  // SvgPicture.asset("assets/profile.svg")
                  ),
            ),
          ],
        ),
        backgroundColor: Colors.white,
        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            physics: const AlwaysScrollableScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: const Color.fromRGBO(106, 140, 175, 0.50),
                          borderRadius: BorderRadius.circular(10)),
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      width: width / 2.4,
                      child: Column(children: const [
                        Text(
                          "Pickups",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w400,
                              color: Colors.white),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          "20",
                          style: TextStyle(
                              fontSize: 36,
                              fontWeight: FontWeight.w400,
                              color: Colors.white),
                        ),
                      ]),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.red[300],
                          borderRadius: BorderRadius.circular(10)),
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      width: width / 2.4,
                      child: Column(children: const [
                        Text(
                          "Delay",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w400,
                              color: Colors.white),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          "5",
                          style: TextStyle(
                              fontSize: 36,
                              fontWeight: FontWeight.w400,
                              color: Colors.white),
                        ),
                      ]),
                    ),
                  ],
                ),
                activedonation.value != ""
                    ? const Padding(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        child: Text(
                          "Active Donation",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w400),
                        ),
                      )
                    : const SizedBox.shrink(),
                activedonation.value != ""
                    ? ActiveCard(orderid: activedonation.value)
                    : const SizedBox.shrink(),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    "Upcoming Pickup's ",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                  ),
                ),
                Center(
                  child: ValueListenableBuilder(
                    valueListenable: pendingDonation,
                    builder: (contect, value, child) => ListView.builder(
                        shrinkWrap: true,
                        physics: const ScrollPhysics(),
                        itemCount: value.isEmpty ? 1 : value.length,
                        itemBuilder: (context, index) {
                          if (value.isNotEmpty ||
                              loader == false ||
                              value.isNotEmpty) {
                            PendingDonationModel postdata =
                                PendingDonationModel.from(value[index]);
                            return Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 5),
                                child: UpcomingCard(
                                  upcomingdonation: postdata,
                                  stateUpdate: () => setState(() {}),
                                ));
                          } else {
                            return const Text("No Orders Yet!");
                          }
                        }),
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  "Your today's Hotel Pickups",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                ),
                const SizedBox(height: 10),
                Center(
                  child: ValueListenableBuilder(
                    valueListenable: hotelsList,
                    builder: (contect, value, child) => ListView.builder(
                        shrinkWrap: true,
                        physics: const ScrollPhysics(),
                        itemCount: value.isEmpty ? 1 : value.length,
                        itemBuilder: (context, index) {
                          if (value.isNotEmpty ||
                              hotelLoader == false ||
                              value.isNotEmpty) {
                            HotelModel hoteldata =
                                HotelModel.fromMap(value[index]);
                            return Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 5),
                                child: HotelCard(
                                  address: hoteldata.address.toString(),
                                  image: hoteldata.image.toString(),
                                  name: hoteldata.name.toString(),
                                  time:
                                      "${hoteldata.time.hour}:${hoteldata.time.minute}",
                                  weight: hoteldata.weight,
                                  hoteldata: hoteldata,
                                ));
                          } else {
                            return const Text("No Orders Yet!");
                          }
                        }),
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  "Customer Reviews ",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                ),
                const SizedBox(height: 10),
                ListView.builder(
                    shrinkWrap: true,
                    physics: const ScrollPhysics(),
                    itemCount: reviewData.isEmpty ? 1 : reviewData.length,
                    itemBuilder: (context, index) {
                      if (reviewData.isNotEmpty ||
                          loader == false ||
                          reviewData.isNotEmpty) {
                        return ReviewCards(
                          address: reviewData[index]["address"],
                          date: reviewData[index]["time"],
                          name: reviewData[index]["name"],
                          review: reviewData[index]["review"],
                          starCount: reviewData[index]["starcount"],
                        );
                      } else {
                        return const Text("No Reviews Yet");
                      }
                    }),
                const SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
