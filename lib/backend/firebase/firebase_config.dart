import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyAzuGHGwTPyoCtEsZffDqfVwEsuJDJ1PLs",
            authDomain: "nielpresidente-64bf3.firebaseapp.com",
            projectId: "nielpresidente-64bf3",
            storageBucket: "nielpresidente-64bf3.appspot.com",
            messagingSenderId: "772072038126",
            appId: "1:772072038126:web:27b78837093d34a53e9dff"));
  } else {
    await Firebase.initializeApp();
  }
}
