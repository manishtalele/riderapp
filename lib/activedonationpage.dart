import 'package:flutter/material.dart';

class ActiveDonationPage extends StatefulWidget {
  const ActiveDonationPage({super.key});

  @override
  State<ActiveDonationPage> createState() => _ActiveDonationPageState();
}

class _ActiveDonationPageState extends State<ActiveDonationPage> {
  @override
  Widget build(BuildContext context) {
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
    );
  }
}
