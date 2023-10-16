import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginController with ChangeNotifier {

  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  // set firebaseAuth(FirebaseAuth firebaseAuth) {
  //   _firebaseAuth = firebaseAuth;
  // }

  FirebaseAuth get firebaseAuth {
    return _firebaseAuth;
  }

}