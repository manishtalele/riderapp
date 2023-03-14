import 'package:flutter/material.dart';
import 'package:riderapp/theme/decoration.dart';
import 'package:riderapp/theme/deftheme.dart';

class UpdateLicenseDetails extends StatefulWidget {
  const UpdateLicenseDetails({super.key});

  @override
  State<UpdateLicenseDetails> createState() => _UpdateLicenseDetailsState();
}

class _UpdateLicenseDetailsState extends State<UpdateLicenseDetails> {
  final TextEditingController _drivinglicno = TextEditingController();
  final TextEditingController _issuedate = TextEditingController();
  final TextEditingController _licencevalidity = TextEditingController();
  final TextEditingController _licenseAuthority = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: InkWell(
          onTap: () => Navigator.pop(context),
          child: Icon(Icons.arrow_back_ios, color: primaryColor),
        ),
        elevation: 0,
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: Text(
          "License Details",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w400,
            color: primaryColor,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(30, 50, 30, 088),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const Text(
              "Driving License no.",
              style: TextStyle(
                fontFamily: "Overpass",
                fontSize: 15,
                fontWeight: FontWeight.w400,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 5, bottom: 15),
              decoration: shadowdecoration,
              child: TextField(
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.all(15),
                  filled: true,
                  fillColor: Colors.white,
                  suffixIcon: Icon(
                    Icons.edit,
                    color: primaryColor,
                  ),
                  border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(10)),
                ),
                controller: _drivinglicno,
              ),
            ),
            const Text(
              "Issue Date",
              style: TextStyle(
                fontFamily: "Overpass",
                fontSize: 15,
                fontWeight: FontWeight.w400,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 5, bottom: 15),
              decoration: shadowdecoration,
              child: TextField(
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.all(15),
                  filled: true,
                  fillColor: Colors.white,
                  suffixIcon: Icon(
                    Icons.edit,
                    color: primaryColor,
                  ),
                  border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(10)),
                ),
                controller: _issuedate,
              ),
            ),
            const Text(
              "License Validity",
              style: TextStyle(
                fontFamily: "Overpass",
                fontSize: 15,
                fontWeight: FontWeight.w400,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 5, bottom: 15),
              decoration: shadowdecoration,
              child: TextField(
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.all(15),
                  filled: true,
                  fillColor: Colors.white,
                  suffixIcon: Icon(
                    Icons.calendar_month_outlined,
                    color: primaryColor,
                  ),
                  border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(10)),
                ),
                controller: _licencevalidity,
              ),
            ),
            const Text(
              "Licensing  Authority",
              style: TextStyle(
                fontFamily: "Overpass",
                fontSize: 15,
                fontWeight: FontWeight.w400,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 5, bottom: 15),
              decoration: shadowdecoration,
              child: TextField(
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.all(15),
                  filled: true,
                  fillColor: Colors.white,
                  suffixIcon: Icon(
                    Icons.edit,
                    color: primaryColor,
                  ),
                  border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(10)),
                ),
                controller: _licenseAuthority,
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
