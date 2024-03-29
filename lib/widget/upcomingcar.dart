import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:riderapp/model/pendingordermodel.dart';
import 'package:riderapp/theme/deftheme.dart';
import 'package:riderapp/screens/orderinfo.dart';

class UpcomingCard extends StatelessWidget {
  final PendingDonationModel upcomingdonation;
  final Function stateUpdate;
  const UpcomingCard(
      {super.key, required this.upcomingdonation, required this.stateUpdate});

  @override
  Widget build(BuildContext context) {
    String formmatingdate = DateFormat.yMMMMd().format(DateTime.now());
    double width = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => OrderInfoScreen(
                    upcomingdonation: upcomingdonation,
                    stateUpdate: stateUpdate,
                  ))),
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
                      "Order ID: ${upcomingdonation.donationid}",
                      style: const TextStyle(
                          fontSize: 14, fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: width - 110,
                          child: Text(
                            formmatingdate +
                                upcomingdonation.address.toString(),
                            overflow: TextOverflow.clip,
                            style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        // Text(
                        //   upcomingdonation.address.toString(),
                        //   style: const TextStyle(
                        //       fontSize: 12, fontWeight: FontWeight.w400),
                        // ),
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
