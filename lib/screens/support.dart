import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:riderapp/theme/decoration.dart';
import 'package:riderapp/theme/deftheme.dart';

class Support extends StatefulWidget {
  const Support({super.key});

  @override
  State<Support> createState() => _SupportState();
}

class _SupportState extends State<Support> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: InkWell(
          onTap: () => Navigator.pop(context),
          child: Icon(Icons.arrow_back_ios, color: primaryColor),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: Text(
          "Support",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w400,
            color: primaryColor,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(20, 40, 20, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {},
                child: Container(
                  decoration: shadowdecoration,
                  padding:
                      const EdgeInsets.symmetric(vertical: 14, horizontal: 15),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SvgPicture.asset(
                        "assets/terms.svg",
                        height: 22,
                        width: 22,
                      ),
                      const SizedBox(width: 20),
                      const Text("Terms & Conditions",
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
              GestureDetector(
                onTap: () {},
                child: Container(
                  decoration: shadowdecoration,
                  margin: const EdgeInsets.symmetric(vertical: 20),
                  padding:
                      const EdgeInsets.symmetric(vertical: 14, horizontal: 15),
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        "assets/FAQ.svg",
                        height: 22,
                        width: 22,
                      ),
                      const SizedBox(width: 20),
                      const Text("FAQ,s",
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
              GestureDetector(
                onTap: () {},
                child: Container(
                  decoration: shadowdecoration,
                  padding:
                      const EdgeInsets.symmetric(vertical: 14, horizontal: 15),
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        "assets/feedback.svg",
                        height: 22,
                        width: 22,
                      ),
                      const SizedBox(width: 20),
                      const Text("Feedback",
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
    );
  }
}
