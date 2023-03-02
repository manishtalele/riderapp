import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:riderapp/screens/myaccount.dart';
import 'package:riderapp/theme/decoration.dart';
import 'package:riderapp/theme/deftheme.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:responsive_framework/responsive_framework.dart';

class Notication extends StatefulWidget {
  const Notication({super.key});

  @override
  State<Notication> createState() => _NoticationState();
}

class _NoticationState extends State<Notication> {
  checkfun() {
    if (offerscoupons && chatsmessages && orderupdates) {
      setState(() {
        pushnotification = true;
      });
    } else {
      setState(() {
        pushnotification = false;
      });
    }
  }

  update() async => await FirebaseFirestore.instance
          .collection("Users")
          .doc(FirebaseAuth.instance.currentUser!.uid.toString())
          .update({
        "offernotication": offerscoupons,
        "chatpermission": chatsmessages,
        "deliverpermission": orderupdates,
        "smspermission": smsnoftification
      });

  bool pushnotification = true;
  bool offerscoupons = true;
  bool chatsmessages = true;
  bool orderupdates = true;
  bool smsnoftification = true;
  @override
  Widget build(BuildContext context) {
    double btnheight = ResponsiveValue(
      context,
      defaultValue: 50.0,
      valueWhen: const [
        Condition.smallerThan(
          name: MOBILE,
          value: 30.0,
        ),
        Condition.largerThan(
          name: TABLET,
          value: 75.0,
        )
      ],
    ).value as double;
    double btnwidth = ResponsiveValue(
      context,
      defaultValue: 320.0,
      valueWhen: const [
        Condition.smallerThan(
          name: MOBILE,
          value: 250.0,
        ),
        Condition.largerThan(
          name: TABLET,
          value: 500.0,
        )
      ],
    ).value as double;
    double? fontsize16 = ResponsiveValue(
      context,
      defaultValue: 16.0,
      valueWhen:  [
        Condition.smallerThan(
          name: MOBILE,
          value: 12.0,
        ),
        Condition.largerThan(
          name: TABLET,
          value: 30.0,
        )
      ],
    ).value;
    checkfun();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
          leading: IconButton(
              onPressed: () {
                Navigator.of(context).pop(
                  MaterialPageRoute(builder: (context) =>  MyAccount()),
                );
              },
              icon:  Icon(Icons.arrow_back_ios,
              color: primaryColor)),
          backgroundColor: Colors.white,
          title: Text(
            "Notifications",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w400,
              fontFamily: 'Autour',
              color: primary4Color,
            ),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(20, 40, 20, 10),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: Container(
                  decoration: shadowdecoration,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical:14,horizontal: 20),
                    child: Row(
                      children: [
                        const Text('Push Notification',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                            )),
                        const Spacer(),
                        FlutterSwitch(
                            padding: 0,
                            width: 50,
                            height: 25,
                            activeColor: primary5Color,
                            inactiveColor: Colors.grey.shade300,
                            inactiveToggleColor: Colors.grey,
                            activeToggleColor: primaryColor,
                            value: offerscoupons,
                            borderRadius: 20,
                            onToggle: (val) {
                              setState(() {
                                offerscoupons = val;
                              });
                            }),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Container(
                  decoration: shadowdecoration,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical:14,horizontal: 20),
                    child: Row(
                      children: [
                        const Text('SMS Notification',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                            )),
                        const Spacer(),
                        FlutterSwitch(
                            padding: 0,
                            width: 50,
                            height: 25,
                            activeColor: primary5Color,
                            inactiveColor: Colors.grey.shade300,
                            inactiveToggleColor: Colors.grey,
                            activeToggleColor: primaryColor,
                            value: chatsmessages,
                            borderRadius: 20,
                            onToggle: (val) {
                              setState(() {
                                chatsmessages = val;
                              });
                            }),
                      ],
                    ),
                  ),
                ),
              ),
              
            ],
          ),
        )
    );
  }
}