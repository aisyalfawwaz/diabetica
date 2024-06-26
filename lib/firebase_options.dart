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
    apiKey: 'AIzaSyBp5z63ZUE_YWGiosW7yg4L4NthYcCix6g',
    appId: '1:571812375124:web:59f142891dda67e9df5bc1',
    messagingSenderId: '571812375124',
    projectId: 'diabetica-1e76e',
    authDomain: 'diabetica-1e76e.firebaseapp.com',
    storageBucket: 'diabetica-1e76e.appspot.com',
    measurementId: 'G-C4L3FBVDJE',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDkFZNQcs6BjXYPf0G3Q4gpyM2A5l5ETLI',
    appId: '1:571812375124:android:18314821117ba4b6df5bc1',
    messagingSenderId: '571812375124',
    projectId: 'diabetica-1e76e',
    storageBucket: 'diabetica-1e76e.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDL6rFyBLAAMytZcNDymrnyyAUFR5CVcgM',
    appId: '1:571812375124:ios:83b25a43cbbdfa1fdf5bc1',
    messagingSenderId: '571812375124',
    projectId: 'diabetica-1e76e',
    storageBucket: 'diabetica-1e76e.appspot.com',
    iosClientId:
        '571812375124-t3avne357a0jdhj11p7djbul04f0faqr.apps.googleusercontent.com',
    iosBundleId: 'com.example.diabetica',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDL6rFyBLAAMytZcNDymrnyyAUFR5CVcgM',
    appId: '1:571812375124:ios:fe9bb7b97be10885df5bc1',
    messagingSenderId: '571812375124',
    projectId: 'diabetica-1e76e',
    storageBucket: 'diabetica-1e76e.appspot.com',
    iosClientId:
        '571812375124-kj79gmtrulfd1p9c72qvakgub87gu48e.apps.googleusercontent.com',
    iosBundleId: 'com.example.diabetica.RunnerTests',
  );
}
