

import 'package:flutter/cupertino.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Locationview extends StatefulWidget {
  const Locationview({Key? key}) : super(key: key);

  @override
  State<Locationview> createState() => _LocationviewState();
}

class _LocationviewState extends State<Locationview> {
  late GoogleMapController mapController;

  final LatLng _center = const LatLng(45.521563, -122.677433);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GoogleMap(
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(
          target: LatLng(0, 0),
          zoom: 11.0,
        ),
      ),
    );
  }
}
