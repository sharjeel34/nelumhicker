import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'RecomendedplacesWidget.dart';

class Listviewimg extends StatefulWidget {
  const Listviewimg({Key? key}) : super(key: key);

  @override
  State<Listviewimg> createState() => _ListviewimgState();
}

class _ListviewimgState extends State<Listviewimg> {
  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        height: 180,
        width: 371,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: <Widget>[
            SizedBox(
              width: 10,
            ),
            ReccomendedPlaces(Rating: "3.5",Placename: "Shogran Valley",img: "https://www.travel-culture.com/images/shogran.jpg"),
            SizedBox(width: 10,),
            ReccomendedPlaces(Rating: "4.5",Placename: "Kaghan Valley",img: "https://journeyonair.com/sites/default/files/2020-12/river_swat_pakistan_3.jpg"),
            SizedBox(width: 10,),
            ReccomendedPlaces(Rating: "5",Placename: "Siri Paye",img: "https://www.natureadventureclub.pk/blog/wp-content/uploads/2019/10/paaye-1.jpg")
            ,SizedBox(width: 10,),
            ReccomendedPlaces(Rating: "5",Placename: "Malam Jabba",img: "https://res.cloudinary.com/raastay/images/f_auto,q_auto/v1629101749/Malam-Jabba2/Malam-Jabba2.jpg",
            )
            ,SizedBox(width: 10,),
            ReccomendedPlaces(Rating: "5",Placename: "Skardu",img: "https://upload.wikimedia.org/wikipedia/commons/9/9f/Shangrila_resort_skardu.jpg")
            ,SizedBox(width: 10,),
            ReccomendedPlaces(Rating: "5",Placename: "Kumrat",img: "https://upload.wikimedia.org/wikipedia/commons/thumb/d/db/Evening_shades.jpg/1200px-Evening_shades.jpg")
            ,SizedBox(width: 10,),
            ReccomendedPlaces(Rating: "5",Placename: "Fair Meadow",img: "https://images.squarespace-cdn.com/content/v1/5c68e11ba568276366c47f73/1562525617848-LC2FDU0UZ3QHYQEJPDUQ/Nanga+Parbat+Hiking.jpg")
            ,SizedBox(width: 10,),
          ],
        ),
      ),
    );
  }
}
