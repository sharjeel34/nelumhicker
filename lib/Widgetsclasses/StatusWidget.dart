

import 'package:flutter/cupertino.dart';

class StatusImg extends StatelessWidget {
  final String img;
  final String PLacename;

  const StatusImg({Key? key,
  required this.img,
  required this.PLacename
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          Container(
            width: 64,
            height: 64,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                  color: Color.fromRGBO(
                      47, 110, 182, 10),
                  width: 2),
              image: DecorationImage(
                  image: NetworkImage(
                      img),
                  fit: BoxFit.fill,
                  filterQuality: FilterQuality.high),
            ),
          ),
          Text(PLacename,
              style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w700)),
        ],
    );
  }
}
