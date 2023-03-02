import 'package:action_slider/action_slider.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:riderapp/model/pendingordermodel.dart';
import 'package:riderapp/theme/deftheme.dart';

class ActiveDonationPage extends StatefulWidget {
  final PendingDonationModel orderDetails;
  const ActiveDonationPage({super.key, required this.orderDetails});

  @override
  State<ActiveDonationPage> createState() => _ActiveDonationPageState();
}

class _ActiveDonationPageState extends State<ActiveDonationPage> {
  int current = 0;
  String slidertitle = "Donation Picked";
  // double sliderwidth = 300 ;
  Future completeDonation() async {
    await FirebaseFirestore.instance
        .collection('Donation')
        .doc(widget.orderDetails.donationid)
        .set({
      'Level': widget.orderDetails.level,
      'Serves': widget.orderDetails.serves,
      'SizeOfGood': widget.orderDetails.sizeofgood,
      'Status': 'Done',
      'Time': widget.orderDetails.datetime,
      'TypeOfDonation': widget.orderDetails.typeOfDonation,
      'address': widget.orderDetails.address,
      'donationId': widget.orderDetails.donationid,
      'foodName': widget.orderDetails.foodname,
      'images': widget.orderDetails.images,
      'name': widget.orderDetails.name,
      'userId': widget.orderDetails.userid,
    });

    await FirebaseFirestore.instance
        .collection('PendingDonation')
        .doc(widget.orderDetails.donationid)
        .delete();

    await FirebaseFirestore.instance
        .collection("Rider")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .update({'Active': ''});
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    // sliderwidth = width ;
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
          'Active Pickup',
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
                  height: height * 0.40,
                  // aspectRatio: 1,
                  viewportFraction: 1,
                  initialPage: 0,
                  autoPlay:
                      widget.orderDetails.images!.length <= 1 ? false : true,
                  autoPlayInterval: const Duration(seconds: 12),
                  autoPlayAnimationDuration: const Duration(milliseconds: 800),
                  autoPlayCurve: Curves.easeInOut,
                  enlargeCenterPage: true,
                  scrollPhysics: widget.orderDetails.images!.length <= 1
                      ? const NeverScrollableScrollPhysics()
                      : const ScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  onPageChanged: (index, reason) {
                    setState(() {
                      current = index;
                    });
                  }),
              items: widget.orderDetails.images?.map((i) {
                return ClipRRect(
                  // borderRadius: BorderRadius.circular(15),
                  child: Image.network(
                    i.toString(),
                    // height: 160,
                    width: width,
                    fit: BoxFit.cover,
                  ),
                );
              }).toList(),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          color: primary4Color,
                          width: 1.0,
                        ),
                      ),
                      backgroundColor: Colors.white,
                      minimumSize: Size(width, 50)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        "assets/call.svg",
                        width: 20,
                        height: 20,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        'Call',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            color: primary4Color),
                      ),
                    ],
                  )),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Row(
                children: [
                  const Text(
                    'Pickup ID:',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    widget.orderDetails.donationid.toString(),
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                        color: primary4Color),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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
                    widget.orderDetails.foodname.toString(),
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                        color: primary4Color),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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
                    widget.orderDetails.name.toString(),
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                        color: primary4Color),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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
                    widget.orderDetails.address.toString(),
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                        color: primary4Color),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.fromLTRB(30, 0, 30, 40),
        child: ActionSlider.standard(
          actionThresholdType: ThresholdType.release,
          rolling: true,
          width: width,
          sliderBehavior: SliderBehavior.stretch,
          child: Text(slidertitle,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w700)),
          backgroundColor: primaryColor,
          toggleColor: primary2Color,
          iconAlignment: Alignment.center,
          loadingIcon: SizedBox(
              width: 55,
              child: Center(
                  child: SizedBox(
                width: 24.0,
                height: 24.0,
                child: CircularProgressIndicator(
                    strokeWidth: 2.0, color: primaryColor),
              ))),
          successIcon: const SizedBox(
              width: 55, child: Center(child: Icon(Icons.check_rounded))),
          icon: const SizedBox(
              width: 55,
              child: Center(child: Icon(Icons.arrow_forward_ios_rounded))),
          action: (controller) async {
            controller.loading(); //starts loading animation
            await Future.delayed(const Duration(seconds: 3));
            controller.success(); //starts success animation
            await completeDonation().whenComplete(() => Navigator.pop(context));
            // await Future.delayed(const Duration(seconds: 3));
            controller.reset(); //resets the slider
          },
        ),
        // ActionSlider.standard(
        //   backgroundColor: primaryColor,
        //   toggleColor: primary2Color,
        //   sliderBehavior: SliderBehavior.stretch,
        //   rolling: true,
        //   width: 300.0,
        //   actionThresholdType: ThresholdType.release,
        //   child: const Text('Donation Picked',
        //   style:TextStyle(
        //       color: Colors.white,
        //       fontSize: 18,
        //       fontWeight: FontWeight.w700)
        //   ),
        //   action: (controller) async {
        //     controller.loading(); //starts loading animation
        //     await Future.delayed(const Duration(seconds: 3));
        //     controller.success(); //starts success animation
        //     await Future.delayed(const Duration(seconds: 1));
        //     controller.reset(); //resets the slider
        //   },
        // ),

        // child: ElevatedButton(
        //     onPressed: () async => await completeDonation()
        //         .whenComplete(() => Navigator.pop(context)),
        //     style: ElevatedButton.styleFrom(
        //         elevation: 0,
        //         shape: RoundedRectangleBorder(
        //             borderRadius: BorderRadius.circular(10)),
        //         backgroundColor: primary2Color,
        //         minimumSize: Size(width, 50)),
        //     child: const Text(
        //       'Donation Picked',
        //       style: TextStyle(
        //           color: Colors.white,
        //           fontSize: 18,
        //           fontWeight: FontWeight.w700),
        //     )),
      ),
    );
  }
}
