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

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyAdPEx6hF1KFLZcdJK2fM7kzOFrXUse6wI',
    appId: '1:1028778722262:web:cfc736809e12c497c8da77',
    messagingSenderId: '1028778722262',
    projectId: 'wahala-testapp-project',
    authDomain: 'wahala-testapp-project.firebaseapp.com',
    storageBucket: 'wahala-testapp-project.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyA_W24WmYCVGW5tQZKGxuinKJv08bzfI1E',
    appId: '1:1028778722262:android:7a308166f69575bec8da77',
    messagingSenderId: '1028778722262',
    projectId: 'wahala-testapp-project',
    storageBucket: 'wahala-testapp-project.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyD4pezLUsadqcMJh8M1UN-lgrbK1fr9UYc',
    appId: '1:1028778722262:ios:634b5ec1c34701e4c8da77',
    messagingSenderId: '1028778722262',
    projectId: 'wahala-testapp-project',
    storageBucket: 'wahala-testapp-project.appspot.com',
    iosBundleId: 'com.example.labari',
  );

}