import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:riderapp/screens/activedonationpage.dart';
import 'package:riderapp/screens/homescreen.dart';
import 'package:riderapp/model/pendingordermodel.dart';
import 'package:riderapp/theme/deftheme.dart';

class ActiveCard extends StatefulWidget {
  final String orderid;

  const ActiveCard({super.key, name, required this.orderid});

  @override
  State<ActiveCard> createState() => _ActiveCardState();
}

class _ActiveCardState extends State<ActiveCard> {
  late PendingDonationModel orderDetails;
  bool loader = true;
  Future callApi() async {
    var data = await FirebaseFirestore.instance
        .collection("PendingDonation")
        .doc(widget.orderid)
        .get()
        .then((value) => value.data());

    setState(() {
      if (data == null) {
        activedonation.value = '';
      } else {
        orderDetails = PendingDonationModel.from(data);
        loader = false;
      }
    });
  }

  @override
  void initState() {
    if (widget.orderid != "") {
      callApi();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ActiveDonationPage(
                      orderDetails: orderDetails,
                    )));
      },
      child: Card(
          color: primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: loader
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: width - 240,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Order ID:\n${widget.orderid}",
                                style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white)),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                                "${orderDetails.name}\n${orderDetails.address}",
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                )),
                            // const Spacer(),
                            Container(
                                padding: const EdgeInsets.all(10),
                                margin: const EdgeInsets.only(top: 20),
                                decoration: BoxDecoration(
                                    color: primary2Color,
                                    borderRadius: BorderRadius.circular(6)),
                                child: const Text('Active')),
                          ],
                        ),
                      ),
                      const Spacer(),
                      Padding(
                          padding: const EdgeInsetsDirectional.all(10),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.network(
                              orderDetails.images![0],
                              fit: BoxFit.fill,
                              height: 120,
                            ),
                          )),
                    ],
                  ),
          )),
    );
  }
}
