import 'dart:async';
import 'package:flutter/material.dart';

class Mysplash extends StatefulWidget {
  @override
  _MysplashState createState() => _MysplashState();
}

class _MysplashState extends State<Mysplash> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: 400,
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage("images/dr.jpg"),
          fit: BoxFit.fill,
        )),
      ),
    );
  }
}
