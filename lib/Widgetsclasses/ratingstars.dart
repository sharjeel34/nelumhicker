
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets/menu_box.dart';

class Ratingstar extends StatefulWidget {
  const Ratingstar({Key? key}) : super(key: key);

  @override
  State<Ratingstar> createState() => _RatingstarState();
}

class _RatingstarState extends State<Ratingstar> {
  @override
  Widget build(BuildContext context) {
    return  Container(
      margin: const EdgeInsets.only(top: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          MenuWidget(
            icon: Icons.star,
          ),
          MenuWidget(
            icon: Icons.star,
          ),
          MenuWidget(
            icon: Icons.star,
          ),
          MenuWidget(
            icon: Icons.star,
          ),
          MenuWidget(
            icon: Icons.star_border,
          ),
        ],
      ),
    );
  }
}
