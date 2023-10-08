


import 'package:flutter/cupertino.dart';

class packclass extends StatelessWidget {

  final String placename;

  const packclass({Key? key,
    required this.placename}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(placename),
    );
  }
}
