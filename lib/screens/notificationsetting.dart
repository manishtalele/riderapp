import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:riderapp/theme/decoration.dart';
import 'package:riderapp/theme/deftheme.dart';

class NotificationSetting extends StatefulWidget {
  const NotificationSetting({super.key});

  @override
  State<NotificationSetting> createState() => _NotificationSettingState();
}

class _NotificationSettingState extends State<NotificationSetting> {
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
    checkfun();
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back_ios, color: primaryColor)),
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
                    padding: const EdgeInsets.symmetric(
                        vertical: 14, horizontal: 20),
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
                    padding: const EdgeInsets.symmetric(
                        vertical: 14, horizontal: 20),
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
        ));
  }
}
