import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:riderapp/api/getdonationdata.dart';
import 'package:riderapp/model/pendingordermodel.dart';
import 'package:riderapp/theme/deftheme.dart';
import 'package:riderapp/widget/activecard.dart';
import 'package:riderapp/screens/myaccount.dart';
import 'package:riderapp/widget/upcomingcar.dart';

ValueNotifier<List> pendingDonation = ValueNotifier<List>([]);
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
  bool loader = true;

  Future callApi() async {
    pendingDonation.value = List.from(pendingDonation.value)..clear();
    pendingDonation.value = List.from(pendingDonation.value)
      ..addAll(await getDonationCards());
    await getActiveDonation();
    setState(() {
      loader = false;
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
    // double width = MediaQuery.of(context).size.width;
    return RefreshIndicator(
      onRefresh: (() async {
        setState(() {
          loader = true;
        });
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
            Icon(
              Icons.notifications_none_outlined,
              color: primaryColor,
              size: 35,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 0, 22, 0),
              child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const MyAccount()));
                  },
                  child: SvgPicture.asset("assets/profile.svg")),
            ),
          ],
        ),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          physics: const AlwaysScrollableScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Card(
                    elevation: 1,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: const [
                          Text(
                            "Pickups",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w600),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: Text(
                              "20",
                              style: TextStyle(
                                  fontSize: 30, fontWeight: FontWeight.w600),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                            width: 260,
                          ),
                          Text(
                            "Reviews",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w600),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: Text(
                              "20",
                              style: TextStyle(
                                  fontSize: 30, fontWeight: FontWeight.w600),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              activedonation.value != ""
                  ? const Text(
                      "Active Donation",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
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
              // StreamBuilder(
              //   stream: FirebaseFirestore.instance
              //       .collection('PendingDonation')
              //       .snapshots(),
              //   builder: (context, snapshot) {
              //     if (snapshot.hasError) {
              //       return const Text('Something went wrong');
              //     }
              //     if (snapshot.hasData && snapshot.data!.docs.isNotEmpty) {
              //       List pendingdonation = List.from(snapshot.data!.docs
              //           .map((doc) => PendingDonationModel.from(doc.data())));
              //       return ListView.builder(
              //           shrinkWrap: true,
              //           physics: const BouncingScrollPhysics(),
              //           itemCount: pendingdonation.length,
              //           itemBuilder: (context, index) {
              //             return UpcomingCard(
              //               upcomingdonation: pendingdonation[index],
              //             );
              //           });
              //     }
              //     return const Center(child: Text("No Data"));
              //   },
              // ),
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
                              padding: const EdgeInsets.symmetric(vertical: 5),
                              child: UpcomingCard(
                                upcomingdonation: postdata,
                                stateUpdate: () => setState(() {}),
                              ));
                        } else {
                          return const Text("No Data");
                        }
                      }),
                ),
              ),

              // Card(
              //     elevation: 3,
              //     shape: RoundedRectangleBorder(
              //       borderRadius: BorderRadius.circular(10),
              //     ),
              //     child: Padding(
              //       padding: const EdgeInsets.all(6),
              //       child: Column(
              //         children: [
              //           InkWell(
              //             onTap: () {
              //               Navigator.push(
              //                 context,
              //                 MaterialPageRoute(
              //                   builder: (context) => const OrderInfoScreen()
              //                 )
              //               );
              //             },
              //             child: Card(
              //                 color: primary2Color,
              //                 shape: RoundedRectangleBorder(
              //                   borderRadius: BorderRadius.circular(10),
              //                 ),
              //                 child: Padding(
              //                   padding: const EdgeInsets.all(10),
              //                   child: Row(
              //                     mainAxisAlignment:
              //                         MainAxisAlignment.spaceBetween,
              //                     children: [
              //                       Column(
              //                         crossAxisAlignment:
              //                             CrossAxisAlignment.start,
              //                         children: [
              //                           const Text(
              //                             "Order ID: #100070",
              //                             style: TextStyle(
              //                                 fontSize: 14,
              //                                 fontWeight: FontWeight.w500),
              //                           ),
              //                           const SizedBox(
              //                             height: 8,
              //                           ),
              //                           Row(
              //                             children: const [
              //                               Text(
              //                                 "11 Jan 2022 , 7 km",
              //                                 style: TextStyle(
              //                                     fontSize: 12,
              //                                     fontWeight: FontWeight.w400,
              //                                     color: Color.fromRGBO(
              //                                         00, 00, 00, 0.61)),
              //                               ),
              //                               Text(
              //                                 "  | Dal Roti",
              //                                 style: TextStyle(
              //                                     fontSize: 12,
              //                                     fontWeight: FontWeight.w400),
              //                               ),
              //                             ],
              //                           ),
              //                         ],
              //                       ),
              //                       const Icon(
              //                         Icons.chevron_right_rounded,
              //                         size: 40,
              //                         color: Colors.white,
              //                       )
              //                     ],
              //                   ),
              //                 )),
              //           ),
              //           Card(
              //               color: primary2Color,
              //               shape: RoundedRectangleBorder(
              //                 borderRadius: BorderRadius.circular(10),
              //               ),
              //               child: Padding(
              //                 padding: const EdgeInsets.all(10),
              //                 child: Row(
              //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //                   children: [
              //                     Column(
              //                       crossAxisAlignment: CrossAxisAlignment.start,
              //                       children: [
              //                         const Text(
              //                           "Order ID: #100070",
              //                           style: TextStyle(
              //                               fontSize: 14,
              //                               fontWeight: FontWeight.w500),
              //                         ),
              //                         const SizedBox(
              //                           height: 8,
              //                         ),
              //                         Row(
              //                           children: const [
              //                             Text(
              //                               "11 Jan 2022 , 7 km",
              //                               style: TextStyle(
              //                                   fontSize: 12,
              //                                   fontWeight: FontWeight.w400,
              //                                   color: Color.fromRGBO(
              //                                       00, 00, 00, 0.61)),
              //                             ),
              //                             Text(
              //                               "  | Dal Roti",
              //                               style: TextStyle(
              //                                   fontSize: 12,
              //                                   fontWeight: FontWeight.w400),
              //                             ),
              //                           ],
              //                         ),
              //                       ],
              //                     ),
              //                     const Icon(
              //                       Icons.chevron_right_rounded,
              //                       size: 40,
              //                       color: Colors.white,
              //                     )
              //                   ],
              //                 ),
              //               )),
              //           Card(
              //               color: primary2Color,
              //               shape: RoundedRectangleBorder(
              //                 borderRadius: BorderRadius.circular(10),
              //               ),
              //               child: Padding(
              //                 padding: const EdgeInsets.all(10),
              //                 child: Row(
              //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //                   children: [
              //                     Column(
              //                       crossAxisAlignment: CrossAxisAlignment.start,
              //                       children: [
              //                         const Text(
              //                           "Order ID: #100070",
              //                           style: TextStyle(
              //                               fontSize: 14,
              //                               fontWeight: FontWeight.w500),
              //                         ),
              //                         const SizedBox(
              //                           height: 8,
              //                         ),
              //                         Row(
              //                           children: const [
              //                             Text(
              //                               "11 Jan 2022 , 7 km",
              //                               style: TextStyle(
              //                                   fontSize: 12,
              //                                   fontWeight: FontWeight.w400,
              //                                   color: Color.fromRGBO(
              //                                       00, 00, 00, 0.61)),
              //                             ),
              //                             Text(
              //                               "  | Dal Roti",
              //                               style: TextStyle(
              //                                   fontSize: 12,
              //                                   fontWeight: FontWeight.w400),
              //                             ),
              //                           ],
              //                         ),
              //                       ],
              //                     ),
              //                     const Icon(
              //                       Icons.chevron_right_rounded,
              //                       size: 40,
              //                       color: Colors.white,
              //                     )
              //                   ],
              //                 ),
              //               )),
              //         ],
              //       ),
              //     )),
              const SizedBox(height: 10),
              const Text(
                "Customer Reviews ",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
              ),
              const Card()
            ],
          ),
        ),
        // bottomNavigationBar: Padding(
        //   padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        //   child: ElevatedButton(
        //     style: ElevatedButton.styleFrom(
        //         foregroundColor: Colors.white,
        //         padding:
        //             const EdgeInsets.symmetric(vertical: 10, horizontal: 20)),
        //     onPressed: () {Navigator.push(
        //                   context,
        //                   MaterialPageRoute(
        //                       builder: (context) => MyAccount()));},
        //     child: const Text("LogOut"),
        //   ),
      ),
    );
  }
}
