import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:riderapp/screens/notificationsetting.dart';
import 'package:riderapp/screens/orderdetail.dart';
import 'package:riderapp/screens/setting.dart';
import 'package:riderapp/screens/support.dart';
import 'package:riderapp/theme/decoration.dart';
import 'package:riderapp/theme/deftheme.dart';
class MyAccount extends StatefulWidget {
  const MyAccount({super.key});

  @override
  State<MyAccount> createState() => _MyAccountState();
}

class _MyAccountState extends State<MyAccount> {
  @override
  Widget build(BuildContext context) {
    double width= MediaQuery.of(context).size.width;
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
        title:Text(
          "My Account",
          style:TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: primaryColor,
          ),
        ),
      ),
      body:SingleChildScrollView(
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
              Container(
                decoration: shadowdecoration,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical:14,horizontal: 15),
                  child: InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>NotificationSetting()));
                    },
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
              SizedBox(height:15),
              Container(
                decoration: shadowdecoration,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical:14,horizontal: 15),
                  child: InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>Setting()));
                    },
                    child: Row(
                      children: [
                        SvgPicture.asset(
                                "assets/setting.svg",
                                height: 22,
                                width: 22,
                              ),
                              SizedBox(width:20),
                        Text("Settings and Personalization",
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
              SizedBox(height:15),
              Container(
                decoration: shadowdecoration,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical:14,horizontal: 15),
                  child: InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>OrderDetail()));
                    },
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
              ),
              SizedBox(height:15),
              InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Support()));
                },
                child: Container(
                  decoration: shadowdecoration,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical:14,horizontal: 15),
                    child: Row(
                      children: [
                        SvgPicture.asset(
                                "assets/support.svg",
                                height: 22,
                                width: 22,
                              ),
                              SizedBox(width:20),
                        Text("Support",
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
              SizedBox(height:15),
              Container(
                decoration: shadowdecoration,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical:14,horizontal: 15),
                  child: Row(
                    children: [
                      SvgPicture.asset(
                              "assets/delete.svg",
                              height: 22,
                              width: 22,
                            ),
                            SizedBox(width:20),
                      Text("Delete Account",
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
              SizedBox(height:80),
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                    backgroundColor: primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    fixedSize: Size(320, 48)),
                onPressed: () {},
                icon: SvgPicture.asset("assets/logout.svg"),
                label: Text(
                  "Logout",
                  style: TextStyle(
                    fontFamily: "Overpass",
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color:Colors.white,
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