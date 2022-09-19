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
    apiKey: 'AIzaSyCZDcC_NcYdJLhceEzoHKbWk4bjTKlGsjY',
    appId: '1:987567720842:web:0f2d2d67136e5ba947e073',
    messagingSenderId: '987567720842',
    projectId: 'fir-authentication-app-a7337',
    authDomain: 'fir-authentication-app-a7337.firebaseapp.com',
    storageBucket: 'fir-authentication-app-a7337.appspot.com',
    measurementId: 'G-0S3RGD1FN5',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDMzLJu3usb0Gn33jQQyBtGHBijqfVSraQ',
    appId: '1:987567720842:android:a99ea705fa1cd76d47e073',
    messagingSenderId: '987567720842',
    projectId: 'fir-authentication-app-a7337',
    storageBucket: 'fir-authentication-app-a7337.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyD_UjuykPnz2PZ-JGEvw7OMa0E7vjMLywY',
    appId: '1:987567720842:ios:116336291dffa6b047e073',
    messagingSenderId: '987567720842',
    projectId: 'fir-authentication-app-a7337',
    storageBucket: 'fir-authentication-app-a7337.appspot.com',
    iosClientId: '987567720842-v72ugv7cvbilp2aekpjth4bktsvou2k7.apps.googleusercontent.com',
    iosBundleId: 'com.example.firebaseAuthenticationApp',
  );
}
