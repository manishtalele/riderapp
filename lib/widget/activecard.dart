import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:riderapp/activedonationpage.dart';
import 'package:riderapp/homescreen.dart';
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
    return Card(
        color: primary2Color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 10, 10, 20),
          child: loader
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
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
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Order ID:\n${widget.orderid}",
                            style: const TextStyle(
                                fontSize: 12, fontWeight: FontWeight.w500)),
                        const SizedBox(
                          height: 10,
                        ),
                        Text("${orderDetails.name}\n${orderDetails.address}",
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            )),
                        ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const ActiveDonationPage()));
                            },
                            child: const Text('Active')),
                      ],
                    ),
                  ],
                ),
        ));
  }
}
