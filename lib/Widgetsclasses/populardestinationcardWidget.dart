
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'FavWidget.dart';

class PopulardestinationWidget extends StatelessWidget {
  final String Dealname;
  final String Placename;
  final String Budget;
  final String img;
  final String Rating;

  const PopulardestinationWidget({Key? key,
  required this.Budget,
    required this.Dealname,
    required this.Placename,
    required this.img,
     required this.Rating
  }) : super(key: key);

  Widget build(BuildContext context) {
    return Container(
        width: 339,
        height: 120,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 12.0, // soften the shadow
              spreadRadius: 0.0, //extend the shadow
              offset: Offset(
                0.0, // Move to right 5  horizontally
                4.0, // Move to bottom 5 Vertically
              ),
            )
          ],
          borderRadius: BorderRadius.all(Radius.circular(15)),
        ),
        child: Row(
          children: [
            SizedBox(
              width: 15,
            ),
            Container(
              width: 74,
              height: 84,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                image: DecorationImage(
                    image: NetworkImage(img),
                    fit: BoxFit.fill,
                    filterQuality: FilterQuality.high),
              ),
            ),
            SizedBox(
              width: 15,
            ),
            Column(
              children: [
                SizedBox(height: 5,),
                Row(
                  children: [
                    SizedBox(width: 190,),
                    FavWidget(ICON: Icons.star, Size: 20),
                    Text(Rating,
                        style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w700
                        )),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),

                Padding(
                  padding:EdgeInsets.only(right: 80),
                  child:  Text(Dealname,
                      style: TextStyle(
                          fontSize: 14, fontWeight: FontWeight.w500)),
                ),

                Padding(
                  padding: EdgeInsets.only(top: 30),
                  child: Row(
                    children: [
                      Icon(Icons.location_on,
                          color: Color.fromRGBO(47, 110, 182, 10)),
                      Text(Placename,
                          style: TextStyle(fontSize: 10)),
                      SizedBox(width: 30,),
                      Text(Budget,
                        style: TextStyle(
                            fontSize: 14
                        ),),
                      Text("/ Perperson",
                      style: TextStyle(
                        fontSize: 10
                      )),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ));
  }
}
