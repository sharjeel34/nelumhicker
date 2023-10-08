import 'package:flutter/material.dart';

class FavWidget extends StatelessWidget {
  final IconData ICON;
  final double Size;
  const FavWidget({
    Key? key,
    required this.ICON,
    required this.Size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Icon(
      ICON,
      size: Size,
      color: Colors.yellow,
    );


  }
}
