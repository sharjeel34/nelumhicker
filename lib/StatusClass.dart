import 'package:flutter/cupertino.dart';

import 'Widgetsclasses/StatusWidget.dart';

class Statusimg extends StatefulWidget {
  const Statusimg({Key? key}) : super(key: key);

  @override
  State<Statusimg> createState() => _StatusimgState();
}

class _StatusimgState extends State<Statusimg> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 100,
        width: 371,
        child: ListView(scrollDirection: Axis.horizontal, children: <Widget>[
          Container(
            child: Row(
              children: [
                StatusImg(
                    img:
                        "https://journeyonair.com/sites/default/files/2020-12/river_swat_pakistan_3.jpg",
                    PLacename: "Kaghan Valley"),

                SizedBox(width: 10,),

                StatusImg(
                    img:
                    "https://www.travel-culture.com/images/shogran.jpg",
                    PLacename: "Neelum Valley"),

                SizedBox(width: 10,),

                StatusImg(
                    img:
                    "https://www.natureadventureclub.pk/blog/wp-content/uploads/2019/10/paaye-1.jpg",
                    PLacename: "Siri Paye"),

                SizedBox(width: 10,),

                StatusImg(
                    img:
                    "https://res.cloudinary.com/raastay/images/f_auto,q_auto/v1629101749/Malam-Jabba2/Malam-Jabba2.jpg",
                    PLacename: "Malam Jabba"),

                SizedBox(width: 10,),

                StatusImg(
                    img:
                    "https://upload.wikimedia.org/wikipedia/commons/9/9f/Shangrila_resort_skardu.jpg",
                    PLacename: "Skardu"),

                SizedBox(width: 10,),

                StatusImg(
                    img:
                    "https://upload.wikimedia.org/wikipedia/commons/thumb/d/db/Evening_shades.jpg/1200px-Evening_shades.jpg",
                    PLacename: "Kumrat"),

                SizedBox(width: 10,),

                StatusImg(
                    img:
                    "https://images.squarespace-cdn.com/content/v1/5c68e11ba568276366c47f73/1562525617848-LC2FDU0UZ3QHYQEJPDUQ/Nanga+Parbat+Hiking.jpg",
                    PLacename: "Fair Meadows"),

              ],
            ),
          ),
        ]));
  }
}
