// File: lib/firebase_options.dart
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart' show defaultTargetPlatform, kIsWeb, TargetPlatform;

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    throw UnsupportedError(
      'DefaultFirebaseOptions are not supported for this platform.',
    );
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyC7LDpc2gAmUNdLDSutsYm6VbDK6JBW4BE',
    appId: '1:96483522208:web:placeholder_app_id', // TODO: You must verify the Web App ID in Firebase Console settings
    messagingSenderId: '96483522208',
    projectId: 'civilprotectiondz',
    authDomain: 'civilprotectiondz.firebaseapp.com',
    storageBucket: 'civilprotectiondz.firebasestorage.app',
    databaseURL: 'https://civilprotectiondz-default-rtdb.europe-west1.firebasedatabase.app',
  );
}
