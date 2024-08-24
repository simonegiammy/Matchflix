// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
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

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBCmWhBStIikb4yFY4wS5lmW4hp5dj1Ryk',
    appId: '1:435976508055:android:be1aeebb06568a039a4fd2',
    messagingSenderId: '435976508055',
    projectId: 'matchflix-29b5f',
    databaseURL: 'https://matchflix-29b5f-default-rtdb.europe-west1.firebasedatabase.app',
    storageBucket: 'matchflix-29b5f.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAcq_zKoR5zo4LQci-NMKH9dIaii61TiZk',
    appId: '1:435976508055:ios:3f2990b1f29b35489a4fd2',
    messagingSenderId: '435976508055',
    projectId: 'matchflix-29b5f',
    databaseURL: 'https://matchflix-29b5f-default-rtdb.europe-west1.firebasedatabase.app',
    storageBucket: 'matchflix-29b5f.appspot.com',
    iosBundleId: 'com.example.newsApp',
  );
}
