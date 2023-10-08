import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:nelumhicker/New/home.dart';
import 'package:nelumhicker/screen/home_screen.dart';

import '../Opners/opner1.dart';

class Splashservice {
  void ismainpage(BuildContext context) {
    Timer(const Duration(seconds: 4),
        () async {

      if (FirebaseAuth.instance.currentUser != null){
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => contro()));
      }
      else {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Opner1()));
      }

    });

  }
}
