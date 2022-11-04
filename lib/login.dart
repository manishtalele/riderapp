import 'package:flutter/material.dart';
import 'package:riderapp/provider/emailauth.dart';
import 'package:riderapp/theme/deftheme.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool check = false;
  String password = "", email = "";
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
        body: SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Column(children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 120, 0, 40),
          child: Image.asset("assets/rider_logo.png",
              width: width - 100, height: width / 4),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 20),
          child: Text(
            "SIGN IN",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        Center(
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextFormField(
                onChanged: (value) => setState(() => email = value),
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  icon: Icon(Icons.email_outlined),
                  fillColor: Colors.black,
                  hintText: 'Email ',
                ),
              ),
            ),
          ),
        ),
        Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: TextFormField(
              onChanged: (value) => setState(() => password = value),
              decoration: const InputDecoration(
                border: InputBorder.none,
                icon: Icon(Icons.key),
                fillColor: Colors.black,
                hintText: 'Password ',
              ),
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
                    activeColor: const Color.fromARGB(255, 117, 183, 158)),
                const Text("Remember Me",
                    style:
                        TextStyle(color: Color.fromARGB(255, 117, 183, 158))),
              ],
            ),
            const Text("Forgot Password?",
                style: TextStyle(color: Color.fromARGB(255, 117, 183, 158))),
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: ElevatedButton(
              onPressed: () => EmailAuth().signInWithEmailAndPassword(
                  context: context, password: password, emailAddress: email),
              style: ElevatedButton.styleFrom(
                  backgroundColor: primaryColor,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10)),
              child: const Text(
                "SIGN IN",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              )),
        ),
        const Text(
          "Don't have an account? Sign Up",
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w400,
            color: Colors.grey,
          ),
        ),
        const SizedBox(height: 40),
        Align(
          alignment: AlignmentDirectional.centerEnd,
          child: Image.asset(
            "assets/login_image.png",
          ),
        ),
      ]),
    ));
  }
}
