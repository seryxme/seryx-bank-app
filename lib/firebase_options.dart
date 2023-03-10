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
    apiKey: 'AIzaSyBda31K40pBDkxOK1mecmlXKuvWRarN7Hc',
    appId: '1:526396790770:web:c1dfb0c02061a46cf53d6b',
    messagingSenderId: '526396790770',
    projectId: 'seryx-bank',
    authDomain: 'seryx-bank.firebaseapp.com',
    storageBucket: 'seryx-bank.appspot.com',
    measurementId: 'G-M6R2KWDY74',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCk1KrNv45MwKsv_pr5duoY_7PNrV31Q5Y',
    appId: '1:526396790770:android:04b60c3280b4ce12f53d6b',
    messagingSenderId: '526396790770',
    projectId: 'seryx-bank',
    storageBucket: 'seryx-bank.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAZCOeCkqeQ_x76o7Qgd8xgzwf27v_xnZk',
    appId: '1:526396790770:ios:49bed4e3362c9c4af53d6b',
    messagingSenderId: '526396790770',
    projectId: 'seryx-bank',
    storageBucket: 'seryx-bank.appspot.com',
    iosClientId: '526396790770-q0m2u6v5787hjoe68t2mp29bidiuboif.apps.googleusercontent.com',
    iosBundleId: 'com.seryxbank.seryxBank',
  );
}
