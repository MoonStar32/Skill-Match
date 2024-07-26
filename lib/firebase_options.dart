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
    apiKey: 'AIzaSyDrsde-E0l91dcVXvICNyPm8P-uyNhLvGE',
    //  AIzaSyDrsde-E0l91dcVXvICNyPm8P-uyNhLvGE
    //  AIzaSyB3uzHJoxm4x_1vcKAwC_4yBB9Bhn8pyPw old
    appId: '1:1012452947380:web:7aaf8e60dc3622d85caee1',
    messagingSenderId: '1012452947380',
    projectId: 'fluttershyha',
    authDomain: 'fluttershyha.firebaseapp.com',
    storageBucket: 'fluttershyha.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDrsde-E0l91dcVXvICNyPm8P-uyNhLvGE',
    appId: '1:1012452947380:android:14d31eb58a80628b5caee1',
    messagingSenderId: '1012452947380',
    projectId: 'fluttershyha',
    storageBucket: 'fluttershyha.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCdzsvqY7A4lItvluq7SeStLUEijZf-2XE',
    appId: '1:1012452947380:ios:879395088b95c2355caee1',
    messagingSenderId: '1012452947380',
    projectId: 'fluttershyha',
    storageBucket: 'fluttershyha.appspot.com',
    iosClientId:
        '1012452947380-7l3p9c9db1um4or02q3f9n169cu4mml4.apps.googleusercontent.com',
    iosBundleId: 'com.example.fluttershyHa',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCdzsvqY7A4lItvluq7SeStLUEijZf-2XE',
    appId: '1:1012452947380:ios:879395088b95c2355caee1',
    messagingSenderId: '1012452947380',
    projectId: 'fluttershyha',
    storageBucket: 'fluttershyha.appspot.com',
    iosClientId:
        '1012452947380-7l3p9c9db1um4or02q3f9n169cu4mml4.apps.googleusercontent.com',
    iosBundleId: 'com.example.fluttershyHa',
  );
}
