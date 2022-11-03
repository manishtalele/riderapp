import 'package:flutter/material.dart';
import 'package:riderapp/homescreen.dart';
import 'package:riderapp/theme/deftheme.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    bool check = false;
    return Scaffold(
        body: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
      const SizedBox(
        height: 70,
      ),
      Image.asset("assets/rider_logo.png", width: width - 120, height: width / 4),
      Text("RIDER's APP",
          style: TextStyle(
            color: primary3Color,
            fontSize: 16,
            fontWeight: FontWeight.w700,
          )),
      const Text(
        "SIGN IN",
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.w400,
        ),
      ),
      Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: TextFormField(
          decoration: const InputDecoration(
            icon: Icon(Icons.email_outlined),
            fillColor: Colors.black,
            hintText: 'Email ',
          ),
        ),
      ),
      Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: TextFormField(
          decoration: const InputDecoration(
            icon: Icon(Icons.key),
            fillColor: Colors.black,
            hintText: 'Password ',
          ),
        ),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Checkbox(
                  value: check,
                  onChanged: (bool? newValue) {
                    setState(() {
                      check = newValue!;
                    });
                  },
                  activeColor: const Color.fromARGB(1, 117, 183, 158)),
              const Text("Remember Me",
                  style: TextStyle(color: Color.fromARGB(255, 117, 183, 158))),
            ],
          ),
          const Text("Forgot Password?",
              style: TextStyle(color: Color.fromARGB(255, 117, 183, 158))),
        ],
      ),
      ElevatedButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: ((context) => const HomeScreen())));
          },
          style: ElevatedButton.styleFrom(backgroundColor: primary3Color),
          child: const Text(
            "SIGN IN",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
          )),
      const Text(
        "Don't have an account? Sign Up",
        style: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w400,
          color: Colors.grey,
        ),
      ),
      Image.asset(
        "assets/login_image.png",
      ),
    ]));
  }
}
