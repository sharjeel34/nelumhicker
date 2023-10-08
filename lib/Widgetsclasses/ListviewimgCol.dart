import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nelumhicker/Widgetsclasses/populardestinationcardWidget.dart';

class ListVieImgCol extends StatefulWidget {
  const ListVieImgCol({Key? key}) : super(key: key);

  @override
  State<ListVieImgCol> createState() => _ListVieImgColState();
}

class _ListVieImgColState extends State<ListVieImgCol> {
  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        width: 371,
        child: Column(
          children: <Widget>[
            PopulardestinationWidget(Budget: '500',Dealname: "Best Eid Package",img: "https://upload.wikimedia.org/wikipedia/commons/thumb/e/e3/Hunza-city.jpg/800px-Hunza-city.jpg",Placename: "Naran Valley",Rating: "4.5"),
            SizedBox(
              height: 10,
            ),
            PopulardestinationWidget(Budget: '800',Dealname: "Ramzan Package",img: "https://rjeem.com/wp-content/uploads/2021/04/%D8%AA%D9%81%D8%B3%D9%8A%D8%B1-%D8%AD%D9%84%D9%85-%D8%A5%D9%81%D8%B7%D8%A7%D8%B1-%D8%A7%D9%84%D8%B5%D8%A7%D8%A6%D9%85-%D9%82%D8%A8%D9%84-%D8%A7%D9%84%D8%A2%D8%B0%D8%A7%D9%86-%D9%84%D9%84%D8%B9%D8%B2%D8%A8%D8%A7%D8%A1-%D8%A8%D8%A7%D9%84%D8%AA%D9%81%D8%B5%D9%8A%D9%84.jpg",Placename: "SeaView Aftari",Rating: "4.5"),
          ],
        ),
      ),
    );
  }
}
