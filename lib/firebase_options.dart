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
    apiKey: 'AIzaSyCmTxkJwkmRObIerZBVIhM7ADMc1pSm2hs',
    appId: '1:193418836881:web:9e3ce06f90aceb74f43830',
    messagingSenderId: '193418836881',
    projectId: 'chat-app-1cf2d',
    authDomain: 'chat-app-1cf2d.firebaseapp.com',
    storageBucket: 'chat-app-1cf2d.appspot.com',
    measurementId: 'G-VY5V6V1WPY',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDoggPE7YjAoTW3yi-dzzbWGI_9q_6ZxuA',
    appId: '1:193418836881:android:b8583bed438e33abf43830',
    messagingSenderId: '193418836881',
    projectId: 'chat-app-1cf2d',
    storageBucket: 'chat-app-1cf2d.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAj9BmhecorVM02eHXzyISe4lAqJNA8hmA',
    appId: '1:193418836881:ios:020114e824629f5df43830',
    messagingSenderId: '193418836881',
    projectId: 'chat-app-1cf2d',
    storageBucket: 'chat-app-1cf2d.appspot.com',
    iosClientId: '193418836881-p3fbrg9mf4ub6gdugdmn0knobts30rn0.apps.googleusercontent.com',
    iosBundleId: 'com.example.chatApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAj9BmhecorVM02eHXzyISe4lAqJNA8hmA',
    appId: '1:193418836881:ios:99fb7af642fdfae5f43830',
    messagingSenderId: '193418836881',
    projectId: 'chat-app-1cf2d',
    storageBucket: 'chat-app-1cf2d.appspot.com',
    iosClientId: '193418836881-4ndfhgjh6qa47o85dmcdq9b9rl74741q.apps.googleusercontent.com',
    iosBundleId: 'com.example.chatApp.RunnerTests',
  );
}