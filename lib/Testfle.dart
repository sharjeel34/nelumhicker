


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Testclass extends StatefulWidget {
  const Testclass({Key? key}) : super(key: key);

  @override
  State<Testclass> createState() => _TestclassState();
}

class _TestclassState extends State<Testclass> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Text("Error Page"),
        ),
      ),
    );
  }
}
