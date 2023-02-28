import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:riderapp/theme/decoration.dart';
import 'package:riderapp/theme/deftheme.dart';
class UpdateLicenseDetails extends StatefulWidget {
  const UpdateLicenseDetails({super.key});

  @override
  State<UpdateLicenseDetails> createState() => _UpdateLicenseDetailsState();
}

class _UpdateLicenseDetailsState extends State<UpdateLicenseDetails> {
  @override
  Widget build(BuildContext context) {
    double width= MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: Icon(Icons.arrow_back_ios,
        color:primaryColor),
        elevation:0,
        centerTitle: true,
        automaticallyImplyLeading: false,
        title:Text("License Details",
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w400,
          color: primaryColor,
        ),),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(30, 50, 30, 088),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            Text("Driving License no.",
              style:TextStyle(
                fontFamily: "Overpass",
                fontSize: 15,
                fontWeight: FontWeight.w400,
              ),
              ),
              SizedBox(height: 5),
              Container(
                decoration: shadowdecoration,
                child: TextField (
                      style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                          ),
                          decoration: InputDecoration(
                                contentPadding: const EdgeInsets.all(15),
                                filled: true,
                                fillColor: Colors.white,
                                border: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.circular(10)),
                                    
                                    icon: Padding(
                                      padding:  EdgeInsets.fromLTRB(250, 0, 13, 0),
                                      child: SvgPicture.asset('assets/edit.svg'),
                                    ),
                              ),
                              
                ),
              ),
              SizedBox(height:20),
               Text("Issue Date",
              style:TextStyle(
                fontFamily: "Overpass",
                fontSize: 15,
                fontWeight: FontWeight.w400,
              ),
              ),
              SizedBox(height: 5),
              Container(
                decoration: shadowdecoration,
                child: TextField (
                      style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                          ),
                          decoration: InputDecoration(
                                contentPadding: const EdgeInsets.all(15),
                                filled: true,
                                fillColor: Colors.white,
                                border: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.circular(10)),
                                     icon:Padding(
                                      padding: const EdgeInsets.fromLTRB(250, 0, 13, 0),
                                      child: Icon(Icons.calendar_month_outlined),
                                    ),
                              ),
                              
                ),
              ),
               SizedBox(height:20),
              Text("License Validity",
              style:TextStyle(
                fontFamily: "Overpass",
                fontSize: 15,
                fontWeight: FontWeight.w400,
              ),
              ),
              SizedBox(height: 5),
              Container(
                decoration: shadowdecoration,
                child: TextField (
                      style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                          ),
                          decoration: InputDecoration(
                                contentPadding: const EdgeInsets.all(15),
                                filled: true,
                                fillColor: Colors.white,
                                border: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.circular(10)),
                                    icon:Padding(
                                      padding: const EdgeInsets.fromLTRB(250, 0, 13, 0),
                                      child: Icon(Icons.calendar_month_outlined),
                                    ),
                                    
                              ),
                              
                ),
              ),
               SizedBox(height:20),
              Text("Licensing  Authority",
              style:TextStyle(
                fontFamily: "Overpass",
                fontSize: 15,
                fontWeight: FontWeight.w400,
              ),
              ),
              SizedBox(height: 5),
              Container(
                decoration: shadowdecoration,
                child: TextField (
                      style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                          ),
                          decoration: InputDecoration(
                                contentPadding: const EdgeInsets.all(15),
                                filled: true,
                                fillColor: Colors.white,
                                border: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.circular(10)),
                                    icon: Padding(
                                      padding:  EdgeInsets.fromLTRB(250, 0, 13, 0),
                                      child: SvgPicture.asset('assets/edit.svg'),
                                    ),
                              ),
                              
                ),
              ),
          ]),
        ),
      ),
    );
  }
}