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
    apiKey: 'AIzaSyDV7yzWUO5d3BWEsmgMEs9HlhDn9UGVzc8',
    appId: '1:486276711430:web:9d1f8b77240ee76722ef87',
    messagingSenderId: '486276711430',
    projectId: 'crisptv-e3355',
    authDomain: 'crisptv-e3355.firebaseapp.com',
    storageBucket: 'crisptv-e3355.appspot.com',
    measurementId: 'G-FTEXK2JL1X',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCLVWz6dg6pRAJac9yHKL8l23dzZp8Q1ew',
    appId: '1:486276711430:android:8e21a8759c99b75422ef87',
    messagingSenderId: '486276711430',
    projectId: 'crisptv-e3355',
    storageBucket: 'crisptv-e3355.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDdqx-P9P6lZe2BvLgsrHBHoe52k_BIWmo',
    appId: '1:486276711430:ios:39e628b3b0ddbece22ef87',
    messagingSenderId: '486276711430',
    projectId: 'crisptv-e3355',
    storageBucket: 'crisptv-e3355.appspot.com',
    iosClientId: '486276711430-popjin6uvar0caoieq5b3hgg5l8v8no9.apps.googleusercontent.com',
    iosBundleId: 'com.example.crisptvMedia',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDdqx-P9P6lZe2BvLgsrHBHoe52k_BIWmo',
    appId: '1:486276711430:ios:39e628b3b0ddbece22ef87',
    messagingSenderId: '486276711430',
    projectId: 'crisptv-e3355',
    storageBucket: 'crisptv-e3355.appspot.com',
    iosClientId: '486276711430-popjin6uvar0caoieq5b3hgg5l8v8no9.apps.googleusercontent.com',
    iosBundleId: 'com.example.crisptvMedia',
  );
}
