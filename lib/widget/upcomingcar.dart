import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:riderapp/model/pendingordermodel.dart';
import 'package:riderapp/theme/deftheme.dart';
import 'package:riderapp/orderinfo.dart';

class UpcomingCard extends StatefulWidget {
  final PendingDonationModel upcomingdonation;
  const UpcomingCard({super.key, required this.upcomingdonation});

  @override
  State<UpcomingCard> createState() => _UpcomingCardState();
}

class _UpcomingCardState extends State<UpcomingCard> {
  String formmatingdate = DateFormat.yMMMMd().format(DateTime.now());

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.push(
          context, MaterialPageRoute(builder: (context) => OrderInfoScreen(upcomingdonation: widget.upcomingdonation,))),
      child: Card(
          color: primary2Color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Order ID:${widget.upcomingdonation.donationid}",
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Row(
                      children: [
                        Text(
                          formmatingdate,
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: Color.fromRGBO(00, 00, 00, 0.61)),
                        ),
                        Text(
                          widget.upcomingdonation.address.toString(),
                          style: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                  ],
                ),
                const Icon(
                  Icons.chevron_right_rounded,
                  size: 40,
                  color: Colors.white,
                )
              ],
            ),
          )),
    );
  }
}
