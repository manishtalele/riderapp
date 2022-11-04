import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:riderapp/homescreen.dart';
import 'package:riderapp/login.dart';

class EmailAuth {
  FirebaseAuth auth = FirebaseAuth.instance;

  createUserWithEmailAndPassword(
      {required String emailAddress,
      required String password,
      required BuildContext context}) async {
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
            email: emailAddress,
            password: password,
          )
          .whenComplete(() => Navigator.push(context,
              MaterialPageRoute(builder: ((context) => const HomeScreen()))));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

  signInWithEmailAndPassword(
      {required String emailAddress,
      required String password,
      required BuildContext context}) async {
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: emailAddress, password: password)
          .whenComplete(() => auth.currentUser!.uid != ""
              ? Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => const HomeScreen()),
                  (route) => false)
              : null);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }

  logout({required BuildContext context}) {
    auth.signOut().whenComplete(() => Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => const LoginScreen()),
        (route) => false));
  }
}
