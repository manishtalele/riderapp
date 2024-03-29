import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:riderapp/screens/homescreen.dart';
import 'package:riderapp/screens/login.dart';

class EmailAuth {
  FirebaseAuth auth = FirebaseAuth.instance;

  createUserWithEmailAndPassword({
    required String emailAddress,
    required String password,
  }) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        if (kDebugMode) {
          print('The password provided is too weak.');
        }
      } else if (e.code == 'email-already-in-use') {
        if (kDebugMode) {
          print('The account already exists for that email.');
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  Future signInWithEmailAndPassword(
      {required String emailAddress,
      required String password,
      required BuildContext context}) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: emailAddress, password: password)
          .then((value) => {
                log(value.user.toString()),
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (context) => const HomeScreen()),
                    (route) => false)
              });
    } catch (e) {
      if (e == 'user-not-found') {
        if (kDebugMode) {
          print('No user found for that email.');
        }
      } else if (e == 'wrong-password') {
        if (kDebugMode) {
          print('Wrong password provided for that user.');
        }
      }
    }
  }

  logout({required BuildContext context}) {
    auth.signOut().whenComplete(() => Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => const LoginScreen()),
        (route) => false));
  }
}
