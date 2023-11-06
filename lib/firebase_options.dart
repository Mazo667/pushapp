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
        return macos;
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
    apiKey: 'AIzaSyCwXMqragzMxfcMrAE542HdkBEXDD0AxhM',
    appId: '1:900040750101:web:ee5d418e029cdefb5bca1c',
    messagingSenderId: '900040750101',
    projectId: 'flutter-projects-test-85593',
    authDomain: 'flutter-projects-test-85593.firebaseapp.com',
    storageBucket: 'flutter-projects-test-85593.appspot.com',
    measurementId: 'G-W9G8PZQ0VE',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyA5DetRmA-sr1YSIhyg1bYze8Emal0fQLc',
    appId: '1:900040750101:android:769db1383051693d5bca1c',
    messagingSenderId: '900040750101',
    projectId: 'flutter-projects-test-85593',
    storageBucket: 'flutter-projects-test-85593.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyD9QeD3ih9EFxvibu5X8Ve2W37yPx7ziZQ',
    appId: '1:900040750101:ios:7996e202bca4c9c45bca1c',
    messagingSenderId: '900040750101',
    projectId: 'flutter-projects-test-85593',
    storageBucket: 'flutter-projects-test-85593.appspot.com',
    iosBundleId: 'com.maximilianofava.pushapp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyD9QeD3ih9EFxvibu5X8Ve2W37yPx7ziZQ',
    appId: '1:900040750101:ios:8906c8e12180d64a5bca1c',
    messagingSenderId: '900040750101',
    projectId: 'flutter-projects-test-85593',
    storageBucket: 'flutter-projects-test-85593.appspot.com',
    iosBundleId: 'com.maximilianofava.pushapp.RunnerTests',
  );
}
