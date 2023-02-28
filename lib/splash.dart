import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:riderapp/screens/homescreen.dart';
import 'package:riderapp/login.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    FirebaseAuth auth = FirebaseAuth.instance;
    double width = MediaQuery.of(context).size.width;
    return AnimatedSplashScreen(
      duration: 1500,
      splash: SizedBox(
          width: width / 2,
          height: width / 2,
          child: Image.asset("assets/rider_logo.png")),
      splashTransition: SplashTransition.fadeTransition,
      pageTransitionType: PageTransitionType.fade,
      nextScreen:
          auth.currentUser != null ? const HomeScreen() : const LoginScreen(),
    );
  }
}
