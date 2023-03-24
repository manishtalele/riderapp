import 'package:flutter/material.dart';
import 'package:riderapp/model/hotelmodel.dart';
import 'package:riderapp/screens/hoteldetailscreen.dart';
import 'package:riderapp/theme/deftheme.dart';

class HotelCard extends StatefulWidget {
  final String image, name, time, address;
  final int weight;
  final HotelModel hoteldata;
  const HotelCard(
      {super.key,
      required this.image,
      required this.name,
      required this.time,
      required this.address,
      required this.weight,
      required this.hoteldata});

  @override
  State<HotelCard> createState() => _HotelCardState();
}

class _HotelCardState extends State<HotelCard> {
  String weight = "Low";
  // Color weightColor = Colors.green;

  @override
  void initState() {
    switch (widget.weight) {
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
    return InkWell(
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
              builder: (_) => HotelDetailScreen(hoteldata: widget.hoteldata))),
      child: Card(
          elevation: 10,
          shape: RoundedRectangleBorder(
              side: BorderSide(color: primary2Color, width: 2),
              borderRadius: BorderRadius.circular(20)),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Image.network(
                    widget.image,
                    width: 120,
                    fit: BoxFit.fill,
                    height: 120,
                  ),
                ),
                SizedBox(
                  width: 180,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(
                        text: TextSpan(
                          text: 'Name: ',
                          style: TextStyle(fontSize: 14, color: primaryColor),
                          children: <TextSpan>[
                            TextSpan(
                              text: widget.name,
                              style: const TextStyle(
                                  fontSize: 14, color: Colors.black),
                            )
                          ],
                        ),
                      ),
                      RichText(
                        text: TextSpan(
                          text: 'Pickup Time: ',
                          style: TextStyle(fontSize: 14, color: primaryColor),
                          children: <TextSpan>[
                            TextSpan(
                              text: widget.time,
                              style: const TextStyle(
                                  fontSize: 14, color: Colors.black),
                            )
                          ],
                        ),
                      ),
                      RichText(
                        text: TextSpan(
                          text: 'Address: ',
                          style: TextStyle(fontSize: 14, color: primaryColor),
                          children: <TextSpan>[
                            TextSpan(
                              text: widget.address,
                              style: const TextStyle(
                                  fontSize: 14, color: Colors.black),
                            )
                          ],
                        ),
                      ),
                      RichText(
                        text: TextSpan(
                          text: 'Food weight: ',
                          style: TextStyle(fontSize: 14, color: primaryColor),
                          children: <TextSpan>[
                            TextSpan(
                              text: weight,
                              style:
                                  TextStyle(fontSize: 14, color: primary4Color),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          )),
    );
  }
}
