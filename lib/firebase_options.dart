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
    apiKey: 'AIzaSyArNIWM7Y5TDiOXoAvtqaHoDCos9L5KD-k',
    appId: '1:931635906837:web:7e27cd5c5679328632411c',
    messagingSenderId: '931635906837',
    projectId: 'scissors-51aed',
    authDomain: 'scissors-51aed.firebaseapp.com',
    storageBucket: 'scissors-51aed.appspot.com',
    measurementId: 'G-M3E5X58Y0H',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCZUIFOuhOs8TbcUhkZTxSqbQXzcwlmSR4',
    appId: '1:931635906837:android:fb4f55f48db6a72632411c',
    messagingSenderId: '931635906837',
    projectId: 'scissors-51aed',
    storageBucket: 'scissors-51aed.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCOXq5yMubhuLvTMS3s9u0TmM1rTYzx_8c',
    appId: '1:931635906837:ios:dab9ff0ec91d1d3832411c',
    messagingSenderId: '931635906837',
    projectId: 'scissors-51aed',
    storageBucket: 'scissors-51aed.appspot.com',
    iosBundleId: 'com.example.timeslot',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCOXq5yMubhuLvTMS3s9u0TmM1rTYzx_8c',
    appId: '1:931635906837:ios:9d333a12cdd8565e32411c',
    messagingSenderId: '931635906837',
    projectId: 'scissors-51aed',
    storageBucket: 'scissors-51aed.appspot.com',
    iosBundleId: 'com.example.timeslot.RunnerTests',
  );
}
