import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:riderapp/model/hotelmodel.dart';
import 'package:riderapp/theme/deftheme.dart';
import 'package:url_launcher/url_launcher.dart';

class HotelDetailScreen extends StatefulWidget {
  final HotelModel hoteldata;
  const HotelDetailScreen({super.key, required this.hoteldata});

  @override
  State<HotelDetailScreen> createState() => HotelDetailScreenState();
}

class HotelDetailScreenState extends State<HotelDetailScreen> {
  String weight = "Low";
  // Color weightColor = Colors.green;

  @override
  void initState() {
    switch (widget.hoteldata.weight) {
      case 1:
        weight = "Low";
        break;
      case 2:
        weight = "Medium";
        break;
      case 3:
        weight = "High";
        break;
      default:
        weight = "low";
    }
    super.initState();
  }

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
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.network(
                    widget.hoteldata.image.toString(),
                    width: width - 40,
                    fit: BoxFit.fill,
                    // height: 120,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              RichText(
                text: TextSpan(
                  text: 'Name: ',
                  style: TextStyle(fontSize: 24, color: primaryColor),
                  children: <TextSpan>[
                    TextSpan(
                      text: widget.hoteldata.name.toString(),
                      style: const TextStyle(fontSize: 24, color: Colors.black),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              RichText(
                text: TextSpan(
                  text: 'Pickup Time: ',
                  style: TextStyle(fontSize: 24, color: primaryColor),
                  children: <TextSpan>[
                    TextSpan(
                      text:
                          "${widget.hoteldata.time.hour}:${widget.hoteldata.time.minute}",
                      style: const TextStyle(fontSize: 24, color: Colors.black),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              RichText(
                text: TextSpan(
                  text: 'Address: ',
                  style: TextStyle(fontSize: 24, color: primaryColor),
                  children: <TextSpan>[
                    TextSpan(
                      text: widget.hoteldata.address,
                      style: const TextStyle(fontSize: 24, color: Colors.black),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              RichText(
                text: TextSpan(
                  text: 'Food weight: ',
                  style: TextStyle(fontSize: 24, color: primaryColor),
                  children: <TextSpan>[
                    TextSpan(
                      text: weight,
                      style: TextStyle(fontSize: 24, color: primary4Color),
                    )
                  ],
                ),
              ),
            ],
          )),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.fromLTRB(30, 0, 30, 40),
        child: ElevatedButton(
            onPressed: () async {
              Uri phoneno = Uri.parse('tel:+97798345348734');
              if (await launchUrl(phoneno)) {
                //dialer opened
              } else {
                //dailer is not opened
              }
            },
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
    );
  }
}
