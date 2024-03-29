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
    apiKey: 'AIzaSyBSznuy0wgjVPWocifjuwHzq9_824cg2Z4',
    appId: '1:186709263983:web:6e14c44d4cbceef2f02f9a',
    messagingSenderId: '186709263983',
    projectId: 'chat-app-c20fa',
    authDomain: 'chat-app-c20fa.firebaseapp.com',
    storageBucket: 'chat-app-c20fa.appspot.com',
    measurementId: 'G-J2B3N23BFH',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDeVdWgosEYneV8NCcKlXQ5Sw0ZL6srwK0',
    appId: '1:186709263983:android:9ee628048c4e62d8f02f9a',
    messagingSenderId: '186709263983',
    projectId: 'chat-app-c20fa',
    storageBucket: 'chat-app-c20fa.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCeAcfhjRJfeovTv7sLNlkT3rhAsReZRyM',
    appId: '1:186709263983:ios:0aab37be0eb51cb5f02f9a',
    messagingSenderId: '186709263983',
    projectId: 'chat-app-c20fa',
    storageBucket: 'chat-app-c20fa.appspot.com',
    iosClientId: '186709263983-hrj2co86b97n4pf79pg90v9dqk8p7s7m.apps.googleusercontent.com',
    iosBundleId: 'com.example.zoomplay',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCeAcfhjRJfeovTv7sLNlkT3rhAsReZRyM',
    appId: '1:186709263983:ios:381b5c98f6d6763cf02f9a',
    messagingSenderId: '186709263983',
    projectId: 'chat-app-c20fa',
    storageBucket: 'chat-app-c20fa.appspot.com',
    iosClientId: '186709263983-kidts6al29b88p7q5ap1iol7ce14a7pd.apps.googleusercontent.com',
    iosBundleId: 'com.example.zoomplay.RunnerTests',
  );
}
