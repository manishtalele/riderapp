import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:riderapp/theme/decoration.dart';
import 'package:riderapp/theme/deftheme.dart';
class PersonalDetails extends StatefulWidget {
  const PersonalDetails({super.key});

  @override
  State<PersonalDetails> createState() => _PersonalDetailsState();
}

class _PersonalDetailsState extends State<PersonalDetails> {
  @override
  Widget build(BuildContext context) {
    double width= MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        automaticallyImplyLeading: false,
        elevation: 0,
        leading: Icon(Icons.arrow_back_ios,color:primaryColor),
        title:Text("Personal Details",
        style:TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w400,
          color: primaryColor
        ))
      ),
       body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(30, 50, 30, 088),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            Text("Full Name",
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
                                    icon: Padding(
                                      padding:  EdgeInsets.fromLTRB(250, 0, 13, 0),
                                      child: SvgPicture.asset('assets/edit.svg'),
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
                                    icon: Padding(
                                      padding:  EdgeInsets.fromLTRB(250, 0, 13, 0),
                                      child: SvgPicture.asset('assets/edit.svg'),
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
              SizedBox(height:20),
              Text("Vehicle Type",
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
                                      child: Icon(Icons.arrow_drop_down_sharp),
                                    ),
                              ),       
                ),
              ),
          ]),
        ),
    ));
  }
}