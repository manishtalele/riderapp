import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:riderapp/api/getdonationdata.dart';
import 'package:riderapp/model/pendingordermodel.dart';
import 'package:riderapp/provider/emailauth.dart';
import 'package:riderapp/widget/activecard.dart';
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
    double width = MediaQuery.of(context).size.width;
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
          actions: const [
            Icon(
              Icons.notifications_none_outlined,
              size: 25,
            )
          ],
        ),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          physics: const AlwaysScrollableScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: [
              //     Card(
              //       elevation: 3,
              //       shape: RoundedRectangleBorder(
              //           borderRadius: BorderRadius.circular(10)),
              //       child: Padding(
              //         padding: const EdgeInsets.all(15),
              //         child: Column(
              //           children: [
              //             Text(
              //               "Todays",
              //               style: TextStyle(
              //                   fontSize: 18,
              //                   fontWeight: FontWeight.w500,
              //                   color: primaryColor),
              //             ),
              //             const SizedBox(
              //               height: 40,
              //             ),
              //             const Text(
              //               "Daily Target :",
              //               style: TextStyle(
              //                   fontSize: 18, fontWeight: FontWeight.w500),
              //             ),
              //             const SizedBox(
              //               height: 16,
              //             ),
              //             const Text(
              //               "Delivered      :",
              //               style: TextStyle(
              //                   fontSize: 18, fontWeight: FontWeight.w500),
              //             ),
              //             const SizedBox(
              //               height: 16,
              //             ),
              //             const Text(
              //               "Earning         :",
              //               style: TextStyle(
              //                   fontSize: 18, fontWeight: FontWeight.w500),
              //             ),
              //             const SizedBox(
              //               height: 16,
              //             ),
              //           ],
              //         ),
              //       ),
              //     ),
              //     Column(
              //       children: [
              //         Card(
              //           elevation: 3,
              //           shape: RoundedRectangleBorder(
              //               borderRadius: BorderRadius.circular(10)),
              //           child: Padding(
              //             padding: const EdgeInsets.all(15),
              //             child: Column(
              //               children: [
              //                 Text(
              //                   "Weekly",
              //                   style: TextStyle(
              //                       fontSize: 18,
              //                       fontWeight: FontWeight.w500,
              //                       color: primaryColor),
              //                 ),
              //                 const Padding(
              //                   padding: EdgeInsets.symmetric(vertical: 5),
              //                   child: Text(
              //                     "Delivered      :",
              //                     style: TextStyle(
              //                         fontSize: 18, fontWeight: FontWeight.w500),
              //                   ),
              //                 ),
              //                 const Text(
              //                   "Earning         :",
              //                   style: TextStyle(
              //                       fontSize: 18, fontWeight: FontWeight.w500),
              //                 ),
              //               ],
              //             ),
              //           ),
              //         ),
              //         Card(
              //           elevation: 3,
              //           shape: RoundedRectangleBorder(
              //               borderRadius: BorderRadius.circular(10)),
              //           child: Padding(
              //             padding: const EdgeInsets.all(15),
              //             child: Column(
              //               children: [
              //                 Text(
              //                   "Monthly",
              //                   style: TextStyle(
              //                       fontSize: 18,
              //                       fontWeight: FontWeight.w500,
              //                       color: primaryColor),
              //                 ),
              //                 const Padding(
              //                   padding: EdgeInsets.symmetric(vertical: 5),
              //                   child: Text(
              //                     "Delivered      :",
              //                     style: TextStyle(
              //                         fontSize: 18, fontWeight: FontWeight.w500),
              //                   ),
              //                 ),
              //                 const Text(
              //                   "Earning         :",
              //                   style: TextStyle(
              //                       fontSize: 18, fontWeight: FontWeight.w500),
              //                 ),
              //               ],
              //             ),
              //           ),
              //         ),
              //       ],
              //     ),
              //   ],
              // ),
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
                  "Pending Donation pickups ",
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
            ],
          ),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20)),
            onPressed: () => EmailAuth().logout(context: context),
            child: const Text("LogOut"),
          ),
        ),
      ),
    );
  }
}
