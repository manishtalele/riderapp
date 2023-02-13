import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:riderapp/model/pendingordermodel.dart';
import 'package:riderapp/theme/deftheme.dart';

class OrderInfoScreen extends StatefulWidget {
  final PendingDonationModel upcomingdonation;
  const OrderInfoScreen({super.key, required this.upcomingdonation});

  @override
  State<OrderInfoScreen> createState() => _OrderInfoScreenState();
}

class _OrderInfoScreenState extends State<OrderInfoScreen> {
  int current = 0;
  List imageData = [];

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.arrow_back_ios)),
        centerTitle: true,
        title: const Text(
          'Pickup Details',
          style: TextStyle(
              color: Color(
                0xff6a8caf,
              ),
              fontSize: 20,
              fontWeight: FontWeight.w400),
        ),
      ),
      body: SingleChildScrollView(
          child: Column(
        children: [
          CarouselSlider(
            options: CarouselOptions(
                // height: height * 0.40,
                aspectRatio: 1 / 1,
                viewportFraction: 1,
                initialPage: 0,
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 12),
                autoPlayAnimationDuration: const Duration(milliseconds: 800),
                autoPlayCurve: Curves.easeInOut,
                enlargeCenterPage: true,
                scrollDirection: Axis.horizontal,
                onPageChanged: (index, reason) {
                  setState(() {
                    current = index;
                  });
                }),
            items: imageData.map((i) {
              return Padding(
                padding: const EdgeInsets.all(10),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.network(
                    widget.upcomingdonation.images.toString(),
                    // height: 160,
                    width: width,
                    fit: BoxFit.fitWidth,
                  ),
                ),
              );
            }).toList(),
          ),
          const Text(
            "Pickup ID",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            widget.upcomingdonation.donationid.toString(),
            textAlign: TextAlign.center,
            style: TextStyle(
              color: primary4Color,
              fontSize: 24,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                const Text(
                  'Item name:',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                ),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  widget.upcomingdonation.foodname.toString(),
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                      color: primary4Color),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                const Text(
                  'Name:',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                ),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  widget.upcomingdonation.name.toString(),
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                      color: primary4Color),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                const Text(
                  'Address:',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                ),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  widget.upcomingdonation.address.toString(),
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                      color: primary4Color),
                ),
              ],
            ),
          ),
        ],
      )),
      bottomNavigationBar: Padding(
          padding: const EdgeInsets.fromLTRB(30, 0, 30, 40),
          child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  backgroundColor: primary2Color,
                  minimumSize: Size(width, 50)),
              child: const Text(
                "Accept Pickup",
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: "Overpass",
                    fontSize: 18,
                    fontWeight: FontWeight.w700),
              ))),
    );
  }
}
