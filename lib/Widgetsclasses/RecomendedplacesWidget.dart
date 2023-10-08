
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../RecomendedplaceScreens/shogran.dart';
import '../Testfle.dart';
import '../placespackages/packageclass.dart';
import 'FavWidget.dart';

class ReccomendedPlaces extends StatelessWidget {
  final String Placename;
  final String Rating;
  final String img;

  const ReccomendedPlaces({Key? key,
  required this.Rating,
    required this.img,
    required this.Placename
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  InkWell(
      child: Container(
          width: 140,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black,
                blurRadius: 2.0, // soften the shadow
                spreadRadius: 0.0, //extend the shadow
                offset: Offset(
                  0.0, // Move to right 5  horizontally
                  4.0, // Move to bottom 5 Vertically
                ),
              )
            ],
            borderRadius: BorderRadius.all(Radius.circular(15)),
            image: DecorationImage(
                image: NetworkImage(img),
                fit: BoxFit.fitHeight,
                filterQuality: FilterQuality.high),
          ),
          child:Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                margin: EdgeInsets.only(top:10,right: 10),
                width: 25,
                height: 25,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(5))
                ),
                child: Icon(Icons.heart_broken,color: Colors.red,size: 15),
              ),
              SizedBox(height: 120,),
              Container(
                  child:
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(Placename,
                          style:  TextStyle(
                              color: Colors.white,
                              fontSize: 14 ,
                            fontWeight: FontWeight.w900,
                            fontFamily: "sans-serif-condensed "
                          )),
                      SizedBox(width: 10,),
                      FavWidget(ICON: Icons.star,Size:17),
                      Text(Rating,
                          style: TextStyle(
                              fontSize: 10,
                              color: Colors.white
                          )),
                    ],
                  )
              ),

            ],
          ),
      ),

      onTap: () {
        if ( Placename == "Shogran Valley" ){
          Navigator.push(context,MaterialPageRoute(builder: (context) => shogran(img: img ,Cname: Placename ),)) ;
        }
        else if( Placename == "Neelum Valley" ){
          Navigator.push(context,MaterialPageRoute(builder: (context) => Testclass(),)) ;
        }
        else {
          Navigator.push(context,MaterialPageRoute(builder: (context) => Testclass(),)) ;
        }
      },
    );
  }
}
