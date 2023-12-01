import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapSample extends StatefulWidget {
  const MapSample({super.key});

  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(27.686382, 85.315399),
    zoom: 14.4746,
  );

  static const CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(27.686382, 85.315399),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

  bool showmap = false;

  @override
  void initState() {
    super.initState();
    showmapfunc();
    _loadMapStyle();
  }

  showmapfunc() {
    Future.delayed(Duration(seconds: 1)).whenComplete(() {
      setState(() {
        showmap = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    List<Marker> markerList = [];
    markerlist() {
      markerList = [
        const Marker(
            markerId: const MarkerId("Kupondole"),
            position: LatLng(27.686302, 85.315399),
            infoWindow: InfoWindow(title: "Kupondole", snippet: "PCPS")),
        const Marker(
            markerId: const MarkerId("Kupondole"),
            position: LatLng(25.686302, 85.315399),
            infoWindow: InfoWindow(title: "Kupondole", snippet: "PCPS")),
      ];
    }

    return Scaffold(
      body: Stack(
        children: [
          showmap
              ? GoogleMap(
                  initialCameraPosition: _kGooglePlex,
                  onMapCreated: (GoogleMapController controller) {
                    //controller.setMapStyle(mapthemedata);
                    _controller.complete(controller);
                  },
                )
              : Container(child: Center(child: CircularProgressIndicator())),

        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _goToTheLake,
        label: const Text('Go!'),
        icon: const Icon(Icons.directions_boat),
      ),

    );
  }

  Future<void> _goToTheLake() async {
    final GoogleMapController controller = await _controller.future;
    await controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  }

  var mapthemedata;

  Future _loadMapStyle() async {
    mapthemedata = await rootBundle.loadString('assets/raw/maptheme.json');
  }
}
