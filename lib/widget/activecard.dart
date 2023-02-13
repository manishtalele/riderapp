import 'package:flutter/material.dart';
import 'package:riderapp/activedonationpage.dart';
import 'package:riderapp/theme/deftheme.dart';

class ActiveCard extends StatefulWidget {
  final String orderid;
  final String name;
  final String location;
  final List activdonation;
  const ActiveCard(
      {super.key,
      required this.activdonation,
      required this.location,
      required this.name,
      required this.orderid});

  @override
  State<ActiveCard> createState() => _ActiveCardState();
}

class _ActiveCardState extends State<ActiveCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
        color: primary2Color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 10, 10, 20),
          child: Row(
            children: [
              SizedBox(
                  height: 120,
                  child: Image.asset(
                    "assets/img1.png",
                    fit: BoxFit.fill,
                  )),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Order ID:${widget.orderid}",
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w500)),
                  const SizedBox(
                    height: 10,
                  ),
                  Text("${widget.name}\n${widget.location}",
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      )),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const ActiveDonationPage()));
                      },
                      child: const Text('Active'))
                ],
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ));
  }
}
