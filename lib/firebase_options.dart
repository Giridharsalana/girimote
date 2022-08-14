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
    apiKey: 'AIzaSyBVgZH8bCTKJ1dD8C60H5wPg299o9UIsbY',
    appId: '1:299511919695:web:0917af78a49f5a544b663a',
    messagingSenderId: '299511919695',
    projectId: 'girimote-b5fa2',
    authDomain: 'girimote-b5fa2.firebaseapp.com',
    storageBucket: 'girimote-b5fa2.appspot.com',
    measurementId: 'G-D9YTCX6EF0',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyC05cmp9qy1F3rlow6ogQJguVS7cTkfmCI',
    appId: '1:299511919695:android:d354003eaf7141bb4b663a',
    messagingSenderId: '299511919695',
    projectId: 'girimote-b5fa2',
    storageBucket: 'girimote-b5fa2.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAjVFu0n-KFj_vW1jDgqGmNncmbxD-zwBQ',
    appId: '1:299511919695:ios:d68671c6b4f2c3b34b663a',
    messagingSenderId: '299511919695',
    projectId: 'girimote-b5fa2',
    storageBucket: 'girimote-b5fa2.appspot.com',
    iosClientId: '299511919695-is5o6t816n0kvlm4f93k780bto3j2bmm.apps.googleusercontent.com',
    iosBundleId: 'com.example.girimote',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAjVFu0n-KFj_vW1jDgqGmNncmbxD-zwBQ',
    appId: '1:299511919695:ios:d68671c6b4f2c3b34b663a',
    messagingSenderId: '299511919695',
    projectId: 'girimote-b5fa2',
    storageBucket: 'girimote-b5fa2.appspot.com',
    iosClientId: '299511919695-is5o6t816n0kvlm4f93k780bto3j2bmm.apps.googleusercontent.com',
    iosBundleId: 'com.example.girimote',
  );
}