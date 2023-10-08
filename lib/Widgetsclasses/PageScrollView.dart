import 'package:flutter/material.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:nelumhicker/Widgetsclasses/ratingstars.dart';
import '../StatusClass.dart';
import 'ListviewImages.dart';
import 'ListviewimgCol.dart';

class Mystatefullwidget extends StatefulWidget {
  const Mystatefullwidget({Key? key}) : super(key: key);

  @override
  State<Mystatefullwidget> createState() => _MystatefullwidgetState();
}

class _MystatefullwidgetState extends State<Mystatefullwidget> {
  @override
  Widget build(BuildContext context) {
    late GoogleMapController mapController;

    final LatLng _center = const LatLng(45.521563, -122.677433);

    void _onMapCreated(GoogleMapController controller) {
      mapController = controller;
    }


    return DefaultTextStyle(
      style: Theme.of(context).textTheme.bodyMedium!,
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints viewportConstraints) {
          return SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: viewportConstraints.maxHeight,
              ),
              child: IntrinsicHeight(
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 10,
                    ),
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.only(top: 10),
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(45),
                          ),
                        ),
                        child: Column(
                          children: [
                            Statusimg(),
                            SizedBox(height: 30),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Padding(
                                    padding: EdgeInsets.only(right: 180),
                                    child: Text(
                                      "Recomended",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 17),
                                    )),
                                Text(
                                  "Viewall",
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.normal),
                                )
                              ],
                            ),
                            SizedBox(height: 20),
                            Listviewimg(),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Padding(
                                    padding: EdgeInsets.only(right: 125),
                                    child: Text(
                                      "Popular Destination",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 17),
                                    )),
                                Text(
                                  "Viewall",
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.normal),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            ListVieImgCol(),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                    padding: EdgeInsets.only(left: 35),
                                    child: Text(
                                      "Last Minutes Deal",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 17),
                                    )),
                              ],
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Container(
                              width: 337,
                              height: 147,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
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
                              ),
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Container(
                                    width: 130,
                                    height: 126,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: NetworkImage(
                                              "https://upload.wikimedia.org/wikipedia/commons/thumb/e/e3/Hunza-city.jpg/800px-Hunza-city.jpg"),
                                          filterQuality: FilterQuality.high,
                                          fit: BoxFit.fill),
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                      color: Colors.white,
                                    ),
                                  ),
                                  Container(
                                      padding:
                                          EdgeInsets.only(left: 10, top: 20),
                                      child: Column(
                                        children: [
                                          Text(
                                            "Murre",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 24,
                                                color: Color.fromRGBO(
                                                    47, 110, 182, 10)),
                                          ),
                                          Text("2 days Tour",
                                              style: TextStyle(fontSize: 12)),
                                          SizedBox(
                                            height: 3,
                                          ),
                                          RichText(
                                            text: TextSpan(
                                              text: '5000 ',
                                              style:
                                                  DefaultTextStyle.of(context)
                                                      .style,
                                              children: const <TextSpan>[
                                                TextSpan(
                                                    text: '/per person',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        fontSize: 10,
                                                        color: Colors.black26)),
                                              ],
                                            ),
                                          ),
                                        ],
                                      )),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Column(
                                    children: [
                                      const Ratingstar(),
                                      Container(
                                        child: Container(
                                          child: Align(
                                            alignment: Alignment.center,
                                            child: Text(
                                              "View Detail",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 10),
                                            ),
                                          ),
                                          width: 74,
                                          height: 25,
                                          decoration: BoxDecoration(
                                              color: Color.fromRGBO(
                                                  47, 110, 182, 10),
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(6))),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                    padding: EdgeInsets.only(left: 35),
                                    child: Text(
                                      "Find Places in a Map",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 17),
                                    )),
                              ],
                            ),
                            SizedBox(
                              height: 15,
                            ),
                                 Container(
                                  width: 330,
                                  height: 200,
                                  child: GoogleMap(
                                    onMapCreated: _onMapCreated,
                                    initialCameraPosition: CameraPosition(
                                      target:_center,
                                      zoom: 11.0,
                                    ),
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(30)),
                                  ),
                                )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
