import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:riderapp/screens/changepassword.dart';
import 'package:riderapp/screens/personaldetails.dart';
import 'package:riderapp/screens/updatelicensedetails.dart';
import 'package:riderapp/theme/decoration.dart';
import 'package:riderapp/theme/deftheme.dart';
class Setting extends StatefulWidget {
  const Setting({super.key});

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  @override
  Widget build(BuildContext context) {
    double width= MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        leading: Icon(Icons.arrow_back_ios,
        color: primaryColor,),
        elevation :0,
        title: Text("Settings and Personalization",
        style:TextStyle(
          fontSize:20,
          fontWeight: FontWeight.w400,
          color:primaryColor,
        )),
      ),
      body: SingleChildScrollView(
        child:Padding(
          padding: const EdgeInsets.fromLTRB(20, 40, 20, 28),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                backgroundImage: AssetImage("assets/avatar.png"),
                  radius: 50,
                ),
                SizedBox(
                  height: 10,
                ),
              Text("Gajodhar Halwai",
            style:TextStyle(
              fontSize: 14,
              fontFamily: "Poppins",
              fontWeight: FontWeight.w500,
            )),
            Text("878899001",
            style:TextStyle(
              fontSize: 14,
              fontFamily: "Poppins",
              fontWeight: FontWeight.w500,
              color:primary3Color,
            )),
            SizedBox(height:25),
              InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>PersonalDetails()));
                },
                child: Container(
                  decoration: shadowdecoration,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical:14,horizontal: 15),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SvgPicture.asset(
                                "assets/details.svg",
                                height: 22,
                                width: 22,
                              ),
                              SizedBox(width:20),
                        Text("Personal Details",
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
              SizedBox(height:20),
              InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>ChangePassword()));
                },
                child: Container(
                  decoration: shadowdecoration,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical:14,horizontal: 15),
                    child: Row(
                      children: [
                        SvgPicture.asset(
                                "assets/change.svg",
                                height: 22,
                                width: 22,
                              ),
                              SizedBox(width:20),
                        Text("Change Password",
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
              SizedBox(height:20),
              InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>UpdateLicenseDetails()));
                },
                child: Container(
                  decoration: shadowdecoration,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical:14,horizontal: 15),
                    child: Row(
                      children: [
                        SvgPicture.asset(
                                "assets/updatelicense.svg",
                                height: 22,
                                width: 22,
                              ),
                              SizedBox(width:20),
                        Text("Update License Details",
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
              
            ],
          ),
        ),
      ),
    );
  }
}