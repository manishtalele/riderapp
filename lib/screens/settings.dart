import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:riderapp/screens/notificationsetting.dart';
import 'package:riderapp/screens/orderdetail.dart';
import 'package:riderapp/provider/emailauth.dart';
import 'package:riderapp/screens/personalization.dart';
import 'package:riderapp/screens/support.dart';
import 'package:riderapp/theme/decoration.dart';
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
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: InkWell(
          onTap: () => Navigator.pop(context),
          child: Icon(Icons.arrow_back_ios,
          color: primaryColor,),
        ),
        elevation :0,
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
          child: Padding(
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
                InkWell(
                  onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>NotificationSetting()));
                        },
                  child: Container(
                    decoration: shadowdecoration,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical:14,horizontal: 15),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SvgPicture.asset(
                                  "assets/bell.svg",
                                  height: 22,
                                  width: 22,
                                ),
                                SizedBox(width:20),
                          Text("Notifications",
                          style:TextStyle(
                            fontFamily: "Overpass",
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                          )),
                          Spacer(),
                          Icon(
                              Icons.arrow_forward_ios,
                            ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: InkWell(
                    onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const PersonalizationPage()));
                          },
                    child: Container(
                      decoration: shadowdecoration,
                      padding: EdgeInsets.symmetric(vertical: 14, horizontal: 15),
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
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>OrderDetail()));
                        },
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical:14,horizontal: 15),
                    decoration: shadowdecoration,
                    child: Row(
                      children: [
                        SvgPicture.asset(
                                "assets/order.svg",
                                height: 22,
                                width: 22,
                              ),
                              SizedBox(width:20),
                        Text("Order Details",
                        style:TextStyle(
                          fontFamily: "Overpass",
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                        )),
                        Spacer(),
                        Icon(
                            Icons.arrow_forward_ios,
                          ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => const Support()));
                    },
                    child: Container(
                      decoration: shadowdecoration,
                      padding: EdgeInsets.symmetric(vertical: 14, horizontal: 15),
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
                      ),
                    ),
                  ),
                ),
                Container(
                  decoration: shadowdecoration,
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 14, horizontal: 15),
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
                    ),
                  ),
                ),
              ],
            ),
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
                        fixedSize: Size(width, 48)),
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
