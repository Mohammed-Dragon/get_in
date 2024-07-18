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
        return windows;
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
    apiKey: 'AIzaSyAQgCOLNOX178h5CqfoNgxmi-Xo5zR16fY',
    appId: '1:791299445507:web:a768835ecad74f902c0f36',
    messagingSenderId: '791299445507',
    projectId: 'getin-b761d',
    authDomain: 'getin-b761d.firebaseapp.com',
    storageBucket: 'getin-b761d.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAhztMts_RfkLs82Pk_pgOxoRN0OB180V8',
    appId: '1:791299445507:android:5472bea6a5ce9a422c0f36',
    messagingSenderId: '791299445507',
    projectId: 'getin-b761d',
    storageBucket: 'getin-b761d.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyA2B6TjWiEXyokiVdEoYA7DwYb4Ei4fPNU',
    appId: '1:791299445507:ios:95da6739eb0a202c2c0f36',
    messagingSenderId: '791299445507',
    projectId: 'getin-b761d',
    storageBucket: 'getin-b761d.appspot.com',
    iosBundleId: 'com.example.getIn',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyA2B6TjWiEXyokiVdEoYA7DwYb4Ei4fPNU',
    appId: '1:791299445507:ios:95da6739eb0a202c2c0f36',
    messagingSenderId: '791299445507',
    projectId: 'getin-b761d',
    storageBucket: 'getin-b761d.appspot.com',
    iosBundleId: 'com.example.getIn',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyAQgCOLNOX178h5CqfoNgxmi-Xo5zR16fY',
    appId: '1:791299445507:web:06564338cce540042c0f36',
    messagingSenderId: '791299445507',
    projectId: 'getin-b761d',
    authDomain: 'getin-b761d.firebaseapp.com',
    storageBucket: 'getin-b761d.appspot.com',
  );
}