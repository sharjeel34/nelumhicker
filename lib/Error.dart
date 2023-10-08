
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Errorpage extends StatelessWidget {
  const Errorpage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Text("Error Occure 404"),
        ),
      ),
    );
  }
}
