import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:riderapp/screens/changepassword.dart';
import 'package:riderapp/screens/personaldetails.dart';
import 'package:riderapp/screens/updatelicensedetails.dart';
import 'package:riderapp/theme/decoration.dart';
import 'package:riderapp/theme/deftheme.dart';

class PersonalizationPage extends StatefulWidget {
  const PersonalizationPage({super.key});

  @override
  State<PersonalizationPage> createState() => _PersonalizationPageState();
}

class _PersonalizationPageState extends State<PersonalizationPage> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        leading: InkWell(
          onTap: () => Navigator.pop(context),
          child: Icon(
            Icons.arrow_back_ios,
            color: primaryColor,
          ),
        ),
        elevation: 0,
        title: Text("Personalization",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w400,
              color: primaryColor,
            )),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 40, 20, 28),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const CircleAvatar(
                  backgroundImage: AssetImage("assets/avatar.png"),
                  radius: 50,
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 10, bottom: 5),
                  child: Text("Gajodhar Halwai",
                      style: TextStyle(
                        fontSize: 14,
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w500,
                      )),
                ),
                Text("878899001",
                    style: TextStyle(
                      fontSize: 14,
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w500,
                      color: primary3Color,
                    )),
                const SizedBox(
                  height: 50,
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const PersonalDetails()));
                  },
                  child: Container(
                    decoration: shadowdecoration,
                    padding: const EdgeInsets.symmetric(
                        vertical: 14, horizontal: 15),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SvgPicture.asset(
                          "assets/details.svg",
                          height: 22,
                          width: 22,
                        ),
                        const SizedBox(width: 20),
                        const Text("Personal Details",
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
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ChangePassword()));
                    },
                    child: Container(
                      decoration: shadowdecoration,
                      padding: const EdgeInsets.symmetric(
                          vertical: 14, horizontal: 15),
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            "assets/change.svg",
                            height: 22,
                            width: 22,
                          ),
                          const SizedBox(width: 20),
                          const Text("Change Password",
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
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                const UpdateLicenseDetails()));
                  },
                  child: Container(
                    decoration: shadowdecoration,
                    padding: const EdgeInsets.symmetric(
                        vertical: 14, horizontal: 15),
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          "assets/updatelicense.svg",
                          height: 22,
                          width: 22,
                        ),
                        const SizedBox(width: 20),
                        const Text("Update License Details",
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
    );
  }
}
