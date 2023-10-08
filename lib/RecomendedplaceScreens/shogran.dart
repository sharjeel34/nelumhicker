import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Widgetsclasses/PageScrollView.dart';
import 'Testpage1.dart';

class shogran extends StatefulWidget {
 final String img;
 final String Cname;


  const shogran({
  required this.img,
  required this.Cname});

  @override
  State<shogran> createState() => _shogranState(img:img,Cname:Cname);
}

class _shogranState extends State<shogran> {
  var img;
  var Cname;

  _shogranState({this.img,this.Cname});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          Container(
              height: MediaQuery. of(context). size. height,
              width:MediaQuery. of(context). size. width ,
              decoration: BoxDecoration(
                image:DecorationImage(
                    fit:BoxFit.cover,
                  image: NetworkImage(img)
                ),

              ),
             child: Column(
               children: [
                 SizedBox(height: 300,),
                 Container(
                   child: Testpage(),
                   margin: const EdgeInsets.only(top: 50),
                   decoration: const BoxDecoration(
                     color: Colors.white,
                     borderRadius: BorderRadius.vertical(
                       top: Radius.circular(30),
                     ),
                   ),
                 )
               ],
             ),
          ),

        ],
      ),
    );
  }
}
