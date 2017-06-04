import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'myApp.dart';

bool isLoggedIn = false;
String jwt = "";

FirebaseUser connectedUser;

void main() {
  runApp(new MyApp());
}
