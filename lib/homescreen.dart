import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:riderapp/model/pendingordermodel.dart';
import 'package:riderapp/provider/emailauth.dart';
import 'package:riderapp/provider/notifcationprovider.dart';
import 'package:riderapp/theme/deftheme.dart';
import 'package:riderapp/widget/activecard.dart';
import 'package:riderapp/widget/upcomingcar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List activedonation = [];
  @override
  activdonation() async {
    await FirebaseFirestore.instance
        .collection('PendingDonation')
        .where('Status', isEqualTo: 'Active')
        .get()
        .then((QuerySnapshot snapshot) {
      for (var doc in snapshot.docs) {
        activedonation.add(doc.data());
      }
    });
    print(activedonation);
  }

  void initState() {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;
      if (notification != null && android != null) {
        flutterLocalNotificationsPlugin.show(
            notification.hashCode,
            notification.title,
            notification.body,
            NotificationDetails(
              android: AndroidNotificationDetails(
                channel.id,
                channel.name,
                playSound: true,
                icon: '@mipmap/ic_launcher',
              ),
            ));
      }
    });
    getFCM();
    activdonation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  "assets/rider_logo.png",
                  height: 60,
                ),
                const Icon(
                  Icons.notifications_none_outlined,
                  size: 25,
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Card(
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      children: [
                        Text(
                          "Todays",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: primaryColor),
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        const Text(
                          "Daily Target :",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        const Text(
                          "Delivered      :",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        const Text(
                          "Earning         :",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                      ],
                    ),
                  ),
                ),
                Column(
                  children: [
                    Card(
                      elevation: 3,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      child: Padding(
                        padding: const EdgeInsets.all(15),
                        child: Column(
                          children: [
                            Text(
                              "Weekly",
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                  color: primaryColor),
                            ),
                            const Padding(
                              padding: EdgeInsets.symmetric(vertical: 5),
                              child: Text(
                                "Delivered      :",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w500),
                              ),
                            ),
                            const Text(
                              "Earning         :",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Card(
                      elevation: 3,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      child: Padding(
                        padding: const EdgeInsets.all(15),
                        child: Column(
                          children: [
                            Text(
                              "Monthly",
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                  color: primaryColor),
                            ),
                            const Padding(
                              padding: EdgeInsets.symmetric(vertical: 5),
                              child: Text(
                                "Delivered      :",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w500),
                              ),
                            ),
                            const Text(
                              "Earning         :",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Text(
              "Active Pickup's",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
            ),
            ListView.builder(
                shrinkWrap: true,
                physics: BouncingScrollPhysics(),
                itemCount: activedonation.length,
                itemBuilder: (context, index) {
                  return  ActiveCard(
                    orderid: activedonation[index]['donationId'],
                    name: activedonation[index]['name'],
                    location: activedonation[index]['address'],
                    activdonation: activedonation,

                  );
                }),
            // Padding(
            //   padding: const EdgeInsets.all(6),
            //   child: Card(
            //       color: primary2Color,
            //       shape: RoundedRectangleBorder(
            //         borderRadius: BorderRadius.circular(10),
            //       ),
            //       child: Padding(
            //         padding: const EdgeInsets.fromLTRB(10, 10, 10, 20),
            //         child: Column(children: [
            //           Row(
            //               crossAxisAlignment: CrossAxisAlignment.start,
            //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //               children: const [
            //                 Text("Happy Valley,\nThane",
            //                     style: TextStyle(
            //                       color: Colors.white,
            //                       fontSize: 16,
            //                       fontWeight: FontWeight.w500,
            //                     )),
            //                 Text("Order ID: #100070",
            //                     style: TextStyle(
            //                         fontSize: 16, fontWeight: FontWeight.w500)),
            //               ]),
            //           const SizedBox(
            //             height: 20,
            //           ),
            //           Row(
            //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //               crossAxisAlignment: CrossAxisAlignment.end,
            //               children: [
            //                 Row(
            //                   children: [
            //                     Image.asset("assets/img1.png"),
            //                     Image.asset("assets/img1.png"),
            //                     Image.asset("assets/img1.png"),
            //                   ],
            //                 ),
            //                 Image.asset("assets/gmaps.png")
            //               ]),
            //         ]),
            //       )),
            // ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Text(
                "Upcoming pickup’s ",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
              ),
            ),
            StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection('PendingDonation')
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return const Text('Something went wrong');
                }
                if (snapshot.hasData && snapshot.data!.docs.isNotEmpty) {
                  List pendingdonation = List.from(snapshot.data!.docs
                      .map((doc) => PendingDonationModel.fromSnapshot(doc)));
                  return ListView.builder(
                      shrinkWrap: true,
                      physics: BouncingScrollPhysics(),
                      itemCount: pendingdonation.length,
                      itemBuilder: (context, index) {
                        return UpcomingCard(
                          upcomingdonation: pendingdonation[index],
                        );
                      });
                }
                return const Center(child: Text("No Data"));
              },
            )
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
    );
  }
}
