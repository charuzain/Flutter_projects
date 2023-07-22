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
    apiKey: 'AIzaSyDQ3HAPOCFYNqrurLRfujfdCKiZRSZfPtI',
    appId: '1:9032177796:web:ad21fc0f2d5da572c80ad1',
    messagingSenderId: '9032177796',
    projectId: 'chat-e634e',
    authDomain: 'chat-e634e.firebaseapp.com',
    storageBucket: 'chat-e634e.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDSUzwqdsqRUvLLY-M_xmG2gfg8mDsW3BM',
    appId: '1:9032177796:android:929075bdca0032e0c80ad1',
    messagingSenderId: '9032177796',
    projectId: 'chat-e634e',
    storageBucket: 'chat-e634e.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAjHHU4wC4f3Q84ICmqM_EBRFP9XrQAKNg',
    appId: '1:9032177796:ios:85d18dc56bf7bfa7c80ad1',
    messagingSenderId: '9032177796',
    projectId: 'chat-e634e',
    storageBucket: 'chat-e634e.appspot.com',
    iosClientId: '9032177796-6fu8fckuppdrk33ooabeeqsr6d7jhtno.apps.googleusercontent.com',
    iosBundleId: 'com.example.chatApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAjHHU4wC4f3Q84ICmqM_EBRFP9XrQAKNg',
    appId: '1:9032177796:ios:85d18dc56bf7bfa7c80ad1',
    messagingSenderId: '9032177796',
    projectId: 'chat-e634e',
    storageBucket: 'chat-e634e.appspot.com',
    iosClientId: '9032177796-6fu8fckuppdrk33ooabeeqsr6d7jhtno.apps.googleusercontent.com',
    iosBundleId: 'com.example.chatApp',
  );
}
