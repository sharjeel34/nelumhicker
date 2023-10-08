
import 'package:flutter/material.dart';

import '../../../../generated/assets.dart';
import '../../../core/color_const.dart';

Widget  ContainerWithImAge(context){
  return  Column(
    children: [
      Container(
        height: 250,
        width: MediaQuery.of(context).size.width,
        color: kLightGreenColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(Assets.imagesLogin,fit: BoxFit.cover,
                height: 110,
                width:110),
            const SizedBox(height: 15,),
            const Text('NeelumHicker',style: TextStyle(fontSize: 25,color: Colors.white),),
          ],
        ),
      ),
    ],
  );
}