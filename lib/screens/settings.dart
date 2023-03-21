import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:riderapp/screens/notificationsetting.dart';
import 'package:riderapp/screens/orderdetail.dart';
import 'package:riderapp/provider/emailauth.dart';
import 'package:riderapp/screens/personalization.dart';
import 'package:riderapp/screens/support.dart';
import 'package:riderapp/theme/deftheme.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double btnheight =
        ResponsiveValue(context, defaultValue: 50.0, valueWhen: const [
      Condition.smallerThan(name: MOBILE, value: 30.0),
      Condition.largerThan(name: TABLET, value: 65.0)
    ]).value as double;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: InkWell(
          onTap: () => Navigator.pop(context),
          child: Icon(
            Icons.arrow_back_ios,
            color: primaryColor,
          ),
        ),
        elevation: 0,
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: Text(
          "Settings",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: primaryColor,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(20, 40, 20, 28),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // const CircleAvatar(
              //   backgroundImage: AssetImage("assets/avatar.png"),
              //   radius: 50,
              // ),
              // const SizedBox(
              //   height: 10,
              // ),
              // const Text("Gajodhar Halwai",
              //     style: TextStyle(
              //       fontSize: 14,
              //       fontFamily: "Poppins",
              //       fontWeight: FontWeight.w500,
              //     )),
              // Text("878899001",
              //     style: TextStyle(
              //       fontSize: 14,
              //       fontFamily: "Poppins",
              //       fontWeight: FontWeight.w500,
              //       color: primary3Color,
              //     )),
              // const SizedBox(height: 25),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const NotificationSetting()));
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black,
                      minimumSize: Size(width, btnheight),
                      elevation: 1,
                      shape: RoundedRectangleBorder(
                          side:
                              const BorderSide(width: 0.4, color: Colors.grey),
                          borderRadius: BorderRadius.circular(10))),
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        "assets/bell.svg",
                        height: 22,
                        width: 22,
                      ),
                      const SizedBox(width: 20),
                      const Text("Notifications",
                          style: TextStyle(
                            fontFamily: "Overpass",
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                          )),
                      const Spacer(),
                      const Icon(
                        Icons.arrow_forward_ios,
                      ),
                    ],
                  )),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const PersonalizationPage()));
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.black,
                        minimumSize: Size(width, btnheight),
                        elevation: 1,
                        shape: RoundedRectangleBorder(
                            side: const BorderSide(
                                width: 0.4, color: Colors.grey),
                            borderRadius: BorderRadius.circular(10))),
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          "assets/setting.svg",
                          height: 22,
                          width: 22,
                        ),
                        const SizedBox(width: 20),
                        const Text("Personalization",
                            style: TextStyle(
                              fontFamily: "Overpass",
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                            )),
                        const Spacer(),
                        const Icon(
                          Icons.arrow_forward_ios,
                        ),
                      ],
                    )),
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const OrderDetail()));
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black,
                      minimumSize: Size(width, btnheight),
                      elevation: 1,
                      shape: RoundedRectangleBorder(
                          side:
                              const BorderSide(width: 0.4, color: Colors.grey),
                          borderRadius: BorderRadius.circular(10))),
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        "assets/order.svg",
                        height: 22,
                        width: 22,
                      ),
                      const SizedBox(width: 20),
                      const Text("Order Details",
                          style: TextStyle(
                            fontFamily: "Overpass",
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                          )),
                      const Spacer(),
                      const Icon(
                        Icons.arrow_forward_ios,
                      ),
                    ],
                  )),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Support()));
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.black,
                        minimumSize: Size(width, btnheight),
                        elevation: 1,
                        shape: RoundedRectangleBorder(
                            side: const BorderSide(
                                width: 0.4, color: Colors.grey),
                            borderRadius: BorderRadius.circular(10))),
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          "assets/support.svg",
                          height: 22,
                          width: 22,
                        ),
                        const SizedBox(width: 20),
                        const Text("Support",
                            style: TextStyle(
                              fontFamily: "Overpass",
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                            )),
                        const Spacer(),
                        const Icon(
                          Icons.arrow_forward_ios,
                        ),
                      ],
                    )),
              ),
              ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black,
                      minimumSize: Size(width, btnheight),
                      elevation: 1,
                      shape: RoundedRectangleBorder(
                          side:
                              const BorderSide(width: 0.4, color: Colors.grey),
                          borderRadius: BorderRadius.circular(10))),
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        "assets/delete.svg",
                        height: 22,
                        width: 22,
                      ),
                      const SizedBox(width: 20),
                      const Text("Delete Account",
                          style: TextStyle(
                            fontFamily: "Overpass",
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                          )),
                      const Spacer(),
                      const Icon(
                        Icons.arrow_forward_ios,
                      ),
                    ],
                  )),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20),
        child: ElevatedButton.icon(
          style: ElevatedButton.styleFrom(
              backgroundColor: primaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              fixedSize: Size(width, btnheight)),
          onPressed: () async => EmailAuth().logout(context: context),
          icon: SvgPicture.asset("assets/logout.svg"),
          label: const Text(
            "Logout",
            style: TextStyle(
              fontFamily: "Overpass",
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
