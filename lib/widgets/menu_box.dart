import 'package:flutter/material.dart';

class MenuWidget extends StatelessWidget {
  final IconData icon;
  const MenuWidget({
    Key? key,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 70),
      child:  Icon(
        icon,
        color: Colors.yellow,
        size:17,
      ),
    );


  }
}
