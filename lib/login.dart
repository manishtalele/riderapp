import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:riderapp/provider/emailauth.dart';
import 'package:riderapp/registration.dart';
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
    double? size10 =
        ResponsiveValue(context, defaultValue: 0.0, valueWhen: const [
      Condition.smallerThan(name: MOBILE, value: 0.0),
      Condition.largerThan(name: TABLET, value: 10.0)
    ]).value;
    double? fontsize14 =
        ResponsiveValue(context, defaultValue: 14.0, valueWhen: const [
      Condition.smallerThan(name: MOBILE, value: 10.0),
      Condition.largerThan(name: TABLET, value: 22.0)
    ]).value;
    double? fontsize16 =
        ResponsiveValue(context, defaultValue: 16.0, valueWhen: const [
      Condition.smallerThan(name: MOBILE, value: 12.0),
      Condition.largerThan(name: TABLET, value: 28.0)
    ]).value;
    double? fontsize24 =
        ResponsiveValue(context, defaultValue: 24.0, valueWhen: const [
      Condition.smallerThan(name: MOBILE, value: 20.0),
      Condition.largerThan(name: TABLET, value: 32.0)
    ]).value;
    double? icontxt =
        ResponsiveValue(context, defaultValue: 0.0, valueWhen: const [
      Condition.smallerThan(name: MOBILE, value: 0.0),
      Condition.largerThan(name: TABLET, value: 20.0)
    ]).value;
    double? iconsize =
        ResponsiveValue(context, defaultValue: 25.0, valueWhen: const [
      Condition.smallerThan(name: MOBILE, value: 15.0),
      Condition.largerThan(name: TABLET, value: 35.0)
    ]).value;
    double btnheight = ResponsiveValue(
      context,
      defaultValue: 50.0,
      valueWhen: const [
        Condition.smallerThan(
          name: MOBILE,
          value: 30.0,
        ),
        Condition.largerThan(
          name: TABLET,
          value: 65.0,
        )
      ],
    ).value as double;
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        child: Column(children: [
          SizedBox(
            height: icontxt,
          ),
          Padding(
              padding: const EdgeInsets.fromLTRB(0, 80, 0, 30),
              child: SvgPicture.asset(
                "assets/RiderLogo.svg",
                width: width / 2,
              )),
          SizedBox(
            height: icontxt,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Text(
              "SIGN IN",
              style: TextStyle(
                  fontSize: fontsize24,
                  fontWeight: FontWeight.w400,
                  color: primaryColor),
            ),
          ),
          SizedBox(
            height: size10,
          ),
          Container(
            height: btnheight,
            width: width,
            decoration: BoxDecoration(
                border: Border.all(width: 0.4, color: Colors.grey),
                borderRadius: BorderRadius.circular(10)),
            child: TextField(
              onChanged: (value) => setState(() => email = value),
              style:
                  TextStyle(fontSize: fontsize16, fontWeight: FontWeight.w400),
              decoration: InputDecoration(
                  border: InputBorder.none,
                  prefixIcon: Icon(
                    Icons.email_outlined,
                    color: Colors.grey,
                    size: iconsize,
                  ),
                  fillColor: Colors.black,
                  hintText: 'Email',
                  hintStyle: TextStyle(
                      fontSize: fontsize16,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey.shade600)),
            ),
          ),
          Container(
            height: btnheight,
            width: width,
            margin: const EdgeInsets.only(top: 20),
            decoration: BoxDecoration(
                border: Border.all(width: 0.4, color: Colors.grey),
                borderRadius: BorderRadius.circular(10)),
            child: TextField(
              onChanged: (value) => setState(() => password = value),
              style:
                  TextStyle(fontSize: fontsize16, fontWeight: FontWeight.w400),
              decoration: InputDecoration(
                  border: InputBorder.none,
                  prefixIcon: Icon(
                    Icons.key,
                    color: Colors.grey,
                    size: iconsize,
                  ),
                  fillColor: Colors.black,
                  hintText: 'Password',
                  hintStyle: TextStyle(
                      fontSize: fontsize16,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey.shade600)),
            ),
          ),
          Row(
            children: [
              Checkbox(
                  value: check,
                  side: BorderSide(color: primary2Color, width: 1.5),
                  onChanged: (bool? newValue) {
                    setState(() {
                      check = newValue!;
                    });
                  },
                  activeColor: primary2Color),
              Text("Remember Me",
                  style: TextStyle(
                      color: primary2Color,
                      fontSize: fontsize14,
                      fontWeight: FontWeight.w400)),
              const Spacer(),
              Text("Forgot Password?",
                  style: TextStyle(
                      color: primary2Color,
                      fontSize: fontsize14,
                      fontWeight: FontWeight.w400)),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 40),
            child: ElevatedButton(
                onPressed: () => EmailAuth().signInWithEmailAndPassword(
                    context: context,
                    password: password.trim(),
                    emailAddress: email.trim()),
                style: ElevatedButton.styleFrom(
                    backgroundColor: primaryColor,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    minimumSize: Size(width, btnheight)),
                child: Text(
                  "SIGN IN",
                  style: TextStyle(
                    fontSize: fontsize16,
                    fontWeight: FontWeight.w700,
                  ),
                )),
          ),
          SizedBox(
            height: size10,
          ),
          TextButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const RegisterScreen()));
            },
            child: Text(
              "Don't have an account? Sign Up",
              style: TextStyle(
                fontSize: fontsize16,
                fontWeight: FontWeight.w400,
                color: Colors.grey,
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
