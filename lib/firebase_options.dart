// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyApld1vHOKrsAB4s3p3uZxqfVWVWNWQskA',
    appId: '1:152014926712:web:6e70dd0ab5354fbcd28e8d',
    messagingSenderId: '152014926712',
    projectId: 'freemorsel-2ea41',
    authDomain: 'freemorsel-2ea41.firebaseapp.com',
    databaseURL: 'https://freemorsel-2ea41-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'freemorsel-2ea41.appspot.com',
    measurementId: 'G-79L99FM0VL',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBMbd330IzDI03cuY6JddtsthH_lCuEXlk',
    appId: '1:152014926712:android:dfe3d597e7b8281cd28e8d',
    messagingSenderId: '152014926712',
    projectId: 'freemorsel-2ea41',
    databaseURL: 'https://freemorsel-2ea41-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'freemorsel-2ea41.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyC4d3nu_PwDmNnpv_mlNtVrpDr59BJHWso',
    appId: '1:152014926712:ios:63d105b3b6527963d28e8d',
    messagingSenderId: '152014926712',
    projectId: 'freemorsel-2ea41',
    databaseURL: 'https://freemorsel-2ea41-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'freemorsel-2ea41.appspot.com',
    androidClientId: '152014926712-3dfun6k7gtd5dj22g6sskt8nb5qn56dk.apps.googleusercontent.com',
    iosClientId: '152014926712-p7v4lgan2q7e3pct7f1b6q0246jr80a8.apps.googleusercontent.com',
    iosBundleId: 'com.example.riderapp',
  );
}
