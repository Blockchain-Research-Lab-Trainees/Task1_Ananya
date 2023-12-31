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
    apiKey: 'AIzaSyAzcZKrcEEi3aHW-YkX9z5Yr7JjhOLV2UA',
    appId: '1:223923671470:web:e9f4511713d7466a41b83f',
    messagingSenderId: '223923671470',
    projectId: 'task-1-brl',
    authDomain: 'task-1-brl.firebaseapp.com',
    storageBucket: 'task-1-brl.appspot.com',
    measurementId: 'G-Y4DQ0FHTVL',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDO6_b5eml2q-dR0J2eZxS5Q-9TGCjhPyU',
    appId: '1:223923671470:android:af5148f848a4b22841b83f',
    messagingSenderId: '223923671470',
    projectId: 'task-1-brl',
    storageBucket: 'task-1-brl.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAKI6OTspQZsQhsEY57wxJe7zz5eLnl8rk',
    appId: '1:223923671470:ios:b38961737bf3469c41b83f',
    messagingSenderId: '223923671470',
    projectId: 'task-1-brl',
    storageBucket: 'task-1-brl.appspot.com',
    iosBundleId: 'com.example.brlTask1',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAKI6OTspQZsQhsEY57wxJe7zz5eLnl8rk',
    appId: '1:223923671470:ios:a32886f37d101c9a41b83f',
    messagingSenderId: '223923671470',
    projectId: 'task-1-brl',
    storageBucket: 'task-1-brl.appspot.com',
    iosBundleId: 'com.example.brlTask1.RunnerTests',
  );
}
